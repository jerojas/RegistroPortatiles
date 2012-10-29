/************************************************************************
 *************************************************************************
@Name :       	jMenu - jQuery Plugin
@Revison :    	1.9
@Date : 		09/2012
@Author:     	ALPIXEL - (www.myjqueryplugins.com - www.alpixel.fr)
@Support:    	FF, IE7, IE8, MAC Firefox, MAC Safari
@License :		Open Source - MIT License : http://www.opensource.org/licenses/mit-license.php
 
 **************************************************************************
 *************************************************************************/

/** 
@ IsHovered Plugin 
@ Thanks to Chad Smith fr his isHovered Plugin 
@ source : http://mktgdept.com/jquery-ishovered
 **/

//Jquery Ingreso
$(document).ready(function(evento){
    $("#Ingresar").click(function (){	 
        $(".error").remove();
        if( ($(".Codigo").val() == "")){
            $(".Codigo").focus().after($("<span class='error'>El campo esta Vacio</span>").fadeIn(3000).fadeOut(3000));
            $("#form")[0].reset();
             
        }
     
    });
    //Jquery Login administrador
    $("#Entrarlogin").click(function (){
    
        $(".error").remove();
        
       if(($("#campo1").attr("value") != "")&&($("#campo2").attr("value") != "")){
            $("#for").submit();
        
       } 
       if( ($("#campo1").val() != "")&&($("#campo2").val() == "")){
            $("#campo2").focus().after($("<span class='errorss'>Ingrese su Contraseña</span>").fadeIn(3000).fadeOut(3000));
          
        }
        if( ($("#campo2").val() != "")&&($("#campo1").val() == "")){
            $("#campo1").focus().after($("<span class='errorss'>Ingrese su usuario</span>").fadeIn(3000).fadeOut(3000));
           
        }
        if( ($("#campo2").val() == "")&&($("#campo1").val() == "")){
            $("#campo2").focus().after($("<span class='errorss'>Ingrese su Contraseña</span>").fadeIn(3000).fadeOut(3000));
            $("#campo1").focus().after($("<span class='errorss'>Ingrese su usuario</span>").fadeIn(3000).fadeOut(3000));
           
        
        }

    });
   
});
