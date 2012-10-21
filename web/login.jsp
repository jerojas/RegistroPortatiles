<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <link type="text/css" href="css/estilos.css" rel="stylesheet" />
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

            <div id="ingresar">	
                <form id="for" name="form" method="POST"  >
                    <div id="form01">
                    <div id="camposs">
                    <label id="usuario">Usuario:</label>  &nbsp &nbsp &nbsp 
                    <input type= "text" id="campo1"> <br><br>
                    </div>
                    <div id="camposs">
                    <label id="passw">Contraseña: </label>
                    <input type="password" id="campo2" > <br><br>
                    </div>
                        <div style="text-align: center">
                        <input type="button" id ="boton" value= "ENTRAR">  <br><br>
                    <a href="#" id="olvipass">¿Has olvidado tu contraseña? </a>
                    </div>
                    </div>
                </form>	

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
