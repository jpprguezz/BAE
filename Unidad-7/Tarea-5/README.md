# Tarea 5

### Carga de datos

Para cargar la base de datos, debemos usar elcomando source:

```sql
source D:\mysql\jardineria.sql;
```

### Indices

- Consulte cuáles son los índices que hay en la tabla producto utilizando las instrucciones SQL que nos permiten obtener esta información de la tabla.

```sql
show index from producto;
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name     | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| producto |          0 | PRIMARY  |            1 | codigo_producto | A         |         276 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | gama     |            1 | gama            | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

- Haga uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas y diga cuál de las dos consultas realizará menos comparaciones para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada caso? ¿Por qué?.

```sql
EXPLAIN SELECT * FROM producto WHERE codigo_producto = 'OR-114';

+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table    | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | producto | NULL       | const | PRIMARY       | PRIMARY | 62      | const |    1 |   100.00 | NULL  |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+


EXPLAIN SELECT * FROM producto WHERE nombre = 'Evonimus Pulchellus';

+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | producto | NULL       | ALL  | NULL          | NULL | NULL    | NULL |  276 |    10.00 | Using where |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+

En la primera tabla se realiza tan solo recorre 1 fila mientras que la segunda recorre las 276 de la tabla. Esto principalmente se debe a que la primera tabla posee una PRIMARY KEY, lo que hace que vaya directo hacia el resultado mientras que en la segunda al no existir esta key, debe recorrer todas las filas.
```


- Suponga que estamos trabajando con la base de datos jardineria y queremos saber optimizar las siguientes consultas. ¿Cuál de las dos sería más eficiente?. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.

```sql
EXPLAIN SELECT AVG(total) FROM pago WHERE YEAR(fecha_pago) = 2008;

+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | pago  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   26 |   100.00 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+


EXPLAIN SELECT AVG(total) FROM pago WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';

+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | pago  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   26 |    11.11 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+

La primera consulta es más precisa que la segunda, esto debido a que si bien las dos consultas recorren las mismas filas, el filtrado de datos de la primera tabla es de 100%, lo cual la convierte en una consulta más precisa.
``` 


- Optimiza la siguiente consulta creando índices cuando sea necesario. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.

```sql
EXPLAIN SELECT * FROM cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente WHERE cliente.nombre_cliente LIKE 'A%';

+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys  | key            | key_len | ref                               | rows | filtered | Extra       |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
|  1 | SIMPLE      | cliente | NULL       | ALL  | PRIMARY        | NULL           | NULL    | NULL                              |   36 |    11.11 | Using where |
|  1 | SIMPLE      | pedido  | NULL       | ref  | codigo_cliente | codigo_cliente | 4       | jardineria.cliente.codigo_cliente |    1 |   100.00 | NULL        |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+

Podemos crear un indice en el nombre del cliente, ya que podemos ver que en la primera fila de la primera fila de la tabla se recorre la tabla al completo, asi que para organizar mejor el contenido, sería más conveniente hacer un indice

create index index_nombre_cliente on cliente (nombre_cliente);


Y si lanzamos de nuevo el explain de la tabla anterior, podemos observar que ahora todo se organiza a través del indice que hemos creado, haciendolo mucho más ordenado

+----+-------------+---------+------------+-------+------------------------------+----------------------+---------+-----------------------------------+------+----------+-----------------------+
| id | select_type | table   | partitions | type  | possible_keys                | key                  | key_len | ref
  | rows | filtered | Extra                 |
+----+-------------+---------+------------+-------+------------------------------+----------------------+---------+-----------------------------------+------+----------+-----------------------+
|  1 | SIMPLE      | cliente | NULL       | range | PRIMARY,index_nombre_cliente | index_nombre_cliente | 202     | NULL
  |    3 |   100.00 | Using index condition |
|  1 | SIMPLE      | pedido  | NULL       | ref   | codigo_cliente               | codigo_cliente       | 4       | jardineria.cliente.codigo_cliente |    6 |   100.00 | NULL                  |
+----+-------------+---------+------------+-------+------------------------------+----------------------+---------+-----------------------------------+------+----------+-----------------------+
```
- ¿Por qué no es posible optimizar el tiempo de ejecución de las siguientes consultas, incluso haciendo uso de índices?


```sql
EXPLAIN SELECT * FROM cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente WHERE cliente.nombre_cliente LIKE '%A%';

+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys  | key            | key_len | ref                               | rows | filtered | Extra       |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
|  1 | SIMPLE      | cliente | NULL       | ALL  | PRIMARY        | NULL           | NULL    | NULL                              |   36 |    11.11 | Using where |
|  1 | SIMPLE      | pedido  | NULL       | ref  | codigo_cliente | codigo_cliente | 4       | jardineria.cliente.codigo_cliente |    6 |   100.00 | NULL        |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+

EXPLAIN SELECT * FROM cliente INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente WHERE cliente.nombre_cliente LIKE '%A';

+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys  | key            | key_len | ref                               | rows | filtered | Extra       |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
|  1 | SIMPLE      | cliente | NULL       | ALL  | PRIMARY        | NULL           | NULL    | NULL                              |   36 |    11.11 | Using where |
|  1 | SIMPLE      | pedido  | NULL       | ref  | codigo_cliente | codigo_cliente | 4       | jardineria.cliente.codigo_cliente |    6 |   100.00 | NULL        |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+

No pueden ser optimizadas, debido a que la busqueda que se hace con el LIKE esta entre %, lo que indica que puede haber cualquier caracter detras delante de la busqueda que se esta realizando, lo cual hace que los indices sean poco utiles en este caso.
```

- Crea un índice de tipo FULLTEXT sobre las columnas nombre y descripcion de la tabla producto.

```sql
create fulltext index idx_nombre_descripcion on producto (nombre, descripcion);
```

- Una vez creado el índice del ejercicio anterior realiza las siguientes consultas haciendo uso de la función MATCH, para buscar todos los productos que: 

(no he colocado los resultados, debido a que mi terminal no generaba bien las tablas)

  - Contienen la palabra planta en el nombre o en la descripción.

  ```sql
  select * from producto where match (nombre, descripcion) against ('planta');

  La tabla es muy grande y no se genera correctamente, por lo cual no la he puesto
  ```

  - Realice una consulta para cada uno de los modos de búsqueda full-text que existen en MySQL (IN NATURAL LANGUAGE MODE, IN BOOLEAN MODE y WITH QUERY EXPANSION) y compare los resultados que ha obtenido en cada caso.

  ```sql
  select * from producto where match (nombre, descripcion) against ('planta' in natural language mode);
  select * from producto where match (nombre, descripcion) against ('planta' in natural boolean mode);
  select * from producto where match (nombre, descripcion) against ('planta' in natural with query expansion);
  ```

  - Contienen la palabra planta seguida de cualquier carácter o conjunto de caracteres, en el nombre o en la descripción.

  ```sql
  select * from producto where match(nombre, descripcion) against ('+planta*' in boolean mode);
  ```

  - Empiezan con la palabra planta en el nombre o en la descripción.

  ```sql
  select * from producto where match(nombre, descripcion) against ('^planta');
  ```

  - Contienen la palabra tronco o la palabra árbol en el nombre o en la descripción.

  ```sql
  select * from producto where match(nombre, descripcion) against ('tronco árbol');
  ```

  - Contienen la palabra tronco y la palabra árbol en el nombre o en la descripción.

  ```sql
  select * from producto where match(nombre, descripcion) against ('+tronco +árbol');
  ```

  - Contienen la palabra tronco pero no contienen la palabra árbol en el nombre o en la descripción.

  ```sql
  select * from producto where match(nombre, descripcion) against ('+tronco +árbol');
  ```

  - Contiene la frase proviene de las costas en el nombre o en la descripción.

  ```sql
  select * from producto where match(nombre, descripcion) against ('"proviene de las costas en el nombre"');
  ``` 

  - Crea un índice de tipo INDEX compuesto por las columnas apellido_contacto y nombre_contacto de la tabla cliente.

  ```sql
  create index index_apellido_nombre_contacto on cliente (apellido_contacto, nombre_contacto);
  ```

  - Una vez creado el índice del ejercicio anterior realice las siguientes consultas haciendo uso de EXPLAIN

      - Busca el cliente Javier Villar. ¿Cuántas filas se han examinado hasta encontrar el resultado?

      ```sql
      explain select * from cliente where nombre_contacto = 'Javier' and apellido_contacto = 'Villar';
      +----+-------------+---------+------------+------+--------------------------------+--------------------------------+---------+-------------+------      +----------+-------+
      | id | select_type | table   | partitions | type | possible_keys                  | key                            | key_len | ref         |  rows |     filtered | Extra |
      +----+-------------+---------+------------+------+--------------------------------+--------------------------------+---------+-------------+------    +----------+-------+
      |  1 | SIMPLE      | cliente | NULL       | ref  | index_apellido_nombre_contacto | index_apellido_nombre_contacto | 246     | const,const |      1 |     100.  00 | NULL  |
      +----+-------------+---------+------------+------+--------------------------------+--------------------------------+---------+-------------+------      +----------+-------+

      Se examinó unicamente una fila
      ```

      - Busca el cliente anterior utilizando solamente el apellido Villar.¿Cuántas filas se han examinado hasta encontrar el resultado?

      ```sql
      explain select * from cliente where apellido_contacto = 'Villar';

      +----+-------------+---------+------------+------+--------------------------------+--------------------------------+---------+-------+------  +----------   +-------+
      | id | select_type | table   | partitions | type | possible_keys                  | key                            | key_len | ref   | rows |   filtered |    Extra |
      +----+-------------+---------+------------+------+--------------------------------+--------------------------------+---------+-------+------  +----------   +-------+
      |  1 | SIMPLE      | cliente | NULL       | ref  | index_apellido_nombre_contacto | index_apellido_nombre_contacto | 123     | const |    1 |   100.  00 |    NULL  |
      +----+-------------+---------+------------+------+--------------------------------+--------------------------------+---------+-------+------  +----------   +-------+

      Se ha examinado solo 1 fila
      ```

      - Busca el cliente anterior utilizando solamente el nombre Javier. ¿Cuántas filas se han examinado hasta encontrar el resultado? ¿Qué ha ocurrido en  este caso?

      ```sql
      explain select * from cliente where nombre_contacto = 'Javier';

      +----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+
      | id | select_type | table   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
      +----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+
      |  1 | SIMPLE      | cliente | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   36 |    10.00 | Using where |
      +----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+

      Se han examinado 36 filas
      ```

    - Calcula cuál podría ser un buen valor para crear un índice sobre un prefijo de la columna nombre_cliente de la tabla cliente. Tenga en cuenta que un buen valor será aquel que nos permita utilizar el menor número de caracteres para diferenciar todos los valores que existen en la columna sobre la que estamos creando el índice.

      - En primer lugar calculamos cuántos valores distintos existen en la columna nombre_cliente. Necesitarás utilizar la función COUNT y DISTINCT.

      ```sql
      select distinct count(nombre_cliente) from cliente;
      +-----------------------+
      | count(nombre_cliente) |
      +-----------------------+
      |                    36 |
      +-----------------------+
      ```
      - Haciendo uso de la función LEFT ve calculando el número de caracteres que necesitas utilizar como prefijo para diferenciar todos los valores de la columna. Necesitarás la función COUNT, DISTINCT y LEFT.

      - Una vez que hayas encontrado el valor adecuado para el prefijo, crea el índice sobre la columna nombre_cliente de la tabla cliente.
      ```sql
      create index index_pref_nombre_cliente ON cliente(nombre_cliente(4));
      ```

      - Ejecuta algunas consultas de prueba sobre el índice que acabas de crear.

      ```sql
      explain select * from cliente where nombre_contacto = 'Franc';

      +----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+
      | id | select_type | table   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
      +----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+
      |  1 | SIMPLE      | cliente | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   36 |    10.00 | Using where |
      +----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+
      ```

### Vistas
  - Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los clientes y los pagos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la transacción

  ```sql
  create view listado_pagos_clientes as select 
  ```





  


