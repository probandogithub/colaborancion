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
@Table(name = "consola")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Consola.findAll", query = "SELECT c FROM Consola c"),
    @NamedQuery(name = "Consola.findByIdConsola", query = "SELECT c FROM Consola c WHERE c.idConsola = :idConsola"),
    @NamedQuery(name = "Consola.findByNombre", query = "SELECT c FROM Consola c WHERE c.nombre = :nombre"),
    @NamedQuery(name = "Consola.findByFabricante", query = "SELECT c FROM Consola c WHERE c.fabricante = :fabricante"),
    @NamedQuery(name = "Consola.findByGeneracion", query = "SELECT c FROM Consola c WHERE c.generacion = :generacion"),
    @NamedQuery(name = "Consola.findByLanzamiento", query = "SELECT c FROM Consola c WHERE c.lanzamiento = :lanzamiento"),
    @NamedQuery(name = "Consola.findByCpu", query = "SELECT c FROM Consola c WHERE c.cpu = :cpu"),
    @NamedQuery(name = "Consola.findBySoporte", query = "SELECT c FROM Consola c WHERE c.soporte = :soporte")})
public class Consola implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "idConsola")
    private String idConsola;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "fabricante")
    private String fabricante;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "generacion")
    private String generacion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "lanzamiento")
    private String lanzamiento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "cpu")
    private String cpu;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "soporte")
    private String soporte;

    public Consola() {
    }

    public Consola(String idConsola) {
        this.idConsola = idConsola;
    }

    public Consola(String idConsola, String nombre, String fabricante, String generacion, String lanzamiento, String cpu, String soporte) {
        this.idConsola = idConsola;
        this.nombre = nombre;
        this.fabricante = fabricante;
        this.generacion = generacion;
        this.lanzamiento = lanzamiento;
        this.cpu = cpu;
        this.soporte = soporte;
    }

    public String getIdConsola() {
        return idConsola;
    }

    public void setIdConsola(String idConsola) {
        this.idConsola = idConsola;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public String getGeneracion() {
        return generacion;
    }

    public void setGeneracion(String generacion) {
        this.generacion = generacion;
    }

    public String getLanzamiento() {
        return lanzamiento;
    }

    public void setLanzamiento(String lanzamiento) {
        this.lanzamiento = lanzamiento;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getSoporte() {
        return soporte;
    }

    public void setSoporte(String soporte) {
        this.soporte = soporte;
    }
    public boolean validarNombre(){
        if(this.nombre.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarIdConsola(){
        if(this.idConsola.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarFabricante(){
        if(this.fabricante.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarGeneracion(){
        if(this.generacion.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarLanzamiento(){
        if(this.lanzamiento.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarCpu(){
        if(this.cpu.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarSoporte(){
        if(this.soporte.equals("")){
            return false;
        }
        else{
            return true;
        }
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idConsola != null ? idConsola.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Consola)) {
            return false;
        }
        Consola other = (Consola) object;
        if ((this.idConsola == null && other.idConsola != null) || (this.idConsola != null && !this.idConsola.equals(other.idConsola))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelos.Consola[ idConsola=" + idConsola + " ]";
    }
    
}
