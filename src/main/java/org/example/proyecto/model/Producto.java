package org.example.proyecto.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@Entity
@Table(name="Productos")
public class Producto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(max = 100)
    @Column(name = "nombre")
    private String nombre;

    @NotNull
    @Size(max = 100)
    @Column(name = "precio")
        private Double precio;

    @Column(name = "stock")
    @Size( max = 100)
    private Double stock;
    private String descripcion;
    private boolean personalizable;
    private Integer categoriaID;


    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public Producto() {
        super();

    }

}
