# Tarea 3: Trabajo con Índices

- Crea una base de datos que tendrá por nombre Base_Indices

- En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:

```sql
CREATE TABLE movimiento (
    Identificador INT PRIMARY KEY AUTO_INCREMENT,
    Articulo VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Cantidad INT NOT NULL
);
```
- Aplica la sentencia adecuada para visualizar los índices que hay en la tabla.

```sql
show index from movimiento;

+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| movimiento |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0.03 sec)
```



- Ejecuta la siguiente sentencia sql para generar datos de prueba:

```sql
CREATE TABLE NumerosUnicos (
Numero INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO NumerosUnicos (Numero)
SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
SELECT 
    n.Numero,
    CONCAT('Producto', n.Numero),
    DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
    FLOOR(RAND() * 1000000) + 1
FROM 
    NumerosUnicos n;

    DROP TABLE NumerosUnicos;
```
- Ejecutamos un count sobre la tabla

```sql
+----------+
| count(*) |
+----------+
|     3594 |
+----------+
```

- Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a la que llamaremos MOVIMIENTO_BIS.

```sql
create table MOVIMIENTO_BIS select * from MOVIMIENTO;

Query OK, 3594 rows affected (0.11 sec)
Records: 3594  Duplicates: 0  Warnings: 0
```

- Con la cláusula DESCRIBE observa cuál es la situación de la tabla clonada, ¿Qué le pasa al índice y a la propiedad AUTO_INCREMENT?

```sql
describe movimiento;

+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Identificador | int         | NO   | PRI | NULL    | auto_increment |
| Articulo      | varchar(50) | NO   |     | NULL    |                |
| Fecha         | date        | NO   |     | NULL    |                |
| Cantidad      | int         | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+


describe movimiento_bis;

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+



A diferencia de la tabla original, en la tabla clonada no se encuentra la PRIMARY KEY o el AUTO_INCREMENT en el campo Identificador. También en este mismo campo ha cambiado el valor de NULL a 0
```

- Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.

```sql
EXPLAIN select * from MOVIMIENTO, MOVIMIENTO_BIS where MOVIMIENTO.Identificador=3 or MOVIMIENTO_BIS.Identificador=3;

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+--------------------------------------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                                      |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+--------------------------------------------+
|  1 | SIMPLE      | MOVIMIENTO     | NULL       | ALL  | PRIMARY       | NULL | NULL    | NULL | 3594 |   100.00 | NULL                                       |
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3594 |   100.00 | Using where; Using join buffer (hash join) |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+--------------------------------------------+


Al no haber PRIMARY KEY en la tabla movimiento_bis, en la sección de extra, nos aparecerá un aviso/warning
```

- Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas. En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).

```sql
create index IX_FECHA_BIS on movimiento_bis (fecha);

Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0


create index IX_IDENTIFICADOR on movimiento_bis (identificador);

Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0
```


- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

```sql
Consulta1

select * from MOVIMIENTO where identificador=3;
```