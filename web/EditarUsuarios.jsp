<%-- 
    Document   : index
    Created on : 15/10/2012, 04:32:20 PM
    Author     : JEOVANY
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="Entidades.*"%>
<%
    String editado = request.getAttribute("mensaje") == null ? "" : (String) request.getAttribute("mensaje");
    //Parámetros de entrada
    Usuario e = (Usuario) request.getAttribute("usuario");

    String doc = "";
    String nombre = "";
    String apellidos = "";
    String email = "";
    String clave = "";
    String telefono = "";
    int genero = 2;
    int idperfil = -1;
    String estado = "";

    String accion = "buscarxaeditar";//por defecto es un nuevo registro

    if (e != null) //si el usuario no es nulo significa que es modificación
    {
        doc = Integer.toString(e.getDoc());
        nombre = e.getNombres();
        apellidos = e.getApellidos();
        email = e.getCorreo();
        clave = e.getClave();
        telefono = e.getTelefono();
        genero = e.getGenero();
        idperfil = e.getIdperfil();
        estado = Integer.toString(e.getEstado());

    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuarios</title>
        <link type="text/css" href="css/estiloreliminarusuario.css" rel="stylesheet" />
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scripts.js"></script>
        <script src = "js/jquery-ui-1.8.23.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css"/> 
        <link rel="stylesheet" type="text/css" href="css/view.css" media="all">
        <link type="text/css" href="css/Botones.css" rel="stylesheet" />
        <script type="text/javascript" src="js/view.js"></script>

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
        <div class="cuerporeg" id="content"> 
            <div id="menuadmin">
                <ul id="css3menu1" class="topmenu">
                    <li class="topfirst"><a href="Quienes somos.jsp" style="height:32px;line-height:32px;"><img src="css3menu1/home.png" alt=""/>Quiénes somos</a></li>
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><img src="css3menu1/samples.png" alt=""/>Objetivo del Portal</a></li>
                    <li class="topmenu"><a href="#" style="height:32px;line-height:32px;"><span><img src="css3menu1/service.png" alt=""/>Gestionar Portátiles</span></a>
                        <ul>
                            <li><a href="#"><img src="css3menu1/256sub11.png" alt=""/>Registrar Portatiles</a></li>
                            <li><a href="#"><img src="css3menu1/256sub21.png" alt=""/>Editar y Eliminar Portátiles</a></li>
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

            <form name="elim"  id="elim" method="POST" action="ControlarUsuarios"> 
                <div id="cajabuscar" >
                    <div>
                        <br>
                        <br>
                        <label class="busqueda" for="element_1">Digite el Documento a Modificar:</label>
                        <br>
                        <br>
                    </div>
                    <div>
                        <input id="docx" name="docx" class="camp" type="text" maxlength="255" value="" required autofocus/> 
                    </div>
                </div>
                <div id="btnbuscar">
                    <br>
                    <input type="submit" class="buscar" id = "buscar" name="buscar"  value="BUSCAR" /> 
                </div>
                <input type="hidden" name="accion" value="<%=accion%>" />
            </form>
            <b><font color="RED"><%=editado%></font></b>
            <form name="reg"  id="reg" method="POST" action="ControlarUsuarios"> 
                <fieldset id="marcos">
                    <legend><strong>Modificar Usuario </strong></legend>
                    <div class="principal">
                        <ul >
                            <div id="prifila">

                                <li id="li_1" >
                                    <label class="description" for="element_1">Documento:</label>
                                    <div>
                                        <input id="doc" name="doc" class="element text medium" type="text" maxlength="255" value="<%=doc%>" <%=e != (null) ? " disabled" : ""%> required  /> 
                                    </div> 
                                </li>	
                                <li id="li_8" >
                                    <label class="description" for="element_8">Nombre: </label>
                                    <div>
                                        <input id="nombre" name="nombre" class="element text medium" type="text" maxlength="255" value="<%=nombre%>" required  /> 
                                    </div> 
                                </li>		<li id="li_9" >
                                    <label class="description" for="element_9">Apellidos: </label>
                                    <div>
                                        <input id="ape" name="ape" class="element text medium" type="text" maxlength="255" value="<%=apellidos%>" required  /> 
                                    </div> 
                                </li>
                            </div>
                            <div id="segfila">

                                <li id="li_4" >
                                    <label class="description" for="element_4">Email: </label>
                                    <div>
                                        <input id="correoo" name="correoo" class="element text medium" type="text" maxlength="255" value="<%=email%>"   /> 
                                    </div> 
                                </li>		<li id="li_5" >
                                    <label class="description" for="element_5">Password: </label>
                                    <div>
                                        <input id="passwor" name="passwor" class="element text medium" type="password" maxlength="255" value="<%=clave%>"required  /> 
                                    </div> 
                                </li>	

                                <li id="li_6" >
                                    <label class="description" for="element_6">Estado:</label>
                                    <div>
                                        <input id="estado" name="estado" class="element text medium" type="text" maxlength="255" value="<%=estado%>"  />
                                    </div>
                                </li>
                            </div>

                            <div id="terfila">

                                <li id="li_2" >
                                    <label class="description" for="element_2">Género: </label>
                                    <div>

                                        <select  name="genero" size = 1 id = "genero" class="element text medium" >
                                            <option value = "2" >Seleccione el Género</option>
                                            <%
                                                if (accion.equals("buscarxaeditar")) {
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
                                </li>			<li id="li_7" >
                                    <label class="description" for="element_7">Teléfono: </label>
                                    <div>
                                        <input id="tel" name="tel" class="element text medium" type="text" maxlength="255" value="<%=telefono%>" required /> 
                                    </div> 
                                </li>
                                <li id="li_8" >
                                    <label class="description" for="element_7">Perfil: </label>
                                    <div class ="campo">

                                        <select name="listaPerfil" size = 1 id = "perfil" class="element text medium" required >
                                            <option value="0" selected>
                                                Seleccionar el Perfil
                                            </option>
                                            <%List ListaPerfiles = (List) request.getAttribute("Perfiles");//se recibe el arreglo
                                                System.out.print("Cargando Perfiles...");
                                                Perfil oPerfil = null;//se define un objeto 
                                                for (int i = 0; i < ListaPerfiles.size(); i++) {
                                                    oPerfil = (Perfil) ListaPerfiles.get(i);%>
                                            <option value="<%=oPerfil.getId()%>" <%= idperfil == oPerfil.getId() ? " selected" : ""%>>
                                                <%=oPerfil.getNombre()%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </div> 
                                </li>
                            </div>
                        </ul>      

                       


                    </div>

                </fieldset> 
                <div class="btn">
                    <input type="submit" class="button medium blue" id = "validarr" name="validarr" value="GUARDAR"/>
                    <br>
                    <br> 


                </div>
                <input type="hidden" name="accion" value="modificar" />
                <input type="hidden" name="doc" value="<%=doc%>" />


                <br>
                <br> 


            </form>


        </div>
        <div id="finalpaginausuarios">
            <br>
            CORPORACIÓN UNIVERSITARIA  ADVENTISTA<br>
            Medellin - Colombia <br>
            JEOVANY ROJAS MEDINA <br>
            SERGIO MOSQUERA <br>
            AÑO 2012 
        </div>

    </body>
</html>
