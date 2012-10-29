

$(document).ready(function(){
    
    $("#olvipass").click(function(){
        mensaje="Por el momento no tenemos como recuperar tu contraseña";
        $("#ok").html(mensaje);
        $( "#dialog" ).dialog( "option", "width", 460 );
        $( "#dialog" ).dialog( "option", "title", "No disponible !");
        $( "#dialog" ).dialog( "open" );   
    });
    
    
    $("#Entrarlogin").click(function(){        
        if ($("#campo1").attr("value")!="" && $("#campo2").attr("value")!="" ){            
            $("#for").submit();
            
        }else
        {
            $("#ok").html("Por favor ingrese El usuario y/o La Contraseña");
            $( "#dialog" ).dialog( "option", "width", 400 );
            $( "#dialog" ).dialog( "option", "title", "Login !");
            $( "#dialog" ).dialog( "open" ); 
            $("#campo1").attr("value","");
            $("#campo2").attr("value","");
        }                
    });
    
    $(".texto").focus(function(){
        $(this).addClass("active");   
        
    });
    
    $(".texto").blur(function(){
        $(this).removeClass("active");
        
        if ($("#repitapassword").attr("value")!="" && $("#passwor").attr("value")!="" && $("#repitapassword").attr("value")!= $("#passwor").attr("value")){                        
        }
        else{
            $(".alerta").html("");
            $("#capaerrores").css("display","none");
        }
    }); 
    
    $("#validar").click(function(){
	
        $(".alerta").css("display","none"); 
        $("#capaerrores").css("display","none");
        var resultado_ok=true; 
	
		 		
        if($("#cod").val() == "") { 
            $("#errorcodigo").html("* Falta ingresar el Código");
            $("#cod").addClass("active");
            $("#errorcodigo").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorcodigo").css("display","block");

            resultado_ok=false;				        
        }
        
         if($("#nombre").val() == "") { 
            $("#errornombre").html("* Falta ingresar el Nombre");
            $("#nombre").addClass("active");
            $("#errornombre").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errornombre").css("display","block");

            resultado_ok=false;				        
        }
		
        if($("#ape").val() == "") { 
            $("#ape").css("background", "23E727");
            $("#errorape").html("* Falta ingresar los Apellidos");
            $("#ape").addClass("active");
            $("#errorape").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorape").css("display","block");
            resultado_ok=false;		
        }
        if($("#doc").val() == "") { 
            $("#doc").css("background", "23E727");
            $("#errordoc").html("* Falta ingresar el Documento de Identidad");
            $("#doc").addClass("active");
            $("#errordoc").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errordoc").css("display","block");
            resultado_ok=false;		
        }
        
        if($("#correoo").val() == "") {  
            $("#correoo").css("background", "23E727");
            $("#errorcorreoo").html("* Falta ingresar el Correo Electrónico"); 
            $("#correoo").addClass("active");
            $("#errorcorreoo").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorcorreoo").css("display","block");
            resultado_ok=false;		
              
        }  
        else if($("#correoo").val().indexOf('@', 0) == -1 || $("#correoo").val().indexOf('.', 0) == -1) {  
            $("#correoo").css("background", "23E727");
            $("#errorvalcorreoo").html("* El correo debe tener una longitud mínima de 3 caracteres y debe tener una @");   
            $("#correoo").addClass("active");
            $("#errorvalcorreoo").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorvalcorreoo").css("display","block");
            resultado_ok=false;		
         
        }
                             
        if($("#passwor").val() == "") { 
            $("#passwor").css("background", "23E727");
            $("#errorpasswor").html("* Falta ingresar la Password");
            $("#passwor").addClass("active");
            $("#errorpasswor").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorpasswor").css("display","block");
            resultado_ok=false;		
        
        } 
        if($("#repitapassword").val() == "") {  
            $("#repitapassword").css("background", "23E727");
            $("#errorrepitapassword").html("* Falta confirmar la Password");  
            $("#repitapassword").addClass("active");
            $("#errorrepitapassword").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorrepitapassword").css("display","block");
            resultado_ok=false;		
           
        }
                           
         if($("#carrera").val() == "") {  
            $("#errorcarrera").html("* Falta ingresar la Carrera");   
            $("#carrera").addClass("active");
            $("#errorcarrera").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorcarrera").css("display","block");
            resultado_ok=false;		
        }

        if($("#semestre").val() == 1) { 
            $("#errorsemestre").html("* No ha seleccionado el Semestre"); 
            $("#semestre").addClass("active");
            $("#errorsemestre").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorsemestre").css("display","block");
            resultado_ok=false;		
        }
        
        if($("#mac").val() == "") { 
            $("#errormac").html("* No ha ingresado la MAC del Portátil"); 
            $("#mac").addClass("active");
            $("#errormac").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errormac").css("display","block");
            resultado_ok=false;		
        }
        if($("#pc").val() == "") { 
            $("#errorpc").html("* No ha ingresado la Marca del Portátil"); 
            $("#pc").addClass("active");
            $("#errorpc").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorpc").css("display","block");
            resultado_ok=false;		
        }
        if($("#color").val() == "") { 
            $("#errorcolor").html("* No ha ingresado el color del Portátil"); 
            $("#color").addClass("active");
            $("#errorcolor").fadeIn();
            $("#capaerrores").css("display","block");
            $("#errorcolor").css("display","block");
            resultado_ok=false;		
        }
        
                
        if (resultado_ok==true) {
        $("#capaerrores").css("display","none");     
         $("#reg").submit();
        }	

    }); 
    
    

    //ingresar solo numeros en el telefono
    $("#tel").keypress(function(e) { 
        //(var key = condicion? valorsitrue: valorsifalse)
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        //presiono borrar
        if (key==8){
            return true;
        }
        // si es presionado un numero
        if(key < 48 || key > 57)
        { 
            return false;
        }
    });
    
    // ingreso solo numeros al campo de busqueda de la pagina de EliminarUsuarios
    $("#docx").keypress(function(e) { 
        //(var key = condicion? valorsitrue: valorsifalse)
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        //presiono borrar
        if (key==8){
            return true;
        }
        // si es presionado un numero
        if(key < 48 || key > 57)
        { 
            return false;
        }
    });
    
     $("#cod").keypress(function(e) { 
        //(var key = condicion? valorsitrue: valorsifalse)
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        //presiono borrar
        if (key==8){
            return true;
        }
        // si es presionado un numero
        if(key < 48 || key > 57)
        { 
            return false;
        }
    });
    
     $("#doc").keypress(function(e) { 
        //(var key = condicion? valorsitrue: valorsifalse)
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        //presiono borrar
        if (key==8){
            return true;
        }
        // si es presionado un numero
        if(key < 48 || key > 57)
        { 
            return false;
        }
    });
    
    //prueba 
       //validar contraseña y repeticion contraseña
    $("#passwor,#repitapassword").blur(function(){        
        if ($("#repitapassword").attr("value")!="" && $("#passwor").attr("value")!="" && $("#repitapassword").attr("value")!= $("#passwor").attr("value")){            
             $("#errorvalpassword").html("* Las contraseñas no coinciden"); 
            
            $("#capaerrores").css("display","block");
            $("#validar").attr('disabled', 'disabled');
            $("#errorvalpassword").css("display","block");
        }
        else{
            $("#errorvalpassword").html(""); 
             $("#capaerrores").css("display","none"); 
             $("#errorvalpassword").css("display","none");
             $("#validar").attr('disabled', false);
        }
         });

    
});
    
    
//animación del logo
    
lightning_one(4000);
  
function lightning_one(t){
    $("#logo").fadeIn(2500).fadeOut(2500);
    setTimeout("lightning_one()",t);
};
    
   
$(function() {
    $( "#tabs" ).tabs();
});



$.fx.speeds._default = 1000;
$(function() {    
    $( "#dialog" ).dialog({
        autoOpen: false,
        show: "blind",
        hide: "explode"
    });    
});
