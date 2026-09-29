# UNION y UNION ALL — RetailChain

## Contenido
- `schema.sql` — creación de las tablas `inventario_sucursal_norte` e `inventario_sucursal_sur`, con datos de prueba.
- `soluciones.sql` — 3 consultas: catálogo unificado (UNION), auditoría de stock total (UNION ALL), y comparación de resultados.

## ¿Cuántas filas devuelve cada consulta y por qué son distintas?

La Consulta 1 (UNION) devuelve 11 filas, mientras que la Consulta 2 (UNION ALL) devuelve 14 filas. La diferencia se debe a que la operación UNION elimina filas completamente duplicadas, y en este dataset hay 3 productos que están cargados de forma idéntica en ambas sucursales, es decir con el mismo `id_producto`, `nombre_producto` y `categoria`: 
- Monitor 4K 27" (103)
- Teclado Mecánico (104) 
- SSD Externo 1TB (106)

Mientras que al utilizar la operación UNION ALL esos mismos 3 productos aparecen como filas individuales, una por cada sucursal, porque UNION ALL no elimina ni compara nada, simplemente concatena todos los resultados tal cual vienen.

Por otro lado, hay un producto que tiene el mismo nombre y categoría en ambas tablas, pero que tiene `id_producto` diferente: Webcam HD 1080p (107 en Norte, 111 en Sur). Como el `id_producto` no coincide, UNION no las considera duplicadas y las mantiene como 2 filas separadas.

## ¿Por qué UNION ALL es más eficiente que UNION?

UNION ALL simplemente concatena los resultados de ambas consultas, uno atrás del otro, sin comparar nada entre sí. UNION, en cambio, tiene que comparar todas las fila para detectar cuáles son idénticas y eliminarlas, lo que implica un paso adicional de ordenamiento o agrupación de todas las filas para poder identificar los duplicados. Ese trabajo extra de comparación es el que consume más recursos, especialmente cuando las tablas involucradas tienen muchas filas.

## ¿En qué casos de negocio usaría cada uno?

**UNION** lo usaría cuando necesito una lista limpia y sin repeticiones para presentar o tomar decisiones, por ejemplo: consolidar la lista de emails de clientes de distintas campañas de marketing (para no mandarles el mismo mail dos veces), o unificar la lista de empleados de dos sucursales que van a fusionarse.

**UNION ALL** lo usaría cuando necesito el volumen real de eventos o transacciones, sin perder ningún registro, por ejemplo: consolidar todas las transacciones de venta de distintas sucursales para calcular la facturación total del mes.

## ¿Qué pasa si las columnas no coinciden en número o tipo?

Si las columnas no coinciden en número o tipo, SQL Server devuelve un error de compilación, ya que ambas partes del UNION deben tener exactamente el mismo número de columnas, en el mismo orden, y con tipos de datos compatibles entre sí. SQL no infiere ni ajusta automáticamente estas diferencias.
