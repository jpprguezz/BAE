# Apuntes para examen

# Cosas que se me dan mal (mysql)

- Consultas resumen
```sql
-- 21. Calcula la cantidad media de todos las solicitudes que aparecen en la tabla solicitud.
SELECT AVG(cantidad) AS cantidad_media FROM solicitud;

-- 22. Calcula el número total de vendedores distintos que aparecen en la tabla solicitud.
SELECT COUNT(DISTINCT id_vendedor) AS total_vendedores_distintos FROM solicitud;

-- 23. Calcula el número total de compradores que aparecen en la tabla comprador.
SELECT COUNT(*) AS total_compradores FROM comprador;

-- 24. Calcula cuál es la mayor cantidad que aparece en la tabla solicitud.
SELECT MAX(cantidad) AS mayor_cantidad FROM solicitud;

-- 25. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla comprador.
SELECT ciudad, MAX(categoria) AS max_categoria FROM comprador GROUP BY ciudad;

-- 26. Calcula cuál es el máximo valor de las solicitudes realizadas durante el mismo día para cada uno de los compradores.
-- Se pide que se calcule cuál es el solicitud de máximo valor para cada uno de los días en los que un comprador ha realizado un solicitud. 
-- Muestra el identificador del comprador, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT s.id_comprador, c.nombre, c.apellidos, s.fecha, MAX(s.cantidad) AS max_cantidad
FROM solicitud s
JOIN comprador c ON s.id_comprador = c.id
GROUP BY s.id_comprador, c.nombre, c.apellidos, s.fecha;

-- 27. Calcula cuál es el máximo valor de las solicitudes realizadas durante el mismo día para cada uno de los compradores, 
-- teniendo en cuenta que sólo queremos mostrar aquellas solicitudes que superen la cantidad de 2000 €.
SELECT s.id_comprador, c.nombre, c.apellidos, s.fecha, MAX(s.cantidad) AS max_cantidad
FROM solicitud s
JOIN comprador c ON s.id_comprador = c.id
WHERE s.cantidad > 2000
GROUP BY s.id_comprador, c.nombre, c.apellidos, s.fecha;

-- 28. Calcula el máximo valor de las solicitudes realizadas para cada uno de los vendedores durante la fecha 2016-08-17. 
-- Muestra el identificador del vendedor, nombre, apellidos y total.
SELECT s.id_vendedor, v.nombre, v.apellidos, MAX(s.cantidad) AS max_cantidad
FROM solicitud s
JOIN vendedor v ON s.id_vendedor = v.id
WHERE s.fecha = '2016-08-17'
GROUP BY s.id_vendedor, v.nombre, v.apellidos;

-- 29. Devuelve un listado con el identificador de comprador, nombre y apellidos y el número total de solicitudes que ha realizado cada uno de compradores.
-- Tenga en cuenta que pueden existir compradores que no han realizado ningún solicitud. 
-- Estos compradores también deben aparecer en el listado indicando que el número de solicitudes realizadas es 0.
SELECT c.id, c.nombre, c.apellidos, COUNT(s.id) AS total_solicitudes
FROM comprador c
LEFT JOIN solicitud s ON c.id = s.id_comprador
GROUP BY c.id, c.nombre, c.apellidos;

-- 30. Devuelve un listado con el identificador de comprador, nombre y apellidos y el número total de solicitudes que ha realizado cada uno de compradores durante el año 2020.
SELECT c.id, c.nombre, c.apellidos, COUNT(s.id) AS total_solicitudes_2020
FROM comprador c
LEFT JOIN solicitud s ON c.id = s.id_comprador AND YEAR(s.fecha) = 2020
GROUP BY c.id, c.nombre, c.apellidos;

-- 31. Devuelve cuál ha sido el solicitud de máximo valor que se ha realizado cada año.
SELECT YEAR(fecha) AS año, MAX(cantidad) AS max_cantidad
FROM solicitud
GROUP BY YEAR(fecha);
``` 

- Subconsultas

```sql
--- Con operadores básicos de comparación

-- 32. Devuelve un listado con todos las solicitudes que ha realizado Adela Salas Díaz.
SELECT * 
FROM solicitud 
WHERE id_comprador = (SELECT id FROM comprador WHERE nombre = 'Adela' AND apellidos = 'Salas Díaz');

-- 33. Devuelve la fecha y la cantidad del solicitud de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha, cantidad 
FROM solicitud 
WHERE id_comprador = (SELECT id FROM comprador WHERE nombre = 'Pepe' AND apellidos = 'Ruiz Santana') 
ORDER BY cantidad ASC 
LIMIT 1;

-- 34. Devuelve el número de solicitudes en los que ha participado el vendedor Daniel Sáez Vega. (Sin utilizar INNER JOIN)
SELECT COUNT(*) AS total_solicitudes 
FROM solicitud 
WHERE id_vendedor = (SELECT id FROM vendedor WHERE nombre = 'Daniel' AND apellidos = 'Sáez Vega');

-- 35. Devuelve los datos del comprador que realizó el solicitud más caro en el año 2021. (Sin utilizar INNER JOIN)
SELECT * 
FROM comprador 
WHERE id = (SELECT id_comprador FROM solicitud WHERE YEAR(fecha) = 2021 ORDER BY cantidad DESC LIMIT 1);

-- 36. Devuelve un listado con los datos de los compradores y las solicitudes, de todos los compradores que han realizado un solicitud durante el año 2020 
-- con un valor mayor o igual al valor medio de las solicitudes realizadas durante ese mismo año.
SELECT * 
FROM comprador 
WHERE id IN (
    SELECT id_comprador 
    FROM solicitud 
    WHERE YEAR(fecha) = 2020 
      AND cantidad >= (SELECT AVG(cantidad) FROM solicitud WHERE YEAR(fecha) = 2020)
);

-- 37. Devuelve un listado de los compradores que no han realizado ningún solicitud. (Utilizando IN o NOT IN).
SELECT * 
FROM comprador 
WHERE id NOT IN (SELECT id_comprador FROM solicitud);

-- 38. Devuelve un listado de los vendedores que no han realizado ningún solicitud. (Utilizando IN o NOT IN).
SELECT * 
FROM vendedor 
WHERE id NOT IN (SELECT id_vendedor FROM solicitud);

-- 39. Devuelve un listado de los compradores que no han realizado ningún solicitud. (Utilizando EXISTS o NOT EXISTS).
SELECT * 
FROM comprador c 
WHERE NOT EXISTS (SELECT 1 FROM solicitud s WHERE s.id_comprador = c.id);

-- 40. Devuelve un listado de los vendedores que no han realizado ningún solicitud. (Utilizando EXISTS o NOT EXISTS).
SELECT * 
FROM vendedor v 
WHERE NOT EXISTS (SELECT 1 FROM solicitud s WHERE s.id_vendedor = v.id);
```

## Aleatoriedad 

- `RAND ()`: Devuelve un valor de punto flotante aleatorio entre 0 y 1. Se puede usar para generar valores aleatorios en general.

```sql
SELECT RAND(); -- Genera un número aleatorio entre 0 y 1
-- Ejemplo de salida: 0.712345
```

- `RAND(N)`: Toma una semilla N como argumento para generar números pseudo-aleatorios.

```sql
SELECT RAND(1); -- Genera un número aleatorio basado en la semilla 1
-- Ejemplo de salida: 0.659217
```

- `RAND() con ORDER BY`: Si necesitas una lista de filas en un orden aleatorio, puedes usar RAND() junto con ORDER BY.

```sql
SELECT * FROM tabla ORDER BY RAND();
-- SELECT * FROM tabla ORDER BY RAND(); -- Ejemplo de salida: Filas de la tabla en un orden aleatorio
```

- `FLOOR(RAND() * (max - min + 1)) + min`. Permite generar un número entero aleatorio dentro de un rango específico.

```sql
SELECT FLOOR(RAND() * (100 - 1 + 1)) + 1; -- Genera un número aleatorio entre 1 y 100
-- Ejemplo de salida: 42
```

- `UUID()`: Genera un identificador único universal (UUID) en formato hexadecimal.

```sql
SELECT UUID(); -- Genera un UUID único
-- Ejemplo de salida: 123e4567-e89b-12d3-a456-426614174000
```

- `CONCAT() con RAND()`: Generar datos aleatorios combinando valores.

```sql
SELECT CONCAT('Usuario', RAND()); -- Genera un nombre de usuario aleatorio
-- Ejemplo de salida: Usuario0.123456
```

- `SUBSTRING_INDEX(UUID(), '-', -1)`: Toma el UUID generado por UUID() y extrae la última parte, que es la parte aleatoria. Esto puede ser útil si necesitas solo la parte aleatoria de un UUID.

```sql
SELECT SUBSTRING_INDEX(UUID(), '-', -1); -- Extrae la parte aleatoria de un UUID
-- Ejemplo de salida: 426614174000
```

## Introducción 
Puedes declarar variables en SQL para almacenar valores temporales que se utilizan en tus consultas y procedimientos almacenados.

```sql
DECLARE @nombre_de_variable tipo_de_dato;
SET @nombre_de_variable = valor;
``` 

O asignar el valor a una o más variables como resultado de una consulta.

```sql
SELECT campo1, campo2, . . . INTO variable1, variable2, . . . 
FROM nombre_tabla WHERE . . .
```

- Condiciones (IF-ELSE): Los condicionales IF-ELSE se utilizan para ejecutar bloques de código dependiendo de una condición.

```sql
IF condición THEN
    sentencias;
ELSE
    sentencias; . . .
END IF;

IF condicion THEN
    sentencias;
[ELSEIF condicion2 THEN
    sentencias;] . . .
[ELSE 
    sentencias;]
END IF
```

- Case

```sql
CASE variable
    WHEN valor1 THEN
        sentencias;
    [WHEN valor2 THEN
        sentencias;] . . .
    [ELSE 
        sentencias;]
END CASE
 
CASE
    WHEN condicion THEN
        sentencias;
    [WHEN condicion2 THEN
        sentencias;] . . .
    [ELSE 
        sentencias;]
END CASE
```

- Loop: Los bucles LOOP no incoporan condición de salida, sino que debe ser implementada utilizando la instrucción LEAVE

```sql
[etiqueta_inicio:] LOOP
    sentencias;
END LOOP [etiqueta_fin]
LEAVE etiqueta;
```

- Iterate: Sólo puede aparecer en instrucciones de bucle ({LOOP, REPEAT y WHILE). Indica que el bucle debe volver a ejecutarse

```sql
ITERATE etiqueta;
Sentencia REPEAT
[etiqueta_inicio:] REPEAT
    sentencias;
UNTIL condicion
END REPEAT [etiqueta_fin]
Sentencia WHILE
[etiqueta_inicio:] WHILE condicion DO
    sentencias;
END WHILE [etiqueta_fin]
```

- Capturar errores: Puedes utilizar bloques TRY-CATCH para capturar y manejar errores.

```sql
BEGIN TRY
    -- Código que puede generar errores
END TRY
BEGIN CATCH
    -- Manejo de errores
END CATCH;
```


## 1. Cursores

En base de datos un Cursor es un mecanismo el cual nos permite procesar fila por fila el resultado de una consulta.

La estrucutura de los cursores es esta: 

- Crear un cursor a partir de una sentencia SQL.
    ```sql
    DECLARE nome_cursor CURSOR FOR 
      sentencia_SELECT;
    ```
- Apertura del cursor.
    ```sql
    OPEN nombre_cursor;
    ```
- Acceso a datos.
    ```sql
    FETCH nombre_cursor INTO variable1[,variable2,...];
    ```
- Cierre del cursor.
    ```sql
    CLOSE nombre_cursor;
    ```

Ejemplo:

1.-Crear un stored procedure el cual incremente en 10 el número de páginas de cada libro (tabla libros). En consola debemos visualizar el título, el anterior número de páginas y el actual número de páginas de cada libro.

```sql
DELIMITER //

DROP PROCEDURE IF EXISTS facilito_procedure//
CREATE PROCEDURE facilito_procedure()
BEGIN

  DECLARE var_id INTEGER;
  DECLARE var_paginas INTEGER;
  DECLARE var_titulo VARCHAR(255);
  DECLARE var_final INTEGER DEFAULT 0;

  DECLARE cursor1 CURSOR FOR SELECT libro_id, titulo, paginas FROM libros;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

  OPEN cursor1;

  bucle: LOOP

    FETCH cursor1 INTO var_id, var_titulo, var_paginas;

    IF var_final = 1 THEN
      LEAVE bucle;
    END IF;

    UPDATE libros SET paginas = var_paginas + 10 WHERE libro_id = var_id;

    SELECT
      var_titulo AS  'titulo',
      var_paginas AS 'Anterior',
      paginas AS 'Incremento'
      FROM libros WHERE libro_id = var_id;


  END LOOP bucle;
  CLOSE cursor1;

END//
DELIMITER ;
```

# 2. Funciones

Características de la función
Después de la definición del tipo de dato que devolverá la función con la palabra reservada RETURNS, tenemos que indicar las características de la función. Las opciones disponibles son las siguientes:

- DETERMINISTIC: Indica que la función siempre devuelve el mismo resultado cuando se utilizan los mismos parámetros de entrada.

- NOT DETERMINISTIC: Indica que la función no siempre devuelve el mismo resultado, aunque se utilicen los mismos parámetros de entrada. Esta es la opción que se selecciona por defecto cuando no se indica una característica de forma explícita.

- CONTAINS SQL: Indica que la función contiene sentencias SQL, pero no contiene sentencias de manipulación de datos. Algunos ejemplos de sentencias SQL que pueden aparecer en este caso son operaciones con variables (Ej: SET @x = 1) o uso de funciones de MySQL (Ej: SELECT NOW();) entre otras. Pero en ningún caso aparecerán sentencias de escritura o lectura de datos.

- NO SQL: Indica que la función no contiene sentencias SQL.

- READS SQL DATA: Indica que la función no modifica los datos de la base de datos y que contiene sentencias de lectura de datos, como la sentencia SELECT.

- MODIFIES SQL DATA: Indica que la función sí modifica los datos de la base de datos y que contiene sentencias como INSERT, UPDATE o DELETE.

Para poder crear una función en MySQL es necesario indicar al menos una de estas tres características:

- DETERMINISTIC
- NO SQL
- READS SQL DATA

Vamos a crear una función que acepte un dividendo y un divisor y haga una división sin usar el operador división:

```sql
delimiter // -- comienzo del delimitador
DROP FUNCTION IF EXISTS divide//
create function divide(dividendo int,divisor int) returns int
begin
    declare aux int; -- declaracion de la variable aux
    declare contador int;-- declaracion de la variable contador
    declare resto int; -- declaracion de la variable resto
    set contador = 0;
    set aux = 0;
    while (aux + divisor) <= dividendo do
        set aux = aux + divisor ;
        set contador = contador + 1;
    end while;
    set resto = dividendo - aux ;
    return contador;
end
// -- finalizacion del delimitador

select divide() -- para mostrar el resultado de la funcion
drop function if exists divide -- elimina la función
```

Se pueden usar variables

```sql
DELIMITER //

CREATE FUNCTION holaMundo() RETURNS VARCHAR(30)
BEGIN
  DECLARE salida VARCHAR(30) DEFAULT 'Hola mundo';
;
  SET salida = ‘Hola mundo con variables’;
  RETURN salida;
END
//
```

O parametros 

```sql
DELIMITER // -- se crea el delimitador
DROP FUNCTION IF EXISTS holaMundo//

CREATE FUNCTION holaMundo(entrada VARCHAR(20)) RETURNS VARCHAR(20)
BEGIN
  DECLARE salida VARCHAR(20);
  SET salida = entrada;
  RETURN salida;
END

//-- se cierra el delimitador
```

# 3. Procedimientos 

Un procedimiento almacenado es un conjunto de instrucciones SQL que se almacena asociado a una base de datos. Es un objeto que se crea con la sentencia CREATE PROCEDURE y se invoca con la sentencia CALL. Un procedimiento puede tener cero o muchos parámetros de entrada y cero o muchos parámetros de salida.

- Ejemplo con parametros de entrada

```sql
DELIMITER // -- comienzo del delimitador
CREATE PROCEDURE total_paises_nombrados_como
(IN palabra CHAR(20))
BEGIN
  SELECT COUNT(*) FROM pais
  WHERE nombre LIKE palabra;
END // -- fin del delimitador
```

- Ejemplo con CALL
```sql
DELIMITER // -- comienzo del delimitador
CREATE PROCEDURE total_paises_nombrados_como
(IN palabra CHAR(20))
BEGIN
  SELECT COUNT(*) FROM pais
  WHERE nombre LIKE palabra;
END // -- fin del delimitador


CALL total_paises_nombrados_como('españa');
/* devolvería el resultado de la consulta */
```

- Ejemplo con parametros de salida

- Utilizando SET

```sql
DELIMITER $$ -- comienzo del delimitador
DROP PROCEDURE IF EXISTS calcular_max_min_media$$
CREATE PROCEDURE calcular_max_min_media(
  IN gama VARCHAR(50),
    OUT maximo DECIMAL(15, 2),
        OUT minimo DECIMAL(15, 2),
            OUT media DECIMAL(15, 2)
)
BEGIN
  SET maximo = (
    SELECT MAX(precio_venta)
    FROM producto
        WHERE producto.gama = gama);
  
  SET minimo = (
    SELECT MIN(precio_venta)
    FROM producto
        WHERE producto.gama = gama);
  
  SET media = (
    SELECT AVG(precio_venta)
    FROM producto
        WHERE producto.gama = gama);
END
$$ -- fin del delimitador

DELIMITER ; -- comienzo del delimitador
CALL calcular_max_min_media('Herramientas', @maximo, @minimo, @media);
SELECT @maximo, @minimo, @media; -- fin del delimitador
```

- Utilizando SELECT ... INTO

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS contar_productos$$
CREATE PROCEDURE contar_productos(IN gama VARCHAR(50), OUT total INT UNSIGNED)
BEGIN
  SELECT COUNT(*) 
  INTO total -- almacenamos el valor del count en la variables total
  FROM producto 
  WHERE producto.gama = gama;
END
$$ -- fin del delimitador

DELIMITER ; -- comienzo del delimitador
CALL contar_productos('Herramientas', @total);
SELECT @total; -- fin del delimitador
```

- Recursividad
```sql
SET @@session.max_sp_recursion_depth = 10; 
```

## 4.Triggers

Un trigger o disparador es una regla que se asocia a una tabla. Mediante esta regla, se ejecutan una serie de instrucciones cuando se producen ciertos eventos sobre una tabla. Los eventos son: INSERT, UPDATE o DELETE.

Con la ayuda de los triggers en MySQL podemos conseguir automatizar acciones sin necesidad de desarrollar lógica en otros lenguajes.

Podemos usar dos tipos de variables: 

Variable NEW
NEW almacena el valor que aporta la consulta a la base de datos. Con esta variable podemos acceder a los datos introducidos. Con NEW.nombre_columna se almacenará la información con el nuevo valor que tendrá ese registro modificado (desde un UPDATE o INSERT) en la tabla. Los trigger relacionados con DELETE no tendrán disponible la variable NEW.

Variable OLD
OLD a diferencia de NEW, almacena el valor de las columnas que van a ser borradas o eliminadas. Al igual que pasa con NEW, OLD no está disponible en todas las instrucciones, más concretamente el valor no se puede recuperar cuando la instrucción es un INSERT.

```sql
CREATE TRIGGER actor_trigger_ai AFTER INSERT ON actor
 BEGIN
  UPDATE actor SET last_update = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER actor_trigger_au AFTER UPDATE ON actor
 BEGIN
  UPDATE actor SET last_update = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
``` 

## 5. Index y Vistas

- __Índices__:
    - __Crear un índice (Forma 1)__: `CREATE [FULLTEXT|UNIQUE|PRIMARY] INDEX index_name ON table_name(column1, ..., columnN);`
    ```sql
    CREATE INDEX idx_username ON users(username);
    ```
    - __Crear un índice (Forma 2)__: `ALTER TABLE table_name ADD INDEX index_name (column1, ..., columnN);`
    ```sql
    ALTER TABLE users ADD INDEX idx_username (username);
    ```
    - __Ver índices de una tabla__: `SHOW INDEX FROM table_name;` o `DESCRIBE table_name;`
    ```sql
    SHOW INDEX FROM users;
    DESCRIBE users;
    ```
    - __Eliminar un índice (Forma 1)__: `DROP INDEX index_name ON table_name;`
    ```sql
    DROP INDEX idx_username ON users;
    ```
    - __Eliminar un índice (Forma 2)__: `ALTER TABLE table_name DROP INDEX index_name;`
    ```sql
    ALTER TABLE users DROP INDEX idx_username;
    ```

- __Vistas__:
    - __Crear una vista__: `CREATE VIEW view_name AS SELECT ...;`
    ```sql
    CREATE VIEW tickets AS
    (SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
    FROM venta v
    JOIN empleado e
    ON v.id_empleado = e.id_empleado
    JOIN articulo a
    ON v.id_articulo = a.id_articulo);
    ```
    - __Eliminar una vista__: `DROP VIEW IF EXISTS view_name;`
    ```sql
    DROP VIEW IF EXISTS tickets;
    ```

- __Otros relacionados__:
    - __Analizar tabla__: `ANALYZE TABLE table_name;`
    - __Optimizar tabla__: `OPTIMIZE TABLE table_name;`

- __Explain__:
```sql
EXPLAIN SELECT * FROM cliente;

+----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | cliente | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   36 |   100.00 | NULL  |
+----+-------------+-
```

# 6. Ejercicios

## Ejercicio 1: Creación de Base de Datos y Tablas
1. Crea una base de datos llamada `donacion`.

```sql
sudo mysql -u root -p
CREATE DATABASE donacion;
use donacion
```


2. Crea una tabla llamada `persona` con los siguientes campos:
   - Identificador Auto Incremental (`id`) - Integer, PK.
   - Identificador (`identificador`) - Texto.
   - Peso (`peso`) - Entero.
   - Admitido (`admitido`) - Texto (`Si`/`No`).
   - Sexo (`sexo`) - Texto (`H`/`M`).
  
  
```sql
CREATE TABLE persona(
    id int primary key auto_increment,
    identificador VARCHAR(30) NOT NULL,
    peso int NOT NULL,
    admitido ENUM('Si', 'No') NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    fecha DATE NOT NULL
);
```

## Ejercicio 2: Procedimientos Almacenados
1. Crea un procedimiento llamado `insertar_datos` que inserte datos aleatorios en la tabla `persona`. El procedimiento debe recibir como parámetro de entrada el número de registros que se desea insertar.

```sql
DROP PROCEDURE IF EXISTS insertar_datos;
DELIMITER //
CREATE PROCEDURE insertar_datos(in iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_id VARCHAR(30);
    DECLARE p_peso int;
    DECLARE p_admitido ENUM('Si', 'No');
    DECLARE p_sexo ENUM('H', 'M');
    DECLARE aux INT;
    WHILE counter < iterations DO
    SET p_id = SUBSTRING(UUID(), 1, 8);
    SET p_peso = FLOOR(RAND()* 130 - 40 + 1) + 40;
    SET aux = FLOOR(RAND() * 2);
    SET p_admitido = IF(aux = 0, 'Si', 'No');
    SET aux = floor(RAND() * 2);
    SET p_sexo = IF(aux = 0, 'H', 'M');

    INSERT INTO persona(identificador, peso, admitido, sexo, fecha) VALUES (p_id, p_peso, p_admitido, p_sexo, CURDATE());
    SET counter = counter + 1;
    end while;
END //
DELIMITER ;

CALL insertar_datos(20);

mysql> select * from persona;
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 39adc615      |   85 | Si       | H    | 2024-05-29 |
|  2 | 39b85fdf      |   36 | Si       | M    | 2024-05-29 |
|  3 | 39b904e9      |   44 | Si       | H    | 2024-05-29 |
|  4 | 39b97a62      |   51 | No       | H    | 2024-05-29 |
|  5 | 39b9cc47      |  123 | Si       | H    | 2024-05-29 |
|  6 | 39bc8c8e      |   95 | Si       | H    | 2024-05-29 |
|  7 | 39bdc5a6      |   11 | No       | M    | 2024-05-29 |
|  8 | 39be3da4      |  118 | Si       | M    | 2024-05-29 |
|  9 | 39beaa07      |  106 | No       | M    | 2024-05-29 |
| 10 | 39bef447      |   44 | Si       | M    | 2024-05-29 |
| 11 | 39c01767      |   97 | Si       | M    | 2024-05-29 |
| 12 | 39c2e76f      |   49 | Si       | H    | 2024-05-29 |
| 13 | 39cc6507      |   92 | No       | M    | 2024-05-29 |
| 14 | 39ccb2e7      |   40 | No       | M    | 2024-05-29 |
| 15 | 39cd08ae      |   64 | No       | M    | 2024-05-29 |
| 16 | 39cee628      |   92 | No       | M    | 2024-05-29 |
| 17 | 39d0dd9d      |    4 | Si       | M    | 2024-05-29 |
| 18 | 39d13e1a      |   27 | Si       | M    | 2024-05-29 |
| 19 | 39d18b8e      |   69 | No       | M    | 2024-05-29 |
| 20 | 39d1eba7      |   74 | Si       | H    | 2024-05-29 |
+----+---------------+------+----------+------+------------+
20 rows in set (0.01 sec)

```

2. Crea un procedimiento llamado `actualizar_fecha` que permita actualizar la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona y una fecha.

```sql
DROP PROCEDURE IF EXISTS actualizar_fecha;
DELIMITER //
CREATE PROCEDURE actualizar_fecha(in input_id INT, in input_fecha DATE)
BEGIN
    UPDATE persona set fecha = input_fecha where id = input_id;
END //
DELIMITER ;


call actualizar_fecha(2, '2024-03-17');

mysql> select * from persona where id = 2;
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  2 | 39b85fdf      |   36 | Si       | M    | 2024-03-17 |
+----+---------------+------+----------+------+------------+
1 row in set (0.00 sec)

```

3. Crea un procedimiento llamado `CalcularTotalDonaciones` que calcule la cantidad total de donaciones realizadas por cada persona y la almacene en una tabla llamada `total_donaciones`. La tabla `total_donaciones` debe tener dos columnas: `id_persona` (texto) y `cantidad_total` (integer).

```sql
DROP PROCEDURE IF EXISTS CalcularTotalDonaciones;
DELIMITER //
CREATE PROCEDURE CalcularTotalDonaciones()
BEGIN
    DROP TABLE IF EXISTS total_donaciones;
    CREATE TABLE total_donaciones(
        id_persona INT,
        cantidad_total INT
    );
    INSERT INTO total_donaciones (id_persona, cantidad_total)
    SELECT id, count(*) from persona group by id;
END //
DELIMITER ;


call CalcularTotalDonaciones();

mysql> select * from total_donaciones;
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
|          1 |              1 |
|          2 |              1 |
|          3 |              1 |
|          4 |              1 |
|          5 |              1 |
|          6 |              1 |
|          7 |              1 |
|          8 |              1 |
|          9 |              1 |
|         10 |              1 |
|         11 |              1 |
|         12 |              1 |
|         13 |              1 |
|         14 |              1 |
|         15 |              1 |
|         16 |              1 |
|         17 |              1 |
|         18 |              1 |
|         19 |              1 |
|         20 |              1 |
+------------+----------------+
20 rows in set (0.00 sec)
```

4. Crea un procedimiento llamado `eliminar_persona` que permita eliminar una persona de la tabla `total_donaciones`.

```sql
DROP PROCEDURE IF EXISTS eliminar_persona;
DELIMITER //
CREATE PROCEDURE eliminar_persona(in input_id INT)
BEGIN
    DELETE FROM total_donaciones where id_persona = input_id;
END //
DELIMITER ;


call eliminar_persona(17);


mysql> select * from total_donaciones;
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
|          1 |              1 |
|          2 |              1 |
|          3 |              1 |
|          4 |              1 |
|          5 |              1 |
|          6 |              1 |
|          7 |              1 |
|          8 |              1 |
|          9 |              1 |
|         10 |              1 |
|         11 |              1 |
|         12 |              1 |
|         13 |              1 |
|         14 |              1 |
|         15 |              1 |
|         16 |              1 |
|         18 |              1 |
|         19 |              1 |
|         20 |              1 |
+------------+----------------+
19 rows in set (0.00 sec)
```

## Ejercicio 3: Funciones Almacenadas
1. Crea una función llamada `posible_donador` que determine si una persona almacenada en la tabla `persona` puede realizar una donación. La función debe recibir como parámetro de entrada el identificador de esta persona y una fecha de donación. Si la persona cumple con los requisitos, actualiza la fecha de última donación y retorna `TRUE`; de lo contrario, retorna `FALSE`.

```sql

DROP FUNCTION IF EXISTS posible_donador;
DELIMITER //
CREATE FUNCTION posible_donador(input_id int, input_fecha DATE)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE p_sexo ENUM('H','M');
    DECLARE p_admitido ENUM('Si','No');
    DECLARE dias INT;
    DECLARE p_fecha DATE;

    SELECT admitido, sexo, fecha INTO p_admitido, p_sexo, p_fecha from persona where id = input_id;

    IF p_admitido = 'No' THEN
        RETURN FALSE;
    END IF;

    SET dias = DATEDIFF(input_fecha, p_fecha);
    IF (p_sexo = 'H' AND dias < 90) OR (p_sexo = 'M' AND dias < 120) THEN
        RETURN FALSE;
    END IF;

    UPDATE persona SET fecha = input_fecha where id = input_id;
    RETURN TRUE;

END//
DELIMITER ;

--0 representa False, no puede donar
mysql> SELECT posible_donador(5, '2024-06-04');
+----------------------------------+
| posible_donador(5, '2024-06-04') |
+----------------------------------+
|                                0 |
+----------------------------------+
1 row in set (0.35 sec)

--1 representa True, que puede donar
mysql> select posible_donador(6, '2024-12-24');
+----------------------------------+
| posible_donador(6, '2024-12-24') |
+----------------------------------+
|                                1 |
+----------------------------------+
1 row in set (1.81 sec)
```

2. Crea una función llamada `maximo_donador` que determine qué persona es la que más donaciones ha realizado.


```sql

DROP FUNCTION IF EXISTS maximo_donador;
DELIMITER //
CREATE FUNCTION maximo_donador()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE p_id INT;
    SELECT id_persona INTO p_id FROM total_donaciones ORDER BY cantidad_total DESC LIMIT 1;
    RETURN p_id;
END //
DELIMITER ;


SELECT maximo_donador();


mysql> SELECT maximo_donador();
+------------------+
| maximo_donador() |
+------------------+
|                1 |
+------------------+
1 row in set (0.01 sec)
```


## Ejercicio 4: Triggers
1. Crea un trigger que actualice la tabla `total_donaciones` cada vez que se inserte un nuevo registro en la tabla `persona`.

```sql
DROP TRIGGER IF EXISTS actualizar_total_donaciones;
DELIMITER //
CREATE TRIGGER actualizar_total_donaciones
AFTER INSERT ON persona
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM total_donaciones WHERE id_persona = NEW.id) THEN
        UPDATE total_donaciones
        SET cantidad_total = cantidad_total + 1
        WHERE id_persona = NEW.id;
    ELSE
        INSERT INTO total_donaciones (id_persona, cantidad_total)
        VALUES (NEW.id, 1);
    END IF;
END //
DELIMITER ;

mysql> call insertar_datos(2);
Query OK, 1 row affected (0.02 sec)

mysql> select * from total_donaciones;
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
|          1 |              1 |
|          2 |              1 |
|          3 |              1 |
|          4 |              1 |
|          5 |              1 |
|          6 |              1 |
|          7 |              1 |
|          8 |              1 |
|          9 |              1 |
|         10 |              1 |
|         11 |              1 |
|         12 |              1 |
|         13 |              1 |
|         14 |              1 |
|         15 |              1 |
|         16 |              1 |
|         18 |              1 |
|         19 |              1 |
|         20 |              1 |
|         24 |              1 |
|         25 |              1 |
+------------+----------------+
21 rows in set (0.00 sec)
```

2. Crea un trigger que elimine todos los registros en la tabla `persona` cuando se elimine un registro de la tabla `total_donaciones`.

```sql
DROP TRIGGER IF EXISTS actualiza_donaciones;
DELIMITER //
CREATE TRIGGER actualiza_donaciones
AFTER DELETE ON total_donaciones
FOR EACH ROW
BEGIN
    DELETE FROM persona WHERE id = OLD.id_persona;
END //
DELIMITER ;



mysql> delete from total_donaciones where id_persona = 8;
Query OK, 1 row affected (0.01 sec)

mysql> select * from persona;
--se ha borrado también de la tabla persona los registros con id 8
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 39adc615      |   85 | Si       | H    | 2024-05-29 |
|  2 | 39b85fdf      |   36 | Si       | M    | 2024-03-17 |
|  3 | 39b904e9      |   44 | Si       | H    | 2024-05-29 |
|  4 | 39b97a62      |   51 | No       | H    | 2024-05-29 |
|  5 | 39b9cc47      |  123 | Si       | H    | 2024-05-29 |
|  6 | 39bc8c8e      |   95 | Si       | H    | 2024-12-24 |
|  7 | 39bdc5a6      |   11 | No       | M    | 2024-05-29 |
|  9 | 39beaa07      |  106 | No       | M    | 2024-05-29 |
| 10 | 39bef447      |   44 | Si       | M    | 2024-05-29 |
| 11 | 39c01767      |   97 | Si       | M    | 2024-05-29 |
| 12 | 39c2e76f      |   49 | Si       | H    | 2024-05-29 |
| 13 | 39cc6507      |   92 | No       | M    | 2024-05-29 |
| 14 | 39ccb2e7      |   40 | No       | M    | 2024-05-29 |
| 15 | 39cd08ae      |   64 | No       | M    | 2024-05-29 |
| 16 | 39cee628      |   92 | No       | M    | 2024-05-29 |
| 17 | 39d0dd9d      |    4 | Si       | M    | 2024-05-29 |
| 18 | 39d13e1a      |   27 | Si       | M    | 2024-05-29 |
| 19 | 39d18b8e      |   69 | No       | M    | 2024-05-29 |
| 20 | 39d1eba7      |   74 | Si       | H    | 2024-05-29 |
| 21 | d1226a90      |   38 | Si       | H    | 2024-05-29 |
| 22 | d1232201      |  113 | No       | H    | 2024-05-29 |
| 23 | d1237a4b      |   46 | No       | M    | 2024-05-29 |
| 24 | 41bc1691      |   95 | No       | H    | 2024-05-29 |
| 25 | 41becad0      |  107 | Si       | H    | 2024-05-29 |
+----+---------------+------+----------+------+------------+
24 rows in set (0.00 sec)

```

-- Realiza las siguientes vistas (Crea, muestra,consulta, y elimmina cada una de ellas)

	-- 1. Crea una vista que devuelva los clientes cuyo apellido incluya la sílaba “le” ordenados por su identificador.
```sql
CREATE VIEW apellido_le as 
select * from Cliente where primerApellido regexp 'le' order by idCLiente;

mysql> select * from apellido_le;

+-----------+---------+--------+----------------+-----------------+----------------------+-----------+---------------+
| idCliente | pais    | nombre | primerApellido | segundoApellido | direccion            | telefono  | observaciones |
+-----------+---------+--------+----------------+-----------------+----------------------+-----------+---------------+
| 12345     | España  | Felipe | Iglesias       | López           | Avda Los Castros, 44 | 942344444 | Buen cliente  |
+-----------+---------+--------+----------------+-----------------+----------------------+-----------+---------------+

DROP VIEW apellido_le;
Query OK, 0 rows affected (0,02 sec)
```

	-- 2. Crea una vista que devuelva los clientes, ordenados por su primer apellido, que tengan alguna observación anotada.
```sql
CREATE VIEW clientes_observacion as
select * from Cliente where observaciones is not NULL order by primerApellido;

mysql> select * from clientes_observacion;
+-----------+----------+--------+----------------+-----------------+----------------------+-----------+------------------+
| idCliente | pais     | nombre | primerApellido | segundoApellido | direccion            | telefono  | observaciones    |
+-----------+----------+--------+----------------+-----------------+----------------------+-----------+------------------+
| 12345     | España   | Felipe | Iglesias       | López           | Avda Los Castros, 44 | 942344444 | Buen cliente     |
| 43215     | Alemania | Hans   | Schmidt        | Müller          | Hauptstrasse 123     | 65890234  | Cliente exigente |
+-----------+----------+--------+----------------+-----------------+----------------------+-----------+------------------+

DROP VIEW cliente_observacion;
Query OK, 0 rows affected (0,02 sec)
```
	-- 3. Crea una vista que devuelva los servicios cuyo precio supere los 5€ ordenados por su código de servicio.
```sql
CREATE VIEW precio_mayor_5 as
select * from Servicio where precio > 5 order by idServicio;

mysql> select * from precio_mayor_5;
+------------+----------------+-----------------+--------+------+------------+
| idServicio | nombreServicio | descripcion     | precio | iva  | fecha      |
+------------+----------------+-----------------+--------+------+------------+
|          1 | Comedor        | 1 menu del día  |  10.00 | 7.00 | 2023-01-01 |
+------------+----------------+-----------------+--------+------+------------+

mysql> drop view precio_mayor_5;
Query OK, 0 rows affected (0,02 sec)
```

	-- 4. Crea una vista que devuelva los clientes que han utilizado el servicio de comedor.
```sql
CREATE VIEW cliente_comedor as 
select distinct(c.idCliente), nombre, primerApellido from Cliente as c join ReservaHabitac as rh on c.idCliente=rh.cliente join Gasto as g on rh.idReserva=g.idReserva join Servicio as s on s.idServicio=g.idServicio where s.nombreServicio ='Comedor';
mysql> select * from cliente_comedor;
+-----------+--------+----------------+
| idCliente | nombre | primerApellido |
+-----------+--------+----------------+
| 12345     | Felipe | Iglesias       |
+-----------+--------+----------------+


mysql> drop view cliente_comedor;
Query OK, 0 rows affected (0,02 sec)
```

	-- 5. Crea una vista que devuelva las características de cada habitación reservada.
```sql
CREATE VIEW carac_habitac as 
select rh.numHabitacion, th.categoria, th.camas, th.exterior, th.terraza, th.salon from TipoHabitacion as th join Habitacion as h on th.categoria=h.tipoHabitacion join ReservaHabitac as rh on rh.numHabitacion=h.numHabitacion;
mysql> select * from carac_habitac;
+---------------+-----------+-------+----------+---------+-------+
| numHabitacion | categoria | camas | exterior | terraza | salon |
+---------------+-----------+-------+----------+---------+-------+
|           101 |         1 |     1 | Si       | No      | No    |
|           102 |         1 |     1 | Si       | No      | No    |
|           103 |         1 |     1 | Si       | No      | No    |
|           104 |         2 |     2 | Si       | No      | No    |
|           105 |         2 |     2 | Si       | No      | No    |
|           106 |         3 |     3 | Si       | No      | No    |
|           107 |         4 |     1 | Si       | No      | Si    |
+---------------+-----------+-------+----------+---------+-------+
drop view carac_habitac;
```

	-- 6. Crea una vista con los servicios que nunca han sido contratados.
```sql
CREATE VIEW servicio_no_usado as
select idServicio, nombreServicio from Servicio where idServicio not in (select idServicio from Gasto);

mysql> select * from servicio_no_usado;
+------------+----------------+
| idServicio | nombreServicio |
+------------+----------------+
|          3 | Lavandería     |
+------------+----------------+

drop view servicio_no_usado;
```

	-- 7. Crea una vista que devuelva el nº de clientes por nacionalidad.
```sql
Create view clientes_nacio as
select count(idCliente), pais from Cliente group by pais;

select * from clientes_nacio;
+------------------+----------+
| count(idCliente) | pais     |
+------------------+----------+
|                1 | Alemania |
|                2 | España   |
|                1 | Francia  |
|                1 | Italia   |
+------------------+----------+

drop view clientes_nacio;
```

	-- 8. Crea una vista que devuelva el nº de habitaciones por categoría de habitación.
```sql
CREATE VIEW 
select count(tipoHabitacion), numHabitacion from Habitacion group by tipoHabitacion;
```
	-- 9. Crea una vista que devuelva el nº de servicios que se ofrecen por tipo de servicio.
select count
	-- 10. Crear una vista que muestre todos los datos del cliente excepto las observaciones.
	-- 11. Crear una vista que muestre el id, nombre y primer apellido de todos los clientes y el gasto total que han realizado en el hotel en sus diferentes estancias.

-- Realiza las siguientes índices (Crea cada uno de los indices, y analiza el coportamiento antes de crear el indice con las consultas que se proponen)

	-- 1. Crea un índice sobre el atributo pais de la tabla cliente, con objeto de agilizar las búsquedas.
	-- Consulta de análisis: SELECT * FROM Cliente WHERE pais = 'España';
```sql
create index idx_pais on Cliente(pais);

mysql> explain SELECT * FROM Cliente WHERE pais = 'España';
+----+-------------+---------+------------+------+---------------+----------+---------+-------+------+----------+-----------------------+
| id | select_type | table   | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra                 |
+----+-------------+---------+------------+------+---------------+----------+---------+-------+------+----------+-----------------------+
|  1 | SIMPLE      | Cliente | NULL       | ref  | idx_pais      | idx_pais | 80      | const |    2 |   100.00 | Using index condition |
+----+-------------+---------+------------+------+---------------+----------+---------+-------+------+----------+-----------------------+
```

-- A partir del índice recorre las filas y busca el indicado haciendo la consulta mucho más eficiente.

	-- 2. Crea un índice sobre el atributo numHabitacion de la tabla ReservaHabitac, con objeto de agilizar las búsquedas.
	-- Consulta de análisis: SELECT * FROM ReservaHabitac WHERE numHabitacion = 101;
```sql
--Antes del índice:
+----+-------------+----------------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key           | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+---------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | ReservaHabitac | NULL       | ref  | numHabitacion | numHabitacion | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+---------------+---------+-------+------+----------+-------+

-- COn el índice:
CREATE INDEX idx_numHabitac on ReservaHabitac(numHabitacion);
mysql> explain SELECT * FROM ReservaHabitac WHERE numHabitacion = 101;
+----+-------------+----------------+------------+------+----------------+----------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys  | key            | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+----------------+----------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | ReservaHabitac | NULL       | ref  | idx_numHabitac | idx_numHabitac | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+----------------+----------------+---------+-------+------+----------+-------+
```

--ahora se basa en el índice para encontrar el número de la habitación

	-- 3. Crea un índice sobre el atributo nombreServicio de la tabla Servicio, con objeto de agilizar las búsquedas.
CREATE INDEX idx_nombreServicio on Servicio(nombreServicio);
--utilizando el índice no debe recorrer todas las filas para encontrarlo, sino que se basa en el índice.
```sql
mysql> explain SELECT * FROM Servicio WHERE nombreServicio = 'Comedor';
+----+-------------+----------+------------+------+--------------------+--------------------+---------+-------+------+----------+-----------------------+
| id | select_type | table    | partitions | type | possible_keys      | key                | key_len | ref   | rows | filtered | Extra                 |
+----+-------------+----------+------------+------+--------------------+--------------------+---------+-------+------+----------+-----------------------+
|  1 | SIMPLE      | Servicio | NULL       | ref  | idx_nombreServicio | idx_nombreServicio | 40      | const |    1 |   100.00 | Using index condition |
+----+-------------+----------+------------+------+--------------------+--------------------+---------+-------+------+----------+-----------------------+
```


	-- Consulta de análisis: SELECT * FROM Servicio WHERE nombreServicio = 'Comedor';
	-- Nota: Utiliza el comando apropiado para verificar el comportamiento

-- 1. Crea un procedimiento que permita añadir datos aleatorios, en la tabla productos o clientes.
```sql
DROP PROCEDURE IF EXISTS insertar_producto;
DELIMITER //
CREATE PROCEDURE insertar_producto(in iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_nombre VARCHAR(100);
    DECLARE p_precio DECIMAL(10, 2);
    DECLARE p_stock INT;

    WHILE counter < iterations DO
    SET p_nombre = CONCAT('Product', ROUND(RAND() * 1000000));
    SET p_precio = ROUND(RAND() * (1000 - 10) + 10, 2); 
    SET p_stock = FLOOR(RAND() * (100 - 10 + 1)) + 1;

        INSERT INTO productos(nombre, precio, stock) VALUES (p_nombre, p_precio, p_stock);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```


mysql> call insertar_producto(15);
Query OK, 1 row affected (0,20 sec)

mysql> select * from productos;
+----+---------------+--------+-------+
| id | nombre        | precio | stock |
+----+---------------+--------+-------+
|  1 | Product678592 | 807.74 |    91 |
|  2 | Product548664 | 766.05 |    16 |
|  3 | Product571149 | 345.04 |    90 |
|  4 | Product878024 | 459.61 |    58 |
|  5 | Product820892 | 202.51 |    47 |
|  6 | Product964685 | 301.65 |    53 |
|  7 | Product10757  | 323.89 |    51 |
|  8 | Product814044 | 416.97 |    56 |
|  9 | Product833105 | 332.46 |    12 |
| 10 | Product669170 | 958.48 |    72 |
| 11 | Product39785  | 852.04 |    13 |
| 12 | Product115181 | 184.06 |    49 |
| 13 | Product140325 | 109.94 |     8 |
| 14 | Product116113 | 335.89 |    28 |
| 15 | Product500277 | 612.61 |    50 |
+----+---------------+--------+-------+
15 rows in set (0,00 sec)


--2. Crea un procedimiento que permita actualizar el número de elementos  de un producto, teniendo como parámetros de entrada el id del producto,  y la cantidad de elementos a restar del producto.
```sql
DROP PROCEDURE IF EXISTS actualizar_stock;
DELIMITER //
CREATE PROCEDURE actualizar_stock(in input_codigo VARCHAR(30), in input_stock INT)
BEGIN
    UPDATE productos set stock = stock - input_stock where id = input_codigo;
END //
DELIMITER ;
```

mysql> call actualizar_stock(3, 10);
Query OK, 1 row affected (0,01 sec)

mysql> select * from productos where id = 3;

-- el stock que antes era 90, es ahora 80.
+----+---------------+--------+-------+
| id | nombre        | precio | stock |
+----+---------------+--------+-------+
|  3 | Product571149 | 345.04 |    80 |
+----+---------------+--------+-------+
1 row in set (0,00 sec)


-- 3. Crea un trigger que actualice la tabla de productos cuando se realice una venta, restando de un producto (id_producto) el número de elementos que se debe de restar (cantidad).
```sql
DROP TRIGGER IF EXISTS disminuir_stock;
DELIMITER //
CREATE TRIGGER disminuir_stock
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    UPDATE productos SET stock = stock - NEW.cantidad WHERE id = id;
END //
DELIMITER ;



--  Se comprueba la cantidad actual de stock antes de la venta
mysql> SELECT * FROM productos where id = 1;
+----+---------------+--------+-------+
| id | nombre        | precio | stock |
+----+---------------+--------+-------+
|  1 | Product678592 | 807.74 |    91 |
+----+---------------+--------+-------+
1 row in set (0,00 sec)


INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha) VALUES (1, 1, 50, '2024-05-13');
--se ha restado al stock los 50 productos que se han vendido.

mysql> SELECT * FROM productos where id = 1;
+----+---------------+--------+-------+
| id | nombre        | precio | stock |
+----+---------------+--------+-------+
|  1 | Product678592 | 807.74 |    41 |
+----+---------------+--------+-------+
1 row in set (0,00 sec)
```

-- 4. Crea una función que calcule el total de las ventas de un cliente.
```sql
DROP FUNCTION IF EXISTS total_ventas;
DELIMITER //
CREATE FUNCTION total_ventas(input_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_ventas INT;
    SELECT count(*) from ventas where cliente_id = input_id into total_ventas;
    RETURN total_ventas;
END //
DELIMITER ;

--veo que el cliente con id 1 aparece 2 veces en la tabla de ventas
mysql> select * from ventas;
+----+------------+-------------+----------+------------+
| id | cliente_id | producto_id | cantidad | fecha      |
+----+------------+-------------+----------+------------+
|  4 |          1 |           1 |        2 | 2024-05-01 |
|  5 |          2 |           2 |        1 | 2024-05-02 |
|  6 |          3 |           3 |        1 | 2024-05-03 |
|  7 |          1 |           1 |       50 | 2024-05-13 |
+----+------------+-------------+----------+------------+
4 rows in set (0,00 sec)

--Llamo a la función, y efectivamente, son 2

mysql> select total_ventas(1);
+-----------------+
| total_ventas(1) |
+-----------------+
|               2 |
+-----------------+
1 row in set (0,01 sec)
```

-- 5. Crea una función que calcule la cantidad de productos en stock de un producto (producto_id).
```sql
DROP FUNCTION IF EXISTS total_cantidad;
DELIMITER //
CREATE FUNCTION total_cantidad(input_producto_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_cantidad INT;
    SELECT stock from productos where id = input_producto_id into total_cantidad;
    RETURN total_cantidad;
END //
DELIMITER ;
```
--compruebo la cantidad total de productos
mysql> select * from productos where id = 8;
+----+---------------+--------+-------+
| id | nombre        | precio | stock |
+----+---------------+--------+-------+
|  8 | Product814044 | 416.97 |     6 |
+----+---------------+--------+-------+
1 row in set (0,00 sec)

--llamo a la función
mysql> select total_cantidad(8);
+-------------------+
| total_cantidad(8) |
+-------------------+
|                 6 |
+-------------------+
1 row in set (0,00 sec)




## Consideraciones adicionales
- Asegúrate de probar cada uno de los procedimientos, funciones y triggers con ejemplos prácticos.

- Verifica que los datos se inserten, actualicen y eliminen correctamente en las tablas correspondientes.
- Mantén la integridad de los datos en todas las operaciones.



