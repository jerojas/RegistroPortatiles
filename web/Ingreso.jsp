<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%> 
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <link type="text/css" href="css/estilos.css" rel="stylesheet" />
        <link type="text/css" href="css/Botones.css" rel="stylesheet" />
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scripts.js"></script>
            <script src = "js/jMenu.jquery.js"></script>
        <script src = "js/jquery-ui-1.8.23.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css"/> 
       <link rel="stylesheet" href="MenuUser_files/css3menu1/style.css" type="text/css" />

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
            <!-- Start css3menu.com BODY section -->
<ul id="css3menu1" class="topmenu">
	<li class="topfirst"><a href="#" style="width:190px;height:32px;line-height:32px;"><span><img src="MenuUser_files/css3menu1/home.png" alt=""/>Home</span></a>
	<ul>
		<li><a href="Quienes somos.jsp"><img src="MenuUser_files/css3menu1/service2.png" alt=""/>Quiénes somos</a></li>
		
	</ul></li>
	<li class="topmenu"><a href="#" style="width:190px;height:32px;line-height:32px;"><img src="MenuUser_files/css3menu1/blue_circle - computer.png" alt=""/>Portátiles</a></li>
	<li class="topmenu"><a href="RegistrarPortatiles.jsp" target="_top" style="width:190px; height:32px;line-height:32px;"><img src="MenuUser_files/css3menu1/256sub14.png" alt=""/>Registrar Portátiles</a></li>
	
	<ul>
		<li><a href="#"><img src="MenuUser_files/css3menu1/256-3.png" alt=""/>Portátiles dentro del Edifcio </a></li>
		<li><a href="#"><img src="MenuUser_files/css3menu1/256-4.png" alt=""/>Portatiles fuera del Edificio</a></li>
	</ul></li>

<!-- End css3menu.com BODY section -->
                
            </div>
            <div id='mensajeIN'>                
                <b>Bienvenido Señor (a):<%=nombre%>&nbsp;&nbsp;</b>
                <a href="ControlarUsuarios?accion=salir"><img src="imagenes/salir.gif" width="48" height="48" alt="salir"/></a>
            </div>
                <div id="content" >
  <form id="form" name="form"  action="ValidarIngreso" method="post"  >
                    <div  id="letrass" align="CENTER" >         
                        <label style=""><span>INGRESE EL CÓDIGO </span><br>    </label>
                        <br>
                       
                        <input name="Codigo" class="Codigo" style="width: 280px; height: 25px;" type="text" id="Codigo" value="">
                        <br>
                        <br>
                        <input   value="Ingresar" type="button" id="Ingresar" class="button large blue"  > 

                    </div>
            </form>

                </div>
            
            <div id="marcoimagen">
                
                
                
            </div>
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
