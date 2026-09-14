--CREAR BASE DE DATOS
CREATE DATABASE Ejercicio1;
GO

-- CLAUSULA USE
USE Ejercicio1;
GO

-- CREAR TABLA DE CLIENTES
CREATE TABLE clientes(
id_cliente int NOT NULL IDENTITY (1,1) PRIMARY KEY, -- INT porque quiero añadir un tipo numérico  entero, pero que sea un autoincremental que comience desde 1, y aumente de 1 en 1, para utilizarlo como un clave primaria
nombre varchar(100) NOT NULL, -- VARCHAR porque es texto de largo variable, que con 100 caracteres debería alcanzar
perfil_bio text NOT NULL,  -- TEXT porque puede ser un texto largo sin límite fijo de caracteres
fecha_registro date NOT NULL -- DATE porque solo necesito guardar el día, no la hora exacta
);

-- VER TABLA CLIENTES
SELECT * FROM clientes;

-- CREAR TABLA EMPLEADOS
CREATE TABLE productos(
id_producto int NOT NULL IDENTITY (1,1) PRIMARY KEY, -- INT porque quiero añadir un tipo numérico  entero, pero que sea un autoincremental que comience desde 1, y aumente de 1 en 1, para utilizarlo como un clave primaria
descripcion varchar(255) NOT NULL, -- VARCHAR porque es texto de largo variable, que con 255 caracteres debería alcanzar
precio DECIMAL (10, 2) NOT NULL, -- DECIMAL porque para dinero necesito precisión exacta de hasta 10 valores numéricos y solo 2 decimales
esta_activo BIT NOT NULL -- BIT porque es un valor lógico simple: activo o no activo
);

-- VER TABLA CLIENTES
SELECT * FROM productos;