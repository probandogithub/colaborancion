<%-- 
    Document   : confirmarEliminarC
    Created on : 28-05-2016, 22:25:56
    Author     : jonny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <style>
        .container{
            margin-top:150px;
            padding:100px;
        }
        .container2{
            width: 500px;
            height: 120px;
            border-radius: 20px;
            background-color: lightgrey;
        }
        .btn{
            border-radius: 10px; 
            background: lightgray;
        }

        </style>
    </head>
    <body>
        <center>
            <div class="container">
                <div class="container2">
                    <% String idConsola = request.getParameter("idConsola");%>
                    <div class="row">
                        <div class="col-xs-12">
                            <h2>¿Estas Seguro de Eliminar?</h2>
                        </div>    
                    </div>    
                    <div class="row">
                        <div class="col-xs-4"></div>
                        <div class="col-xs-2">
                            <a href="EliminarC?idConsola=<%out.println(idConsola);%>" class="btn btn-default"><b>Si</b></a>
                        </div>      
                        <div class="col-xs-1">    
                            <a href="ListaC" class="btn btn-default"><b>No</b></a>
                        </div>
                    </div>    
                </div>
            </div>            
        </center>
    </body>
</html>
