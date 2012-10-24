/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
@WebServlet(name = "ControlarUsuarios", urlPatterns = {"/ControlarUsuarios"})
public class ControlarUsuarios extends HttpServlet {
   

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

    private void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String cod = request.getParameter("cod");
       String nombre = request.getParameter("nombre");
        String ape = request.getParameter("ape");
        String email = request.getParameter("correoo");
        String pass = request.getParameter("passwor");
        String doc = request.getParameter("doc");
        String tel = request.getParameter("tel");
        String perfil = "3"; //visitante
        
        RequestDispatcher vista;
        
        //Datos de la conexion
        String driver = "com.mysql.jdbc.Driver";
        String urlDB = "jdbc:mysql://localhost/registroportatiles";
        String userBD = "root";
        String passBD = "toor11";
        
        //Objetos para manipular la conexion y los datos
        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
         Statement sentencia2 = null;
        int resultado = 0;//resultado de las inserción sql
        ResultSet  resultado2 = null;//resultado de las inserción sql2
        String sql = "";
        String sql2 = "";

        try {
            //CARGAR DRIVER
            Class.forName(driver);

            //ESTABLECER CONEXION
            con = DriverManager.getConnection(urlDB, userBD, passBD);
            System.out.println("Conectado ...");

            //Definición de Sentencia SQL
            
            sql = "INSERT INTO usuarios(cod,nombres,apellidos,documento,correo,clave,perfil,"
                    + "telefono) VALUES ('" + cod + "','" + nombre + "','" + ape + "','" + doc
                    + "','" + email + "'," + pass + "," + perfil + ")";      
                 
            sentencia = con.createStatement();
            resultado = sentencia.executeUpdate(sql);
            System.out.println(resultado);//numero de filas afectadas
            request.setAttribute("guardoOK", resultado);
            
           vista = request.getRequestDispatcher("RegistraUsuarios.jsp");
           vista.forward(request, response);
            
             
           
             
            
        } catch (ClassNotFoundException ex) {
            System.out.println("No se ha podido cargar el Driver de MySQL");
            
            response.sendRedirect("Error.jsp");
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
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                request.getRequestDispatcher("Error.jsp").include(request, response);
            }
        } 
        
        
    }
}
