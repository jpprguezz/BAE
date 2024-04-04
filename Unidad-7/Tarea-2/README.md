# Tarea 2: Trabajo con Índices

- Elimine la tabla "cliente" si existe. 

```sql
use database cliente;
ERROR 1049 (42000): Unknown database 'database'
```

- Cree la tabla sin clave primaria y incluye a posteriori esta. 

```sql
CREATE TABLE cliente (
    documento_cliente VARCHAR(8) NOT NULL,
    nombre_cliente VARCHAR(30) NOT NULL,
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    telefono VARCHAR(11)
);

Query OK, 0 rows affected (3,62 sec)


ALTER TABLE cliente ADD PRIMARY KEY (documento_cliente);

Query OK, 0 rows affected (10,20 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

- Define los siguientes indices: 

    - Un índice único por el campo "documento" y un índice  común por ciudad y provincia

    ```sql
    1. create unique index index_documento_cliente on cliente(documento_cliente);
    Query OK, 0 rows affected (2,99 sec)
    Records: 0  Duplicates: 0  Warnings: 0

    2. create index index_ciudad on cliente(ciudad);
    Query OK, 0 rows affected (2,82 sec)
    Records: 0  Duplicates: 0  Warnings: 0

    3. create index index_provincia on cliente(provincia);
    Query OK, 0 rows affected (2,55 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    ```

    - Vea los índices de la tabla

    ```sql
    show index from cliente;

    +---------+------------+-------------------------+--------------+-------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name                | Seq_in_index | Column_name       | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+-------------------------+--------------+-------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | cliente |          0 | PRIMARY                 |            1 | documento_cliente | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          0 | index_documento_cliente |            1 | documento_cliente | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | index_ciudad            |            1 | ciudad            | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | index_provincia         |            1 | provincia         | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +---------+------------+-------------------------+--------------+-------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    4 rows in set (1,01 sec)
    ```

- Agregue un índice único por el campo "telefono"

```sql
create unique index index_telefono on cliente(telefono);

Query OK, 0 rows affected (2,65 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

- Elimina los índices 

```sql
ALTER TABLE cliente DROP INDEX index_documento_cliente;

Query OK, 0 rows affected (1,23 sec)
Records: 0  Duplicates: 0  Warnings: 0


DROP INDEX index_ciudad ON cliente;

Query OK, 0 rows affected (3,86 sec)
Records: 0  Duplicates: 0  Warnings: 0


DROP INDEX indez_provincia ON cliente;

Query OK, 0 rows affected (1,19 sec)
Records: 0  Duplicates: 0  Warnings: 0


ALTER TABLE cliente DROP INDEX index_telefono;

Query OK, 0 rows affected (2,88 sec)
Records: 0  Duplicates: 0  Warnings: 0
```
