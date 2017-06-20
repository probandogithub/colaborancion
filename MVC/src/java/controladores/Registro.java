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
import javax.persistence.*;
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
public class Registro extends HttpServlet {

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
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            String direccion = request.getParameter("direccion");
            String contraseña = request.getParameter("contrasena");
            
            
            if(nombreusuario == null || nombre == null || telefono == null || apellido== null || email== null || direccion== null || contraseña==null){
                RequestDispatcher rd = request.getRequestDispatcher("/vistas/registro.jsp");
                rd.forward(request, response);
            }
            else{
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
                EntityManager em = emf.createEntityManager();
                String mensaje="";
                try{
                    em.getTransaction().begin();
                    Usuario u = new Usuario();
                    u.setNombre(nombre);
                    u.setNombreusuario(nombreusuario);
                    u.setTelefono(telefono);
                    u.setApellido(apellido);
                    u.setEmail(email);
                    u.setDireccion(direccion);
                    u.setContrasena(contraseña);
                    
                    boolean validadoNombreUsuario=u.validarNombreUsuario();
                    boolean validadoNombre=u.validarNombre();
                    boolean validadoTelefono=u.validarTelefono();
                    boolean validadoTelefono2=u.validarTelefono2();
                    boolean validadoTelefono3=u.validarTelefono3();
                    boolean validadoApellido=u.validarApellido();
                    boolean validadoEmail=u.validarEmail();
                    boolean validadoEmailArroba=u.validarEmailArroba();
                    boolean validadoEmailPunto=u.validarEmailPunto();
                    boolean validadoEmailArrPunto=u.validarPosArrPunto();
                    boolean validadoDireccion=u.validarDireccion();
                    boolean validadoContraseña=u.validarContrasena();
                    
                    boolean existe=false;
                    List<Usuario> usuarios = em.createNamedQuery("Usuario.findAll",Usuario.class).getResultList();
                    for(int i=0;i<usuarios.size();i++){
                        Usuario a = usuarios.get(i);
                        String nombreUsu = a.getNombreusuario();
                        if(nombreUsu.equals(nombreusuario)){
                           existe = true;
                        }
                    }
                    if(existe==true){
                        mensaje += "El Nombre de usuario ingresado ya existe .<br/>";
                        request.setAttribute("mensajeNombreUsuario2", "error");
                    }
                    else{
                        request.setAttribute("mensajeNombreUsuario2", "");
                    }
                    if(validadoNombreUsuario == false){
                    mensaje += "El Nombre de usuario no puede ser vacío .<br/>";
                    request.setAttribute("mensajeNombreUsuario", "error");
                    }
                    else{
                        request.setAttribute("mensajeNombreUsuario", "");
                    }
                    if(validadoNombre == false){
                        mensaje += "El Nombre no puede ser vacío.<br/>";
                        request.setAttribute("mensajeNombre", "error");
                    }
                    else{
                        request.setAttribute("mensajeNombre", "");
                    }
                    if(validadoApellido == false){
                        mensaje += "El Apellido no puede ser vacío.<br/>";
                        request.setAttribute("mensajeApellido", "error");
                    }
                    else{
                        request.setAttribute("mensajeApellido", "");
                    } 
                    if(validadoDireccion == false){
                        mensaje += "La Direccion no puede estar vacia.<br/>";
                        request.setAttribute("mensajeDireccion", "error");
                    }
                    else{
                        request.setAttribute("mensajeDireccion", "");
                    }
                    if(validadoTelefono==false){
                        mensaje += "El Telefono no puede ser vacio.<br/>";
                        request.setAttribute("mensajeTelefono", "error");
                    }
                    else{
                        request.setAttribute("mensajeTelefono","");
                    }
                    if(validadoTelefono2==false){
                        mensaje += "El Telefono debe ser un numero.<br/>";
                        request.setAttribute("mensajeTelefono2", "error");
                    }
                    else{
                        request.setAttribute("mensajeTelefono2", "");
                    }
                    if(validadoTelefono3==false){
                        mensaje += "El Telefono debe contener 9 digitos.<br/>";
                        request.setAttribute("mensajeTelefono3", "error");
                    }
                    else{
                        request.setAttribute("mensajeTelefono3", "");
                    }
                    if(validadoEmailArrPunto == false){
                        mensaje += "El '.' debe ir a la derecha del '@'.<br/>";
                        request.setAttribute("mensajeEmailArrPunto", "error");
                    }
                    else{
                        request.setAttribute("mensajeEmailArrPunto", "");
                    }        
                    if(validadoEmailArroba == false){
                        mensaje += "El Email debe contener '@'.<br/>";
                        request.setAttribute("mensajeEmailArroba", "error");
                    }
                    else{
                        request.setAttribute("mensajeEmailArroba", "");
                    }
                    if(validadoEmailPunto == false){
                        mensaje += "El Email debe contener '.'.<br/>";
                        request.setAttribute("mensajeEmailPunto", "error");
                    }
                    else{
                        request.setAttribute("mensajeEmailPunto", "");
                    }
                    if(validadoEmail == false){
                        mensaje += "El Email no puede ser vacío.<br/>";
                        request.setAttribute("mensajeEmail", "error");
                    }
                    else{
                        request.setAttribute("mensajeEmail", "");
                    }
                    if(validadoContraseña == false){
                        mensaje += "La Contraseña no puede estar vacia.<br/>";
                        request.setAttribute("mensajeContraseña", "error");
                    }
                    else{
                        request.setAttribute("mensajeContraseña", "");
                    }
                    
                    if(!mensaje.equals("")){
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError", mensaje)
                            .add("nombreUsuario",nombreusuario)
                            .add("contrasena",contraseña)
                            .add("apellido",apellido)
                            .add("email",email)
                            .add("direccion",direccion)
                            .add("nombre",nombre)
                            .add("telefono",telefono)
                                
                        .build();
                    
                        out.print(usuarioObject);
                    }
                    else{
                        em.persist(u);
                        em.getTransaction().commit(); 
                        
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError","")
                            .add("nombreUsuario","")
                            .add("contrasena","")
                            .add("apellido","")
                            .add("email","")
                            .add("direccion","")
                            .add("nombre","")
                            .add("telefono","")
                                
                        .build();
                    
                        out.print(usuarioObject);
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
