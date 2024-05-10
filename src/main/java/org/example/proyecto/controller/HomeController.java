package org.example.proyecto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@RequestMapping("/")
public class HomeController {

    @GetMapping("/")
    public ModelAndView welcome() {
        ModelAndView model = new ModelAndView("home"); // quitamos el "/" de "/home"
        model.addObject("message", "Bienvenido a mi aplicación"); // suponemos que 'message' es una cadena
        return model;
    }







}
