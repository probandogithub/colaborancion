<%-- 
    Document   : registro2
    Created on : 01-06-2016, 2:22:38
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
        String idConsola = request.getParameter("idConsola");
        String fabricante = request.getParameter("fabricante");
        String generacion = request.getParameter("generacion");
        String lanzamiento = request.getParameter("lanzamiento");
        String cpu = request.getParameter("cpu");
        String soporte = request.getParameter("soporte");
        String nombre=request.getParameter("nombre");
        
        String mensajesDeError = (String)request.getAttribute("mensajesDeError");
        String errorFabricante = (String)request.getAttribute("mensajeFabricante");
        String errorGeneracion = (String)request.getAttribute("mensajeGeneracion");
        String errorLanzamiento = (String)request.getAttribute("mensajeLanzamiento");
        String errorCpu = (String)request.getAttribute("mensajeCpu");
        String errorSoporte= (String)request.getAttribute("mensajeSoporte");
        String errorNombre = (String)request.getAttribute("mensajeNombre");
        String errorIdConsola = (String)request.getAttribute("mensajeIdConsola");
        String errorIdConsola2 = (String)request.getAttribute("mensajeIdConsola2");
        %>
<div class="container2">
    <div class="col-xs-7">         
        <div class="container">
            <form action="Registro2" id="Registro02">
                <div class="row">
                    <div class="col-xs-4">
                        ID Consola:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorIdConsola!= null || errorIdConsola2!= null ){
                                if(!errorIdConsola.equals("") || !errorIdConsola2.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="idConsola" value="<% if(idConsola != null) out.print(idConsola); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Nombre:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorNombre!= null){
                                if(!errorNombre.equals("")){out.println("error");
                            }
                        }
                        %>"  type="text" name="nombre" value="<% if(nombre != null) out.print(nombre); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Fabricante:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorFabricante!= null){
                                if(!errorFabricante.equals("")){out.println("error");
                            }
                        }
                        %>"  type="text" name="fabricante"value="<% if(fabricante != null) out.print(fabricante); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Generacion:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorGeneracion!= null){
                                if(!errorGeneracion.equals("")){out.println("error");
                            }
                        }
                        %>"  type="text" name="generacion"value="<% if(generacion != null) out.print(generacion); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Lanzamiento:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorLanzamiento!= null){
                                if(!errorLanzamiento.equals("")){out.println("error");
                            }
                        }
                        %>"type="text" name="lanzamiento"value="<% if(lanzamiento != null) out.print(lanzamiento); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Cpu:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorCpu!= null){
                                if(!errorCpu.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="cpu"value="<% if(cpu != null) out.print(cpu); %>"/>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-xs-4">
                        Soporte:
                    </div>
                    <div class="col-xs-4">
                        <input class="<% 
                            if(errorSoporte!= null){
                                if(!errorSoporte.equals("")){out.println("error");
                            }
                        }
                        %>" type="text" name="soporte"value="<% if(soporte!= null) out.print(soporte); %>"/>
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
    $(document).on("submit","#Registro02",function( event ) {
              event.preventDefault();
              var $form = $( this ),
                idConsola = $form.find( "input[name='idConsola']" ).val(),
                nombre = $form.find( "input[name='nombre']" ).val(),
                cpu= $form.find( "input[name='cpu']" ).val(),
                fabricante = $form.find( "input[name='fabricante']" ).val(),
                generacion = $form.find( "input[name='generacion']" ).val(),
                lanzamiento = $form.find( "input[name='lanzamiento']" ).val(),
                soporte = $form.find( "input[name='soporte']" ).val(),
                
                Registro2 = $form.attr( "action" );
                var posting = $.post( "Registro2", { idConsola:idConsola,nombre:nombre,cpu:cpu,fabricante:fabricante,generacion:generacion,lanzamiento:lanzamiento,soporte:soporte } );
                posting.done(function( respuestaJson ) {
                   var contenidotabla = "";
                   var consola = JSON.parse(respuestaJson);
                   console.log(consola);
                        contenidotabla +=
                                "<div class='col-xs-7'>"+
                                    "<div class='container'>"+
                                    "<form action='Registro2' id='Registro02'>"+
                                    "<div class='row'>"+
                                    "</div>"+
                                    
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>idConsola:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+consola.errorIdConsola+"' type='text' name='idConsola' value='"+consola.idConsola+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Nombre:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+consola.errorNombre+"' type='text' name='nombre' value='"+consola.nombre+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Fabricante:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+consola.errorFabricante+"' type='text' name='fabricante' value='"+consola.fabricante+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Generacion:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+consola.errorGeneracion+"' type='text' name='generacion' value='"+consola.generacion+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Lanzamiento:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+consola.errorLanzamiento+"' type='text' name='lanzamiento' value='"+consola.lanzamiento+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Cpu:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+consola.errorCpu+"' type='text' name='cpu' value='"+consola.cpu+"'/>"+
                                    "</div>"+
                                "</div>"+
                                
                                "<div class='row'>"+
                                    "<div class='col-xs-4'>"+
                                        "<b>Soporte:</b>"+
                                    "</div>"+
                                    "<div class='col-xs-4'>"+
                                        "<input class='"+consola.errorSoporte+"' type='password' name='soporte' value='"+consola.soporte+"'/>"+
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
                            "<center><b>"+consola.mensajesdeError+"</b></center>"+
                            "</div>"+
                        "</div>";
                
                    $('.container2').html(contenidotabla);
                    if(consola.mensajesdeError == ''){
                        window.location = "ListaC";
                    }
              });
            });


            </script> 
            
            
    </body>
</html>