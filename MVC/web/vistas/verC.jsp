<%-- 
    Document   : verC
    Created on : 29-05-2016, 0:30:48
    Author     : jonny
--%>

<%@page import="java.util.List"%>
<%@page import="modelos.Consola"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consola</title>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <style>
            .container{
                padding: 15px;
                margin-top: 40px;
                background: lavender;
                border-radius: 20px;
                width: 400px;
                height: 550px;
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
       <% String idConsola = request.getParameter("idConsola");
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
            EntityManager em = emf.createEntityManager();
            List<Consola> consolas = em.createNamedQuery("Consola.findAll",Consola.class).getResultList();
            for(int i=0;i<consolas.size();i++){
                Consola c = consolas.get(i);
                String idC = c.getIdConsola();
                if(idC.equals(idConsola)){
                    String nombre = c.getNombre();
                    String fabricante = c.getFabricante();
                    String generacion = c.getGeneracion();
                    String lanzamiento = c.getLanzamiento();
                    String cpu = c.getCpu();
                    String soporte=c.getSoporte();
                    %>
                    <div class="container">
                        <div class="row">
                            <center><img src="images/consola.png" width="100px" height="100px"></center>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>idConsola: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(idConsola);%>
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
                                <p>Fabricante: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(fabricante);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Generacion: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(generacion);%>
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
                                <p>CPU: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(cpu);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Soporte: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(soporte);%>
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
                                 <a href="ListaC" class="btn btn-default">Volver</a>
                            </div>    
                        </div>
                    </div>    
    </body>
</html>
