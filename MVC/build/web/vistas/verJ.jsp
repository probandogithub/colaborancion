<%-- 
    Document   : verJ
    Created on : 29-05-2016, 2:36:15
    Author     : jonny
--%>

<%@page import="java.util.List"%>
<%@page import="modelos.Juego"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juego</title>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <style>
            .container{
                padding: 15px;
                margin-top: 10px;
                background: lavender;
                border-radius: 20px;
                width: 400px;
                height: 620px;
            }
            .row{
                padding:10px;
                
            }
            .titulo{
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
       <% String idJuego = request.getParameter("idJuego");
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
            EntityManager em = emf.createEntityManager();
            List<Juego> juegos = em.createNamedQuery("Juego.findAll",Juego.class).getResultList();
            for(int i=0;i<juegos.size();i++){
                Juego j = juegos.get(i);
                String idC = j.getIdJuego();
                if(idC.equals(idJuego)){
                    String nombre = j.getNombre();
                    String desarrollador = j.getDesarrollador();
                    String distribuidora = j.getDistribuidora();
                    String plataforma = j.getPlataforma();
                    String genero = j.getGenero();
                    String lanzamiento=j.getLanzamiento();
                    String argumento = j.getArgumento();
                    String sistema = j.getSistema();
                   %>
                   <div class="container">
                        <div class="row">
                            <center><img src="images/juego.png" width="65px" height="80px"></center>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>idJuego: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(idJuego);%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Nombre: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(nombre);%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Desarrollador: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(desarrollador);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Distribuidora: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(distribuidora);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Plataforma: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(plataforma);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Genero: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(genero);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Lanzamiento: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(lanzamiento);%>
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Sistema: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(sistema);%>
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Argumento: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(argumento);%>
                            </div>
                        </div>     
                   
                   <%            
                }
            }
            em.close();
            emf.close();
          
            
        %>
                        <div class="row">
                            <div class="col-xs-9"></div>
                            <div class="col-xs-1">
                                 <a href="ListaJ" class="btn btn-default">Volver</a>
                            </div>    
                        </div>
                    </div>    
    </body>
</html>
