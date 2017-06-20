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
        <title>JSP Page</title>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <style>
            .row{
                padding:10px;
            }
            .error{
                background:lightcoral;
            }
            .container{
                padding: 15px;
                margin-top: 10px;
                width: 80%;
                background: lavender;
                border-radius: 20px;
            }
            .errores{
                background:lightcoral;
                padding: 10px;
                margin-top: 5px;
                width: 400px;
                height: 100%;
                border-radius: 20px;
            }
            .col-xs-4{
                font-weight: bold;
            }
            .btn{
                border-radius:10px;
                border-color: lightslategray;
                background-color:lightgray;
            }
        </style>
    </head>
    <body>
        <%
        String nombreusuario = request.getParameter("nombreusuario");
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String direccion = request.getParameter("direccion");
        String contrasena = request.getParameter("contrasena");
        
        String mensajesDeError = (String)request.getAttribute("mensajesDeError");
        String errorNombreUsuario = (String)request.getAttribute("mensajeNombreUsuario");
        String errorNombreUsuario2=(String)request.getAttribute("mensajeNombreUsuario2");
        String errorNombre = (String)request.getAttribute("mensajeNombre");
        String errorTelefono = (String)request.getAttribute("mensajeTelefono");
        String errorTelefono2 = (String)request.getAttribute("mensajeTelefono2");
        String errorTelefono3 = (String)request.getAttribute("mensajeTelefono3");
        String errorContraseña = (String)request.getAttribute("mensajeContraseña");
        String errorDireccion = (String)request.getAttribute("mensajeDireccion");
        String errorEmail = (String)request.getAttribute("mensajeEmail");
        String errorEmailArrPunto = (String)request.getAttribute("mensajeEmailArrPunto");
        String errorEmailArroba = (String)request.getAttribute("mensajeEmailArroba");
        String errorEmailPunto = (String)request.getAttribute("mensajeEmailPunto");
        String errorApellido = (String)request.getAttribute("mensajeApellido");
        %>
<div class="container2">
    <div class="col-xs-7">        
        <div class="container">
            <form action="Registro" id="Registroo">
                <div class="row">
                    <div class="col-xs-4">
                        Nombre de Usuario:
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
                    <div class="col-xs-4">
                        Nombre:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorNombre != null){
                                if(!errorNombre.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="nombre" value="<% if(nombre != null) out.print(nombre); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Apellido:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorApellido != null){
                                if(!errorApellido.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="apellido" value="<% if(apellido != null) out.print(apellido); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Dirección:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorDireccion != null){
                                if(!errorDireccion.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="direccion" value="<% if(direccion != null) out.print(direccion); %>"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4">
                        Teléfono:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorTelefono != null || errorTelefono2 != null || errorTelefono3 != null){
                                if(!errorTelefono.equals("")|| !errorTelefono2.equals("") || !errorTelefono3.equals("")){
                                    out.println("error");
                                }
                            }
                        %>" type="text" name="telefono" value="<% if(telefono != null) out.print(telefono); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Email:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorEmail != null || errorEmailArrPunto != null || errorEmailPunto != null || errorEmailArroba != null){
                                if((!errorEmail.equals(""))||(!errorEmailArroba.equals(""))||(!errorEmailPunto.equals(""))||(!errorEmailArrPunto.equals(""))){out.println("error");
                            }
                        }
                        %>" type="email" name="email" value="<% if(email != null) out.print(email); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Contraseña:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorContraseña != null){
                                if(!errorContraseña.equals("")){out.println("error");
                            }
                        }
                        %>" type="password" name="contrasena" value="<% if(contrasena != null) out.print(contrasena); %>"/>
                    </div>
                </div>
                    
                <div class="row">
                    <div class="col-xs-8">
                        <input class="btn btn-default" type="submit" value="Registrarse"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
         <%if(mensajesDeError != null){ %>   
            <div class="row">
                <div class="col-xs-12 errores">
                    <center><b><%if(mensajesDeError != null){ 
                        out.println(mensajesDeError);}%></b></center>
                </div>
            </div>
            <%}%> 
</div>      



        <script>
            $(document).on("submit","#Registroo",function( event ) {
              event.preventDefault();
              var $form = $( this ),
                nombreusuario = $form.find( "input[name='nombreusuario']" ).val(),
                nombre = $form.find( "input[name='nombre']" ).val(),
                contrasena= $form.find( "input[name='contrasena']" ).val(),
                telefono = $form.find( "input[name='telefono']" ).val(),
                email = $form.find( "input[name='email']" ).val(),
                apellido = $form.find( "input[name='apellido']" ).val(),
                direccion = $form.find( "input[name='direccion']" ).val(),
                
                Registro = $form.attr( "action" );
                var posting = $.post( "Registro", { nombreusuario:nombreusuario, contrasena:contrasena , nombre:nombre,telefono:telefono,email:email,direccion:direccion,apellido:apellido} );
                posting.done(function( respuestaJson ) {
                   var contenidotabla = "";
                   var usuario = JSON.parse(respuestaJson);
                   console.log(usuario);
                   contenidotabla+=
                                "<div class='col-xs-7'>"+
                                    "<div class='container'>"+
                                    "<form action='Registro' id='Registroo'>"+
                                    "<div class='row'>"+
                                    "</div>"+
                                    
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Nombre de Usuario:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input type='text' name='nombreusuario' value='"+usuario.nombreUsuario+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Nombre:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input type='text' name='nombre' value='"+usuario.nombre+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Apellido:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input type='text' name='apellido' value='"+usuario.apellido+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Direccion:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input type='text' name='direccion' value='"+usuario.direccion+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Telefono:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input type='text' name='telefono' value='"+usuario.telefono+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Email:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input type='text' name='email' value='"+usuario.email+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Contraseña:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input type='password' name='contrasena' value='"+usuario.contrasena+"'/>"+
                                    "</div>"+
                                "</div>"+
                                

                                "<div class='row'>"+
                                    "<div class='col-xs-8'>"+
                                        "<input type='submit' class='btn btn-default'  value='Registrarse'/>"+
                                    "</div>"+
                                "</div>"+
                             "</form>"+
                            "</div>"+
                         "</div>"+


                        "<div class='row'>"+
                            "<div class='col-xs-12 errores'> "+
                            "<center><b>"+usuario.mensajesdeError+"</b></center>"+
                            "</div>"+
                        "</div>";
                    $('.container2').html(contenidotabla);
                    if(usuario.mensajesdeError == ''){
                        window.location = "Lista";
                    }

              });
            });


            </script> 
    </body>
</html>
