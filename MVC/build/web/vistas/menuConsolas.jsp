<%-- 
    Document   : MenuConsolas
    Created on : 29-05-2016, 2:10:58
    Author     : jonny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu de Consolas</title>
        
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <style>
            .container{
                padding: 15px;
                margin-top: 200px;
                width: 600px;
                height: 150px;
                background: lavender;
                border-radius: 20px;
            }
            .btn{
                border-radius:10px;
                border-color: lightslategray;
                background-color:lightgray;
            }
            .borde{
                margin-top: 20px;
            }
            .fuente{
                font-family: cursive; 
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row fuente"><center><h2>Menu Consolas</h2></center></div>
            <a href="ListaC" class="btn btn-default borde">Lista de Consolas</a>
            <a href="Modificar0C" class="btn btn-default borde">Modificar Consolas</a>
            <a href="MenuPrincipal" class="btn btn-default borde">Menu Principal</a>
            <a href="Registro2" class="btn btn-default borde">Registrar Consolas</a>
        </div>
    </body>
</html>
