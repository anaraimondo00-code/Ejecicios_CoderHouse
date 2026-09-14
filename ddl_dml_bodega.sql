-- BodegaTech — Script de Inventario
-- Autor: Ana Raimondo
-- Fecha: 14/09/2026

-- SECCIÓN DDL

--CREAR BASE DE DATOS
CREATE DATABASE Ejercicio2;
GO

-- CLAUSULA USE
USE Ejercicio2;
GO

-- ELIMINAR TABLA INVENTARIO
DROP TABLE IF EXISTS inventario;

-- CREAR TABLA DE INVENTARIO
CREATE TABLE inventario(
id_producto int NOT NULL IDENTITY (1,1) PRIMARY KEY, -- INT porque quiero añadir un tipo numérico  entero, pero que sea un autoincremental que comience desde 1, y aumente de 1 en 1, para utilizarlo como un clave primaria
nombre_producto varchar(100) NOT NULL, -- VARCHAR porque es texto de largo variable, que con 100 caracteres debería alcanzar
categoria varchar(50) NOT NULL, -- VARCHAR porque es texto de largo variable, que con 50 caracteres debería alcanzar
precio_unitario DECIMAL (10, 2) NOT NULL, -- DECIMAL porque para dinero necesito precisión exacta de hasta 10 valores numéricos y solo 2 decimales
stock_actual int NOT NULL,-- INT porque quiero añadir un tipo numérico  entero
stock_minimo int NOT NULL,-- INT porque quiero añadir un tipo numérico  entero
fecha_ingreso date NOT NULL, -- DATE porque solo necesito guardar el día, no la hora exacta
activo TINYINT NOT NULL -- TINYINT porque es un valor lógico simple: activo o no activo
);

-- SECCIÓN DML

-- AÑADIR INFORMACIÓN EN LA TABLA
INSERT INTO inventario(nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES 
('Laptop Pro 15','Computación',1200.00,15,3,'2024-01-10',1),
('Mouse Inalámbrico','Accesorios',28.00,80,10,'2024-01-10',1),
('Monitor 4K 27"','Computación',450.00,12,2,'2024-01-15',1),
('Teclado Mecánico','Accesorios',95.00,40,5,'2024-01-15',1),
('Laptop Basic 14','Computación',650.00,20,3,'2024-02-01',1),
('Auriculares BT Pro','Audio',120.00,35,5,'2024-02-01',1),
('Hub USB-C 7 puertos','Accesorios',45.00,60,10,'2024-02-10',1),
('Webcam HD 1080p','Accesorios',85.00,25,5,'2024-02-10',1),
('SSD Externo 1TB','Almacenamiento',130.00,18,3,'2024-03-01',1),
('Parlante Bluetooth','Audio',60.00,45,8,'2024-03-01',1);

-- ACTUALIZAR STOCK ACTUAL
UPDATE inventario SET stock_actual = stock_actual - 3 WHERE id_producto = 1;
UPDATE inventario SET stock_actual = stock_actual - 12 WHERE id_producto = 2;
UPDATE inventario SET stock_actual = stock_actual - 5 WHERE id_producto = 6;

-- ACTUALIZAR ESTADO ACTIVO
UPDATE inventario SET activo = 0 WHERE id_producto = 8;

-- VER TABLA COMPLETA PARA VALIDAR LA CARGA
SELECT * FROM inventario;