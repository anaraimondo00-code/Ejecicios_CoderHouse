# Módulo 3 — Ejercicio 2: DDL y DML en SQL — Inventario BodegaTech

## Descripción
Script SQL que administra el inventario de **BodegaTech**, una empresa distribuidora de productos tecnológicos. Cubre el ciclo completo de trabajo con una base de datos: definición de la estructura (DDL) y manipulación de los datos (DML).

## Contenido del script (`modulo3_ejercicio2.sql`)

**Sección DDL:**
- Creación de la base de datos `Ejercicio2`.
- `DROP TABLE IF EXISTS` para permitir re-ejecutar el script sin errores.
- `CREATE TABLE inventario` con 8 columnas, clave primaria en `id_producto`, y comentarios explicando el tipo de dato elegido en cada columna.

**Sección DML:**
- `INSERT INTO` con la carga de los 10 productos iniciales del inventario.
- `UPDATE` de `stock_actual` para reflejar 3 ventas del día (Laptop Pro 15, Mouse Inalámbrico, Auriculares BT Pro).
- `UPDATE` de `activo = 0` para marcar la Webcam HD 1080p como descontinuada.
- `SELECT * FROM inventario` final, para validar que la carga y las actualizaciones quedaron correctas.

## Cómo ejecutar
1. Abrir el script en SQL Server Management Studio (SSMS) o Azure Data Studio.
2. Ejecutar el script completo de punta a punta (de arriba hacia abajo).
3. El `SELECT` final muestra los 10 productos con sus stocks actualizados.

## Resultado esperado
| Producto | Stock final |
|---|---|
| Laptop Pro 15 (id 1) | 12 |
| Mouse Inalámbrico (id 2) | 68 |
| Auriculares BT Pro (id 6) | 30 |
| Webcam HD 1080p (id 8) | `activo = 0` (descontinuada) |

## Evidencia de ejecución
Ver captura de pantalla adjunta (`resultado_select.png`) con el resultado del `SELECT * FROM inventario` mostrando los 10 productos cargados y los valores actualizados correctamente.
