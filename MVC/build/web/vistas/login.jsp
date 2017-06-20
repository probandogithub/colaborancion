<%-- 
    Document   : login
    Created on : 02-05-2016, 14:19:08
    Author     : crmoya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <style>
            .row{
                padding:10px;
            }
            .container{
                padding: 15px;
                margin-top: 10px;
                width: 450px;
                height: 200px;
                background: lavender;
                border-radius: 20px;
            }
            .btn{
                border-radius:10px;
                border-color: lightslategray;
                background-color:lightgray;
            }
            .error{
                background:lightcoral;
            }
            .errores{
                background:lightcoral;
                padding: 10px;
                margin-top: 5px;
                width: 445px;
                height: 70px;
                border-radius: 20px;
                
            }
        </style>
    </head>
    <body>
        <%
        String nombreusuario = request.getParameter("nombreusuario");
        String contrasena = request.getParameter("contrasena");
        String mensajesDeError = (String)request.getAttribute("mensajesDeError");
        String errorNombreUsuario = (String)request.getAttribute("mensajeNombreUsuario");
        String errorContraseña = (String)request.getAttribute("mensajeContraseña");
        String errorNombreUsuario2 = (String)request.getAttribute("mensajeNombreUsuario2");
        String errorContraseña2 = (String)request.getAttribute("mensajeContraseña2");


        %>
        <div class="container2">
        <div class="row">
            <div class="col-xs-4"></div>
            <div class="col-xs-6">
            <%if(mensajesDeError != null){ %>   
            <div class="row">
                <div class="col-xs-12 errores">
                    <center><b><%if(mensajesDeError != null){ 
                        out.println(mensajesDeError);}%></b></center>
                </div>
            </div>
            <%}%> 
            </div>
        </div>
        <div class="container">
            <form action="Login" id="Loginn">
   
                <div class="row">
                <div class="row">
                    <div class="col-xs-5">
                        <b>Nombre de Usuario:</b>
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorNombreUsuario != null || errorNombreUsuario2 != null ){
                                if(!errorNombreUsuario.equals("") || !errorNombreUsuario2.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="nombreusuario" value="<% if(nombreusuario != null) out.print(nombreusuario); %>"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5">
                        <b>Clave:</b>
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorContraseña != null || errorContraseña2 != null){
                                if(!errorContraseña.equals("") || !errorContraseña2.equals("")){out.println("error");
                            }
                        }
                        %>" type="password" name="contrasena" value="<% if(contrasena != null) out.print(contrasena); %>"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5">
                        <input class="btn btn-default" type="submit" value="INGRESAR"/>
                    </div>
                    <div class="col-xs-4">
                        <a href="Registro" class="btn btn-default">REGISTRARSE</a>
                    </div>     
                </div>
                
                
            </form>
        </div>
        </div>
        </div>
                    
       
            <script>

            $(document).on("submit","#Loginn",function( event ) {
                event.preventDefault();
              var $form = $( this ),
                nombreusuario = $form.find( "input[name='nombreusuario']" ).val(),
                contrasena= $form.find( "input[name='contrasena']" ).val(),
                Login = $form.attr( "action" );
                var posting = $.post( "Login", { nombreusuario:nombreusuario, contrasena:contrasena } );
                posting.done(function( respuestaJson ) {
                   var contenidotabla = "";
                   var usuario = JSON.parse(respuestaJson);
                   console.log(usuario);
                   contenidotabla += 
                    "<div class='row'>"+
                        "<div class='col-xs-4'></div>"+
                        "<div class='col-xs-6'>"+
                            "<div class='row'>"+
                                "<div class='col-xs-12 errores'> "+
                                "<center><b>"+usuario.mensajesdeError+"</b></center>"+
                                "</div>"+
                            "</div>"+
                        "</div>"+
                    "</div>"+
                    "<div class='container'>"+
                        "<form action='Login' id='Loginn'>"+
                        "<div class='row'>"+

                            "<div class='row'>"+
                                "<div class='col-xs-5'>"+
                                    "<b>Nombre de Usuario:</b>"+
                                "</div>"+
                                "<div class='col-xs-4'>"+
                                    "<input class='"+usuario.ErrorName +"'type='text' name='nombreusuario' value='"+usuario.nombreUsuario+"'/>"+
                                "</div>"+
                            "</div>"+

                            "<div class='row'>"+
                                "<div class='col-xs-5'>"+
                                    "<b>Contraseña:</b>"+
                                "</div>"+
                                "<div class='col-xs-4'>"+
                                    "<input class='"+usuario.ErrorContraseña+"'type='text' name='contrasena' value='"+usuario.contrasena+"'/>"+
                                "</div>"+
                            "</div>"+

                            "<div class='row'>"+
                                "<div class='col-xs-5'>"+
                                    "<input class='btn btn-default btn-Login' type='submit' value='Login'/>"+
                                "</div>"+
                                "<div class='col-xs-4'>"+
                                    "<a href='Registro' class='btn btn-default'>REGISTRARSE</a>"+
                                "</div> "+
                            "</div>"+  
                        "</form>"+
                        "</div>"+
                     "</div>"; 
                    $('.container2').html(contenidotabla);
                    
                    if(usuario.mensajesdeError == ''){
                        window.location = "MenuPrincipal";
                    }

              });
            });


            </script>        
    </body>
</html>