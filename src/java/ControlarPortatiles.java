/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Entidades.Portatil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
@WebServlet(name = "ControlarPortatiles", urlPatterns = {"/ControlarPortatiles"})
public class ControlarPortatiles extends HttpServlet {

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
        }else if (accion.equals("listar")) {
            //ver todos los usuarios del portal
            todos(request, response);
        } else if (accion.equals("eliminar")) {
            //eliminar un usuario
            eliminar(request, response);
        }else if (accion.equals("editar")) {
            //Solicita pagina para editar
            buscar_for_editar(request, response);
        }else if (accion.equals("modificar")) {
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

        String mac = request.getParameter("mac");
        String marca = request.getParameter("pc");
        String color = request.getParameter("color");
        String cod = request.getParameter("cod");
        RequestDispatcher vista;

        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        int resultado = 0;//resultado de las inserción sql
        ResultSet resultado2 = null;
        String sql = "";


        try {

            con = conBD.getCConexion();
            System.out.println("Conectado ...");
            //Definición de Sentencia SQL

            //Definición de Sentencia SQL


            sql = "SELECT codigo FROM propietarios WHERE codigo = " + cod + "";

            sentencia = con.createStatement();

            resultado2 = sentencia.executeQuery(sql);
            System.out.println(resultado2);
            if (resultado2.next()) {
                sql = "INSERT INTO portatiles(mac,marca,color,IDpropietario) VALUES ('" + mac + "','" + marca + "','" + color + "'," + cod + ")";

                sentencia = con.createStatement();
                resultado = sentencia.executeUpdate(sql);
                System.out.println(resultado);//numero de filas afectadas
                request.setAttribute("guardoOK", resultado);
                vista = request.getRequestDispatcher("RegistrarPortatiles.jsp");


            } else {

                request.setAttribute("codexiste", "El Usuario no existe");
                vista = request.getRequestDispatcher("RegistrarPortatiles.jsp");

            }
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

    private void todos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //Objetos para manipular la conexion y los datos
        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        ResultSet resultado = null;//Objeto para obtener los resultados de las consultas sql
        String sql = "";
        try {
            con = conBD.getCConexion();
            //Definición de Sentencia SQL
            sql = "SELECT mac,marca,color,IDpropietario FROM portatiles";
           
            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            //arreglo donde se gurdaran los usuarios encontrados en la BD
            ArrayList Portatiles = new ArrayList();
            while (resultado.next()) //si el resultado tiene datos empezar a guardarlos.
            {
                Portatil e = new Portatil(resultado.getInt(4), resultado.getString(1),
                        resultado.getString(2), resultado.getString(3));
               
                //Agregamos el estudiante al arrelo
                Portatiles.add(e);
            }
            // Agregar el arreglo de estudiantes a la solicitud
            request.setAttribute("portatiles", Portatiles);
            //redirigir la solicitu a la página JSP
            request.getRequestDispatcher("/EditarEliminarPortatiles.jsp").include(request, response);
            //cerrar la conexion
            //con.close();
        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }  
        
        
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Objetos para manipular la conexion y los datos
        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        int resultado = 0;//resultado de las filas borradas sql
        String sql = "";
        try {

            //ESTABLECER CONEXION
            con = conBD.getCConexion();
            System.out.println("Conectado a BD...");

            //OBTENER EL DATO A ELIMINAR
            String mac = request.getParameter("ID");

            //Definición de Sentencia SQL
            sql = "DELETE FROM portatiles WHERE mac='" + mac + "'";

            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeUpdate(sql);
            System.out.println("Borrado exitoso !");
            request.setAttribute("mensaje", "Registro borrado exitosamente !");
           
            

            //listar de nuevo los datos
            todos(request, response);

        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }
        
        
        
    }

    private void buscar_for_editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        ResultSet resultado = null;//Objeto para obtener los resultados de las consultas sql
        String sql = "";

        //Objeto Usuario, donde se guardará la información del registro a editar
        Portatil e = null;
        try {
            //CARGAR DRIVER
            // Class.forName(driver);
            //ESTABLECER CONEXION
            //con = DriverManager.getConnection(urlDB, userBD, passBD);
            con = conBD.getCConexion();
            System.out.println("Conectado ...");
            //OBTENER EL DATO A CONSULTAR
            String mac = request.getParameter("ID");

            //Definición de Sentencia SQL
            sql = "SELECT * FROM portatiles WHERE mac='" + mac + "'";
            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            // VER SI HAY RESULTADODOS
            while (resultado.next()) {
                e = new Portatil(resultado.getInt(4), resultado.getString(1),
                        resultado.getString(2), resultado.getString(3));
                break; //debe haber un solo registro.
            }
            // Agregar el usuario a la solicitud
            request.setAttribute("portatil", e);

            //redirigir la solicitud a la página JSP
            request.getRequestDispatcher("/EditarPortatiles.jsp").include(request, response);
            
        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }
        
        
        
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String mac = request.getParameter("mac");
        String marca = request.getParameter("marca");
        String color = request.getParameter("color");
        String cod = request.getParameter("cod");
        
        RequestDispatcher vista;
       
        //Objetos para manipular la conexion y los datos
        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        String sql = "";
        int filasafectadas = 0;

       
        try {
            //ESTABLECER CONEXION
           con = conBD.getCConexion();
            System.out.println("Conectado ...");

            //Definición de Sentencia SQL
            sql = "UPDATE portatiles SET marca ='" + marca + "', "
                    + "color='" + color + "', "
                    + "IDpropietario=" + cod + " "
                    + "WHERE mac='" + mac + "'";

            //Ejecutar sentencia
            sentencia = con.createStatement();
           filasafectadas = sentencia.executeUpdate(sql);

            System.out.println("Actualizacion exitosa ! ...");
            request.setAttribute("mensaje", "Registro modificado exitosamente !");
            todos(request, response);
         

        } catch (SQLException ex) {
            request.getRequestDispatcher("/Error.jsp").include(request, response);
            System.out.println("No se ha podido Insertar, o el SQL esta mal formado " + sql);
        } finally {
            try {
                //Liberar recursos
                sentencia.close();
               
            } catch (SQLException ex) {
                request.getRequestDispatcher("/Error.jsp").include(request, response);
            }
        }  
        
        
        
        
        
        
    }
}
