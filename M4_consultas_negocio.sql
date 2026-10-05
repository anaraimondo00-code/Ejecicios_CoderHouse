-- Módulo 4 - Pre Entregra 4
-- TechStore
-- Autor: Ana Raimondo
-- Fecha: 20/09/2026


-- CLAUSULA USE
USE Ventas_Tech_DB;
GO

-- Primer SELECT para ver datos de tabla
SELECT * FROM ventas;

-- Consulta 1: Resumen ejecutivo mensual
SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
COUNT(*) AS cantidad_pedidos,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- Consulta 2 — Ranking de productos (Top 5)
SELECT TOP 5 id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


-- Consulta 3: Clientes recurrentes
SELECT id_cliente,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;


-- Consulta 4: Meses por encima/debajo del promedio
SELECT
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
CASE 
WHEN SUM(cantidad * precio_unitario) > (SELECT AVG(total_mes)
    FROM (SELECT SUM(cantidad * precio_unitario) AS total_mes
        FROM ventas
        GROUP BY MONTH(fecha_venta)) AS totales_por_mes) 
    THEN 'Por encima'
    ELSE 'Por debajo'
END AS comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

/*

Hallazgos concretos:
    1.El producto 1 es el que más facturó con $3600, mientras que el segundo que más facturo fue el producto 3 con $1350.
    2.El producto 2 fue el que más unidades ha vendido, pero el que menos ha facturado con un total de $364.
    3.Los 5 clientes registrados han hecho más de un pedido, siendo el que más ha gastado el cliente 1 con un monto total de $2640.

*/