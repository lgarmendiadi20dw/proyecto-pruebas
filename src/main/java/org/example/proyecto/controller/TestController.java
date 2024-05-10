package org.example.proyecto.controller;

import org.example.proyecto.model.Direccion;
import org.example.proyecto.model.Usuario;
import org.example.proyecto.model.Vendedor;
import org.example.proyecto.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class TestController {

    private final UsuarioCrudRepository usuarioRepository;
    private final VendedorRepository vendedorRepository;

    @Autowired
    public TestController(UsuarioCrudRepository usuarioRepository, VendedorRepository vendedorRepository) {
        this.usuarioRepository = usuarioRepository;
        this.vendedorRepository = vendedorRepository;
    }

    @GetMapping("/relaciones")
    public String relaciones(Model model) {
        // Crear un usuario
        Usuario usuario = new Usuario("John", "john@example.com", "Doe", "password123", "12345678A", 30, 123456789, 34);
        usuarioRepository.save(usuario);

        // Crear un vendedor y asociarlo al usuario
        Vendedor vendedor = new Vendedor();
        vendedor.setUsuario(usuario);
        vendedorRepository.save(vendedor);

        // Crear una dirección y asociarla al vendedor
        Direccion direccion = new Direccion("123 Main Street");
        direccion.setVendedor(vendedor);

      /*  // Guardar la dirección
        vendedor.getDireccion().add(direccion);
        vendedorRepository.save(vendedor);
*/
        // Obtener y mostrar información relacionada
        Usuario usuarioObtenido = usuarioRepository.findById(usuario.getId()).orElse(null);
        Vendedor vendedorObtenido = vendedorRepository.findById(vendedor.getId()).orElse(null);

        model.addAttribute("usuario", usuarioObtenido);
        model.addAttribute("vendedor", vendedorObtenido);

        return "home";
    }
}
