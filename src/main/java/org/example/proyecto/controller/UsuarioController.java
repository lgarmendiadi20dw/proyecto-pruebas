package org.example.proyecto.controller;

import jakarta.inject.Inject;
import org.example.proyecto.model.Usuario;
import org.example.proyecto.repository.UsuarioCrudRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller

public class UsuarioController{

    @Inject
    private UsuarioCrudRepository usuarioRepository;

    @GetMapping("/formularioUsuario")
    public String showForm(Model model) {
//        Iterable<Usuario>usuarios=usuarioRepository.findAll();
        model.addAttribute("usuario",new Usuario());
        return "FormularioUsuario";
    }

    @GetMapping("/mostrarUsuarios")
    public String showUsuarios(Model model) {
        Iterable<Usuario> usuarios =usuarioRepository.findAll();
        model.addAttribute("usuarios",usuarios);
        return "MostrarUsuarios";
    }

    @PostMapping("/crearUsuario")
    public String createNewUser(Usuario usuario) {
//        usuarioRepository.insertUsuarioCustom(usuario.getId(),usuario.getNombre(), usuario.getEmail(), usuario.getApellidos(),usuario.getContraseña(), usuario.getDni(), usuario.getEdad(), usuario.getTlf(), usuario.getPrefijoTlf());
        usuarioRepository.save(usuario);
        return "redirect:/"; // Página de inicio o donde desees redirigir
    }

}
