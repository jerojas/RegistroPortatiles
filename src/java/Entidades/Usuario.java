/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author Guillermo
 */
public class Usuario {

    String nombres,apellidos,documento,correo,clave,telefono;
    int cod, idperfil, estado;

    public Usuario(int cod, String nombres, String apellidos, String documento, String correo, String clave, int idperfil, String telefono, int estado) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.documento = documento;
        this.correo = correo;
        this.clave = clave;
       this.telefono = telefono;
        this.cod = cod;
        this.idperfil = idperfil;
        this.estado = estado;
    }

  

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getDocumento() {
        return documento;
    }

    public String getCorreo() {
        return correo;
    }

    public String getClave() {
        return clave;
    }

   
    public String getTelefono() {
        return telefono;
    }

    public int getCod() {
        return cod;
    }

    public int getIdperfil() {
        return idperfil;
    }

    public int getEstado() {
        return estado;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public void setIdperfil(int idperfil) {
        this.idperfil = idperfil;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
    
    

   
    
}
