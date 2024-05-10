package org.example.proyecto.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@Entity
@Table(name="Usuarios")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nombre;
    private String email;
    private String apellidos;
    private String contraseña;
    private String dni;
    private int edad;
    private int tlf;
    private int prefijoTlf;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // Constructor con argumentos
    public Usuario(String nombre, String email, String apellidos, String contrasena, String dni, int edad, int tlf, int prefijoTlf) {
        this.nombre = nombre;
        this.email = email;
        this.apellidos = apellidos;
        this.contraseña = contrasena;
        this.dni = dni;
        this.edad = edad;
        this.tlf = tlf;
        this.prefijoTlf = prefijoTlf;
    }
    public Usuario() {}

    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "usuario")
    private Vendedor vendedor;
}

