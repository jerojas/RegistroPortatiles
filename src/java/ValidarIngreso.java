/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Ssergio
 */
@WebServlet(name = "ValidarIngreso", urlPatterns = {"/ValidarIngreso"})
public class ValidarIngreso extends HttpServlet {

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
        
         String codigo = request.getParameter("codigo");
          
          
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

             sql = "SELECT portatiles.marca,portatiles.color,propietarios.nombre,"
                     + "propietarios.carrera, propietarios.semestre FROM portatiles,propietarios "
                     + "WHERE propietarios.codigo=portatiles.IDpropietario AND codigo= '"+codigo+"'";
                                  
             
            sentencia = con.createStatement();
            resultado2 = sentencia.executeQuery(sql);
                        System.out.println(resultado2);
                                
                                
            if (resultado2.next()) {
                
//                sql = "INSERT INTO reportes(mac,marca,color,IDpropietario) VALUES ('" + mac + "','" + marca + "','" + color + "'," + cod + ")";

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
}
