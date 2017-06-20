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
@Table(name = "juego")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Juego.findAll", query = "SELECT j FROM Juego j"),
    @NamedQuery(name = "Juego.findByIdJuego", query = "SELECT j FROM Juego j WHERE j.idJuego = :idJuego"),
    @NamedQuery(name = "Juego.findByNombre", query = "SELECT j FROM Juego j WHERE j.nombre = :nombre"),
    @NamedQuery(name = "Juego.findByDesarrollador", query = "SELECT j FROM Juego j WHERE j.desarrollador = :desarrollador"),
    @NamedQuery(name = "Juego.findByDistribuidora", query = "SELECT j FROM Juego j WHERE j.distribuidora = :distribuidora"),
    @NamedQuery(name = "Juego.findByPlataforma", query = "SELECT j FROM Juego j WHERE j.plataforma = :plataforma"),
    @NamedQuery(name = "Juego.findByGenero", query = "SELECT j FROM Juego j WHERE j.genero = :genero"),
    @NamedQuery(name = "Juego.findByLanzamiento", query = "SELECT j FROM Juego j WHERE j.lanzamiento = :lanzamiento"),
    @NamedQuery(name = "Juego.findByArgumento", query = "SELECT j FROM Juego j WHERE j.argumento = :argumento"),
    @NamedQuery(name = "Juego.findBySistema", query = "SELECT j FROM Juego j WHERE j.sistema = :sistema")})
public class Juego implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "idJuego")
    private String idJuego;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "desarrollador")
    private String desarrollador;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "distribuidora")
    private String distribuidora;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "plataforma")
    private String plataforma;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "genero")
    private String genero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "lanzamiento")
    private String lanzamiento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "argumento")
    private String argumento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "sistema")
    private String sistema;

    public Juego() {
    }

    public Juego(String idJuego) {
        this.idJuego = idJuego;
    }

    public Juego(String idJuego, String nombre, String desarrollador, String distribuidora, String plataforma, String genero, String lanzamiento, String argumento, String sistema) {
        this.idJuego = idJuego;
        this.nombre = nombre;
        this.desarrollador = desarrollador;
        this.distribuidora = distribuidora;
        this.plataforma = plataforma;
        this.genero = genero;
        this.lanzamiento = lanzamiento;
        this.argumento = argumento;
        this.sistema = sistema;
    }

    public String getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(String idJuego) {
        this.idJuego = idJuego;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDesarrollador() {
        return desarrollador;
    }

    public void setDesarrollador(String desarrollador) {
        this.desarrollador = desarrollador;
    }

    public String getDistribuidora() {
        return distribuidora;
    }

    public void setDistribuidora(String distribuidora) {
        this.distribuidora = distribuidora;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getLanzamiento() {
        return lanzamiento;
    }

    public void setLanzamiento(String lanzamiento) {
        this.lanzamiento = lanzamiento;
    }

    public String getArgumento() {
        return argumento;
    }

    public void setArgumento(String argumento) {
        this.argumento = argumento;
    }

    public String getSistema() {
        return sistema;
    }

    public void setSistema(String sistema) {
        this.sistema = sistema;
    }
    public boolean validarNombre(){
        if(this.nombre.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarIdJuego(){
        if(this.idJuego.equals("")){
            return false;
        }
        else{
            return true;
        }
        
    }
    public boolean validarDesarrollador(){
        if(this.desarrollador.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarDistribuidora(){
        if(this.distribuidora.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarPlataforma(){
        if(this.plataforma.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarGenero(){
        if(this.genero.equals("")){
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
    public boolean validarArgumento(){
        if(this.argumento.equals("")){
            return false;
        }
        else{
            return true;
        }
    }
    public boolean validarSistema(){
        if(this.sistema.equals("")){
            return false;
        }
        else{
            return true;
        }
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idJuego != null ? idJuego.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Juego)) {
            return false;
        }
        Juego other = (Juego) object;
        if ((this.idJuego == null && other.idJuego != null) || (this.idJuego != null && !this.idJuego.equals(other.idJuego))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelos.Juego[ idJuego=" + idJuego + " ]";
    }
    
}
