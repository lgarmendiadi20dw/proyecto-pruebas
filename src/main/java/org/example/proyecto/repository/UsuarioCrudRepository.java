package org.example.proyecto.repository;

import org.example.proyecto.model.Usuario;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface UsuarioCrudRepository extends CrudRepository<Usuario, Long> {

    /*@Modifying
    @Query(value = "INSERT INTO Usuarios ( Id, Nombre, Email, Apellidos, Contraseña, DNI, Edad, Tlf, Prefijo_tlf, Created_at, Updated_at) " +
            "VALUES (:nombre, :email, :apellidos, :contrasena, :dni, :edad, :tlf, :prefijoTlf, current_timestamp(), current_timestamp())",
            nativeQuery = true)
    void insertUsuarioCustom(Long id, String nombre, String email, String apellidos, String contrasena,
                             String dni, int edad, int tlf, int prefijoTlf);*/
}
