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
        <link type="text/css" href="css/Botones.css" rel="stylesheet" />
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

            <div id="content" >
                
                <div  id="letrass" align="CENTER" >         
                    <label><span>INGRESE EL CODIGO DEL COMPUTADOR </span><br>   </label>
                      <br>
                        <input name="Codigo" class="Codigo" type="text" id="Codigo" value="" >
                        <br>
                         <br>
                        <input name="Ingresar" value="Ingresar" type="reset" id="Ingresar" class="button large green"  > 
                         
                </div>

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
