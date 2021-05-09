package com.example.demo.models;

import javax.persistence.*;
@Entity
@Table (name = "empleado")
public class EmpleadoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Integer id;
    private String nombre;
    private String apellido;
    private String dui;
    private String fotoempleado;
    private String fotodocumento;
    private String email;
    private String contraseña;
    private int rol;
    private int estado;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getFotoempleado() {
        return fotoempleado;
    }

    public void setFotoempleado(String fotoempleado) {
        this.fotoempleado = fotoempleado;
    }

    public String getFotodocumento() {
        return fotodocumento;
    }

    public void setFotodocumento(String fotodocumento) {
        this.fotodocumento = fotodocumento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
}



