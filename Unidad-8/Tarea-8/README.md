# Tarea 8

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

```sql
create database test;
```

Tabla alumnos:
- id (entero sin signo)
- nombre (cadena de caracteres)
- apellido1 (cadena de caracteres)
- apellido2 (cadena de caracteres)
- nota (número real)

```sql
CREATE TABLE alumnos(
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100), 
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    nota DECIMAL (4, 2)
);
```

Crea los siguientes triggers:

Trigger1:trigger_check_nota_before_insert.
- Se ejecuta sobre la tabla alumnos.
- Se ejecuta antes de una operación de inserción.
- Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
- Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.

```sql
DELIMITER //
CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
IF NEW.nota < 0 THEN
    SET NEW.nota = 0;
END IF;
IF NEW.nota > 10 THEN
    SET NEW.nota = 10;
END IF;
END//
DELIMITER;
```

Trigger2 : trigger_check_nota_before_update.
- Se ejecuta sobre la tabla alumnos.
- Se ejecuta antes de una operación de actualización.
- Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
- Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.

```sql
DELIMITER //
CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
IF NEW.nota < 0 THEN
    SET NEW.nota = 0;
END IF;
IF NEW.nota > 10 THEN
    SET NEW.nota = 10;
END IF;
END//
DELIMITER;
```

Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

Crea el siguiente procedimiento:

- Procedimiento1:
    - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre 3, y 10.

    - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.

Realiza los procedimientos y verifica el comportamiento llamando a este con los parámetros adecuados.

```sql
DELIMITER //

CREATE PROCEDURE insercion_alumnos(IN iterations INT)
BEGIN
    
    DECLARE counter INT DEFAULT 0;
    DECLARE rand_id INTEGER;
    DECLARE rand_nombre VARCHAR(100);
    DECLARE rand_apellido1 VARCHAR(100);
    DECLARE rand_apellido2 VARCHAR(100);
    DECLARE rand_nota DECIMAL(4, 2);

    WHILE counter < iterations DO
        SET rand_id = (RAND() * 2000) + counter;
        SET rand_nombre = CONCAT('alumno', counter);
        SET rand_apellido1 = CONCAT('apellido1', counter);
        SET rand_apellido2 = CONCAT('apellido2', counter);
        SET rand_nota = ROUND(RAND() * (10 - 3) + 3, 1);

        INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota) 
        VALUES (rand_id, rand_nombre, rand_apellido1, rand_apellido2, rand_nota);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call insercion_alumnos(10);

+------+---------+------------+------------+------+
| id   | nombre  | apellido1  | apellido2  | nota |
+------+---------+------------+------------+------+
|  272 | alumno7 | apellido17 | apellido27 | 4.80 |
|  738 | alumno9 | apellido19 | apellido29 | 3.20 |
| 1367 | alumno5 | apellido15 | apellido25 | 3.00 |
| 1413 | alumno2 | apellido12 | apellido22 | 7.10 |
| 1467 | alumno1 | apellido11 | apellido21 | 9.90 |
| 1619 | alumno3 | apellido13 | apellido23 | 5.00 |
| 1751 | alumno8 | apellido18 | apellido28 | 7.20 |
| 1827 | alumno0 | apellido10 | apellido20 | 9.30 |
| 1928 | alumno6 | apellido16 | apellido26 | 8.60 |
| 1999 | alumno4 | apellido14 | apellido24 | 3.90 |
+------+---------+------------+------------+------+
```

```sql
DELIMITER //

CREATE PROCEDURE insercion_alumnos_2(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE rand_id INTEGER;
    DECLARE rand_nombre VARCHAR(100);
    DECLARE rand_apellido1 VARCHAR(100);
    DECLARE rand_apellido2 VARCHAR(100);
    DECLARE rand_nota DECIMAL(4, 2);

    WHILE counter < iterations DO
        SET rand_id = (RAND() * 2000) + counter;
        SET rand_nombre = CONCAT('alumno', counter);
        SET rand_apellido1 = CONCAT('apellido1', counter);
        SET rand_apellido2 = CONCAT('apellido2', counter);
        SET rand_nota = ROUND((RAND() * (12 - (-10)) + (-10)), 1);

        INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota) 
        VALUES (rand_id, rand_nombre, rand_apellido1, rand_apellido2, rand_nota);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call insercion_alumnos_2(10);

+------+---------+------------+------------+------+
| id   | nombre  | apellido1  | apellido2  | nota |
+------+---------+------------+------------+------+
|  143 | alumno0 | apellido10 | apellido20 | 0.00 |
|  153 | alumno5 | apellido15 | apellido25 | 6.30 |
|  232 | alumno1 | apellido11 | apellido21 | 0.00 |
|  272 | alumno7 | apellido17 | apellido27 | 4.80 |
|  738 | alumno9 | apellido19 | apellido29 | 3.20 |
|  839 | alumno3 | apellido13 | apellido23 | 0.00 |
|  979 | alumno6 | apellido16 | apellido26 | 0.00 |
| 1060 | alumno8 | apellido18 | apellido28 | 9.40 |
| 1103 | alumno2 | apellido12 | apellido22 | 3.50 |
| 1155 | alumno7 | apellido17 | apellido27 | 0.00 |
| 1367 | alumno5 | apellido15 | apellido25 | 3.00 |
| 1413 | alumno2 | apellido12 | apellido22 | 7.10 |
| 1467 | alumno1 | apellido11 | apellido21 | 9.90 |
| 1619 | alumno3 | apellido13 | apellido23 | 5.00 |
| 1669 | alumno9 | apellido19 | apellido29 | 1.10 |
| 1751 | alumno8 | apellido18 | apellido28 | 7.20 |
| 1827 | alumno0 | apellido10 | apellido20 | 9.30 |
| 1928 | alumno6 | apellido16 | apellido26 | 8.60 |
| 1987 | alumno4 | apellido14 | apellido24 | 0.00 |
| 1999 | alumno4 | apellido14 | apellido24 | 3.90 |
+------+---------+------------+------------+------+
```

