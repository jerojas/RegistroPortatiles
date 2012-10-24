<%-- 
    Document   : index
    Created on : 24/10/2012, 04:32:20 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Administrador</title>
        <link type="text/css" href="css/estilos.css" rel="stylesheet" />
        <link type="text/css" href="css/Botones.css" rel="stylesheet" />
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scripts.js"></script>
        <script src = "js/jquery-ui-1.8.23.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css"/> 
        <link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style>._css3m{display:none}</style>
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
                <div id="divcentro" >
                    <form id="form1" name="form1"  action="Validar" method="post"  > 
                        <label>Tipo de usuario</label>
                        <select  id="Tipouser" name="Tipouser"> 
                            <option value="1" >Administrador</option>
                            <option value="2" >Seguridad Porteria</option>
                        </select>
                        <br>
                        <label>Usuario</label>  
                        <input name="Usuario" class="Usuario" type="text" id="Usuario" value=""  >
                           <br>
                        <label>Contraseña</label> 
                        <input name="Contraseña" class="Contraseña" type="text" id="Contraseña" value="" >
                        <input   value="Ingresar" type="reset" id="IngrEsar" class="button large blue"  >
                    </form>
                </div>

            </div>
        </div>
        <div id="finalpagina">
            <br>
            CORPORACIÓN UNIVERSITARIA  ADVENTISTA<br>
            Medellin - Colombia <br>
            JEOVANY ROJAS MEDINA <br>
            SERGIO MOSQUERA <br>
            AÑO 2012 
        </div>

    </body>
</html>
