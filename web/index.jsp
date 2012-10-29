<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>
<%
    String nombre = (String)request.getAttribute("usuario");    
    String perfil = (String)request.getAttribute("perfil");
   String mensaje = request.getAttribute("errorlogin") == null ? "" : (String) request.getAttribute("errorlogin");
   String accion = "Validar";
   
   if (request.getAttribute("error") != null) {
        mensaje = (String) request.getAttribute("error");
    }
   
%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <script type="text/javascript" src="MD5.js"></script>
        
        <link type="text/css" href="css/estilos.css" rel="stylesheet" />
        <link type="text/css" href="css/Botones.css" rel="stylesheet" />
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scripts.js"></script>
           <script src = "js/jMenu.jquery.js"></script>
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
            <form id="for" name="form" method="POST" action="ValidarLogin"  >
                <div id="ingresar">	
                    <div id="form01">
                        <div id="camposs">
                            <label id="usuario">Usuario:</label>  &nbsp &nbsp &nbsp 
                            <input type= "text" id="campo1"  name="email"> <br><br>
                        </div>
                        <div id="camposs">
                            <label id="passw">Contraseña: </label>
                            <input type="password" id="campo2" name="pass" > <br><br>
                        </div>
                    </div>
                    <div>
                        <input  value="Entrar" type="button" id="Entrarlogin" class="button large blue"  > 
                        <br>
                        
                    </div>
                    <p style="text-align:center;color: red; margin-top: 168px; margin-left: 70px;">
                    <b><font color="RED"><%=mensaje%></font></b>
         </p>

                </div> 
          <input type="hidden" name="accion" value="<%=accion%>" />
            </form>	
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
