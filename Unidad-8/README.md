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


## Cursores

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

# Funciones

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

# Procedimientos 

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

## Triggers

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