package com.example.demo.controllers;

import com.example.demo.models.EmpleadoModel;
import com.example.demo.services.EmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/usuario")

public class EmpleadoController {
    @Autowired
    EmpleadoService empleadoService;

    @GetMapping()
    public ArrayList<EmpleadoModel> obtenerEmpleados(){

        return  empleadoService.obtenerEmpleados();
    }

    @PostMapping
    public EmpleadoModel guardarUsuario(@RequestBody EmpleadoModel empleado){

        return this.empleadoService.guardarEmpleado(empleado);
    }

    @GetMapping(path = "/{id}")
    public Optional<EmpleadoModel> obtenerEmpleadoPorId(@PathVariable("id") Integer id ){

        return  this.empleadoService.obtenerPorId(id);
    }

    @GetMapping("/query")
    public ArrayList<EmpleadoModel> obtenerEmpleadoPorEmail(@RequestParam("email") String email){
        return this.empleadoService.obtenerPorEmail(email);

    }

    @DeleteMapping(path = "/{id}")
    public String eliminarPorId(@PathVariable("id")  Integer id){
        boolean ok =this.empleadoService.eliminarEmpleado(id);
        if (ok){
            return "Se elimino con exito Usuario id: "+ id;
        }else {
            return "Fallo al eliminar Usuario id: "+ id;
        }
    }


}
