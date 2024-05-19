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
    Subsidio FLOAT(10,2),
    Salud FLOAT(10,2),
    Pension FLOAT(10,2),
    Bono FLOAT(10,2),
    Integral FLOAT(10,2)
);
```

3. Creación de un procedimiento de forma aleatoria con las siguientes características:

    - Parámetro de entrada el número de registros (Mínimo 10, y realiza la prueba varias veces).

    
```sql
DELIMITER //

CREATE PROCEDURE parametros_entrada_aleatorios(IN iterations INT)
BEGIN
    
    DECLARE counter INT DEFAULT 0;
    DECLARE rand_Nombre VARCHAR(100);
    DECLARE rand_Salario_Base FLOAT(10,2);

    IF iterations < 10 THEN
        SET iterations = 10;
    END IF;

    WHILE counter < iterations DO
        INSERT INTO persona (ID, Nombre, Salario_base)
        VALUES (UUID(), CONCAT('Persona', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

mysql> call parametros_entrada_aleatorios (10);
Query OK, 1 row affected (0.02 sec)

mysql> call parametros_entrada_aleatorios (12);
Query OK, 1 row affected (0.06 sec)

mysql> call parametros_entrada_aleatorios (11);
Query OK, 1 row affected (0.05 sec)

select * from persona;

+--------------------------------------+-----------------------------+--------------+----------+-------+---------+------+----------+
| ID                                   | Nombre                      | Salario_Base | Subsidio | Salud | Pension | Bono | Integral |
+--------------------------------------+-----------------------------+--------------+----------+-------+---------+------+----------+
| 0ecb56a4-15e9-11ef-89c8-f02f742f350d | Persona0.888999063418246    |      7538.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0ecb8c4f-15e9-11ef-89c8-f02f742f350d | Persona0.7942869689262351   |      9158.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0ecbc78f-15e9-11ef-89c8-f02f742f350d | Persona0.09046111543705791  |      8147.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0ecc1200-15e9-11ef-89c8-f02f742f350d | Persona0.5701787495707895   |      6368.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0ecc3c2f-15e9-11ef-89c8-f02f742f350d | Persona0.019246479514284508 |      5667.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0ecc6519-15e9-11ef-89c8-f02f742f350d | Persona0.23407464123710492  |      8363.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0ecc9221-15e9-11ef-89c8-f02f742f350d | Persona0.27420014447923763  |      9882.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0eccc7f6-15e9-11ef-89c8-f02f742f350d | Persona0.10313125057437574  |      6482.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0eccf5c1-15e9-11ef-89c8-f02f742f350d | Persona0.4916927372028052   |      8223.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 0ecd1f48-15e9-11ef-89c8-f02f742f350d | Persona0.4139810282867225   |      7892.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16be49b6-15e9-11ef-89c8-f02f742f350d | Persona0.4404051792252857   |      9941.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16be827e-15e9-11ef-89c8-f02f742f350d | Persona0.6418694273027307   |      3852.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16beb0f8-15e9-11ef-89c8-f02f742f350d | Persona0.23187278232711628  |      5719.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16bee35c-15e9-11ef-89c8-f02f742f350d | Persona0.628758295093438    |      7994.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16bf19ba-15e9-11ef-89c8-f02f742f350d | Persona0.8595528424340793   |      2402.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16bf42e4-15e9-11ef-89c8-f02f742f350d | Persona0.6726796270093691   |      3700.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16bf6d55-15e9-11ef-89c8-f02f742f350d | Persona0.04493760787410439  |      6695.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16bf971d-15e9-11ef-89c8-f02f742f350d | Persona0.7996981831264666   |      3902.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16c07952-15e9-11ef-89c8-f02f742f350d | Persona0.7898272851387292   |      3886.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16c0a0dc-15e9-11ef-89c8-f02f742f350d | Persona0.8094350461004628   |      4718.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16c0ce4f-15e9-11ef-89c8-f02f742f350d | Persona0.270820586263035    |      4677.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 16c0f8c1-15e9-11ef-89c8-f02f742f350d | Persona0.8606760006963052   |      4396.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 1931689c-15e9-11ef-89c8-f02f742f350d | Persona0.9154590134652881   |      7431.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 1937502c-15e9-11ef-89c8-f02f742f350d | Persona0.6476375261765323   |      3614.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 19377bf5-15e9-11ef-89c8-f02f742f350d | Persona0.06598215276932544  |      7797.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 1937a583-15e9-11ef-89c8-f02f742f350d | Persona0.4249234436311977   |      9608.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 1937d284-15e9-11ef-89c8-f02f742f350d | Persona0.479706330671633    |      6367.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 1937fc7a-15e9-11ef-89c8-f02f742f350d | Persona0.2901095666830517   |      8504.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 1938257a-15e9-11ef-89c8-f02f742f350d | Persona0.19472506753609056  |      6277.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 19384d8f-15e9-11ef-89c8-f02f742f350d | Persona0.08879045964106029  |      8722.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 193875e3-15e9-11ef-89c8-f02f742f350d | Persona0.9344934019581354   |      3215.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 19389e67-15e9-11ef-89c8-f02f742f350d | Persona0.9562607770378336   |      4604.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 1938c6ff-15e9-11ef-89c8-f02f742f350d | Persona0.7585144226984255   |      8530.00 |     NULL |  NULL |    NULL | NULL |     NULL |
+--------------------------------------+-----------------------------+--------------+----------+-------+---------+------+----------+
```

Cree una función para cada punto teniendo en cuenta que:
- Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico. Actualiza el valor en la tabla.
```sql
DELIMITER //

CREATE FUNCTION subsidio_transporte(Salario_Base FLOAT(10,2)) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE Subsidio FLOAT(10,2);
    SET Subsidio = Salario_Base * 0.07;
    RETURN Subsidio;
END//

DELIMITER ;
```

- Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla.
```sql
DELIMITER //

CREATE FUNCTION salud(Salario_Base FLOAT(10,2)) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE Salud FLOAT(10,2);
    SET Salud = Salario_Base * 0.04;
    RETURN Salud;
END//

DELIMITER ;
```

- Función pension: La pensión que corresponde al 4% al salario básico. Actualiza el valor en la tabla.
```sql
DELIMITER //

CREATE FUNCTION pension(Salario_Base FLOAT(10,2)) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE Pension FLOAT(10,2);
    SET Pension = Salario_Base * 0.04;
    RETURN Pension;
END//

DELIMITER ;
```
- Función bono: Un bono que corresponde al 8% al salario básico. Actualiza el valor en la tabla.
```sql
DELIMITER //

CREATE FUNCTION bono(Salario_Base FLOAT(10,2)) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE Bono FLOAT(10,2);
    SET Bono = Salario_Base * 0.04;
    RETURN Bono;
END//

DELIMITER ;
```

- Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte. Actualiza el valor en la tabla.
```sql
DELIMITER //

CREATE FUNCTION integral(Salario_Base FLOAT(10,2), Salud FLOAT(10,2), Pension FLOAT(10,2), Bono FLOAT(10,2), Subsidio FLOAT(10,2)) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE Integral FLOAT(10,2);
    SET Integral = Salario_Base - Salud - Pension + Bono + Subsidio;
    RETURN Integral;
END//

DELIMITER ;
```
- Crea cada uno de las funciones anteriores para una persona en específico.
  El parámetro de entrada debe de ser un identificar de la persona.
```sql
DELIMITER //

CREATE FUNCTION pension(Salario_Base FLOAT(10,2)) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE Pension FLOAT(10,2);
    SET Pension = Salario_Base * 0.04;
    RETURN Pension;
END//

DELIMITER ;
```



