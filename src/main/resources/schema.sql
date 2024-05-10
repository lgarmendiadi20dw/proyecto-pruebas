/*
CREATE DATABASE IF NOT EXISTS HandCraftVerse;
USE HandCraftVerse;

-- Tabla Usuarios


CREATE TABLE Usuarios (
                          ID INT PRIMARY KEY,
                          Nombre VARCHAR(255),
                          Email VARCHAR(255) UNIQUE,
                          Apellidos VARCHAR(255),
                          Contraseña VARCHAR(255),
                          DNI VARCHAR(10),
                          Edad INT,
                          Tlf INT,
                          Prefijo_tlf INT,
                          Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Direcciones

CREATE TABLE Direcciones (
                             ID INT PRIMARY KEY,
                             Pais VARCHAR(100),
                             Provincia VARCHAR(100),
                             Municipio VARCHAR(100),
                             Piso INT,
                             Numero INT,
                             Escalera VARCHAR(10),
                             Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Tabla Info Bancaria

CREATE TABLE Info_Bancaria (
                               ID INT PRIMARY KEY,
                               Titular VARCHAR(255),
                               Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Relación N:M entre Usuarios y Info_Bancaria

CREATE TABLE Usuarios_Info_Bancaria (
                                        UsuarioID INT,
                                        Info_BancariaID INT,
                                        PRIMARY KEY (UsuarioID, Info_BancariaID),
                                        Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                        FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID),
                                        FOREIGN KEY (Info_BancariaID) REFERENCES Info_Bancaria(ID)
);

-- Tabla Administradores

CREATE TABLE Administradores (
                                 ID INT PRIMARY KEY,
                                 UsuarioID INT,
                                 Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                 Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                 FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla Vendedores

CREATE TABLE Vendedores (
                            ID INT PRIMARY KEY,
                            UsuarioID INT,
                            Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla Redes Sociales

CREATE TABLE Redes_Sociales (
                                ID INT PRIMARY KEY,
                                VendedorID INT,
                                Nombre_usuario VARCHAR(255),
                                Plataforma VARCHAR(100),
                                Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                FOREIGN KEY (VendedorID) REFERENCES Vendedores(ID)
);

-- Tabla PayPal

CREATE TABLE PayPal (
                        ID INT PRIMARY KEY,
                        Info_BancariaID INT UNIQUE,
                        Correo_electronico VARCHAR(255),
                        Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        FOREIGN KEY (Info_BancariaID) REFERENCES Info_Bancaria(ID)
);

-- Tabla Tarjeta

CREATE TABLE Tarjeta (
                         ID INT PRIMARY KEY,
                         Info_BancariaID INT UNIQUE,
                         Tipo_tarjeta ENUM('Visa', 'Mastercard'),
                         Numero VARCHAR(16),
                         CVV INT,
                         Caducidad DATE,
                         Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         FOREIGN KEY (Info_BancariaID) REFERENCES Info_Bancaria(ID)
);



-- Tabla Categorias

CREATE TABLE Categorias (
                            ID INT PRIMARY KEY,
                            Nombre VARCHAR(255),
                            Fecha_creacion DATE,
                            Fecha_modificacion DATE,
                            Descripcion TEXT,
                            Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Productos

CREATE TABLE Productos (
                           ID INT PRIMARY KEY,
                           VendedorID INT,
                           Nombre VARCHAR(255),
                           Precio DECIMAL(10, 2),
                           Stock INT,
                           Descripcion TEXT,
                           Personalizable BOOLEAN,
                           CategoriaID INT,
                           Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                           FOREIGN KEY (VendedorID) REFERENCES Vendedores(ID),
                           FOREIGN KEY (CategoriaID) REFERENCES Categorias(ID)
);

-- Tabla Colores

CREATE TABLE Colores (
                         ID INT PRIMARY KEY,
                         Nombre VARCHAR(100),
                         Codigo VARCHAR(10),
                         Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Imagenes

CREATE TABLE Imagenes (
                          ID INT PRIMARY KEY,
                          URL VARCHAR(255),
                          Alt VARCHAR(255),
                          Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Productos_Colores_Imagenes

CREATE TABLE Productos_Colores_Imagenes (
                                            ProductoID INT,
                                            ColorID INT,
                                            ImagenID INT,
                                            PRIMARY KEY (ProductoID, ColorID, ImagenID),
                                            Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                            FOREIGN KEY (ProductoID) REFERENCES Productos(ID),
                                            FOREIGN KEY (ColorID) REFERENCES Colores(ID),
                                            FOREIGN KEY (ImagenID) REFERENCES Imagenes(ID)
);

-- Tabla Compradores

CREATE TABLE Compradores (
                             ID INT PRIMARY KEY,
                             UsuarioID INT,
                             Direccion_envioID INT,
                             Direccion_facturacionID INT,
                             Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                             FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID),
                             FOREIGN KEY (Direccion_envioID) REFERENCES Direcciones(ID),
                             FOREIGN KEY (Direccion_facturacionID) REFERENCES Direcciones(ID)
);



-- Tabla Pedidos

CREATE TABLE Pedidos (
                         ID INT PRIMARY KEY,
                         ProductoID INT,
                         CompradorID INT,
                         Personalizacion VARCHAR(255),
                         Cantidad INT,
                         Estado VARCHAR(100),
                         Fecha_compra DATE,
                         Fecha_pago DATE,
                         Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         FOREIGN KEY (ProductoID) REFERENCES Productos(ID),
                         FOREIGN KEY (CompradorID) REFERENCES Compradores(ID)
);

-- Tabla Comentarios
CREATE TABLE Comentarios (
                             ID INT PRIMARY KEY,
                             ProductoID INT,
                             CompradorID INT,
                             Puntuacion INT,
                             Comentario TEXT,
                             Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                             FOREIGN KEY (ProductoID) REFERENCES Productos(ID),
                             FOREIGN KEY (CompradorID) REFERENCES Compradores(ID)
);

-- Tabla Guarda_Fav


CREATE TABLE Guarda_Fav (
                            ProductoID INT,
                            CompradorID INT,
                            PRIMARY KEY (ProductoID, CompradorID),
                            Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            FOREIGN KEY (ProductoID) REFERENCES Productos(ID),
                            FOREIGN KEY (CompradorID) REFERENCES Compradores(ID)
);

-- Tabla Historial_Productos

CREATE TABLE Historial_Productos (
                                     ID INT AUTO_INCREMENT PRIMARY KEY,
                                     ProductoID INT,
                                     Gestion ENUM('Create', 'Update', 'Delete'),
                                     Nombre VARCHAR(255),
                                     Precio DECIMAL(10, 2),
                                     Stock INT,
                                     Descripcion TEXT,
                                     Personalizable BOOLEAN,
                                     CategoriaID INT,

                                     Fecha_gestion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                     FOREIGN KEY (ProductoID) REFERENCES Productos(ID),
                                     FOREIGN KEY (CategoriaID) REFERENCES Categorias(ID)
);
*/