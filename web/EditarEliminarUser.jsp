<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,Entidades.Usuario" %>

<%
//Obtener el arreglo de estudiantes enviado en la solicitud
    ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios");
    int contador = 0;
    String mensaje = request.getAttribute("mensaje") == null ? "" : (String) request.getAttribute("mensaje");
    String estado = "";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <link type="text/css" href="css/estilos.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/bluedream.css" type="text/css" > 
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scripts.js"></script>
        <script src = "js/jquery-ui-1.8.23.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css"/> 

        <link href="imagenes/favicon.png" type="image/x-icon" rel="shortcut icon" />
        
     </head>
    <body>
        <div class="header"id ="header"> 
            <img src="imagenes/header.png" />
            <div id="logo" >
               <img src="imagenes/logo.jpg" width="282px" height="91px"  /> 
            </div>
            <div id="titulo">
              Sistema de Registro de Portátiles 
              Bolívar Rave
              </div>
        </div>
        <div class="cuerpo" id="content"> 
            
        <table align="center">            
            <caption>Usuarios Registrados</caption>
            <thead>
                <tr>
                    <th scope="col">Documento</th>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Clave</th>
                     <th scope="col">Género</th>
                     <th scope="col">Teléfono</th>
                     <th scope="col">Estado</th>
                    <th scope="col">Perfil</th>
                    
                </tr>
            </thead>
            <%
                if (usuarios != null && usuarios.size() > 0) {
                    for (Iterator iterator = usuarios.iterator(); iterator.hasNext();) {
                        Usuario u = (Usuario) iterator.next();
                        contador++;
            %>
            <tbody>
                <%
                    if (contador % 2 == 0) {
                %>
                <tr>
                    <%} else {%>
                <tr class="odd">                               
                    <%}%>
                    <td>
                        <%= u.getDoc()%>
                    </td>
                    <td>
                        <%= u.getNombres()%>
                    </td>
                    <td>
                        <%= u.getApellidos()%>
                    </td>
                     <td>
                        <%= u.getCorreo()%>
                    </td>
                    <td>
                        <%= u.getClave()%>
                    </td>
                    <td>
                        <%= u.getGenero()%>
                    </td>
                    <td>
                        <%= u.getTelefono()%>
                    </td>
                     <td>
                        <%= u.getEstado()%>
                    </td>
                    <td>
                        <%= u.getIdperfil()%>
                    </td>
                   
                    <td>
                        <a href="ControlarUsuarios?accion=eliminar&IDs=<%=u.getDoc()%> &perfil=<%=u.getIdperfil()%>">Eliminar</a>
                    </td>
                    <td>
                        <a href="ControlarUsuarios?accion=editar&ID=<%=u.getDoc()%>">Editar</a>
                    </td>
                </tr>
            </tbody>
            <%
                    }
                }
            %>

        </table>
          <br>
        <p style="text-align:center;color: red">
            <%=mensaje%>
        </p>
        <hr>


        </div>
        <div id="finalpaginalogin">
            <br>
         CORPORACIÓN UNIVERSITARIA  ADVENTISTA<br>
          Medellin - Colombia <br>
         JEOVANY ROJAS MEDINA <br>
          SERGIO MOSQUERA <br>
          AÑO 2012 
                   
        </div>

    </body>
</html>
