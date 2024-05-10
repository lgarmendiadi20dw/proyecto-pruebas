<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulario Usuario</title>
    <link href="/dist/output.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="/css/tailwind.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        moradoPrincipal: '#F8D4FF',
                        texto: '#2E2E2E',
                        textoSecundario: '#5C5C5C',
                        // moradoResaltar:'#2D0A33',
                        moradoResaltar:'#761D91',
                    }
                }
            }
        }
    </script>
</head>
<body>
<nav class="bg-moradoPrincipal 900">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
        <a href="#" class="flex items-center">
            <img src="https://flowbite.com/docs/images/logo.svg" class="h-8 mr-3" alt="HandCraftVerse Logo" />
            <span class="self-center text-2xl font-semibold whitespace-nowrap text-texto">HandCraftVerse</span>
        </a>
        <div class="flex md:order-2">
            <button type="button" data-collapse-toggle="navbar-search" aria-controls="navbar-search" aria-expanded="false" class="md:hidden text-moradoResaltar  hover:bg-gray-100 dark:hover:bg-moradoPrincipal-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5 mr-1" >
                <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                </svg>
                <span class="sr-only">Search</span>
            </button>
            <div class="relative hidden md:block">
                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                    <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                         fill="none" viewBox="0 0 20 20">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                    </svg>
                    <span class="sr-only">Search icon</span>
                </div>
                <input type="text" class="search-navbar block w-full p-2 pl-10 text-sm text-textoSecundario  border border-transparent rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal " placeholder="Search...">
            </div>
            <button data-collapse-toggle="navbar-search" type="button" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-search" aria-expanded="false">
                <span class="sr-only">Open main menu</span>
                <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15"/>
                </svg>
            </button>
        </div>
        <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-search">
            <div class="relative mt-3 md:hidden">
                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                    <svg class="w-4 h-4 text-texto " aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                         fill="none" viewBox="0 0 20 20">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                    </svg>
                </div>
                <input type="text" class="search-navbar block w-full p-2 pl-10 text-sm text-textoSecundario border  rounded-lg " placeholder="Search...">
            </div>
            <ul
                    class="flex flex-col p-4 md:p-0 mt-4 font-medium border  bg-transparent rounded-lg md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-transparent   dark:border-gray-700">
                <li>
                    <a href="/"
                       class="block py-2 pl-3 pr-4 text-textoSecundario rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-moradoResaltar"
                    >Home</a>
                </li>
                <li>
                    <a href="/formularioProducto"
                       class="block py-2 pl-3 pr-4 text-moradoResaltar rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-moradoResaltar"  aria-current="page">Nuevo Producto</a>
                </li>
                <li>
                    <a href="formularioUsuario"
                       class="block py-2 pl-3 pr-4 text-textoSecundario rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-moradoResaltar">Crear Usuario</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form:form action="/crearUsuario" method="post" modelAttribute="usuario">
    <table>
        <tr>
            <td>Nombre:</td>
            <td><form:input class="w-full border border-gray-300 rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal" path="nombre" /></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><form:input class="w-full border border-gray-300 rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal" path="email" /></td>
        </tr>
        <tr>
            <td>Apellidos:</td>
            <td><form:input class="w-full border border-gray-300 rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal" path="apellidos" /></td>
        </tr>
        <tr>
            <td>Contraseña:</td>
            <td><form:password class="w-full border border-gray-300 rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal" path="contraseña" /></td>
        </tr>
        <tr>
            <td>DNI:</td>
            <td><form:input class="w-full border border-gray-300 rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal" path="dni" /></td>
        </tr>
        <tr>
            <td>Edad:</td>
            <td><form:input class="w-full border border-gray-300 rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal" path="edad" /></td>
        </tr>
        <tr>
            <td>Teléfono:</td>
            <td><form:input class="w-full border border-gray-300 rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal" path="tlf" /></td>
        </tr>
        <tr>
            <td>Prefijo Teléfono:</td>
            <td><form:input class="w-full border border-gray-300 rounded-md hover:border-moradoResaltar focus:border-moradoResaltar focus:ring focus:ring-moradoPrincipal" path="prefijoTlf" /></td>
        </tr>
    </table>
    <input type="submit" value="Submit" />
</form:form>


</body>
</html>
