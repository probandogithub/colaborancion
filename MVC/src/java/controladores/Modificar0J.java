/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.json.Json;
import javax.json.JsonObject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Juego;

/**
 *
 * @author jonny
 */
public class Modificar0J extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String idJuego = request.getParameter("idJuego");
            String nombre = request.getParameter("nombre");
            String desarrollador = request.getParameter("desarrollador");
            String distribuidora = request.getParameter("distribuidora");
            String plataforma = request.getParameter("plataforma");
            String genero = request.getParameter("genero");
            String lanzamiento = request.getParameter("lanzamiento");
            String argumento = request.getParameter("argumento");
            String sistema = request.getParameter("sistema");
            
            if(idJuego == null || nombre == null || desarrollador == null || distribuidora== null || plataforma== null || genero== null || lanzamiento== null || argumento== null || sistema== null){
                RequestDispatcher rd = request.getRequestDispatcher("/vistas/modificar0J.jsp");
                rd.forward(request, response);
            }
            else{
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
                EntityManager em = emf.createEntityManager();
                
                Juego j = em.find(Juego.class,idJuego);
                if(j != null){
                    em.getTransaction().begin();
                    
                    try{
                        String mensaje="";
                        j.setArgumento(argumento);
                        j.setDesarrollador(desarrollador);
                        j.setDistribuidora(distribuidora);
                        j.setGenero(genero);
                        j.setLanzamiento(lanzamiento);
                        j.setNombre(nombre);
                        j.setPlataforma(plataforma);
                        j.setSistema(sistema); 
                        boolean validadoArgumento=j.validarArgumento();
                        boolean validadoDesarrollador=j.validarDesarrollador();
                        boolean validadoDistribuidora=j.validarDistribuidora();
                        boolean validadoGenero=j.validarGenero();
                        boolean validadoLanzamiento=j.validarLanzamiento();
                        boolean validadoNombre=j.validarNombre();
                        boolean validadoPlataforma=j.validarLanzamiento();
                        boolean validadoSistema=j.validarSistema();

                        String mensajeNombre="";
                        String mensajeDesarrollador="";
                        String mensajeDistribuidora="";
                        String mensajePlataforma="";
                        String mensajeGenero="";
                        String mensajeLanzamiento="";
                        String mensajeArgumento="";
                        String mensajeSistema="";
                        String mensajeIdJuego="";
                        
                        if(validadoNombre == false){
                            mensaje += "El Nombre no puede estar vacio.<br/>";
                            mensajeNombre="error";
                        }
                        if(validadoDesarrollador == false){
                            mensaje += "El Desarrollador no puede estar vacio.<br/>";
                            mensajeDesarrollador="error";
                        }
                        if(validadoDistribuidora == false){
                            mensaje += "La Distribuidora no puede estar vacia.<br/>";
                            mensajeDistribuidora="error";
                        }
                        if(validadoPlataforma == false){
                            mensaje += "La Plataforma no puede estar vacia.<br/>";
                            mensajePlataforma="error";
                        }
                        if(validadoGenero == false){
                            mensaje += "El Genero no puede estar vacio.<br/>";
                            mensajeGenero="error";
                        }
                        if(validadoLanzamiento == false){
                            mensaje += "El Lanzamiento no puede estar vacio.<br/>";
                            mensajeLanzamiento="error";
                        }
                        if(validadoArgumento == false){
                            mensaje += "El Argumento no puede estar vacio.<br/>";
                            mensajeArgumento="error";
                        }
                        if(validadoSistema == false){
                            mensaje += "El Sistema no puede estar vacio.<br/>";
                            mensajeSistema="error";
                        }
                        if(mensaje.equals("")){
                            JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError", "")
                            .add("idJuego", "")
                            .add("desarrollador","")
                            .add("nombre","")
                            .add("distribuidora","")
                            .add("lanzamiento","")
                            .add("plataforma","")
                            .add("genero","")
                            .add("argumento","")
                            .add("sistema","")
                            .add("errorNombre","")
                            .add("errorDesarrollador","")
                            .add("errorDistribuidora","")
                            .add("errorPlataforma","")
                            .add("errorGenero","")
                            .add("errorLanzamiento","")
                            .add("errorArgumento","")
                            .add("errorSistema","")
                            .add("errorIdJuego","")
                                
                        .build();
                    
                        out.print(usuarioObject);
                        }
                        else{
                           
                    
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError",mensaje)
                            .add("idJuego", idJuego)
                            .add("desarrollador",desarrollador)
                            .add("nombre",nombre)
                            .add("distribuidora",distribuidora)
                            .add("lanzamiento",lanzamiento)
                            .add("plataforma",plataforma)
                            .add("genero",genero)
                            .add("argumento",argumento)
                            .add("sistema",sistema)
                            .add("errorNombre",mensajeNombre)
                            .add("errorDesarrollador",mensajeDesarrollador)
                            .add("errorDistribuidora",mensajeDistribuidora)
                            .add("errorPlataforma",mensajePlataforma)
                            .add("errorGenero",mensajeGenero)
                            .add("errorLanzamiento",mensajeLanzamiento)
                            .add("errorArgumento",mensajeArgumento)
                            .add("errorSistema",mensajeSistema)
                            .add("errorIdJuego",mensajeIdJuego)
                                
                        .build();
                    
                        out.print(usuarioObject); 
                        }
                    }
                    catch(Exception ex){  
                    }
                    em.getTransaction().commit();
                }
                if(j==null){
                    String mensaje="";
                    Juego n = new Juego();
                    n.setArgumento(argumento);
                    n.setDesarrollador(desarrollador);
                    n.setDistribuidora(distribuidora);
                    n.setGenero(genero);
                    n.setIdJuego(idJuego);
                    n.setLanzamiento(lanzamiento);
                    n.setNombre(nombre);
                    n.setPlataforma(plataforma);
                    n.setSistema(sistema);
                                        
                    boolean validadoArgumento=n.validarArgumento();
                    boolean validadoDesarrollador=n.validarDesarrollador();
                    boolean validadoDistribuidora=n.validarDistribuidora();
                    boolean validadoGenero=n.validarGenero();
                    boolean validadoLanzamiento=n.validarLanzamiento();
                    boolean validadoNombre=n.validarNombre();
                    boolean validadoPlataforma=n.validarPlataforma();
                    boolean validadoSistema=n.validarSistema();
                    
                    String mensajeNombre="";
                    String mensajeDesarrollador="";
                    String mensajeDistribuidora="";
                    String mensajePlataforma="";
                    String mensajeGenero="";
                    String mensajeLanzamiento="";
                    String mensajeArgumento="";
                    String mensajeSistema="";
                    String mensajeIdJuego="";

                    mensaje += "El idJuego ingresado no existe.<br/>";
                    mensajeIdJuego="error";
                    
                    if(validadoNombre == false){
                        mensaje += "El Nombre no puede estar vacio.<br/>";
                        mensajeNombre="error";
                    }
                    if(validadoDesarrollador == false){
                        mensaje += "El Desarrollador no puede estar vacio.<br/>";
                        mensajeDesarrollador="error";
                    }
                    if(validadoDistribuidora == false){
                        mensaje += "La Distribuidora no puede estar vacia.<br/>";
                        mensajeDistribuidora="error";
                    }
                    if(validadoPlataforma == false){
                        mensaje += "La Plataforma no puede estar vacia.<br/>";
                        mensajePlataforma="error";
                    }
                    if(validadoGenero == false){
                        mensaje += "El Genero no puede estar vacio.<br/>";
                        mensajeGenero="error";
                    }
                    if(validadoLanzamiento == false){
                        mensaje += "El Lanzamiento no puede estar vacio.<br/>";
                        mensajeLanzamiento="error";
                    }
                    if(validadoArgumento == false){
                        mensaje += "El Argumento no puede estar vacio.<br/>";
                        mensajeArgumento="error";
                    }
                    if(validadoSistema == false){
                        mensaje += "El Sistema no puede estar vacio.<br/>";
                        mensajeSistema="error";
                    }

                    if(!mensaje.equals("")){
                    
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError",mensaje)
                            .add("idJuego", idJuego)
                            .add("desarrollador",desarrollador)
                            .add("nombre",nombre)
                            .add("distribuidora",distribuidora)
                            .add("lanzamiento",lanzamiento)
                            .add("plataforma",plataforma)
                            .add("genero",genero)
                            .add("argumento",argumento)
                            .add("sistema",sistema)
                            .add("errorNombre",mensajeNombre)
                            .add("errorDesarrollador",mensajeDesarrollador)
                            .add("errorDistribuidora",mensajeDistribuidora)
                            .add("errorPlataforma",mensajePlataforma)
                            .add("errorGenero",mensajeGenero)
                            .add("errorLanzamiento",mensajeLanzamiento)
                            .add("errorArgumento",mensajeArgumento)
                            .add("errorSistema",mensajeSistema)
                            .add("errorIdJuego",mensajeIdJuego)
                                
                        .build();
                    
                        out.print(usuarioObject); 
                    }

                    }
                em.close();
                emf.close();  

            }
        }catch(Exception ex){
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
