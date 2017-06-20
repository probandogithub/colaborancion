<%-- 
    Document   : ListaC
    Created on : 28-05-2016, 22:04:44
    Author     : jonny
--%>

<%@page import="modelos.Consola"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Consolas</title>
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
                <div class="col-xs-4 no-border"><img src="images/consola.png" width="50px" height="50px"></div>
                <div class="col-xs-4 no-border"><center><h2><b>Lista de Consolas</b></h2></center></div>
                <div class="col-xs-3 no-border"></div>
                <div class="col-xs-1 no-border"><img src="images/consola.png" width="50px" height="50px"></div>
            </div>
            <div class="row titulo">
                <center><div class="col-xs-2 titulo">Id Consola</div>
                <div class="col-xs-2 titulo">Nombre</div>
                <div class="col-xs-2 titulo">Fabricante</div>
                <div class="col-xs-2 titulo">Lanzamiento</div>
                <div class="col-xs-4 titulo">Opciones</div></center>
            </div>
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
            EntityManager em = emf.createEntityManager();
            List<Consola> consolas = em.createNamedQuery("Consola.findAll",Consola.class).getResultList();
            for(int i=0;i<consolas.size();i++)
            {
                %>
                <div class="row">
                <%
                Consola c = consolas.get(i);
                String idConsola = c.getIdConsola();
                String nombre = c.getNombre();
                String fabricante=c.getFabricante();
                String lanzamiento=c.getLanzamiento();
                %>
                    <div class="col-xs-2"><% out.print(idConsola); %></div>
                    <center><div class="col-xs-2"><% out.print(nombre); %></div>
                    <div class="col-xs-2"><% out.print(fabricante); %></div>
                    <div class="col-xs-2"><% out.print(lanzamiento); %></div></center>
                    <div class="col-xs-1"></div>
                    <div class="col-xs-3">
                        <a href="VerConsola?idConsola=<%out.println(idConsola);%>" class="btn btn-default">Ver</a>
                        <a href="Modificar1C?idConsola=<%out.println(idConsola);%>" class="btn btn-default">Modificar</a>
                         <span consola_id="<% out.print(idConsola); %>" class="btnEliminar btn btn-default">Eliminar</span>
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
                    <a href="MenuConsolas" class="btn btn-default">Menu Consolas</a>
                </div>
            </div>
        </div>
        
            <script>
        $(document.body).on('click','.btnEliminar',function(e){
            var consola_id = $(this).attr('consola_id');
            $.post("EliminarC", { id: consola_id } )
            .done(function(respuestaJson) {
                var contenidotabla = "";
                contenidotabla += 
                "<div class='row'>"+
                "    <div class='col-xs-4 no-border'><img src='images/consola.png' width='50px' height='50px'></div>" +
                "    <div class='col-xs-4 no-border'><center><h2><b>Lista de Consolas</b></h2></center></div>" +
                "    <div class='col-xs-3 no-border'></div>" +
                "    <div class='col-xs-1 no-border'><img src='images/consola.png' width='50px' height='50px'></div>" +
                "</div>" +
                "<div class='row titulo'>" +
                "    <center><div class='col-xs-2 titulo'>Id Consola</div>" +
                "    <div class='col-xs-2 titulo'>Nombre</div>" +
                "    <div class='col-xs-2 titulo'>Fabricante</div>" +
                "    <div class='col-xs-2 titulo'>Lanzamiento</div>" +
                "    <div class='col-xs-4 titulo'>Opciones</div></center>" +
                "</div>";
  
                var listaConsolas = JSON.parse(respuestaJson);
                for(var i=0;i<listaConsolas.length;i++){
                    var consola = listaConsolas[i];
                    contenidotabla += 
                    "<div class='row'>" +
                    "<center><div class='col-xs-2'>"+consola.idConsola+"</div>"+
                    "<div class='col-xs-2'>"+consola.nombre+"</div>"+
                    "<div class='col-xs-2'>"+consola.fabricante+"</div>"+
                    "<div class='col-xs-2'>"+consola.lanzamiento+"</div></center>"+
                    "<div class='col-xs-1'></div>"+
                    "<div class='col-xs-3'>"+
                    "    <a href='VerConsola?idConsola="+consola.idConsola+"' class='btn btn-default'>Ver</a>"+
                    "    <a href='Modificar1?idConsola="+consola.idConsola+"' class='btn btn-default'>Modificar</a>"+
                    "    <span consola_id='"+consola.idConsola+"' class='btnEliminar btn btn-default'>Eliminar</span>"+
                    "</div>"+
                    "</div>";

                }
                contenidotabla += 
                        
                "<div class='row no-border borde'>"+
                "    <div class='col-xs-2 no-border'>"+
                "       <a href='MenuPrincipal' class='btn btn-default'>Menu Principal</a>"+
                "    </div>"+
                "    <div class='col-xs-1 no-border'>"+
                "       <a href='MenuConsolas' class='btn btn-default'>Menu Consolas</a>"+
                "    </div>"+
                "</div>";

                $('.container').html(contenidotabla);
            });
        }); 
        </script>  
        
    </body>
</html>
