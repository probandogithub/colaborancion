<%-- 
    Document   : menuUsuarios
    Created on : 29-05-2016, 2:10:33
    Author     : jonny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu de Usuario</title>
        
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
            <div class="row fuente"><center><h2>Menu Usuarios</h2></center></div>
            <a href="Lista" class="btn btn-default borde">Lista de Usuarios</a>
            <a href="Registro" class="btn btn-default borde">Registro Usuarios</a>
            <a href="Modificar0" class="btn btn-default borde">Modificar Usuarios</a>
            <a href="MenuPrincipal" class="btn btn-default borde">MenuPrincipal</a>
        </div>

    </body>
</html>
