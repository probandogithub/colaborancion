/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jonny
 */
@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findByNombreusuario", query = "SELECT u FROM Usuario u WHERE u.nombreusuario = :nombreusuario"),
    @NamedQuery(name = "Usuario.findByNombre", query = "SELECT u FROM Usuario u WHERE u.nombre = :nombre"),
    @NamedQuery(name = "Usuario.findByTelefono", query = "SELECT u FROM Usuario u WHERE u.telefono = :telefono"),
    @NamedQuery(name = "Usuario.findByApellido", query = "SELECT u FROM Usuario u WHERE u.apellido = :apellido"),
    @NamedQuery(name = "Usuario.findByEmail", query = "SELECT u FROM Usuario u WHERE u.email = :email"),
    @NamedQuery(name = "Usuario.findByDireccion", query = "SELECT u FROM Usuario u WHERE u.direccion = :direccion"),
    @NamedQuery(name = "Usuario.findByContrasena", query = "SELECT u FROM Usuario u WHERE u.contrasena = :contrasena")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "nombreusuario")
    private String nombreusuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "telefono")
    private String telefono;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "apellido")
    private String apellido;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "direccion")
    private String direccion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "contrasena")
    private String contrasena;

    public Usuario() {
    }

    public Usuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public Usuario(String nombreusuario, String nombre, String telefono, String apellido, String email, String direccion, String contrasena) {
        this.nombreusuario = nombreusuario;
        this.nombre = nombre;
        this.telefono = telefono;
        this.apellido = apellido;
        this.email = email;
        this.direccion = direccion;
        this.contrasena = contrasena;
    }

    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public boolean validarNombreUsuario(){
        
        if(this.nombreusuario.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    
    public boolean validarNombre(){
        if(this.nombre.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarTelefono(){
        
        if(this.telefono.equals("")){
            return false;
        }
        else{
            return true;
        }
        
    }
    public boolean validarTelefono2(){
        try{
            int telefono = Integer.parseInt(this.telefono);
            return true;
            }
            catch(NumberFormatException ne){
                return false;
            }
    }
    public boolean validarTelefono3(){
        if(this.telefono.length() != 9){
            return false;
        }
        else{
            return true;
        }
        
    }
                   
                
             
               
    public boolean validarApellido(){
        
        if(this.apellido.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    
    public boolean validarEmail(){
        if(this.email.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    
    public boolean validarEmailArroba(){
        int posArroba = -1;
        posArroba = this.email.indexOf("@");
        if(posArroba == -1){
           return false;
        }
        else{
            return true;
        }
    }
    public boolean validarEmailPunto(){
        int posPunto = -1;
        posPunto = email.indexOf(".");
        if(posPunto == -1){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarPosArrPunto(){
        int posArroba = -1;
        int posPunto = -1;
        posArroba = this.email.indexOf("@");
        posPunto = email.indexOf(".");
        if(posArroba > posPunto){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarDireccion(){
        if(this.direccion.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarContrasena(){
        if(this.contrasena.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nombreusuario != null ? nombreusuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.nombreusuario == null && other.nombreusuario != null) || (this.nombreusuario != null && !this.nombreusuario.equals(other.nombreusuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelos.Usuario[ nombreusuario=" + nombreusuario + " ]";
    }
    
}
