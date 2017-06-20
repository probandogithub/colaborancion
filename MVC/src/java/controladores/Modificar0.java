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
import modelos.Usuario;

/**
 *
 * @author jonny
 */
public class Modificar0 extends HttpServlet {

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
            String contrasena = request.getParameter("contrasena");
            
            if(nombreusuario == null || nombre == null || telefono == null || apellido== null || email== null || direccion== null || contrasena== null){
                RequestDispatcher rd = request.getRequestDispatcher("/vistas/modificar0.jsp");
                rd.forward(request, response);
            }
            else{
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("MVCPU");
                EntityManager em = emf.createEntityManager();
                
                Usuario u = em.find(Usuario.class,nombreusuario);
                if(u != null){
                    em.getTransaction().begin();
                    
                    try{
                        String mensaje="";
                        u.setNombre(nombre);
                        u.setTelefono(telefono);
                        u.setApellido(apellido);
                        u.setContrasena(contrasena);
                        u.setDireccion(direccion);
                        u.setEmail(email);
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
                        String mensajeNombreUsuario="";
                        String mensajeNombre="";
                        String mensajeApellido="";
                        String mensajeDireccion="";
                        String mensajeContraseña="";
                        boolean em1=false;
                        boolean em2=false;
                        boolean em3=false;
                        boolean em4=false;
                        boolean tel1=false;
                        boolean tel2=false;
                        boolean tel3=false;
                        String validaEm="";
                        String validaTel="";
                        
                        if(validadoContraseña == false){
                        mensaje += "La Contraseña no puede estar vacia.<br/>";
                        mensajeContraseña="error";
                        }
                        else{
                            mensajeContraseña="";
                        }
                        if(validadoDireccion == false){
                        mensaje += "La Direccion no puede estar vacia.<br/>";
                        mensajeDireccion="error";
                        }
                        else{
                             mensajeDireccion="";
                        }
                        if(validadoEmailArrPunto == false){
                            mensaje += "El '.' debe ir a la derecha del '@'.<br/>";
                            em1=true;
                        }    
                        if(validadoEmailArroba == false){
                            mensaje += "El Email debe contener '@'.<br/>";
                            em2=true;
                        }
                        if(validadoEmailPunto == false){
                            mensaje += "El Email debe contener '.'.<br/>";
                            em3=true;
                        }
                        if(validadoEmail == false){
                            mensaje += "El Email no puede ser vacío.<br/>";
                            em4=true;
                        }
                        if(em1==true || em2==true || em2==true || em2==true){
                            validaEm="error";
                        }
                        
                        if(validadoNombre == false){
                            mensaje += "El Nombre no puede ser vacío.<br/>";
                            mensajeNombre="error";
                        }
                        else{
                             mensajeNombre="";
                        }
                        if(validadoTelefono==false){
                            mensaje += "El Telefono no puede ser vacio.<br/>";
                            tel1=true;
                        }
                        if(validadoTelefono2==false){
                            mensaje += "El Telefono debe ser un numero.<br/>";
                             tel2=true;
                        }
                        if(validadoTelefono3==false){
                            mensaje += "El Telefono debe contener 9 digitos.<br/>";
                             tel3=true;
                        }
                        if(tel1=true || (tel2=true) || (tel3=true) ){
                            validaTel="error";
                        }
                        if(validadoApellido == false){
                            mensaje += "El Apellido no puede ser vacío.<br/>";
                            mensajeApellido="error";
                        }
                        else{
                             mensajeApellido="";
                        }
                        
                        if(mensaje.equals("")){
                           JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError", "")
                            .add("nombreUsuario","")
                            .add("contrasena","")
                            .add("apellido","")
                            .add("email","")
                            .add("direccion","")
                            .add("nombre","")
                            .add("telefono","")
                            .add("validaEm","")
                            .add("validaTel","")
                            .add("errorNombre","")
                            .add("errorApellido","")
                            .add("errorDireccion","")
                            .add("errorContraseña","")
                            .add("errorNombreUsuario","")
                             
                             
                            .build();
                             
                        out.print(usuarioObject); 
                        }
                    
                        else{
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError", mensaje)
                            .add("nombreUsuario",nombreusuario)
                            .add("contrasena",contrasena)
                            .add("apellido",apellido)
                            .add("email",email)
                            .add("direccion",direccion)
                            .add("nombre",nombre)
                            .add("telefono",telefono)
                            .add("validaEm",validaEm)
                            .add("validaTel",validaTel)
                            .add("errorNombre",mensajeNombre)
                            .add("errorNombreUsuario",mensajeNombreUsuario)
                            .add("errorApellido",mensajeApellido)
                            .add("errorDireccion",mensajeDireccion)
                            .add("errorContraseña",mensajeContraseña)
                                
                        .build();
                    
                        out.print(usuarioObject);
                        }
                        
                        
                        
                    }
                catch(Exception ex){
                }
                em.getTransaction().commit();
                }  
                if(u==null){
                    String mensaje="";
                    Usuario a=new Usuario();
                    a.setNombre(nombre);
                    a.setNombreusuario(nombreusuario);
                    a.setApellido(apellido);
                    a.setContrasena(contrasena);
                    a.setDireccion(direccion);
                    a.setEmail(email);
                    a.setTelefono(telefono);
                    boolean validadoNombre=a.validarNombre();
                    boolean validadoTelefono=a.validarTelefono();
                    boolean validadoTelefono2=a.validarTelefono2();
                    boolean validadoTelefono3=a.validarTelefono3();
                    boolean validadoApellido=a.validarApellido();
                    boolean validadoEmail=a.validarEmail();
                    boolean validadoEmailArroba=a.validarEmailArroba();
                    boolean validadoEmailPunto=a.validarEmailPunto();
                    boolean validadoEmailArrPunto=a.validarPosArrPunto();
                    boolean validadoDireccion=a.validarDireccion();
                    boolean validadoContraseña=a.validarContrasena();
                    String mensajeNombreUsuario="";
                    String mensajeNombre="";
                    String mensajeApellido="";
                    String mensajeDireccion="";
                    String mensajeContraseña="";
                    boolean em1=false;
                    boolean em2=false;
                    boolean em3=false;
                    boolean em4=false;
                    boolean tel1=false;
                    boolean tel2=false;
                    boolean tel3=false;
                    String validaEm="";
                    String validaTel="";

                    mensaje += "El Usuario ingresado no existe.<br/>";
                    mensajeNombreUsuario="error";

                    if(validadoContraseña == false){
                    mensaje += "La Contraseña no puede estar vacia.<br/>";
                    mensajeContraseña="error";
                    }
                    else{
                        mensajeContraseña="";
                    }
                    if(validadoDireccion == false){
                    mensaje += "La Direccion no puede estar vacia.<br/>";
                    mensajeDireccion="error";
                    }
                    else{
                         mensajeDireccion="";
                    }
                    if(validadoEmailArrPunto == false){
                        mensaje += "El '.' debe ir a la derecha del '@'.<br/>";
                        em1=true;
                    }    
                    if(validadoEmailArroba == false){
                        mensaje += "El Email debe contener '@'.<br/>";
                        em2=true;
                    }
                    if(validadoEmailPunto == false){
                        mensaje += "El Email debe contener '.'.<br/>";
                        em3=true;
                    }
                    if(validadoEmail == false){
                        mensaje += "El Email no puede ser vacío.<br/>";
                        em4=true;
                    }
                    if(em1==true || em2==true || em2==true || em2==true){
                        validaEm="error";
                    }

                    if(validadoNombre == false){
                        mensaje += "El Nombre no puede ser vacío.<br/>";
                        mensajeNombre="error";
                    }
                    else{
                         mensajeNombre="";
                    }
                    if(validadoTelefono==false){
                        mensaje += "El Telefono no puede ser vacio.<br/>";
                        tel1=true;
                    }
                    if(validadoTelefono2==false){
                        mensaje += "El Telefono debe ser un numero.<br/>";
                         tel2=true;
                    }
                    if(validadoTelefono3==false){
                        mensaje += "El Telefono debe contener 9 digitos.<br/>";
                         tel3=true;
                    }
                    if(tel1=true || (tel2=true) || (tel3=true) ){
                        validaTel="error";
                    }
                    if(validadoApellido == false){
                        mensaje += "El Apellido no puede ser vacío.<br/>";
                        mensajeApellido="error";
                    }
                    else{
                         mensajeApellido="";
                    }
                        
                    if(!mensaje.equals("")){
                        JsonObject usuarioObject = Json.createObjectBuilder()
                            .add("mensajesdeError", mensaje)
                            .add("nombreUsuario",nombreusuario)
                            .add("contrasena",contrasena)
                            .add("apellido",apellido)
                            .add("email",email)
                            .add("direccion",direccion)
                            .add("nombre",nombre)
                            .add("telefono",telefono)
                            .add("validaEm",validaEm)
                            .add("validaTel",validaTel)
                            .add("errorNombre",mensajeNombre)
                            .add("errorNombreUsuario",mensajeNombreUsuario)
                            .add("errorApellido",mensajeApellido)
                            .add("errorDireccion",mensajeDireccion)
                            .add("errorContraseña",mensajeContraseña)
                                
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

        