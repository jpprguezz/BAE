# Tarea 1: Trabajo con Índices

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

- número de inscripción, comienza desde 1 cada año,
- año de inscripción,
- nombre del alumno,
- documento del alumno,
- domicilio,
- ciudad,
- provincia,
- clave primaria: número de inscripto y año de inscripción.




- Elimine la tabla "alumno" si existe

```sql
drop table if exists alumno;
Query OK, 0 rows affected (0.01 sec)
```

- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).
```sql
CREATE TABLE alumno (
    num_inscripcion INT,
    anio_inscripcion INT,
    nombre_alumno VARCHAR(50),
    documento_alumno VARCHAR(50),
    domicilio VARCHAR(100),
    ciudad VARCHAR(100),
    provincia VARCHAR(50),
    PRIMARY KEY (num_inscripcion, anio_inscripcion)
);
```

- Define los siguiente indices:

    - Un índice único por el campo "documento" y un índice común por ciudad y provincia

     ```sql
     1. create unique index index_documento_alumno on alumno(documento_alumno);
        Query OK, 0 rows affected (0.01 sec)
        Records: 0  Duplicates: 0  Warnings: 0  

    2. create index index_ciudad on alumno(ciudad);
        Query OK, 0 rows affected (0.01 sec)
        Records: 0  Duplicates: 0  Warnings: 0  

    3. create index index_provincia on alumno(provincia);
        Query OK, 0 rows affected (0.01 sec)
        Records: 0  Duplicates: 0  Warnings: 0
     ```

    - Vea los índices de la table: 

    ```sql
    show index from alumno;

    +--------+------------+-----------------+-------------- +----------------------+-----------+-------------+----------+--------    +------+------------+---------+---------------+---------+------------+
    | Table  | Non_unique | Key_name        | Seq_in_index |    Column_name          | Collation | Cardinality | Sub_part | Packed |   Null | Index_type | Comment | Index_comment | Visible | Expression |
    +--------+------------+-----------------+-------------- +----------------------+-----------+-------------+----------+--------    +------+------------+---------+---------------+---------+------------+
    | alumno |          0 | PRIMARY         |            1 |    numero_de_incription | A         |           0 |     NULL |    NULL |      | BTREE      |         |               | YES     |   NULL       |
    | alumno |          0 | PRIMARY         |            2 |    año                  | A         |           0 |     NULL |    NULL |      | BTREE      |         |               | YES     |   NULL       |
    | alumno |          0 | index_documento |            1 |    Documento_alumno     | A         |           0 |     NULL |   NULL |   YES  | BTREE      |         |               | YES     | NULL       |
    | alumno |          1 | index_ciudad    |            1 |    ciudad               | A         |           0 |     NULL |   NULL |   YES  | BTREE      |         |               | YES     | NULL       |
    | alumno |          1 | index_provincia |            1 |    provincia            | A         |           0 |     NULL |   NULL |   YES  | BTREE      |         |               | YES     | NULL       |
    +--------+------------+-----------------+-------------- +----------------------+-----------+-------------+----------+--------    +------+------------+---------+---------------+---------+------------+
    ```

- Intente ingresar un alumno con clave primaria repetida.

```sql
mysql> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre_alumno, documento_alumno, domicilio, ciudad, provincia)
    -> VALUES (1, 2024, 'Juan', '12345678A', 'Calle Mayor 123', 'Madrid', 'Comunidad de Madrid'),
    ->        (1, 2024, 'María', '98765432B', 'Avenida Libertad 456', 'Barcelona', 'Cataluña');

ERROR 1062 (23000): Duplicate entry '1-2024' for key 'alumno.PRIMARY'
```

- Intente ingresar un alumno con documento repetido.

```sql
mysql> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre_alumno, documento_alumno, domicilio, ciudad, provincia)
    -> VALUES (1, 2024, 'Juan', '12345678A', 'Calle Mayor 123', 'Madrid', 'Comunidad de Madrid'),
    -> (2, 2023, 'María', '12345678A', 'Avenida Libertad 456', 'Barcelona', 'Cataluña');
ERROR 1062 (23000): Duplicate entry '12345678A' for key 'alumno.index_documento_alumno'
```


- Ingrese varios alumnos de la misma ciudad y provincia

```sql
mysql> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre_alumno, documento_alumno, domicilio, ciudad, provincia)
    -> VALUES (3, 2024, 'Alejandro', '12345678K', 'Calle Principal 123', 'Malaga', 'Málaga'),
    -> (4, 2023, 'Juan', '98765432L', 'Avenida Central 456', 'Málaga', 'Málaga'),
    -> (5, 2022, 'Ana', '56789012P', 'Shibuya Street 789', 'Málaga', 'Málaga');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0
```

- Elimina los indices creados, y muestra que ya no se encuentran.
```sql
alter table alumno drop index index_documento_alumno;

Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0


drop index index_ciudad on alumno;

Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0


drop index index_provincia on alumno;

Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0


+--------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name      | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | num_inscripcion  | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | anio_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+----
```

