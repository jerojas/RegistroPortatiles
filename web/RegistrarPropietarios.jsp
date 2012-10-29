<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>
<%

        String nombre = request.getParameter("correoo");
        String codigo = (String)request.getAttribute("cod");
    Integer guardo = (Integer) request.getAttribute("guardoOK");
    String mensaje = "";
    String mensaje2 = "";
     String mensaje3 = "";
    String accion = "insertar";//la acción será un nuevo registro 
    
    if (guardo != null) {
        mensaje2 = "Registro ingresado exitosamente";
    }
    
  
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Propietario</title>
        <link type="text/css" href="css/estiloregistrarpropietario.css" rel="stylesheet" />
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scripts.js"></script>
             <link type="text/css" href="css/Botones.css" rel="stylesheet" />
        <script src = "js/jquery-ui-1.8.23.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css"/> 
        <link rel="stylesheet" type="text/css" href="css/view.css" media="all">
        <script type="text/javascript" src="js/view.js"></script>
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
        <div class="cuerporeg" id="content" align="CENTER"> 
             <div id="menuadmin">
                <ul id="css3menu1" class="topmenu">
                    <li class="topfirst"><a href="Quienes somos.jsp" style="height:32px;line-height:32px;"><img src="css3menu1/home.png" alt=""/>Quiénes somos</a></li>
                  
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/service.png" alt=""/>Gestionar Portátiles</span></a>
                        <ul>
                            <li><a href="RegistrarPortatiles.jsp"><img src="css3menu1/256sub11.png" alt=""/>Registrar Portatiles</a></li>
                            <li><a href="ControlarUPortatiles?accion=listar"><img src="css3menu1/256sub21.png" alt=""/>Editar y Eliminar Portátiles</a></li>
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
                <b>Bienvenido (salir)&nbsp;&nbsp;</b>
                <a href="ControlarUsuarios?accion=salir"><img src="imagenes/salir.gif" width="48" height="48" alt="salir"/></a>
            </div>

            <form name="reg"  id="reg" method="POST" action="ControlarPropietario"> 

                <fieldset id="marcos" >
                    <legend><strong>Registrar Propietario  </strong> </legend>
                    <div class="principal" align="CENTER" >
                        <ul >
                            <div id="prifila">
                                <li id="li_1" >
                                    <label class="description" for="element_1">Código </label>
                                    <div>
                                        <input id="cod" name="cod" class="element text medium" type="text" maxlength="255" value=""/> 
                                    </div> 
                                </li>	
                                <li id="li_8" >
                                    <label class="description" for="element_8">Nombre: </label>
                                    <div>
                                        <input id="nombre" name="nombre" class="element text medium" type="text" maxlength="255" value=""/> 
                                    </div> 
                                </li>		<li id="li_9" >
                                    <label class="description" for="element_9">Apellidos: </label>
                                    <div>
                                        <input id="ape" name="ape" class="element text medium" type="text" maxlength="255" value=""/> 
                                    </div> 
                                </li>

                                
                            </div>
                           
                            <div id="segfila">
                                 <li id="li_2" >
                                    <label class="description" for="element_2">Documento: </label>
                                    <div>
                                        <input id="doc" name="doc" class="element text medium" type="text" maxlength="255" value=""/> 
                                    </div> 
                                </li>
                                <li id="li_4" >
                                    <label class="description" for="element_4">Email: </label>
                                    <div>
                                        <input id="correoo" name="correoo" class="element text medium" type="text" maxlength="255" value=""/> 
                                    </div> 
                                </li>
                                <li id="li_7" >
                                    <label class="description" for="element_7">Teléfono: </label>
                                    <div>
                                        <input id="tel" name="tel" class="element text medium" type="text" maxlength="255" value=""/> 
                                    </div> 
                                </li>
                                
                            </div>

                            <div id="terfila">
                                
                                <li id="li_3" >
                                    <label class="description" for="element_3">Carrera: </label>
                                    <div>
                                        <input id="carrera" name="carrera" class="element text medium" type="text" maxlength="255" value=""/> 
                                    </div> 
                                </li>

                                 <li id="li_3" >
                        <label class="description" for="element_3">Semestre: </label>
                        <div>
                            <input id="semestre" name="semestre" class="element text medium" type="text" maxlength="255" value=""/> 
                        </div> 
                        </li>
                                
                                <li id="li_7" >
                                    <label class="description" for="element_7">Genero: </label>
                                     <div>
                                       
                                         <select  name="genero" size = 1 id = "genero" class="element text medium" >
                                    <option value="2"> Seleccione el género</option>
                                    <option value="1">Masculino</option>
                                    <option value="0">Femenino</option>
                                </select> 
                                    </div> 
                                </li>
                               
                            </div>
                        </ul>

                        <div class="btn">
                            <input type="button" class="button medium blue" id = "validar" name="validar" value="GUARDAR"/>
                            <br>
                            <br>                        

                        </div>
                        <div id="mensajerror">
                        <b><font color="RED"><%=mensaje2%></font></b>
                        </div>
                    </div>
                </fieldset> 
                <input type="hidden" name="accion" value="<%=accion%>" />
            </form>
            <div class = "ale" id = "capaerrores"  style="display: none;" >
                Información mal ingresada por favor corrija lo siguiente:
                <br>
                <div class= "alerta" id="errorcodigo" >
                </div>
                <div class= "alerta" id="errornombre" >
                </div>
                <div class= "alerta" id="errorape">
                </div>
                <div class= "alerta" id="errordoc">
                </div>
                <div class= "alerta"  id="errorcorreoo">
                </div>
                <div class= "alerta" id="errorvalcorreoo">
                </div>
                <div class= "alerta" id="errorpasswor">
                </div>
                <div class= "alerta" id="errorrepitapassword">
                </div>
                <div class= "alerta" id="errorcarrera">
                </div>
                <div class= "alerta" id="errortel">
                </div>
                <div class= "alerta" id="errorvalpassword">
                </div>
                <div class= "alerta" id="errorsemestre">
                </div>
                <div class= "alerta" id="errormac">
                </div>
                <div class= "alerta" id="errorpc">
                </div>
                <div class= "alerta" id="errorcolor">
                </div>
            </div>
            <br>
            <br>
            <br>
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
