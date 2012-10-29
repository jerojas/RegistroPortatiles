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
        <title>Quiénes somos</title>
        <link type="text/css" href="css/estilos.css" rel="stylesheet" />
        <script src = "js/jquery-1.8.0.min.js"></script>
        <script src = "js/scripts.js"></script>
        <script src = "js/jquery-ui-1.8.23.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css"/> 
        <link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style>._css3m{display:none}</style>
        <link href="imagenes/favicon.png" type="image/x-icon" rel="shortcut icon" />
        
         <link rel="stylesheet" type="text/css" href="css/view.css" media="all">
        <script>
            $(function() {
                $( "#accordion" ).accordion();
            });
        </script>

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
        <div class="cuerpoindex" id="content" align="CENTER"> 
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

            <div>
                <div id="accordion">
                    <h3>  &nbsp &nbsp &nbsp       Misión</h3>
                    <div>
                        <p>La Corporación Universitaria Adventista reconoce a Dios como Creador, Redentor y Sustentador del hombre y del universo; y en armonía con los principios filosóficos y educativos inspirados por el Espíritu Santo, evidenciados en la naturaleza, ejemplificados por Jesucristo, expuestos en las Sagradas Escrituras y tal como los profesa la iglesia Adventista del Séptimo Día, nuestra Institución declara como su misión propiciar y fomentar una significativa relación del hombre con Dios por medio del trabajo en las diferentes disciplinas del conocimiento. En consecuencia, la Corporación se define como una institución universitaria sin ánimo de lucro que desarrolla su labor educativa enmarcada en el servicio a Dios, la comunidad adventista y la sociedad en general.<br><br>
                            El trabajo del conocimiento se fundamenta en tres pilares: la formación integral, la cultura investigativa y la excelencia en el servicio,en el que el hombre es el agente principal del proceso educativo que persigue el desarrollo armónico de los aspectos físicos, mentales sociales y espirituales. La misión se desarrollará en procura de los altos niveles de calidad educativa, a través de un personal calificado con un profundo sentido de compromiso, apoyado en el uso óptimo de los recursos físicos, financieros y tecnológicos.
                        </p>
                    </div>
                    <h3>&nbsp &nbsp &nbsp Visión</h3>
                    <div>
                        <p>
                            La Corporación Universitaria Adventista será una universidad completamente accesible a la Iglesia Adventista del Séptimo Día en particular, y a la comunidad en general, con el propósito de preparar ciudadanos para este mundo y para la eternidad.
                        </p>
                    </div>
                    <h3>&nbsp &nbsp &nbsp Perfiles Institucionales</h3>
                    <div>
                        <p>
                        <ol type="1">
                            <li><em>Una sólida formación cristiana.</em> El egresado es una persona íntegra, con altos ideales fundamentados en valores, con capacidad para servir a la sociedad utilizando los conocimientos adquiridos y aplicando los principios recibidos en su Alma Máter</li><br>
                            <li><em>Competencia profesional y laboral.</em> El egresado es un profesional de excelencia. Con competencias cognitivas y laborales que le permiten desempeñarse profesionalmente en las áreas del conocimiento para las cuales fue formado. Con capacidad para crear nuevas propuestas de mejoramiento y alternativas de solución a los problemas que se presenten.</li><br>
                            <li><em>Un compromiso con el servicio.</em> El egresado es un líder servidor. Reconoce en cada ser humano una criatura formada a imagen de Dios y alguien por quien Cristo murió. Por lo tanto, desarrolla una labor social enfocada en el servicio a los demás. </li><br>
                            <li><em>Cuidado personal y de la salud</em>. El egresado reconoce la importancia de mantener su salud física y mental, por ende practica un estilo de vida que incluye la sana alimentación, hábitos de higiene, el ejercicio físico, la recreación y el descanso.</li><br>
                        </ol>
                        </p>
                    </div>
                    <h3>&nbsp &nbsp &nbsp Ubicación</h3>
                    <div>
                        <p>
                            Desarrollar una aplicación que permita gestionar el ingreso de portátiles al edificio 
                            Bolívar Rave.  
                        </p>
                        
                    </div>
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
