/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ssergio
 */
 @WebServlet(name = "ValidarLogin", urlPatterns = {"/ValidarLogin"})
public class ValidarLogin extends HttpServlet {

   


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
            if (accion.equals("Validar")) {
                validarlogin(request, response);
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

        private void validarlogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");

            RequestDispatcher vista;

            //Objetos para manipular la conexion y los datos
            Connection con = null;//Objeto para la conexion
            Statement sentencia = null;//Objeto para definir y ejecutar las consultas sql
            ResultSet resultado =null;//resultado de las inserción sql
            String sql = "";
            String mensaje = "";
                      
            try {
                //CARGAR DRIVER
//            Class.forName(driver);
                //ESTABLECER CONEXION
                con = conBD.getCConexion();
                System.out.println("Conectado ...");
                //Definición de Sentencia SQL
//                sql = "SELECT documento, perfil FROM usuarios WHERE documento = "+ doc + " AND " 
//                        + "clave = '" + pass + "'";
//              
                //Definición de Sentencia SQL
                sql = "SELECT usuarios.nombres,usuarios.perfil,correo,perfiles.perfil "
                        + "FROM usuarios,perfiles "
                        + "WHERE usuarios.perfil=perfiles.id"
                        + "AND correo= '" + email + "' AND "
                        + "clave = '" + pass + "'";
                
                
                  
                //Ejecutar sentencia
                sentencia = con.createStatement();
                resultado = sentencia.executeQuery(sql);

                
                if (resultado.next()){ 
                    
                    System.out.println("autenticado ...");
                    //creamos la sesion
                    HttpSession sesionOk = request.getSession();//creamos la sesion
                    //agregamos el usuario a la sesión
                    sesionOk.setAttribute("usuario", resultado.getString(2));
                    //agregamos el perfil a la sesión                                        
                    sesionOk.setAttribute("perfil", resultado.getString(8));
                    //agregamos el id del usuario                                        
                    sesionOk.setAttribute("documento", resultado.getString(1));
                    //agregamos la descripcion del perfil
                    sesionOk.setAttribute("desperfil", resultado.getString("perfil"));
                    vista = request.getRequestDispatcher("Home.jsp");
                    //request.getRequestDispatcher("/Index.jsp").include(request, response);

                } else {
                    System.out.println("Error usuario no existe ...");
                     vista = request.getRequestDispatcher("index.jsp");
                }

                vista.forward(request, response);
            } 
        
            catch (SQLException ex) {
                mensaje = "No se ha podido establecer la conexión, o el SQL esta mal formado " + sql;
                mensaje = mensaje + "\n" + ex.toString();
                System.out.println(mensaje);
                request.setAttribute("mensaje", mensaje);
                request.getRequestDispatcher("/Error.jsp").forward(request, response);
            } finally {
                try {
                    //Liberar recursos
                    if (sentencia != null) {
                        sentencia.close();
                    }
                    
                } catch (SQLException ex) {
                    request.getRequestDispatcher("/Error.jsp").include(request, response);
                }
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
    }
