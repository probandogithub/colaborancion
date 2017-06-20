/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import modelos.Consola;


/**
 *
 * @author jonny
 */
public class Registro2 extends HttpServlet {

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
            String idConsola = request.getParameter("idConsola");
            String nombre = request.getParameter("nombre");
            String fabricante = request.getParameter("fabricante");
            String generacion = request.getParameter("generacion");
            String lanzamiento = request.getParameter("lanzamiento");
            String cpu = request.getParameter("cpu");
            String soporte = request.getParameter("soporte");
            if(idConsola == null || nombre == null || fabricante == null || generacion== null || lanzamiento== null || cpu== null || soporte==null){
                RequestDispatcher rd = request.getRequestDispatcher("/vistas/registro2.jsp");
                rd.forward(request, response);
            }
            else{
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
                EntityManager em = emf.createEntityManager();
                
                try{
                    em.getTransaction().begin();
                    String mensaje="";
                    Consola c = new Consola();
                    c.setCpu(cpu);
                    c.setFabricante(fabricante);
                    c.setGeneracion(generacion);
                    c.setIdConsola(idConsola);
                    c.setLanzamiento(lanzamiento);
                    c.setSoporte(soporte);
                    c.setNombre(nombre);
                    
                    
                    boolean validadoNombre=c.validarNombre();
                    boolean validadoSoporte=c.validarSoporte();
                    boolean validadoCpu=c.validarCpu();
                    boolean validadoLanzamiento=c.validarLanzamiento();
                    boolean validadoFabricante=c.validarFabricante();
                    boolean validadoGeneracion=c.validarGeneracion();
                    boolean validadoIdConsola=c.validarIdConsola();
                    
                    boolean existe=false;
                    List<Consola> consolas = em.createNamedQuery("Consola.findAll",Consola.class).getResultList();
                    for(int i=0;i<consolas.size();i++){
                        Consola a = consolas.get(i);
                        String idCn = a.getIdConsola();
                        if(idCn.equals(idConsola)){
                           existe = true;
                        }
                    }
                    
                    String mensajeSoporte="";
                    String mensajeCpu="";
                    String mensajeLanzamiento="";
                    String mensajeGeneracion="";
                    String mensajeFabricante="";
                    String mensajeNombre="";
                    boolean mensajeIdConsola=false;
                    boolean mensajeIdConsola2=false;
                    String errorIdConsola="";
                        
                    if(existe==true){
                        mensaje += "La idConsola ingresada ya existe .<br/>";
                        mensajeIdConsola=true;
                    }
                    if(validadoIdConsola == false){
                        mensaje += "La IdConsola no puede estar vacio.<br/>";
                        mensajeIdConsola2=true;
                    }
                    
                    if(mensajeIdConsola==true || mensajeIdConsola2==true){
                        errorIdConsola="error";
                    }
                    
                    if(validadoNombre == false){
                            mensaje += "El Nombre no puede ser vacío.<br/>";
                            mensajeNombre="error";
                    }
                    if(validadoFabricante == false){
                            mensaje += "El Fabricante no puede estar vacio.<br/>";
                            mensajeFabricante="error";
                    }
                    if(validadoGeneracion == false){
                            mensaje += "La Generacion no puede estar vacia.<br/>";
                            mensajeGeneracion="error";
                    }
                    if(validadoLanzamiento == false){
                            mensaje += "El Lanzamiento no puede estar vacio.<br/>";
                            mensajeLanzamiento="error";
                    }
                    if(validadoCpu == false){
                            mensaje += "La Cpu no puede estar vacia.<br/>";
                            mensajeCpu="error";
                    }
                    
                    if(validadoSoporte == false){
                            mensaje += "El Soporte no puede estar vacio.<br/>";
                            mensajeSoporte="error";
                    }
                    
                    if(!mensaje.equals("")){
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError", mensaje)
                            .add("idConsola", idConsola)
                            .add("fabricante",fabricante)
                            .add("nombre",nombre)
                            .add("generacion",generacion)
                            .add("lanzamiento",lanzamiento)
                            .add("soporte",soporte)
                            .add("cpu",cpu)
                            .add("errorSoporte",mensajeSoporte)
                            .add("errorCpu",mensajeCpu)
                            .add("errorLanzamiento",mensajeLanzamiento)
                            .add("errorGeneracion",mensajeGeneracion)
                            .add("errorFabricante",mensajeFabricante)
                            .add("errorNombre",mensajeNombre)
                            .add("errorIdConsola",errorIdConsola)
                                
                        .build();
                    
                        out.print(usuarioObject);
                    }
                    else{
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError", "")
                            .add("idConsola", "")
                            .add("fabricante","")
                            .add("nombre","")
                            .add("generacion","")
                            .add("lanzamiento","")
                            .add("soporte","")
                            .add("cpu","")
                            .add("errorSoporte","")
                            .add("errorCpu","")
                            .add("errorLanzamiento","")
                            .add("errorGeneracion","")
                            .add("errorFabricante","")
                            .add("errorNombre","")
                            .add("errorIdConsola","")
                                
                        .build();
                    
                        out.print(usuarioObject);
                        
                        em.persist(c);
                        em.getTransaction().commit();    
                    }
                }catch(Exception e){
                   
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
