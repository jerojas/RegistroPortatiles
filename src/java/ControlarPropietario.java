
import Entidades.Propietario;
import java.io.IOException;
import java.sql.Connection;
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
        } else if (accion.equals("buscarxaeditar")) {
            buscar_editar(request, response);
        } else if (accion.equals("buscarxaeliminar")) {
            buscar_eliminar(request, response);
        } else if (accion.equals("eliminar")) {
            eliminaruno(request, response);
        } else if (accion.equals("modificar")) {
            //modificar los datos de un usuario
            modificar(request, response);
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
            sql = "INSERT INTO propietarios(codigo,nombre,apellidos,documento,correo,telefono,carrera,"
                    + "semestre,genero) VALUES (" + cod + ",'" + nombre + "','" + ape + "'," + doc + ",'" + email
                    + "','" + tel + "','" + carrera + "','" + semestre + "'," + genero + ")";

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

    private void buscar_editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        ResultSet resultado = null;//Objeto para obtener los resultados de las consultas sql
        String sql = "";

        //Objeto Usuario, donde se guardará la información del registro a editar
        Propietario user = null;
        try {

            con = conBD.getCConexion();
            System.out.println("Conectado ...");
            //OBTENER EL DATO A CONSULTAR
            String cod = request.getParameter("cod");

            //Definición de Sentencia SQL
            sql = "SELECT * FROM propietarios WHERE codigo =" + cod + "";
            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            // VER SI HAY RESULTADODOS
            while (resultado.next()) {
                user = new Propietario(resultado.getInt(1), resultado.getString(2),
                        resultado.getString(3), resultado.getInt(4), resultado.getString(5), resultado.getString(6),
                        resultado.getString(7), resultado.getString(8), resultado.getInt(9));
                break; //debe haber un solo registro.
            }
            // Agregar el usuario a la solicitud
            request.setAttribute("propietario", user);

            //Agregamos los perfiles

            //redirigir la solicitud a la página JSP
            request.getRequestDispatcher("/EditarPropietarios.jsp").include(request, response);

        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }


    }

    private void buscar_eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        ResultSet resultado = null;//Objeto para obtener los resultados de las consultas sql
        String sql = "";

        //Objeto Usuario, donde se guardará la información del registro a editar
        Propietario pro = null;
        try {

            con = conBD.getCConexion();
            System.out.println("Conectado ...");
            //OBTENER EL DATO A CONSULTAR
            String cod = request.getParameter("codx");

            //Definición de Sentencia SQL
            sql = "SELECT * FROM propietarios WHERE codigo = " + cod + "";
            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            // VER SI HAY RESULTADODOS
            while (resultado.next()) {

                pro = new Propietario(resultado.getInt(1), resultado.getString(2),
                        resultado.getString(3), resultado.getInt(4), resultado.getString(5), resultado.getString(6),
                        resultado.getString(7), resultado.getString(8), resultado.getInt(9));
                break; //debe haber un solo registro.


            }
            // Agregar el usuario a la solicitud
            request.setAttribute("propietario", pro);



            //redirigir la solicitud a la página JSP
            request.getRequestDispatcher("/EliminarPropietarios.jsp").include(request, response);

        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }

    }

    private void eliminaruno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Objetos para manipular la conexion y los datos
        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        int resultado = 0;//resultado de las inserción sql2
        String sql = "";

        try {
            //ESTABLECER CONEXION

            con = conBD.getCConexion();
            System.out.println("Conectado ...");

            //OBTENER EL DATO A ELIMINAR
            String cod = request.getParameter("cod");

            //Definición de Sentencia SQL
            sql = "DELETE FROM propietarios WHERE codigo =" + cod + "";

            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeUpdate(sql);
            System.out.println("Borrado exitoso !");
            request.setAttribute("mensaje", "Registro borrado exitosamente !");

            request.getRequestDispatcher("/EliminarPropietarios.jsp").include(request, response);

        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        } finally {
            try {
                //Liberar recursos
                if (sentencia != null) {
                    sentencia.close();
                }

            } catch (SQLException ex) {
                request.getRequestDispatcher("Error.jsp").include(request, response);
            }
        }




    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cod = request.getParameter("cod");
        String nombre = request.getParameter("nombre");
        String ape = request.getParameter("ape");
        String doc = request.getParameter("doc");
        String email = request.getParameter("correoo");
        String tel = request.getParameter("tel");
        String carrera = request.getParameter("carrera");
        String semestre = request.getParameter("semestre");
        String genero = request.getParameter("genero"); //visitante

        RequestDispatcher vista;

        //Objetos para manipular la conexion y los datos
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

//            /Definición de Sentencia SQL
            sql = "UPDATE propietarios SET nombre ='" + nombre + "',"
                    + "apellidos='" + ape + "',"
                    + "documento='" + doc + "',"
                    + "correo= '" + email + "',"
                    + "telefono='" + tel + "',"
                    + "carrera='" + carrera + "',"
                    + "semestre='" + semestre + "',"
                    + "genero=b'" + genero + "'" //el tipo de dato es un bit (0 o 1)
                    + "WHERE codigo =" + cod + "";


            sentencia = con.createStatement();
            resultado = sentencia.executeUpdate(sql);
            System.out.println(resultado);//numero de filas afectadas
            request.setAttribute("mensaje", "El registro ha sido modificado");
            vista = request.getRequestDispatcher("EditarPropietarios.jsp");
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

            } catch (SQLException ex) {
                request.getRequestDispatcher("Error.jsp").include(request, response);
            }
        }


    }
}
