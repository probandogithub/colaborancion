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
import javax.json.JsonObjectBuilder;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Usuario;

/**
 *
 * @author crmoya
 */
public class Login extends HttpServlet {

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
            String nombreusuario = request.getParameter("nombreusuario");
            String contrasena = request.getParameter("contrasena");
            
            if(nombreusuario == null || contrasena == null){
                RequestDispatcher rd = request.getRequestDispatcher("/vistas/login.jsp");
                rd.forward(request, response);
            }
            else{
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
                EntityManager em = emf.createEntityManager();
                
                //esta consulta trae todos los registros de la tabla usuario
                //y los transforma en un arreglo de usuarios
                List<Usuario> usuarios = em.createNamedQuery("Usuario.findAll",Usuario.class).getResultList();
                //recorro el arreglo
                boolean existe = false;
                boolean nombreU=false;
                boolean nombreUsus=false;
                boolean NombreUsuario=false;
                boolean CContraseña=false;
                for(int i=0;i<usuarios.size();i++)
                {
                    Usuario u = usuarios.get(i);
                    String nombreUsu = u.getNombreusuario();
                    String contraseña=u.getContrasena();
                    if(nombreUsu.equals(nombreusuario)){
                        NombreUsuario=true;
                    }
                    if(contrasena.equals(contraseña)){
                        CContraseña=true;
                    }
                    if(nombreUsu.equals(nombreusuario)&&(contrasena.equals(contraseña) )){
                        existe = true;
                    }
                    if(nombreUsu.equals(nombreusuario) && (!contrasena.equals(contraseña))){
                        nombreU=true;
                    }
                    
                    
                }
                String mensaje="";
                if(existe==false){
                    Usuario u=new Usuario();
                    u.setNombreusuario(nombreusuario);
                    u.setContrasena(contrasena);
                    boolean validadoNombreUsuario=u.validarNombreUsuario(); 
                    boolean validadoContraseña=u.validarContrasena();
                    boolean cont1=false;
                    boolean cont2=false;
                    String errorContraseña="";
                    boolean name1=false;
                    boolean name2=false;
                    String errorName="";
                    
                    if(validadoContraseña==false){
                        mensaje += "La Contraseña no puede ser vacía .<br/>";
                        cont1=true;
                    }
                    if(CContraseña==false && validadoContraseña==true && NombreUsuario==true){
                        mensaje+="Contraseña no valida";
                        cont2=true;
                    }
                    if(cont1==true || cont2==true){
                        errorContraseña="error";
                    }
                    
                    if(NombreUsuario==false && validadoNombreUsuario==true){
                        mensaje+="Nombre usuario no existe";
                        name1=true;
                    }
                    
                    if(validadoNombreUsuario==false){
                        mensaje += "El Nombre de usuario no puede ser vacío .<br/>";
                        name2=true;
                    }
                    if(name1==true || name2==true){
                        errorName="error";
                    }
                    
                    
                    if(!mensaje.equals("")){

                    JsonObject usuarioObject = Json.createObjectBuilder()
                        .add("mensajesdeError", mensaje)
                        .add("nombreUsuario",nombreusuario)
                        .add("contrasena",contrasena)
                        .add("ErrorName",errorName)
                        .add("ErrorContraseña",errorContraseña)
                    .build();

                    out.print(usuarioObject); 

                    }
                }
                
                else{
                    JsonObject usuarioObject = Json.createObjectBuilder()
                        .add("mensajesdeError", "")
                        .add("nombreUsuario","")
                        .add("contrasena","")
                        .add("ErrorName","")
                        .add("ErrorContraseña","")
                    .build();
                    out.print(usuarioObject);
                }

                em.close();
                emf.close();
            }
            
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
