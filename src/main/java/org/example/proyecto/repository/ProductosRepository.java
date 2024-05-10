package org.example.proyecto.repository;

import org.example.proyecto.model.Producto;
import org.springframework.data.repository.CrudRepository;

public interface ProductosRepository extends CrudRepository<Producto, Long> {
}
