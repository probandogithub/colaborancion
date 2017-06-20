<%-- 
    Document   : menuPrincipal
    Created on : 29-05-2016, 1:53:09
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
            .container{
                padding: 15px;
                margin-top: 200px;
                width: 450px;
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
            <div class="row fuente"><center><h2>Menu Principal</h2></center></div>
            <a href="MenuUsuarios" class="btn btn-default borde">Menu Usuarios</a>
            <a href="MenuConsolas" class="btn btn-default borde">Menu Consolas</a>
            <a href="MenuJuegos" class="btn btn-default borde">Menu Juegos</a>
        </div>
    </body>
</html>
