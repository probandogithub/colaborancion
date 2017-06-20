<%-- 
    Document   : listaJ
    Created on : 29-05-2016, 0:55:44
    Author     : jonny
--%>

<%@page import="modelos.Juego"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Juegos</title>
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
                <div class="col-xs-4 no-border"><img src="images/juego.png" width="50px" height="50px"></div>
                <div class="col-xs-4 no-border"><center><h2><b>Lista de Juegos</b></h2></center></div>
                <div class="col-xs-3 no-border"></div>
                <div class="col-xs-1 no-border"><img src="images/juego.png" width="50px" height="50px"></div>
            </div>
            <div class="row">
                <center><div class="col-xs-2 titulo">Id Juego</div>
                <div class="col-xs-2 titulo">Nombre</div>
                <div class="col-xs-2 titulo">Genero</div>
                <div class="col-xs-2 titulo">Lanzamiento</div>
                <div class="col-xs-4 titulo">Opciones</div></center>
            </div>
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
            EntityManager em = emf.createEntityManager();
            List<Juego> juegos = em.createNamedQuery("Juego.findAll",Juego.class).getResultList();
            for(int i=0;i<juegos.size();i++)
            {
                %>
                <div class="row">
                <%
                Juego j = juegos.get(i);
                String idJuego = j.getIdJuego();
                String nombre = j.getNombre();
                String genero=j.getGenero();
                String lanzamiento=j.getLanzamiento();
                %>
                    <div class="col-xs-2"><% out.print(idJuego); %></div>
                    <center><div class="col-xs-2"><% out.print(nombre); %></div>
                    <div class="col-xs-2"><% out.print(genero); %></div>
                    <div class="col-xs-2"><% out.print(lanzamiento); %></div></center>
                    <div class="col-xs-1"></div>
                    <div class="col-xs-3">
                        <a href="VerJuego?idJuego=<%out.println(idJuego);%>" class="btn btn-default">Ver</a>
                        <a href="Modificar1J?idJuego=<%out.println(idJuego);%>" class="btn btn-default">Modificar</a>
                        <span juego_id="<% out.print(idJuego); %>" class="btnEliminar btn btn-default">Eliminar</span>
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
                    <a href="MenuJuegos" class="btn btn-default">Menu Juegos</a>
                </div>
            </div>
        </div>
            
           
            <script>
        $(document.body).on('click','.btnEliminar',function(e){
            var juego_id = $(this).attr('juego_id');
            $.post("EliminarJ", { id: juego_id } )
            .done(function(respuestaJson) {
                var contenidotabla = "";
                contenidotabla += 
                "<div class='row'>"+
                "    <div class='col-xs-4 no-border'><img src='images/juego.png' width='50px' height='50px'></div>" +
                "    <div class='col-xs-4 no-border'><center><h2><b>Lista de Juegos</b></h2></center></div>" +
                "    <div class='col-xs-3 no-border'></div>" +
                "    <div class='col-xs-1 no-border'><img src='images/juego.png' width='50px' height='50px'></div>" +
                "</div>" +
                "<div class='row'>" +
                "    <center><div class='col-xs-2 titulo'>Id Juego</div>" +
                "    <div class='col-xs-2 titulo'>Nombre</div>" +
                "    <div class='col-xs-2 titulo'>Genero</div>" +
                "    <div class='col-xs-2 titulo'>Lanzamiento</div>" +
                "    <div class='col-xs-4 titulo'>Opciones</div></center>" +
                "</div>";
    
                var listaJuegos = JSON.parse(respuestaJson);
                for(var i=0;i<listaJuegos.length;i++){
                    var juego = listaJuegos[i];
                    contenidotabla += 
                    "<div class='row'>" +
                    "<center><div class='col-xs-2'>"+juego.idJuego+"</div>"+
                    "<div class='col-xs-2'>"+juego.nombre+"</div>"+
                    "<div class='col-xs-2'>"+juego.genero+"</div>"+
                    "<div class='col-xs-2'>"+juego.lanzamiento+"</div></center>"+
                    "<div class='col-xs-1'></div>"+
                    "<div class='col-xs-3'>"+
                    "    <a href='VerJuego?idJuego="+juego.idJuego+"' class='btn btn-default'>Ver</a>"+
                    "    <a href='Modificar1?idJuego="+juego.idJuego+"' class='btn btn-default'>Modificar</a>"+
                    "    <span juego_id='"+juego.idJuego+"' class='btnEliminar btn btn-default'>Eliminar</span>"+
                    "</div>"+
                    "</div>";
                }
                contenidotabla += 
                        
                "<div class='row no-border borde'>"+
                "    <div class='col-xs-2 no-border'>"+
                "       <a href='MenuPrincipal' class='btn btn-default'>Menu Principal</a>"+
                "    </div>"+
                "    <div class='col-xs-1 no-border'>"+
                "       <a href='MenuConsolas' class='btn btn-default'>Menu Juegos</a>"+
                "    </div>"+
                "</div>";
        
                $('.container').html(contenidotabla);
            });
        }); 
        </script>  
        
            
            
    </body>
</html>
