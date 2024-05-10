package org.example.proyecto.controller;

import org.example.proyecto.model.Producto;
import org.example.proyecto.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductoController {


        @Autowired
        private ProductoService productoService;

        @GetMapping("/formularioProducto")
        public String showForm(Model model) {
            model.addAttribute("producto", new Producto()); // Agrega el objeto producto al modelo
            return "CreateProduct"; // Nombre de tu vista JSP
        }

        @PostMapping("/crearProducto")
        public String createNewProduct(@ModelAttribute("producto") Producto producto) {
            productoService.save(producto);
            return "redirect:/"; // Redirige a la página principal o a donde desees
        }
    }


