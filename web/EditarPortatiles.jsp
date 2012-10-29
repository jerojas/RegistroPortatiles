<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="Entidades.*"%>
<%

   
    Portatil e = (Portatil) request.getAttribute("portatil");

    String cod = "";
    String mac = "";
    String marca = "";
    String color = "";
 

     String accion = "modificar";//la acción será un nuevo registro 

    if (e != null) //si el usuario no es nulo significa que es modificación
    {
        cod = Integer.toString(e.getCod());
        mac = e.getMac();
        marca = e.getMarca();
        color = e.getColor();
       
    }


        
  %>
  <%
    //String nombre = (String) request.getAttribute("usuario");
    //String perfil = (String) request.getAttribute("perfil");
    String nombre = "";
    String perfil = "";
    String mensaje = "";
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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Portatil</title>
        <link type="text/css" href="css/estiloregistrarportatil.css" rel="stylesheet" />
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scriptsreportatiles.js"></script>
             <link type="text/css" href="css/Botones.css" rel="stylesheet" />
        <script src = "js/jquery-ui-1.8.23.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css"/> 
        <link rel="stylesheet" type="text/css" href="css/view.css" media="all">
        <script type="text/javascript" src="js/view.js"></script>
        <link rel="stylesheet" href="css3menu1/style.css" type="text/css" />
        <link href="imagenes/favicon.png" type="image/x-icon" rel="shortcut icon" />
    </head>
    <body>
        <div id="full">
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
        <div class="cuerporeg" id="content" align="CENTER"> 
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

            <form name="reg"  id="reg" method="POST" action="ControlarPortatiles"> 

                <fieldset id="marcos" >
                    <legend><strong>Modificar Portatil  </strong> </legend>
                    <div class="principal" align="CENTER" >
                        <ul>
                            <div id="prifila">
                                 <li id="li_9" >
                              
                                    <label class="description" for="element_8">Código del Propietario: </label>
                                    <div>
                                        <input id="cod" name="cod" class="element text medium" type="text" maxlength="255" value="<%=cod%>"/> 
                                    </div> 
                                </li>
                                
                          <li id="li_8" >
                              
                                    <label class="description" for="element_8">Mac: </label>
                                    <div>
                                        <input id="mac" name="mac" class="element text medium" type="text" maxlength="255" value="<%=mac%>"disabled="" /> 
                                    </div> 
                                </li>
                            </div>
                             <div id="segfila">
                                <li id="li_7" >
                                <label class="description" for="element_7">Marca del Portátil: </label>
                                    <div>
                                        <input id="marca" name="marca" class="element text medium" type="text" maxlength="255" value="<%=marca%>"/> 
                                    </div> 
                                </li>
                                <li id="li_7" >
                                    <label class="description" for="element_7">Color: </label>
                                    <div>
                                        <input id="color" name="color" class="element text medium" type="text" maxlength="255" value="<%=color%>"/> 
                                    </div> 
                                </li>   
                            
                             </div>
                        </ul>

                        <div class="btn">
                            <input type="submit" class="button medium blue" id = "validar" name="validar" value="MODIFICAR"/>
                            <br>
                            <br> 
                          </div>
                         
                    </div>
                </fieldset>
                <br>
                                 
                <input type="hidden" name="accion" value="<%=accion%>" />
                  <input type="hidden" name="mac" value="<%=mac%>" />
            </form>
             <br>
            <br>
            <Br> 
        </div>
         <div id="finalpaginalogin">
            <br>
            CORPORACIÓN UNIVERSITARIA  ADVENTISTA<br>
            Medellin - Colombia <br>
            JEOVANY ROJAS MEDINA <br>
            SERGIO MOSQUERA <br>
            AÑO 2012 
        </div>
        </div>
    </body>
</html>
