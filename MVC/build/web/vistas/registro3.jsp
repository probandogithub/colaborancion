<%-- 
    Document   : Registro3
    Created on : 01-06-2016, 3:27:53
    Author     : jonny
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
        String idJuego = request.getParameter("idJuego");
        String desarrollador = request.getParameter("desarrollador");
        String distribuidora = request.getParameter("distribuidora");
        String plataforma = request.getParameter("plataforma");
        String genero = request.getParameter("genero");
        String lanzamiento = request.getParameter("lanzamiento");
        String argumento = request.getParameter("argumento");
        String sistema = request.getParameter("sistema");
        String nombre = request.getParameter("nombre");
        
        String mensajesDeError = (String)request.getAttribute("mensajesDeError");
        String erroridJuego = (String)request.getAttribute("mensajeIdJuego");
        String erroridJuego2=(String)request.getParameter("mensajeIdJuego2");
        String errorNombre = (String)request.getAttribute("mensajeNombre");
        String errorDesarrollador = (String)request.getAttribute("mensajeDesarrollador");
        String errorDistribuidora = (String)request.getAttribute("mensajeDistribuidora");
        String errorPlataforma = (String)request.getAttribute("mensajePlataforma");
        String errorGenero = (String)request.getAttribute("mensajeGenero");
        String errorLanzamiento = (String)request.getAttribute("mensajeLanzamiento");
        String errorArgumento = (String)request.getAttribute("mensajeArgumento");
        String errorSistema = (String)request.getAttribute("mensajeSistema");
        %>
<div class="container2">
    <div class="col-xs-7">        
        <div class="container">
            <form action="Registro3" id="Registro03">
                <div class="row">
                    <div class="col-xs-4">
                        idJuego:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(erroridJuego != null || erroridJuego2 != null){
                                if(!erroridJuego.equals("")|| erroridJuego2 != null){out.println("error");
                            }
                        }
                        %>" type="text" name="idJuego" value="<% if(idJuego != null) out.print(idJuego); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Nombre :
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
                        Desarrollador:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorDesarrollador != null){
                                if(!errorDesarrollador.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="desarrollador"value="<% if(desarrollador != null) out.print(desarrollador); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Distribuidora:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorDistribuidora != null){
                                if(!errorDistribuidora.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="distribuidora"value="<% if(distribuidora != null) out.print(distribuidora); %>"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4">
                        Plataforma:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorPlataforma != null){
                                if(!errorPlataforma.equals("")){out.println("error");
                            }
                        }
                        %>"  type="text" name="plataforma"value="<% if(plataforma != null) out.print(plataforma); %>" />
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Genero:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorGenero != null){
                                if(!errorGenero.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="genero"value="<% if(genero != null) out.print(genero); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Lanzamiento:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorLanzamiento != null){
                                if(!errorLanzamiento.equals("")){out.println("error");
                            }
                        }
                        %>" type="date" name="lanzamiento"value="<% if(lanzamiento != null) out.print(lanzamiento); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Argumento:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorArgumento != null){
                                if(!errorArgumento.equals("")){out.println("error");
                            }
                        }
                        %>"  type="text" name="argumento"value="<% if(argumento != null) out.print(argumento); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Sistema:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorSistema != null){
                                if(!errorSistema.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="sistema"value="<% if(sistema != null) out.print(sistema); %>"/>
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
       $(document).on("submit","#Registro03",function( event ) {
              event.preventDefault();
              var $form = $( this ),
                idJuego = $form.find( "input[name='idJuego']" ).val(),
                nombre = $form.find( "input[name='nombre']" ).val(),
                desarrollador= $form.find( "input[name='desarrollador']" ).val(),
                distribuidora = $form.find( "input[name='distribuidora']" ).val(),
                genero = $form.find( "input[name='genero']" ).val(),
                lanzamiento = $form.find( "input[name='lanzamiento']" ).val(),
                plataforma = $form.find( "input[name='plataforma']" ).val(),
                sistema = $form.find( "input[name='sistema']" ).val(),
                argumento = $form.find( "input[name='argumento']" ).val(),
                    
                Registro3 = $form.attr( "action" );
                var posting = $.post( "Registro3", { idJuego:idJuego,nombre:nombre,desarrollador:desarrollador,distribuidora:distribuidora,genero:genero,lanzamiento:lanzamiento,plataforma:plataforma,sistema:sistema,argumento:argumento } );
                posting.done(function( respuestaJson ) {
                   var contenidotabla = "";
                   var juego = JSON.parse(respuestaJson);
                   console.log(juego);
                    
                        contenidotabla +=
                                "<div class='col-xs-7'>"+
                                    "<div class='container'>"+
                                    "<form action='Registro3' id='Registro03'>"+
                                    "<div class='row'>"+
                                    "</div>"+
                                    
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>idJuego:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorIdJuego+"' type='text' name='idJuego' value='"+juego.idJuego+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Nombre:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorNombre+"' type='text' name='nombre' value='"+juego.nombre+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Desarrollador:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorDesarrollador+"' type='text' name='desarrollador' value='"+juego.desarrollador+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Distribuidora:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorDistribuidora+"' type='text' name='distribuidora' value='"+juego.distribuidora+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Plataforma:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorPlataforma+"' type='text' name='plataforma' value='"+juego.plataforma+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Genero:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorGenero+"' type='text' name='genero' value='"+juego.genero+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Lanzamiento:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorLanzamiento+"' type='text' name='lanzamiento' value='"+juego.lanzamiento+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Argumento:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorArgumento+"' type='text' name='argumento' value='"+juego.argumento+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Sistema:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+juego.errorSistema+"' type='text' name='sistema' value='"+juego.sistema+"'/>"+
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
                            "<center><b>"+juego.mensajesdeError+"</b></center>"+
                            "</div>"+
                        "</div>";
                        
                
                    $('.container2').html(contenidotabla);
                    if(juego.mensajesdeError == ''){
                        window.location = "ListaJ";
                    }

              });
            });


            </script> 
            
    </body>
</html>
