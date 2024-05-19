# Tarea 7

1. Teniendo en cuenta esta información se pide:

Crea una base datos llamada salario.
    Crear BBDD en MySql.

```sql
create database salario;
```

2. Crea una tabla llamada persona con los siguientes campos:

- Identificador. (Texto)(PK).
- Nombre (Texto).
- Salario_base. (Escoge el tipo de dato).
- Subsidio(Escoge el tipo de dato).
- Salud(Escoge el tipo de dato).
- Pensión(Escoge el tipo de dato).
- Bono(Escoge el tipo de dato).
- Integral(Escoge el tipo de dato).


```sql
CREATE TABLE IF NOT EXISTS persona (
    ID VARCHAR(100) PRIMARY KEY,
    Nombre VARCHAR(100),
    Salario_Base FLOAT(10,2),
    Subsidio FLOAT(10,2) NULL,
    Salud FLOAT(10,2) NULL,
    Pension FLOAT(10,2) NULL,
    Bono FLOAT(10,2) NULL,
    Integral FLOAT(10,2) NULL
);
```

3. Creación de un procedimiento de forma aleatoria con las siguientes características:

    - Parámetro de entrada el número de registros (Mínimo 10, y realiza la prueba varias veces).

    
```sql
DELIMITER //

CREATE PROCEDURE nombres_aleatorios(IN iterations INT, IN nombre VARCHAR(100), IN salario_base FLOAT(10,2))
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO persona (Nombre, Salario_base)
        VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000)
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```



