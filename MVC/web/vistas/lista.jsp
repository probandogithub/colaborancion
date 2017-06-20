<%-- 
    Document   : login
    Created on : 02-05-2016, 14:19:08
    Author     : crmoya
--%>

<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Usuarios</title>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <style>
            .container{
                padding: 15px;
                margin-top: 40px;
                background: lavender;
                border-radius: 20px;
            }
            .borde{
                margin-top: 10px;
            }
            .row{
                padding:5px;
                border-bottom:1px silver solid;
            }
            .titulo{
                font-weight: bold;
                background: lavender;
            }
            .col-xs-4{
                border-right:1px silver solid;
            }
            .col-xs-2{
                border-right:1px silver solid;
                border-left: 1px silver solid;
            }
            .col-xs-3{
                border-right:1px silver solid;
            }
            .btn{
                border-radius:10px;
                border-color: lightslategray;
                background-color:lightgray;
            }
            .no-border{
                border-bottom: none !important; 
                border-right:none !important;
                border-left: none !important;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-4 no-border"><img src="images/user_1.png" width="50px" height="50px"></div>
                <div class="col-xs-4 no-border"><center><h2><b>Lista de Usuarios</b></h2></center></div>
                <div class="col-xs-3 no-border"></div>
                <div class="col-xs-1 no-border"><img src="images/user_1.png" width="50px" height="50px"></div>
            </div>
            <div class="row titulo">
                <center><div class="col-xs-2 titulo">Nombre de Usuario</div>
                <div class="col-xs-2 titulo">Nombre</div>
                <div class="col-xs-4 titulo">Teléfono</div>
                <div class="col-xs-4 titulo">Opciones</div></center>
            </div>
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
            EntityManager em = emf.createEntityManager();
            List<Usuario> usuarios = em.createNamedQuery("Usuario.findAll",Usuario.class).getResultList();
            for(int i=0;i<usuarios.size();i++)
            {
                %>
                <div class="row">
                <%
                Usuario u = usuarios.get(i);
                String nombreUsuario = u.getNombreusuario();
                String nombre = u.getNombre();
                String telefono = u.getTelefono();
                %>
                <center><div class="col-xs-2"><% out.print(nombreUsuario); %></div>
                    <div class="col-xs-2"><% out.print(nombre); %></div>
                    <div class="col-xs-4"><% out.print(telefono); %></div></center>
                    <div class="col-xs-1"></div>
                    <div class="col-xs-3">
                        <a href="VerUsuario?nombreusuario=<%out.println(nombreUsuario);%>" class="btn btn-default">Ver</a>
                        <a href="Modificar1?nombreusuario=<%out.println(nombreUsuario);%>" class="btn btn-default">Modificar</a>
                        <span usuario_id="<% out.print(nombreUsuario); %>" class="btnEliminar btn btn-default">Eliminar</span>

                    </div>
                </div>
            <%
            }

            em.close();
            emf.close();
            %>
            <div class="row no-border borde">
                <div class="col-xs-2 no-border">
                    <a href="MenuPrincipal" class="btn btn-default">Menu Principal</a>
                </div>
                <div class="col-xs-1 no-border">
                    <a href="MenuUsuarios" class="btn btn-default">Menu Usuario</a>
                </div>
            </div>
        </div>
       <script>
        $(document.body).on('click','.btnEliminar',function(e){
            var usuario_id = $(this).attr('usuario_id');
            $.post("Eliminar", { id: usuario_id } )
            .done(function(respuestaJson) {
                var contenidotabla = "";
                contenidotabla += 
                "<div class='row'>"+
                "    <div class='col-xs-4 no-border'><img src='images/user_1.png' width='50px' height='50px'></div>" +
                "    <div class='col-xs-4 no-border'><center><h2><b>Lista de Usuarios</b></h2></center></div>" +
                "    <div class='col-xs-3 no-border'></div>" +
                "    <div class='col-xs-1 no-border'><img src='images/user_1.png' width='50px' height='50px'></div>" +
                "</div>" +
                "<div class='row titulo'>" +
                "    <center><div class='col-xs-2 titulo'>Nombre de Usuario</div>" +
                "    <div class='col-xs-2 titulo'>Nombre</div>" +
                "    <div class='col-xs-4 titulo'>Teléfono</div>" +
                "    <div class='col-xs-4 titulo'>Opciones</div></center>" +
                "</div>";
            
                var listaUsuarios = JSON.parse(respuestaJson);
                for(var i=0;i<listaUsuarios.length;i++){
                    var usuario = listaUsuarios[i];
                    contenidotabla += 
                    "<div class='row'>" +
                    "<center><div class='col-xs-2'>"+usuario.nombreusuario+"</div>"+
                    "<div class='col-xs-2'>"+usuario.nombre+"</div>"+
                    "<div class='col-xs-4'>"+usuario.telefono+"</div></center>"+
                    "<div class='col-xs-1'></div>"+
                    "<div class='col-xs-3'>"+
                    "    <a href='VerUsuario?nombreusuario="+usuario.nombreusuario+"' class='btn btn-default'>Ver</a>"+
                    "    <a href='Modificar1?nombreusuario="+usuario.nombreusuario+"' class='btn btn-default'>Modificar</a>"+
                    "    <span usuario_id='"+usuario.nombreusuario+"' class='btnEliminar btn btn-default'>Eliminar</span>"+
                    "</div>"+
                    "</div>";

                    
                }
                contenidotabla += 
                        
                "<div class='row no-border borde'>"+
                "   <div class='col-xs-2 no-border'>"+
                "   <a href='MenuPrincipal' class='btn btn-default'>Menu Principal</a>"+
                "</div>"+
                "<div class='col-xs-1 no-border'>"+
                "    <a href='MenuUsuarios' class='btn btn-default'>Menu Usuario</a>"+
                "    </div>"+
                "</div>";
                
                
                $('.container').html(contenidotabla);
            });
        }); 
        </script>    
    </body>
</html>