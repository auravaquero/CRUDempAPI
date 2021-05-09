package com.example.demo.services;

import com.example.demo.models.EmpleadoModel;
import com.example.demo.repositories.EmpleadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Optional;

@Service
public class EmpleadoService {

    @Autowired
    EmpleadoRepository EmpleadoRepository;

    public ArrayList<EmpleadoModel> obtenerEmpleados(){

       return(ArrayList<EmpleadoModel>)EmpleadoRepository.findAll();
    }

    public EmpleadoModel guardarEmpleado(EmpleadoModel empleado){
        return EmpleadoRepository.save(empleado);
    }

    public Optional<EmpleadoModel> obtenerPorId(Integer Id){
        return EmpleadoRepository.findById(Id);

    }
    public ArrayList<EmpleadoModel> obtenerPorEmail(String email){
        return EmpleadoRepository.findByEmail(email);
    }
    public boolean eliminarEmpleado(Integer Id){
        try{
            EmpleadoRepository.deleteById(Id);
            return true;
        }
        catch (Exception Err){
            return  false;
        }
    }

}
