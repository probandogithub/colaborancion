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
import javax.json.JsonArrayBuilder;
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
import modelos.Juego;

/**
 *
 * @author jonny
 */
public class EliminarJ extends HttpServlet {

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
            
            String idJuego = request.getParameter("id");
            
            
           
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
                EntityManager em = emf.createEntityManager();
                
                
                Juego j = em.find(Juego.class,idJuego);
                if(j != null){
                    em.getTransaction().begin();
                    em.remove(j);
                    em.getTransaction().commit();
                }
                List<Juego> juegos = em.createNamedQuery("Juego.findAll",Juego.class).getResultList();
                    JsonArrayBuilder jab = Json.createArrayBuilder();
                    for(int i=0;i<juegos.size();i++){
                        Juego juego = juegos.get(i);
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("idJuego", juego.getIdJuego())
                            .add("nombre", juego.getNombre())
                            .add("genero", juego.getGenero())
                            .add("lanzamiento",juego.getLanzamiento())
                        .build();
                        jab.add(usuarioObject);
                    }
                    out.print(jab.build());
                   
                em.close();
                emf.close();     
            
            
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
