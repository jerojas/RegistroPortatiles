<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="Entidades.*"%>
<%
    String eliminado = request.getAttribute("mensaje") == null ? "" : (String) request.getAttribute("mensaje");
    //Parámetros de entrada
    Propietario e = (Propietario) request.getAttribute("propietario");

    String cod = "";
    String doc = "";
    String nombre = "";
    String apellidos = "";
    String email = "";
    String carrera = "";
    String telefono = "";
    int genero = 2;
    int idperfil = -1;

    String semestre = "";

    String accion = "buscarxaeliminar";//por defecto es un nuevo registro

    if (e != null) //si el usuario no es nulo significa que es modificación
    {
        cod = Integer.toString(e.getCod());
        nombre = e.getNombres();
        apellidos = e.getApellidos();
        doc = Integer.toString(e.getDocumento());
        email = e.getCorreo();
        telefono = e.getTelefono();
        carrera = e.getCarrera();
        genero = e.getGenero();
        semestre = e.getSemestre();



    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Propietario</title>
        <link type="text/css" href="css/estiloreliminarpropietario.css" rel="stylesheet" />
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
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><img src="css3menu1/samples.png" alt=""/>Objetivo del Portal</a></li>
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/service.png" alt=""/>Gestionar Portátiles</span></a>
                        <ul>
                            <li><a href="RegistrarPortatiles.jsp"><img src="css3menu1/256sub11.png" alt=""/>Registrar Portatiles</a></li>
                            <li><a href="EditarEliminarUser.jsp"><img src="css3menu1/256sub21.png" alt=""/>Editar y Eliminar Portátiles</a></li>
                        </ul></li>
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/service.png" alt=""/>Gestionar Propietarios</span></a>
                        <ul>
                            <li><a href="RegistrarPortatiles.jsp"><img src="css3menu1/256sub11.png" alt=""/>Registrar Propietarios</a></li>
                            <li><a href="EditarEliminarUser.jsp"><img src="css3menu1/256sub21.png" alt=""/>Editar y Eliminar Propietarios</a></li>
                        </ul></li>
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/service1.png" alt=""/>Gestionar Porteros</span></a>
                        <ul>
                            <li><a href="#"><img src="css3menu1/256sub1.png" alt=""/>Registrar Porteros</a></li>
                            <li><a href="#"><img src="css3menu1/256sub2.png" alt=""/>Editar y Eliminar Porteros</a></li>
                        </ul></li>
                    <li class="toplast"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/256sub12.png" alt=""/>Reportes</span></a>
                        <ul>
                            <li><a href="#"><img src="css3menu1/256sub13.png" alt=""/>Generar Reporte </a></li>
                        </ul></li>
            </div>

            <form name="elim"  id="elim" method="POST" action="ControlarPropietario"> 
                <div id="cajabuscar" >
                    <div>
                        <br>
                        <br>
                        <label class="busqueda" for="element_1">Digite el Código a eliminar:</label>
                        <br>
                        <br>
                    </div>
                    <div>
                        <input id="codx" name="codx" class="camp" type="text" maxlength="255" value="" required autofocus/> 
                    </div>
                </div>
                <div id="btnbuscar">
                    <br>
                    <input type="submit" class="buscar" id = "buscar" name="buscar"  value="BUSCAR" /> 
                </div>
                <input type="hidden" name="accion" value="<%=accion%>" />
            </form>
            <form name="reg"  id="reg" method="POST" action="ControlarPropietario"> 

                <fieldset id="marcos" >
                    <legend><strong>Editar Propietario  </strong> </legend>
                    <div class="principal" align="CENTER" >
                        <ul >
                            <div id="prifila">
                                <li id="li_1" >
                                <label class="description" for="element_1">Código </label>
                                <div>
                                    <input id="codx" name="codx" class="element text medium" type="text" maxlength="255" value="<%=cod%>" disabled=""/> 
                                </div> 
                                </li>	
                                <li id="li_8" >
                                <label class="description" for="element_8">Nombre: </label>
                                <div>
                                    <input id="nombre" name="nombre" class="element text medium" type="text" maxlength="255" value="<%=nombre%>" disabled=""/> 
                                </div> 
                            </li>		<li id="li_9" >
                        <label class="description" for="element_9">Apellidos: </label>
                        <div>
                            <input id="ape" name="ape" class="element text medium" type="text" maxlength="255" value="<%=apellidos%>"disabled=""/> 
                        </div> 
                        </li>


                    </div>

                    <div id="segfila">
                        <li id="li_2" >
                        <label class="description" for="element_2">Documento: </label>
                        <div>
                            <input id="doc" name="doc" class="element text medium" type="text" maxlength="255" value="<%=doc%>"disabled=""/> 
                        </div> 
                        </li>
                        <li id="li_4" >
                        <label class="description" for="element_4">Email: </label>
                        <div>
                            <input id="correoo" name="correoo" class="element text medium" type="text" maxlength="255" value="<%=email%>"disabled=""/> 
                        </div> 
                        </li>
                        <li id="li_7" >
                        <label class="description" for="element_7">Teléfono: </label>
                        <div>
                            <input id="tel" name="tel" class="element text medium" type="text" maxlength="255" value="<%=telefono%>"disabled=""/> 
                        </div> 
                        </li>

                    </div>

                    <div id="terfila">

                        <li id="li_3" >
                        <label class="description" for="element_3">Carrera: </label>
                        <div>
                            <input id="carrera" name="carrera" class="element text medium" type="text" maxlength="255" value="<%=carrera%>"disabled=""/> 
                        </div> 
                        </li>

                        <li id="li_3" >
                        <label class="description" for="element_3">Semestre: </label>
                        <div>
                            <input id="semestre" name="semestre" class="element text medium" type="text" maxlength="255" value="<%=semestre%>"/> 
                        </div> 
                        </li>

                        <li id="li_7" >
                        <label class="description" for="element_7">Genero: </label>
                        <div>
                            <select  name="genero" size = 1 id = "genero" class="element text medium" value="<%=carrera%>" >
                                <option value = "2" >Seleccione el Género</option>
                                <%
                                    if (accion.equals("buscarxaeliminar")) {
                                        if (genero == 0) {%>
                                <option value="0" selected>Femenino</option>
                                <option value="1">Masculino</option>
                                <%} else {
                                %>
                                <option value="0" >Femenino</option>
                                <option value="1" selected>Masculino</option>
                                <%}
                                } else { //es un nuevo registro
                                %>
                                <option value="2" selected>Seleccione el Género </option>
                                <option value="0">Femenino</option>
                                <option value="1">Masculino</option>
                                <%}//fin accion
                                %>
                            </select> 
                        </div> 
                        </li>




                    </div>
                </ul>

                <div class="btn">
                    <input type="button" class="button medium blue" id = "validar" name="validar" value="ELIMINAR"/>
                    <br>
                    <br>    
                    <br> 
                    <b><font color="RED"><%=eliminado%></font></b>
                </div>


            </div>
        </fieldset> 
        <input type="hidden" name="accion" value="eliminar" />
        <input type="hidden" name="cod" value="<%=cod%>" />
    </form>

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
