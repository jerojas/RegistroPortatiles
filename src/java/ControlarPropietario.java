
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JEOVANY
 */
@WebServlet(name = "ControlarPropietario", urlPatterns = {"/ControlarPropietario"})
public class ControlarPropietario extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     utilidades.Conexion conBD = null;//objeto conexión
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
        
        String accion = request.getParameter("accion");
        //registrar nuevo usuario en el portal
        if (accion.equals("insertar")) {
            insertar(request, response);
        }
        
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
 

   
    
       @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
 @Override
    public void init() throws ServletException {
        super.init();
        conBD = new utilidades.Conexion();
        conBD.crearConexion();
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            conBD.cerrarConexion();
        } catch (SQLException ex) {
            System.out.println("Error cerrando conexión... " + ex);
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cod = request.getParameter("cod");
        String doc = request.getParameter("doc");
        String nombre = request.getParameter("nombre");
        String ape = request.getParameter("ape");
        String email = request.getParameter("correoo");
        String tel = request.getParameter("tel");
        String genero = request.getParameter("genero");
        String carrera = request.getParameter("carrera");
        String semestre = request.getParameter("semestre");
//        String nombrepc = request.getParameter("mac");
//        String marca = request.getParameter("pc");
//        String color = request.getParameter("color");
        String estado = "0"; //visitante
        RequestDispatcher vista;  
        
        
         Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        int resultado = 0;//resultado de las inserción sql
        String sql = "";
        
        
        try {
            //CARGAR DRIVER
//            Class.forName(driver);
            //ESTABLECER CONEXION
            con = conBD.getCConexion();
            System.out.println("Conectado ...");
            //Definición de Sentencia SQL
           
                //Definición de Sentencia SQL
               sql = "INSERT INTO PROPIETARIOS(codigo,nombre,apellidos,documento,correo,telefono,carrera,"
                        + "semestre,estado,genero) VALUES ("+cod+",'"+nombre+"','"+ape+"',"+doc+",'"+email
                        +"','"+tel+"','"+carrera+"','"+semestre+"',"+estado+","+genero+")";
               
                sentencia = con.createStatement();
                resultado = sentencia.executeUpdate(sql);
                System.out.println(resultado);//numero de filas afectadas
                request.setAttribute("guardoOK", resultado);
                vista = request.getRequestDispatcher("RegistrarPropietarios.jsp");
                vista.forward(request, response);
            
        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } finally {
            try {
                //Liberar recursos
                if (sentencia != null) {
                    sentencia.close();
                }
                //cerrar conexion
                
            } catch (SQLException ex) {
                request.getRequestDispatcher("Error.jsp").include(request, response);
            }
        }
        
        
        
    }
}