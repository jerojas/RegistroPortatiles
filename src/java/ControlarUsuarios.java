/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Entidades.Perfil;
import Entidades.Usuario;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        } else if (accion.equals("listar")) {
            //ver todos los usuarios del portal
            todos(request, response);
        } else if (accion.equals("eliminar")) {
            //eliminar un usuario
            eliminar(request, response);
        } else if (accion.equals("buscar")) {
            buscar_eliminar(request, response);
        } else if (accion.equals("buscarxaeditar")) {
            buscar_editar(request, response);
        } else if (accion.equals("eliminarr")) {
            eliminaruno(request, response);
        } else if (accion.equals("modificar")) {
            //modificar los datos de un usuario
            modificar(request, response);
        } else if (accion.equals("salir")) { //salir de la aplicacion
            salir(request, response);//
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

        String doc = request.getParameter("doc");
        String nombre = request.getParameter("nombre");
        String ape = request.getParameter("ape");
        String email = request.getParameter("correoo");
        String pass = request.getParameter("passwor");
        String tel = request.getParameter("tel");
        String genero = request.getParameter("genero");
        String perfil = "2"; //visitante
        String estado = "0"; //visitante

        RequestDispatcher vista;

        //Objetos para manipular la conexion y los datos
        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        int resultado = 0;//resultado de las inserción sql
        ResultSet resultado2 = null;//resultado de las inserción sql2
        String sql = "";
        String sql2 = "";
        try {
            //CARGAR DRIVER
//            Class.forName(driver);
            //ESTABLECER CONEXION
            con = conBD.getCConexion();
            System.out.println("Conectado ...");
            //Definición de Sentencia SQL
            sql = "SELECT documento FROM usuarios WHERE documento = " + doc + "";

            sentencia = con.createStatement();

            resultado2 = sentencia.executeQuery(sql);

            if (resultado2.next()) {
                request.setAttribute("doc", resultado2.getString("doc"));
                vista = request.getRequestDispatcher("RegistrarUsuarios.jsp");
                vista.forward(request, response);

            } else {

                //Definición de Sentencia SQL
                sql = "INSERT INTO usuarios(documento,nombres,apellidos,correo,clave,genero,telefono,"
                        + "perfil,estado) VALUES (" + doc + ",'" + nombre + "','" + ape + "','" + email
                        + "','" + pass + "'," + genero + ",'" + tel + "'," + perfil + "," + estado + ")";

                sentencia = con.createStatement();
                resultado = sentencia.executeUpdate(sql);
                System.out.println(resultado);//numero de filas afectadas
                request.setAttribute("guardoOK", resultado);
                vista = request.getRequestDispatcher("RegistrarUsuarios.jsp");
                vista.forward(request, response);
            }
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
        ResultSet resultado = null;//resultado de las inserción sql2
        String sql = "";
        try {
            //ESTABLECER CONEXION
            con = conBD.getCConexion();
            System.out.println("Conectado ...");

            //Definición de Sentencia SQL
            sql = "SELECT * FROM usuarios";

            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            //arreglo donde se gurdaran los usuarios encontrados en la BD
            ArrayList Usuarios = new ArrayList();
            while (resultado.next()) //si el resultado tiene datos empezar a guardarlos.
            {
                Usuario e = new Usuario(resultado.getInt(1), resultado.getString(2),
                        resultado.getString(3), resultado.getString(4), resultado.getString(5), resultado.getInt(6),
                        resultado.getString(7), resultado.getInt(8), resultado.getInt(9));
                //Agregamos el estudiante al arrelo
                Usuarios.add(e);
            }
            // Agregar el arreglo de estudiantes a la solicitud
            request.setAttribute("usuarios", Usuarios);
            //redirigir la solicitud a la página JSP
            request.getRequestDispatcher("/EditarEliminarUser.jsp").include(request, response);
            //cerrar la conexion
        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
            String cod = request.getParameter("IDs");
            String perfil = request.getParameter("perfil");

            if ("1".equals(perfil)) {

                System.out.println("Administrador no se puede Borrar !");
                request.setAttribute("mensaje", "Imposible borrar Administrador !");

            } else {

                //Definición de Sentencia SQL
                sql = "DELETE FROM USUARIOS WHERE cod =" + cod + "";

                //Ejecutar sentencia
                sentencia = con.createStatement();
                resultado = sentencia.executeUpdate(sql);
                System.out.println("Borrado exitoso !");
                request.setAttribute("mensaje", "Registro borrado exitosamente !");
            }
            //listar de nuevo los datos
            todos(request, response);

        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }
    }

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

    private void buscar_eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        ResultSet resultado = null;//Objeto para obtener los resultados de las consultas sql
        String sql = "";

        //Objeto Usuario, donde se guardará la información del registro a editar
        Usuario user = null;
        try {

            con = conBD.getCConexion();
            System.out.println("Conectado ...");
            //OBTENER EL DATO A CONSULTAR
            String doc = request.getParameter("docx");

            //Definición de Sentencia SQL
            sql = "SELECT * FROM USUARIOS WHERE documento =" + doc + "";
            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            // VER SI HAY RESULTADODOS
            while (resultado.next()) {
                user = new Usuario(resultado.getInt(1), resultado.getString(2),
                        resultado.getString(3), resultado.getString(4), resultado.getString(5), resultado.getInt(6),
                        resultado.getString(7), resultado.getInt(8), resultado.getInt(9));
                break; //debe haber un solo registro.
            }
            // Agregar el usuario a la solicitud
            request.setAttribute("usuario", user);

            //Agregamos los perfiles

            //Definición de Sentencia SQL
            sql = "SELECT id,perfil FROM perfiles ORDER BY perfil";

            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            //arreglo donde se guardaran los perfiles encontrados en la BD
            ArrayList perfiles = new ArrayList();
            while (resultado.next()) //si el resultado tiene datos empezar a guardarlos.
            {
                Perfil p = new Perfil(resultado.getString(2), resultado.getInt(1));
                //Agregamos el perfil (FILA) encontrado al arreglo
                perfiles.add(p);
            }
            // Agregar el arreglo de perfiles a la solicitud
            request.setAttribute("Perfiles", perfiles);

            //redirigir la solicitud a la página JSP
            request.getRequestDispatcher("/EliminarUsuarios.jsp").include(request, response);

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
            String doc = request.getParameter("cod");
            String perfil = request.getParameter("perfil");

            if ("1".equals(perfil)) {

                System.out.println("Administrador no se puede Borrar !");
                request.setAttribute("mensaje", "Imposible borrar Administrador !");

            } else {

                //Definición de Sentencia SQL
                sql = "DELETE FROM USUARIOS WHERE documento =" + doc + "";

                //Ejecutar sentencia
                sentencia = con.createStatement();
                resultado = sentencia.executeUpdate(sql);
                System.out.println("Borrado exitoso !");
                request.setAttribute("mensaje", "Registro borrado exitosamente !");
            }
                       request.getRequestDispatcher("/EliminarUsuarios.jsp").include(request, response);

        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }finally {
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

        String doc = request.getParameter("doc");
        String nombre = request.getParameter("nombre");
        String ape = request.getParameter("ape");
        String email = request.getParameter("correoo");
        String pass = request.getParameter("passwor");
        String tel = request.getParameter("tel");
        String genero = request.getParameter("genero");
        String perfil = request.getParameter("listaPerfil");
        String estado = request.getParameter("estado"); //visitante

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
            sql = "UPDATE USUARIOS SET nombres ='" + nombre + "',"
                    + "apellidos='" + ape + "',"
                    + "correo='" + email + "',"
                    + "clave='" + pass + "',"
                    + "genero=b'" +genero+"'," //el tipo de dato es un bit (0 o 1)
                    + "telefono='" +tel+"',"
                    + "perfil=" +perfil+ ","
                    + "estado=b'"+estado+"'" //el tipo de dato es un bit (0 o 1)
                    + "WHERE documento ="+doc+"";

            
             
            sentencia = con.createStatement();
            resultado = sentencia.executeUpdate(sql);
            System.out.println(resultado);//numero de filas afectadas
            request.setAttribute("mensaje", "El registro ha sido modificado");
            vista = request.getRequestDispatcher("EditarUsuarios.jsp");
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

    private void buscar_editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = null;//Objeto para la conexion
        Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
        ResultSet resultado = null;//Objeto para obtener los resultados de las consultas sql
        String sql = "";

        //Objeto Usuario, donde se guardará la información del registro a editar
        Usuario user = null;
        try {

            con = conBD.getCConexion();
            System.out.println("Conectado ...");
            //OBTENER EL DATO A CONSULTAR
            String doc = request.getParameter("docx");

            //Definición de Sentencia SQL
            sql = "SELECT * FROM USUARIOS WHERE documento =" + doc + "";
            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            // VER SI HAY RESULTADODOS
            while (resultado.next()) {
                user = new Usuario(resultado.getInt(1), resultado.getString(2),
                        resultado.getString(3), resultado.getString(4), resultado.getString(5), resultado.getInt(6),
                        resultado.getString(7), resultado.getInt(8), resultado.getInt(9));
                break; //debe haber un solo registro.
            }
            // Agregar el usuario a la solicitud
            request.setAttribute("usuario", user);

            //Agregamos los perfiles

            //Definición de Sentencia SQL
            sql = "SELECT id,perfil FROM perfiles ORDER BY perfil";

            //Ejecutar sentencia
            sentencia = con.createStatement();
            resultado = sentencia.executeQuery(sql);

            //arreglo donde se guardaran los perfiles encontrados en la BD
            ArrayList perfiles = new ArrayList();
            while (resultado.next()) //si el resultado tiene datos empezar a guardarlos.
            {
                Perfil p = new Perfil(resultado.getString(2), resultado.getInt(1));
                //Agregamos el perfil (FILA) encontrado al arreglo
                perfiles.add(p);
            }
            // Agregar el arreglo de perfiles a la solicitud
            request.setAttribute("Perfiles", perfiles);

            //redirigir la solicitud a la página JSP
            request.getRequestDispatcher("/EditarUsuarios.jsp").include(request, response);

        } catch (SQLException ex) {
            System.out.println("No se ha podido establecer la conexión, o el SQL esta mal formado " + sql);
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        }finally {
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

    private void salir(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
         HttpSession sesionOk = request.getSession();//se obtiene la sesion creada
        sesionOk.invalidate();//se destruye la sesión
        response.sendRedirect("index.jsp");
    }
}
