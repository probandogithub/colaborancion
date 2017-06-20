<%-- 
    Document   : Ver
    Created on : 28-05-2016, 0:05:02
    Author     : jonny
--%>

<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
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
                height: 500px;
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
       <% String nombreusuario = request.getParameter("nombreusuario");
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
            EntityManager em = emf.createEntityManager();
            List<Usuario> usuarios = em.createNamedQuery("Usuario.findAll",Usuario.class).getResultList();
            for(int i=0;i<usuarios.size();i++){
                Usuario u = usuarios.get(i);
                String nombreUsuario = u.getNombreusuario();
                if(nombreusuario.equals(nombreUsuario)){
                    String nombre = u.getNombre();
                    String telefono = u.getTelefono();
                    String apellido = u.getApellido();
                    String email = u.getEmail();
                    String direccion = u.getDireccion();
                    %>
                    <div class="container">
                        <div class="row">
                            <center><img src="images/user.png" width="100px" height="100px"></center>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Nombre Usuario: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(nombreusuario);%>
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
                                <p>Apellido: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(apellido);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Telefono: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(telefono);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Direccion: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(direccion);%>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-xs-6 titulo">
                                <p>Email: </p>
                            </div>
                            <div class="col-xs-4">
                                <%out.print(email);%>
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
                                 <a href="Lista" class="btn btn-default">Volver</a>
                            </div>    
                        </div>
                    </div>    
    </body>
</html>
