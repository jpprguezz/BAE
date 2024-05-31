# Apuntes para examen

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

## 4. Triggers

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

# 5. Ejercicios

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

## Consideraciones adicionales
- Asegúrate de probar cada uno de los procedimientos, funciones y triggers con ejemplos prácticos.

- Verifica que los datos se inserten, actualicen y eliminen correctamente en las tablas correspondientes.
- Mantén la integridad de los datos en todas las operaciones.
