USE M5_Ejercicio2

SELECT * FROM inventario_sucursal_norte;
SELECT * FROM inventario_sucursal_sur;

-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Autor: Ana Raimondo
-- Fecha: 29/09/2026
-- ══════════════════════════════════════════
-- ── CONSULTA 1: UNION ────────────────────
-- Reporte de Catálogo Unificado
-- Pregunta de negocio: ¿Qué productos únicos comercializa la empresa en toda su red de sucursales?
-- Operador: UNION (elimina filas completamente duplicadas)

SELECT id_producto, nombre_producto, categoria
FROM inventario_sucursal_norte
UNION
SELECT id_producto, nombre_producto, categoria
FROM inventario_sucursal_sur;

/*
Comercializa los siguientes 11 productos: 
	Laptop Pro 15
	Mouse Inalámbrico
	Monitor 4K 27"
	Teclado Mecánico
	Auriculares BT Pro
	SSD Externo 1TB
	Webcam HD 1080p (tiene 2 id diferentes 107 y 111)
	Laptop Basic 14
	Parlante Bluetooth
	Hub USB-C 7p
*/
-- ── CONSULTA 2: UNION ALL ────────────────
-- Auditoría de Stock Total
-- Pregunta de negocio: ¿Cuántos registros físicos de stock existen en total entre ambas sucursales?
-- Operador: UNION ALL (mantiene todos los registros incluyendo duplicados)

SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_norte
UNION ALL
SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_sur;

/* 
Existen 14 registro de stock entre ambas sucursales
*/

-- ── CONSULTA 3: COMPARACIÓN DE RESULTADOS ─
-- Ejecutá estas dos consultas para comparar cuántas filas devuelve cada operador y explicá la diferencia en tu README
SELECT COUNT(*) AS filas_union     
FROM 
	(SELECT id_producto, nombre_producto, categoria
	FROM inventario_sucursal_norte
	UNION
	SELECT id_producto, nombre_producto, categoria
	FROM inventario_sucursal_sur
	)     AS resultado_union;

SELECT COUNT(*) AS filas_union_all 
FROM 
	(SELECT id_producto, nombre_producto, categoria, stock
	FROM inventario_sucursal_norte
	UNION ALL
	SELECT id_producto, nombre_producto, categoria, stock
	FROM inventario_sucursal_sur
	) AS resultado_union_all;