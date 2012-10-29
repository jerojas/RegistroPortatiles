<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>

<%@page import="Entidades.Portatil"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%> 
<%@ page language="java" import="java.util.*,Entidades.Usuario" %>

<%
//Obtener el arreglo de estudiantes enviado en la solicitud
    ArrayList<Portatil> portatiles = (ArrayList<Portatil>) request.getAttribute("portatiles");
    int contador = 0;
    String mensaje = request.getAttribute("mensaje") == null ? "" : (String) request.getAttribute("mensaje");
    
%>
<%
    //String nombre = (String) request.getAttribute("usuario");
    //String perfil = (String) request.getAttribute("perfil");
    String nombre = "";
    String perfil = "";
   
    String sperfil="";
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("nombre") == null) {
        request.setAttribute("error", "Es obligatorio identificarse");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    } else {
        nombre = (String) sesionOk.getAttribute("nombre");
        perfil = (String) sesionOk.getAttribute("perfil");
       
        mensaje = request.getAttribute("mensaje") == null ? "" : (String) request.getAttribute("mensaje");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Portátiles</title>
        <link type="text/css" href="css/estilos.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/bluedream.css" type="text/css" > 
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scripts.js"></script>
        <script src = "js/jquery-ui-1.8.23.custom.min.js"></script>
         <link rel="stylesheet" type="text/css" href="css/view.css" media="all">
        <script type="text/javascript" src="js/view.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css"/> 
        <link rel="stylesheet" href="css3menu1/style.css" type="text/css" />
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
           <div id="menuadmin">
                <ul id="css3menu1" class="topmenu">
                    <li class="topfirst"><a href="Quienes somos.jsp" style="height:32px;line-height:32px;"><img src="css3menu1/home.png" alt=""/>Quiénes somos</a></li>
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/service.png" alt=""/>Gestionar Portátiles</span></a>
                        <ul>
                            <li><a href="RegistrarPortatiles.jsp"><img src="css3menu1/256sub11.png" alt=""/>Registrar Portatiles</a></li>
                            <li><a href="ControlarPortatiles?accion=listar"><img src="css3menu1/256sub21.png" alt=""/>Editar y Eliminar Portátiles</a></li>
                        </ul></li>
                        <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/service.png" alt=""/>Gestionar Propietarios</span></a>
                        <ul>
                            <li><a href="RegistrarPropietarios.jsp"><img src="css3menu1/256sub11.png" alt=""/>Registrar Propietarios</a></li>
                            <li><a href="EditarPropietarios.jsp"><img src="css3menu1/256sub21.png" alt=""/>Modificar Propietarios</a></li>
                             <li><a href="EliminarPropietarios.jsp"><img src="css3menu1/256sub21.png" alt=""/>Eliminar Propietarios</a></li>
                        </ul></li>
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/service1.png" alt=""/>Gestionar Usuarios</span></a>
                        <ul>
                            <li><a href="RegistrarUsuarios.jsp"><img src="css3menu1/256sub1.png" alt=""/>Registrar Usuarios</a></li>
                            <li><a href="EditarUsuarios.jsp"><img src="css3menu1/256sub2.png" alt=""/>Modificar Usuarios</a></li>
                            <li><a href="EliminarUsuarios.jsp"><img src="css3menu1/256sub2.png" alt=""/>Eliminar Usuarios</a></li>
                        </ul></li>
                    <li class="toplast"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/256sub12.png" alt=""/>Reportes</span></a>
                        <ul>
                            <li><a href="#"><img src="css3menu1/256sub13.png" alt=""/>Generar Reporte </a></li>
                        </ul></li>
                           </div> 
       <div id='mensajeIN'>                
                <b>Bienvenido Señor (a):<%=nombre%>&nbsp;&nbsp;</b>
                <a href="ControlarUsuarios?accion=salir"><img src="imagenes/salir.gif" width="48" height="48" alt="salir"/></a>
            </div>
            <br>
            <br>
            <br>
            
            
            <table align="center">            
            <caption>Portátiles Registrados</caption>
            <thead>
                <tr>
                    <th scope="col">Código Propietario</th>
                    <th scope="col">Mac</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Color</th>
                    
                </tr>
            </thead>
            <%
                if (portatiles != null && portatiles.size() > 0) {
                    for (Iterator iterator = portatiles.iterator(); iterator.hasNext();) {
                        Portatil u = (Portatil) iterator.next();
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
                        <%=u.getCod()%>
                    </td>
                    <td>
                        <%= u.getMac()%>
                    </td>
                    <td>
                        <%= u.getMarca()%>
                    </td>
                     <td>
                        <%= u.getColor()%>
                    </td>
                                      
                    <td>
                        <a href="ControlarPortatiles?accion=eliminar&ID=<%=u.getMac()%>">Eliminar</a>
                    </td>
                    <td>
                        <a href="ControlarPortatiles?accion=editar&ID=<%=u.getMac()%>">Editar</a>
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
