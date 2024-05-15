# Tarea 6 

1. Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().

```sql
  INSERT INTO empleados (nombre, salario)
  VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
        (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
        (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
        (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
        (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
```

```sql
DELIMITER //

CREATE PROCEDURE nombres_aleatorios(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE rand_user VARCHAR(100);
    DECLARE rand_salary DECIMAL(10, 2);

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;




call nombres_aleatorios(5);

select * from empleados;

+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.7027834064353103  | 7426.00 |
|  5 | Empleado0.2830878852709084  | 5044.00 |
|  6 | Empleado0.05361943883227132 | 3011.00 |
|  7 | Empleado0.4709786469777847  | 9807.00 |
|  8 | Empleado0.4660196196902726  | 5222.00 |
+----+-----------------------------+---------+
``` 


2. Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función UUID().

```sql
INSERT INTO empleados (nombre, salario)
VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
```
```sql
DELIMITER //

CREATE PROCEDURE ids_aleatorios(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE rand_user VARCHAR(100);
    DECLARE rand_salary DECIMAL(10, 2);

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000)
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call ids_aleatorios(3);

select * from empleados;

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.7027834064353103           | 7426.00 |
|  5 | Empleado0.2830878852709084           | 5044.00 |
|  6 | Empleado0.05361943883227132          | 3011.00 |
|  7 | Empleado0.4709786469777847           | 9807.00 |
|  8 | Empleado0.4660196196902726           | 5222.00 |
|  9 | 62ee2487-12e0-11ef-aa38-080027b70237 | 6925.00 |
| 10 | 633d3d9e-12e0-11ef-aa38-080027b70237 | 8958.00 |
| 11 | 6373b47e-12e0-11ef-aa38-080027b70237 | 6013.00 |
+----+--------------------------------------+---------+
```

3. Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().


```sql
INSERT INTO empleados (nombre, salario)
SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
FROM (SELECT 1 UNION SELECT 2) AS sub
ORDER BY RAND()
LIMIT 2;
```
```sql
DELIMITER //

CREATE PROCEDURE nombres_aleatorios_order(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE rand_user VARCHAR(100);
    DECLARE rand_salary DECIMAL(10, 2);

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
        FROM (SELECT 1 UNION SELECT 2) AS sub
        ORDER BY RAND()
        LIMIT 2;
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;



call nombres_aleatorios_order(2);

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.7027834064353103           | 7426.00 |
|  5 | Empleado0.2830878852709084           | 5044.00 |
|  6 | Empleado0.05361943883227132          | 3011.00 |
|  7 | Empleado0.4709786469777847           | 9807.00 |
|  8 | Empleado0.4660196196902726           | 5222.00 |
|  9 | 62ee2487-12e0-11ef-aa38-080027b70237 | 6925.00 |
| 10 | 633d3d9e-12e0-11ef-aa38-080027b70237 | 8958.00 |
| 11 | 6373b47e-12e0-11ef-aa38-080027b70237 | 6013.00 |
| 12 | Empleado0.6882680809947365           | 6606.00 |
| 13 | Empleado0.9896107921280067           | 4012.00 |
| 15 | Empleado0.7732986330737347           | 9357.00 |
| 16 | Empleado0.341956690272276            | 4146.00 |
+----+--------------------------------------+---------+
```

4. Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).

```sql
INSERT INTO empleados (nombre, salario)
VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
      (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
```

```sql
DELIMITER //

CREATE PROCEDURE nombres_aleatorios_substring(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE rand_user VARCHAR(100);
    DECLARE rand_salary DECIMAL(10, 2);

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call nombres_aleatorios_substring(4);

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.7027834064353103           | 7426.00 |
|  5 | Empleado0.2830878852709084           | 5044.00 |
|  6 | Empleado0.05361943883227132          | 3011.00 |
|  7 | Empleado0.4709786469777847           | 9807.00 |
|  8 | Empleado0.4660196196902726           | 5222.00 |
|  9 | 62ee2487-12e0-11ef-aa38-080027b70237 | 6925.00 |
| 10 | 633d3d9e-12e0-11ef-aa38-080027b70237 | 8958.00 |
| 11 | 6373b47e-12e0-11ef-aa38-080027b70237 | 6013.00 |
| 12 | Empleado0.6882680809947365           | 6606.00 |
| 13 | Empleado0.9896107921280067           | 4012.00 |
| 15 | Empleado0.7732986330737347           | 9357.00 |
| 16 | Empleado0.341956690272276            | 4146.00 |
| 18 | 080027b70237                         | 4223.00 |
| 19 | 080027b70237                         | 7049.00 |
| 20 | 080027b70237                         | 4571.00 |
| 21 | 080027b70237                         | 7713.00 |
+----+--------------------------------------+---------+
```


5. Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.

```sql
INSERT INTO empleados (nombre, salario)
VALUES (CONCAT('Empleado', RAND(1)), FLOOR(RAND(1) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(2)), FLOOR(RAND(2) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(3)), FLOOR(RAND(3) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(4)), FLOOR(RAND(4) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(5)), FLOOR(RAND(5) * (10000 - 2000 + 1)) + 2000),
      (CONCAT('Empleado', RAND(6)), FLOOR(RAND(6) * (10000 - 2000 + 1)) + 2000);
```

```sql
DELIMITER //

CREATE PROCEDURE nombres_con_semilla(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE rand_user VARCHAR(100);
    DECLARE rand_salary DECIMAL(10, 2);
    DECLARE seed INT DEFAULT 1;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT('Empleado', RAND(seed)), FLOOR(RAND(seed) * (10000 - 2000 + 1)) + 2000);
        SET counter = counter + 1;
        SET seed = seed + 1;
    END WHILE;
END//

DELIMITER ;

call nombres_con_semilla(6);

select * from empleados;

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.7027834064353103           | 7426.00 |
|  5 | Empleado0.2830878852709084           | 5044.00 |
|  6 | Empleado0.05361943883227132          | 3011.00 |
|  7 | Empleado0.4709786469777847           | 9807.00 |
|  8 | Empleado0.4660196196902726           | 5222.00 |
|  9 | 62ee2487-12e0-11ef-aa38-080027b70237 | 6925.00 |
| 10 | 633d3d9e-12e0-11ef-aa38-080027b70237 | 8958.00 |
| 11 | 6373b47e-12e0-11ef-aa38-080027b70237 | 6013.00 |
| 12 | Empleado0.6882680809947365           | 6606.00 |
| 13 | Empleado0.9896107921280067           | 4012.00 |
| 15 | Empleado0.7732986330737347           | 9357.00 |
| 16 | Empleado0.341956690272276            | 4146.00 |
| 18 | 080027b70237                         | 4223.00 |
| 19 | 080027b70237                         | 7049.00 |
| 20 | 080027b70237                         | 4571.00 |
| 21 | 080027b70237                         | 7713.00 |
| 22 | Empleado0.40540353712197724          | 5243.00 |
| 23 | Empleado0.6555866465490187           | 7245.00 |
| 24 | Empleado0.9057697559760601           | 9247.00 |
| 25 | Empleado0.15595286540310166          | 3247.00 |
| 26 | Empleado0.40613597483014313          | 5249.00 |
| 27 | Empleado0.6563190842571847           | 7251.00 |
+----+--------------------------------------+---------+
```




