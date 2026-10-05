-- Módulo 5 - Pre Entregra 5
-- TechStore
-- Autor: Ana Raimondo
-- Fecha: 05/10/2026


-- CLAUSULA USE
USE Ventas_Tech_DB;
GO

-- Seleccionar Tablas
SELECT * FROM ventas;
SELECT * FROM productos;
SELECT * FROM categorias;
SELECT * FROM clientes;

--Consulta 1 — Vista base del proyecto (INNER JOIN)

SELECT 
    v.id_venta,
    v.fecha_venta,
    p.nombre_producto,
    cat.nombre_categoria,
    cat.descripcion,
    c.nombre AS nombre_cliente,
    c.email AS email_cliente,
    c.ciudad AS ciudad_cliente,
    v.cantidad,
    v.precio_unitario,
    p.stock,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

--Consulta 2 — Clientes sin ventas (LEFT JOIN) 
SELECT 
    c.nombre AS nombre_cliente,
    c.email AS email_cliente,
    c.ciudad AS ciudad_cliente,
    c.fecha_registro AS fecha_registro_cliente,
    v.id_venta
FROM clientes AS c
LEFT JOIN ventas AS v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

    --No hay clientes sin ventas

--Consulta 3 — Productos sin ventas (LEFT JOIN)
SELECT 
    p.nombre_producto,
    p.precio,
    p.stock,
    p.activo,
    cat.descripcion,
    v.id_venta
FROM productos AS p
LEFT JOIN ventas AS v ON p.id_producto = v.id_producto
LEFT JOIN categorias AS cat ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;

    --No hay productos sin venderse

--Consulta 4 — Consolidado por canal (UNION ALL)
    --Region 1 -> Buenos Aires -> Sede Central
    SELECT canal, SUM(total) AS total_canal
    FROM (
        SELECT 
            c.ciudad AS ciudad_cliente,
            v.fecha_venta,
            v.cantidad * v.precio_unitario AS total,
            'Sede Central' AS canal
        FROM ventas v
        INNER JOIN clientes AS c ON v.id_cliente = c.id_cliente
        WHERE c.ciudad = 'Buenos Aires'
    
    --Unir tablas
     UNION ALL

    --Region 2 -> Demás provincias -> Sede Interior
        SELECT 
            c.ciudad AS ciudad_cliente,
            v.fecha_venta,
            v.cantidad * v.precio_unitario AS total,
            'Sede Interior' AS canal
        FROM ventas v
        INNER JOIN clientes AS c ON v.id_cliente = c.id_cliente
        WHERE c.ciudad <> 'Buenos Aires'
    ) AS Tablas_unidas
    GROUP BY canal;
