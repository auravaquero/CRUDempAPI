package com.example.demo.repositories;

import com.example.demo.models.EmpleadoModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface EmpleadoRepository extends CrudRepository<EmpleadoModel, Integer> {
     ArrayList<EmpleadoModel> findByEmail(String email);

}
