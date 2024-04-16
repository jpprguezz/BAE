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

      +-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
    | codigo_producto | nombre                            | gama        | dimensiones | proveedor             | descripcion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | cantidad_en_stock | precio_venta | precio_proveedor |
    +-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
    | AR-004          | Melissa                           | Aromáticas  | 15-20       | Murcia Seasons        | Es una planta perenne (dura varios años) conocida por el agradable y característico olor a limón que desprenden en verano. Nunca debe faltar en la huerta o jardín por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy fácil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por día. Cada año, su abonado mineral correspondiente.En otoño, la melisa pierde el agradable olor a limón que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotará de forma densa en primavera.                                                                                                                                                                                                                                                                                                                                                                                         |               140 |         1.00 |             0.00 |
    | AR-001          | Ajedrea                           | Aromáticas  | 15-20       | Murcia Seasons        | Planta aromática que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |               140 |         1.00 |             0.00 |
    | AR-008          | Thymus Citriodra (Tomillo limón)  | Aromáticas  | 15-20       | Murcia Seasons        | Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Región mediterránea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas. En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada.También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.              |               140 |         1.00 |             0.00 |
    | AR-009          | Thymus Vulgaris                   | Aromáticas  | 15-20       | Murcia Seasons        | Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Región mediterránea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas.
     En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada. También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.         |               140 |         1.00 |             0.00 |
    | FR-100          | Nectarina                         | Frutales    | 8/10        | Frutales Talavera S.A | Se trata de un árbol derivado por mutación de los melocotoneros comunes, y los únicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                50 |        11.00 |             8.00 |
    +-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+

      ```

  - Realice una consulta para cada uno de los modos de búsqueda full-text que existen en MySQL (IN NATURAL LANGUAGE MODE, IN BOOLEAN MODE y WITH QUERY EXPANSION) y compare los resultados que ha obtenido en cada caso.

      ```sql
      select * from producto where match (nombre, descripcion) against ('planta' in natural language mode);

      +-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
    | codigo_producto | nombre                            | gama        | dimensiones | proveedor             | descripcion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | cantidad_en_stock | precio_venta | precio_proveedor |
    +-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
    | AR-004          | Melissa                           | Aromáticas  | 15-20       | Murcia Seasons        | Es una planta perenne (dura varios años) conocida por el agradable y característico olor a limón que desprenden en verano. Nunca debe faltar en la huerta o jardín por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy fácil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por día. Cada año, su abonado mineral correspondiente.En otoño, la melisa pierde el agradable olor a limón que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotará de forma densa en primavera.                                                                                                                                                                                                                                                                                                                                                                                         |               140 |         1.00 |             0.00 |
    | AR-001          | Ajedrea                           | Aromáticas  | 15-20       | Murcia Seasons        | Planta aromática que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |               140 |         1.00 |             0.00 |
    | AR-008          | Thymus Citriodra (Tomillo limón)  | Aromáticas  | 15-20       | Murcia Seasons        | Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Región mediterránea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas. En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada.También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.              |               140 |         1.00 |             0.00 |
    | AR-009          | Thymus Vulgaris                   | Aromáticas  | 15-20       | Murcia Seasons        | Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Región mediterránea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas.
     En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada. También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.         |               140 |         1.00 |             0.00 |
    | FR-100          | Nectarina                         | Frutales    | 8/10        | Frutales Talavera S.A | Se trata de un árbol derivado por mutación de los melocotoneros comunes, y los únicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                50 |        11.00 |             8.00 |
    +-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+

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
  create view listado_pagos_clientes as select concat(nombre_contacto, apellido_contacto) as nombre_completo_cliente, telefono, ciudad, pais, fecha_pago, total, id_transaccion from cliente join pago on cliente.codigo_cliente = pago.codigo_cliente;

  +-------------------------+-------------+--------------------------+-----------+------------+----------+----------------+
  | nombre_completo_cliente | telefono    | ciudad                   | pais      | fecha_pago | total    | id_transaccion |
  +-------------------------+-------------+--------------------------+-----------+------------+----------+----------------+
  | Daniel GGoldFish        | 5556901745  | San Francisco            | USA       | 2008-11-10 |  2000.00 | ak-std-000001  |
  | Daniel GGoldFish        | 5556901745  | San Francisco            | USA       | 2008-12-10 |  2000.00 | ak-std-000002  |
  | AnneWright              | 5557410345  | Miami                    | USA       | 2009-01-16 |  5000.00 | ak-std-000003  |
  | AnneWright              | 5557410345  | Miami                    | USA       | 2009-02-16 |  5000.00 | ak-std-000004  |
  | AnneWright              | 5557410345  | Miami                    | USA       | 2009-02-19 |   926.00 | ak-std-000005  |
  | LinkFlaute              | 5552323129  | New York                 | USA       | 2007-01-08 | 20000.00 | ak-std-000006  |
  | LinkFlaute              | 5552323129  | New York                 | USA       | 2007-01-08 | 20000.00 | ak-std-000007  |
  | LinkFlaute              | 5552323129  | New York                 | USA       | 2007-01-08 | 20000.00 | ak-std-000008  |
  | LinkFlaute              | 5552323129  | New York                 | USA       | 2007-01-08 | 20000.00 | ak-std-000009  |
  | LinkFlaute              | 5552323129  | New York                 | USA       | 2007-01-08 |  1849.00 | ak-std-000010  |
  | AkaneTendo              | 55591233210 | Miami                    | USA       | 2006-01-18 | 23794.00 | ak-std-000011  |
  | JoseBermejo             | 654987321   | Madrid                   | Spain     | 2009-01-13 |  2390.00 | ak-std-000012  |
  | GuillermoRengifo        | 689234750   | Madrid                   | Spain     | 2009-01-06 |   929.00 | ak-std-000013  |
  | PedroCamunas            | 34914873241 | San Lorenzo del Escorial | Spain     | 2008-08-04 |  2246.00 | ak-std-000014  |
  | JuanRodriguez           | 34912453217 | Madrid                   | Spain     | 2008-07-15 |  4160.00 | ak-std-000015  |
  | JavierVillar            | 654865643   | Madrid                   | Spain     | 2009-01-15 |  2081.00 | ak-std-000016  |
  | JavierVillar            | 654865643   | Madrid                   | Spain     | 2009-02-15 | 10000.00 | ak-std-000035  |
  | MariaRodriguez          | 666555444   | Fuenlabrada              | Spain     | 2009-02-16 |  4399.00 | ak-std-000017  |
  | LuisMartinez            | 916458762   | Santa cruz de Tenerife   | Spain     | 2009-03-06 |   232.00 | ak-std-000018  |
  | MariaSantillana         | 915576622   | Sotogrande               | Spain     | 2009-03-26 |   272.00 | ak-std-000019  |
  | Eva Mar├¡aS├ínchez      | 916877445   | Madrid                   | Spain     | 2008-03-18 | 18846.00 | ak-std-000020  |
  | Mat├¡asSan Mart├¡n      | 916544147   | Madrid                   | Spain     | 2009-02-08 | 10972.00 | ak-std-000021  |
  | BenitoLopez             | 675432926   | Getafe                   | Spain     | 2009-01-13 |  8489.00 | ak-std-000022  |
  | SaraMarquez             | 675124537   | Fuenlabrada              | Spain     | 2009-01-16 |  7863.00 | ak-std-000024  |
  | JacobJones              | 2 9261-2433 | Sydney                   | Australia | 2007-10-06 |  3321.00 | ak-std-000025  |
  | JustinSmith             | 2 8005-7161 | Sydney                   | Australia | 2006-05-26 |  1171.00 | ak-std-000026  |
  +-------------------------+-------------+--------------------------+-----------+------------+----------+----------------+
  ```

  - Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas: código del cliente, nombre y apellidos del cliente concatendados, teléfono, ciudad, pais, código del pedido, fecha del pedido, fecha esperada, fecha de entrega y la cantidad total del pedido, que será la suma del producto de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.

<<<<<<< HEAD
   ```sql
   create view listado_pedidos_clientes 
   ```
=======
  ```sql
  create view listado_pedidos_clientes as select cl.codigo_cliente, concat(cl.nombre_contacto, cl.apellido_contacto) as nombre_cliente, cl.telefono, cl.ciudad, cl.pais, pe.codigo_pedido, pe.fecha_pedido, pe.fecha_esperada, pe.fecha_entrega, sum(detp.cantidad * detp.precio_unidad) as cantidad_total_pedido from cliente as cl join pedido as pe on cl.codigo_cliente = pe.codigo_cliente join detalle_pedido as detp on pe.codigo_pedido=detp.codigo_pedido group by cl.codigo_cliente, pe.codigo_pedido;
>>>>>>> 87ca1b7895767d25a3d19db64f3752a8b2fb253b

  +----------------+--------------------+-------------+--------------------------+-----------+---------------+--------------+----------------+---------------+-----------------------+
  | codigo_cliente | nombre_cliente     | telefono    | ciudad                   | pais      | codigo_pedido | fecha_pedido | fecha_esperada |  fecha_entrega | cantidad_total_pedido |
  +----------------+--------------------+-------------+--------------------------+-----------+---------------+--------------+----------------+--------------- +-----------------------+
  |              5 | AkaneTendo         | 55591233210 | Miami                    | USA       |             1 | 2006-01-17   | 2006-01-19     |  2006-01-19    |               1567.00 |
  |              5 | AkaneTendo         | 55591233210 | Miami                    | USA       |             2 | 2007-10-23   | 2007-10-28     |  2007-10-26    |               7113.00 |
  |              5 | AkaneTendo         | 55591233210 | Miami                    | USA       |             3 | 2008-06-20   | 2008-06-25     |  NULL          |              10850.00 |
  |              5 | AkaneTendo         | 55591233210 | Miami                    | USA       |             4 | 2009-01-20   | 2009-01-26     |  NULL          |               2624.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |             8 | 2008-11-09   | 2008-11-14     |  2008-11-14    |               1065.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |             9 | 2008-12-22   | 2008-12-27     |  2008-12-28    |               2535.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            10 | 2009-01-15   | 2009-01-20     |  NULL          |               2920.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            11 | 2009-01-20   | 2009-01-27     |  NULL          |                820.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            12 | 2009-01-22   | 2009-01-27     |  NULL          |                290.00 |
  |              7 | JoseBermejo        | 654987321   | Madrid                   | Spain     |            13 | 2009-01-12   | 2009-01-14     |  2009-01-15    |                738.00 |
  |              7 | JoseBermejo        | 654987321   | Madrid                   | Spain     |            14 | 2009-01-02   | 2009-01-02     |  NULL          |                829.00 |
  |              7 | JoseBermejo        | 654987321   | Madrid                   | Spain     |            15 | 2009-01-09   | 2009-01-12     |  2009-01-11    |                214.00 |
  |              7 | JoseBermejo        | 654987321   | Madrid                   | Spain     |            16 | 2009-01-06   | 2009-01-07     |  2009-01-15    |                234.00 |
  |              7 | JoseBermejo        | 654987321   | Madrid                   | Spain     |            17 | 2009-01-08   | 2009-01-09     |  2009-01-11    |                375.00 |
  |              9 | GuillermoRengifo   | 689234750   | Madrid                   | Spain     |            18 | 2009-01-05   | 2009-01-06     |  2009-01-07    |                116.00 |
  |              9 | GuillermoRengifo   | 689234750   | Madrid                   | Spain     |            19 | 2009-01-18   | 2009-02-12     |  NULL          |                333.00 |
  |              9 | GuillermoRengifo   | 689234750   | Madrid                   | Spain     |            20 | 2009-01-20   | 2009-02-15     |  NULL          |                292.00 |
  |              9 | GuillermoRengifo   | 689234750   | Madrid                   | Spain     |            21 | 2009-01-09   | 2009-01-09     |  2009-01-09    |                182.00 |
  |              9 | GuillermoRengifo   | 689234750   | Madrid                   | Spain     |            22 | 2009-01-11   | 2009-01-11     |  2009-01-13    |                  6.00 |
  |              5 | AkaneTendo         | 55591233210 | Miami                    | USA       |            23 | 2008-12-30   | 2009-01-10     |  NULL          |               1640.00 |
  |             14 | JuanRodriguez      | 34912453217 | Madrid                   | Spain     |            24 | 2008-07-14   | 2008-07-31     |  2008-07-25    |                287.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            25 | 2009-02-02   | 2009-02-08     |  NULL          |               1455.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            26 | 2009-02-06   | 2009-02-12     |  NULL          |                675.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            27 | 2009-02-07   | 2009-02-13     |  NULL          |                504.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            28 | 2009-02-10   | 2009-02-17     |  2009-02-20    |               2052.00 |
  |             14 | JuanRodriguez      | 34912453217 | Madrid                   | Spain     |            29 | 2008-08-01   | 2008-09-01     |  2008-09-01    |               1324.00 |
  |             13 | PedroCamunas       | 34914873241 | San Lorenzo del Escorial | Spain     |            30 | 2008-08-03   | 2008-09-03     |  2008-08-31    |                711.00 |
  |             13 | PedroCamunas       | 34914873241 | San Lorenzo del Escorial | Spain     |            31 | 2008-09-04   | 2008-09-30     |  2008-10-04    |                244.00 |
  |              4 | LinkFlaute         | 5552323129  | New York                 | USA       |            32 | 2007-01-07   | 2007-01-19     |  2007-01-27    |               3089.00 |
  |              4 | LinkFlaute         | 5552323129  | New York                 | USA       |            33 | 2007-05-20   | 2007-05-28     |  NULL          |              73226.00 |
  |              4 | LinkFlaute         | 5552323129  | New York                 | USA       |            34 | 2007-06-20   | 2008-06-28     |  2008-06-28    |               1532.00 |
  |              4 | LinkFlaute         | 5552323129  | New York                 | USA       |            35 | 2008-03-10   | 2009-03-20     | NULL
         |               1718.00 |
  |             14 | JuanRodriguez      | 34912453217 | Madrid                   | Spain     |            36 | 2008-10-15   | 2008-12-15     |  2008-12-10    |                311.00 |
  |              4 | LinkFlaute         | 5552323129  | New York                 | USA       |            37 | 2008-11-03   | 2009-11-13     |  NULL          |               2284.00 |
  |             19 | LuisMartinez       | 916458762   | Santa cruz de Tenerife   | Spain     |            38 | 2009-03-05   | 2009-03-06     |  2009-03-07    |                 98.00 |
  |             19 | LuisMartinez       | 916458762   | Santa cruz de Tenerife   | Spain     |            39 | 2009-03-06   | 2009-03-07     |  2009-03-09    |                108.00 |
  |             19 | LuisMartinez       | 916458762   | Santa cruz de Tenerife   | Spain     |            40 | 2009-03-09   | 2009-03-10     |  2009-03-13    |                 12.00 |
  |             19 | LuisMartinez       | 916458762   | Santa cruz de Tenerife   | Spain     |            41 | 2009-03-12   | 2009-03-13     |  2009-03-13    |                 10.00 |
  |             19 | LuisMartinez       | 916458762   | Santa cruz de Tenerife   | Spain     |            42 | 2009-03-22   | 2009-03-23     |  2009-03-27    |                  4.00 |
  |             23 | MariaSantillana    | 915576622   | Sotogrande               | Spain     |            43 | 2009-03-25   | 2009-03-26     |  2009-03-28    |                  9.00 |
  |             23 | MariaSantillana    | 915576622   | Sotogrande               | Spain     |            44 | 2009-03-26   | 2009-03-27     |  2009-03-30    |                  5.00 |
  |             23 | MariaSantillana    | 915576622   | Sotogrande               | Spain     |            45 | 2009-04-01   | 2009-03-04     |  2009-03-07    |                 10.00 |
  |             23 | MariaSantillana    | 915576622   | Sotogrande               | Spain     |            46 | 2009-04-03   | 2009-03-04     |  2009-03-05    |                 84.00 |
  |             23 | MariaSantillana    | 915576622   | Sotogrande               | Spain     |            47 | 2009-04-15   | 2009-03-17     |  2009-03-17    |                164.00 |
  |             26 | Eva Mar├¡aS├ínchez | 916877445   | Madrid                   | Spain     |            48 | 2008-03-17   | 2008-03-30     |  2008-03-29    |               6398.00 |
  |             26 | Eva Mar├¡aS├ínchez | 916877445   | Madrid                   | Spain     |            49 | 2008-07-12   | 2008-07-22     |  2008-07-30    |                625.00 |
  |             26 | Eva Mar├¡aS├ínchez | 916877445   | Madrid                   | Spain     |            50 | 2008-03-17   | 2008-08-09     |  NULL          |               3506.00 |
  |             26 | Eva Mar├¡aS├ínchez | 916877445   | Madrid                   | Spain     |            51 | 2008-10-01   | 2008-10-14     |  2008-10-14    |               7750.00 |
  |             26 | Eva Mar├¡aS├ínchez | 916877445   | Madrid                   | Spain     |            52 | 2008-12-07   | 2008-12-21     |  NULL          |                700.00 |
  |             13 | PedroCamunas       | 34914873241 | San Lorenzo del Escorial | Spain     |            53 | 2008-10-15   | 2008-11-15     |  2008-11-09    |                141.00 |
  |             14 | JuanRodriguez      | 34912453217 | Madrid                   | Spain     |            54 | 2009-01-11   | 2009-02-11     |  NULL          |                669.00 |
  |             14 | JuanRodriguez      | 34912453217 | Madrid                   | Spain     |            55 | 2008-12-10   | 2009-01-10     |  2009-01-11    |               1569.00 |
  |             13 | PedroCamunas       | 34914873241 | San Lorenzo del Escorial | Spain     |            56 | 2008-12-19   | 2009-01-20     |  NULL          |                377.00 |
  |             13 | PedroCamunas       | 34914873241 | San Lorenzo del Escorial | Spain     |            57 | 2009-01-05   | 2009-02-05     |  NULL          |                773.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            58 | 2009-01-24   | 2009-01-31     |  2009-01-30    |               4775.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            59 | 2008-11-09   | 2008-11-14     |  2008-11-14    |                700.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            60 | 2008-12-22   | 2008-12-27     |  2008-12-28    |                700.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            61 | 2009-01-15   | 2009-01-20     |  NULL          |                700.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            62 | 2009-01-20   | 2009-01-27     |  NULL          |                700.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            63 | 2009-01-22   | 2009-01-27     |  NULL          |                700.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            64 | 2009-01-24   | 2009-01-31     |  2009-01-30    |                700.00 |
  |              1 | Daniel GGoldFish   | 5556901745  | San Francisco            | USA       |            65 | 2009-02-02   | 2009-02-08     |  NULL          |                700.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            66 | 2009-02-06   | 2009-02-12     |  NULL          |                700.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            67 | 2009-02-07   | 2009-02-13     |  NULL          |                700.00 |
  |              3 | AnneWright         | 5557410345  | Miami                    | USA       |            68 | 2009-02-10   | 2009-02-17     |  2009-02-20    |                700.00 |
  |             15 | JavierVillar       | 654865643   | Madrid                   | Spain     |            74 | 2009-01-14   | 2009-01-22     |  NULL          |               3562.00 |
  |             15 | JavierVillar       | 654865643   | Madrid                   | Spain     |            75 | 2009-01-11   | 2009-01-13     |  2009-01-13    |               1048.00 |
  |             15 | JavierVillar       | 654865643   | Madrid                   | Spain     |            76 | 2008-11-15   | 2008-11-23     |  2008-11-23    |               2223.00 |
  |             15 | JavierVillar       | 654865643   | Madrid                   | Spain     |            77 | 2009-01-03   | 2009-01-08     |  NULL          |                588.00 |
  |             15 | JavierVillar       | 654865643   | Madrid                   | Spain     |            78 | 2008-12-15   | 2008-12-17     |  2008-12-17    |               4660.00 |
  |             28 | BenitoLopez        | 675432926   | Getafe                   | Spain     |            79 | 2009-01-12   | 2009-01-13     |  2009-01-13    |                300.00 |
  |             28 | BenitoLopez        | 675432926   | Getafe                   | Spain     |            80 | 2009-01-25   | 2009-01-26     |  NULL          |               5773.00 |
  |             28 | BenitoLopez        | 675432926   | Getafe                   | Spain     |            81 | 2009-01-18   | 2009-01-24     |  NULL          |                120.00 |
  |             28 | BenitoLopez        | 675432926   | Getafe                   | Spain     |            82 | 2009-01-20   | 2009-01-29     |  2009-01-29    |               2176.00 |
  |             28 | BenitoLopez        | 675432926   | Getafe                   | Spain     |            83 | 2009-01-24   | 2009-01-28     |  NULL          |                120.00 |
  |             35 | JacobJones         | 2 9261-2433 | Sydney                   | Australia |            89 | 2007-10-05   | 2007-12-13     |  2007-12-10    |                710.00 |
  |             27 | Mat├¡asSan Mart├¡n | 916544147   | Madrid                   | Spain     |            90 | 2009-02-07   | 2008-02-17     |  NULL          |                 41.00 |
  |             27 | Mat├¡asSan Mart├¡n | 916544147   | Madrid                   | Spain     |            91 | 2009-03-18   | 2009-03-29     |  2009-03-27    |               1384.00 |
  |             27 | Mat├¡asSan Mart├¡n | 916544147   | Madrid                   | Spain     |            92 | 2009-04-19   | 2009-04-30     |  2009-05-03    |               2906.00 |
  |             27 | Mat├¡asSan Mart├¡n | 916544147   | Madrid                   | Spain     |            93 | 2009-05-03   | 2009-05-30     |  2009-05-17    |                882.00 |
  |             27 | Mat├¡asSan Mart├¡n | 916544147   | Madrid                   | Spain     |            94 | 2009-10-18   | 2009-11-01     |  NULL          |               5759.00 |
  |             35 | JacobJones         | 2 9261-2433 | Sydney                   | Australia |            95 | 2008-01-04   | 2008-01-19     |  2008-01-19    |                605.00 |
  |             35 | JacobJones         | 2 9261-2433 | Sydney                   | Australia |            96 | 2008-03-20   | 2008-04-12     |  2008-04-13    |                660.00 |
  |             35 | JacobJones         | 2 9261-2433 | Sydney                   | Australia |            97 | 2008-10-08   | 2008-11-25     |  2008-11-25    |                322.00 |
  |             35 | JacobJones         | 2 9261-2433 | Sydney                   | Australia |            98 | 2009-01-08   | 2009-02-13     |  NULL          |               1024.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |            99 | 2009-02-15   | 2009-02-27     |  NULL          |               2070.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           100 | 2009-01-10   | 2009-01-15     |  2009-01-15    |                800.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           101 | 2009-03-07   | 2009-03-27     |  NULL          |                209.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           102 | 2008-12-28   | 2009-01-08     |  2009-01-08    |                660.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           103 | 2009-01-15   | 2009-01-20     |  2009-01-24    |                304.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           104 | 2009-03-02   | 2009-03-06     |  2009-03-06    |               1760.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           105 | 2009-02-14   | 2009-02-20     |  NULL          |               1506.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           106 | 2009-05-13   | 2009-05-15     |  2009-05-20    |               1077.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           107 | 2009-04-06   | 2009-04-10     |  2009-04-10    |               3216.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           108 | 2009-04-09   | 2009-04-15     |  2009-04-15    |                660.00 |
  |             38 | JustinSmith        | 2 8005-7161 | Sydney                   | Australia |           109 | 2006-05-25   | 2006-07-28     |  2006-07-28    |                553.00 |
  |             38 | JustinSmith        | 2 8005-7161 | Sydney                   | Australia |           110 | 2007-03-19   | 2007-04-24     |  2007-04-24    |                149.00 |
  |             36 | AntonioRomero      | 654352981   | Madrid                   | Spain     |           111 | 2008-03-05   | 2008-03-30     |  2008-03-30    |                700.00 |
  |             36 | AntonioRomero      | 654352981   | Madrid                   | Spain     |           112 | 2009-03-05   | 2009-04-06     |  2009-05-07    |                700.00 |
  |             36 | AntonioRomero      | 654352981   | Madrid                   | Spain     |           113 | 2008-10-28   | 2008-11-09     |  2009-01-09    |                700.00 |
  |             36 | AntonioRomero      | 654352981   | Madrid                   | Spain     |           114 | 2009-01-15   | 2009-01-29     |  2009-01-31    |                700.00 |
  |             36 | AntonioRomero      | 654352981   | Madrid                   | Spain     |           115 | 2008-11-29   | 2009-01-26     |  2009-02-27    |                700.00 |
  |             38 | JustinSmith        | 2 8005-7161 | Sydney                   | Australia |           116 | 2008-06-28   | 2008-08-01     |  2008-08-01    |                264.00 |
  |             38 | JustinSmith        | 2 8005-7161 | Sydney                   | Australia |           117 | 2008-08-25   | 2008-10-01     |  NULL          |                154.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           118 | 2009-02-15   | 2009-02-27     |  NULL          |                700.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           119 | 2009-01-10   | 2009-01-15     |  2009-01-15    |                700.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           120 | 2009-03-07   | 2009-03-27     |  NULL          |                700.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           121 | 2008-12-28   | 2009-01-08     |  2009-01-08    |                700.00 |
  |             16 | MariaRodriguez     | 666555444   | Fuenlabrada              | Spain     |           122 | 2009-04-09   | 2009-04-15     |  2009-04-15    |                700.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           123 | 2009-01-15   | 2009-01-20     |  2009-01-24    |                700.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           124 | 2009-03-02   | 2009-03-06     |  2009-03-06    |                700.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           125 | 2009-02-14   | 2009-02-20     |  NULL          |                700.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           126 | 2009-05-13   | 2009-05-15     |  2009-05-20    |                700.00 |
  |             30 | SaraMarquez        | 675124537   | Fuenlabrada              | Spain     |           127 | 2009-04-06   | 2009-04-10     |  2009-04-10    |                700.00 |
  |             38 | JustinSmith        | 2 8005-7161 | Sydney                   | Australia |           128 | 2008-11-10   | 2008-12-10     |  2008-12-29    |                 51.00 |
  +----------------+--------------------+-------------+--------------------------+-----------+---------------+--------------+----------------+--------------- +-----------------------+
  ```




  


