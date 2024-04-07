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
explain select * from movimiento, movimiento_bis where movimiento.Identificador=3 or movimiento_bis.Identificador=3;

+----+-------------+----------------+------------+------+------------------+------+---------+------+------+----------+--------------------------------------------+
| id | select_type | table          | partitions | type | possible_keys    | key  | key_len | ref  | rows | filtered | Extra
              |
+----+-------------+----------------+------------+------+------------------+------+---------+------+------+----------+--------------------------------------------+
|  1 | SIMPLE      | movimiento     | NULL       | ALL  | PRIMARY          | NULL | NULL    | NULL | 3594 |   100.00 | NULL
              |
|  1 | SIMPLE      | movimiento_bis | NULL       | ALL  | IX_IDENTIFICADOR | NULL | NULL    | NULL | 3594 |   100.00 | Using where; Using join buffer (hash join) |
+----+-------------+----------------+------------+------+------------------+------+---------+------+------+----------+--------------------------------------------+


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
Consulta 1

explain select * from MOVIMIENTO where identificador=3;

+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+

Consulta 2

explain select identificador from MOVIMIENTO_BIS where identificador=3;

+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys    | key              | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_IDENTIFICADOR | IX_IDENTIFICADOR | 4       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
```

Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? 

Se busca a traves de la PRIMARY KEY


¿Por qué crees que lo hace así? 

Porque no le hemos creado ningún indice a esa tabla relacionado con el identificador


En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca? 

A través de IX_IDENTIFICADOR


¿Por qué crees que lo hace así? Analiza la ejecución.`

```sql
explain select identificador from MOVIMIENTO_BIS where identificador=3;
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys    | key              | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_IDENTIFICADOR | IX_IDENTIFICADOR | 4       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+------------------+------------------+---------+-------+------+----------+-------------+

Lo hace asi debido que al tener un index ya creado, accede más rapido al resultado
```

- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

```sql
Consulta 1:

EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';

+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3594 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+

Consulta 2

EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | IX_FECHA_BIS  | NULL | NULL    | NULL | 3594 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? 

A través de IX_FECHA_BIS


¿Por qué crees que lo hace así? 

Porque aunque anteriormente creamos un indice, al colocar el * en la consulta, pedimos a esta que nos de todos los datos de la tabla


En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca? 

A través de ninguno


¿Por qué crees que lo hace así? Analiza la ejecución.
```sql
EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | IX_FECHA_BIS  | NULL | NULL    | NULL | 3594 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+

Porque no hemos creado ningun indice en esta tabla
```

- Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.

```sql
create index IX_FECHA on movimiento (fecha);

Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

- Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.

```sql
show index from movimiento;

+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| movimiento |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |
|               | YES     | NULL       |
| movimiento |          1 | IX_FECHA |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |
|               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

show index from movimiento_bis;

+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name         | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| movimiento_bis |          1 | IX_FECHA_BIS     |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| movimiento_bis |          1 | IX_IDENTIFICADOR |            1 | Identificador | A         |        3594 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```
 - Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: 
 ```sql
 Consulta 1:

 EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/20
 12 AND 01/03/2012;
 +----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
 | id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra       |
 +----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
 |  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | Using index |
 +----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
 
 Consulta 2:
 
 EXPLAIN SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
 
 +----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
 | id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra |
 +----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
 |  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | NULL  |
 +----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
 
 Consulta 3:

 EXPLAIN SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
 +----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
 | id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra       |
 +----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
 |  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | Using index |
 +----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+

 Consulta 4:

 EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
 +----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
 | id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
 +----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
 |  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | NULL  |
 +----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
 ```
