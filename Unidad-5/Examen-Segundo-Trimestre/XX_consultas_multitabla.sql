-- ----------------------------------------
-- Consultas sobre una tabla
-- 0,2 puntos la correcta. Total = 1,4 puntos
-- ----------------------------------------

-- 1.- Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados
-- por la fecha de realización, mostrando en primer lugar las compras más recientes.
select * from compra order by fecha desc;

+----+---------+------------+---------------+------------------+
| id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+---------+------------+---------------+------------------+
| 15 | 370.85  | 2022-03-11 | 1             | 5                |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                |
| 13 | 545.75  | 2022-01-25 | 6             | 1                |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 1  | 150.5   | 2020-10-05 | 5             | 2                |
| 3  | 65.26   | 2020-10-05 | 2             | 1                |
| 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                |
| 14 | 145.82  | 2020-02-02 | 6             | 1                |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                |
| 2  | 270.65  | 2019-09-10 | 1             | 5                |
| 4  | 110.5   | 2019-08-17 | 8             | 3                |
| 11 | 75.29   | 2019-08-17 | 3             | 7                |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                |
| 10 | 250.45  | 2018-06-27 | 8             | 2                |
+----+---------+------------+---------------+------------------+

-- 2. Devuelve todos los datos de los dos compras de mayor valor.
select * from compra order by total desc limit 2;

+----+--------+------------+---------------+------------------+
| id | total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+------------+---------------+------------------+
| 7  | 5760.0 | 2018-09-10 | 2             | 1                |
| 12 | 3045.6 | 2020-04-25 | 2             | 1                |
+----+--------+------------+---------------+------------------+

-- 3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

select distinct(id) from consumidor ;
+----+
| id |
+----+
| 1  |
| 2  |
| 3  |
| 4  |
| 5  |
| 6  |
| 7  |
| 8  |
| 9  |
| 10 |
+----+

-- 4. Devuelve un listado de todos las compras que se realizaron durante el año 2020,
-- cuya cantidad total sea superior a 500€.
select * from compra where fecha regexp "2020" and total > 500;

+----+---------+------------+---------------+------------------+
| id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+---------+------------+---------------+------------------+
| 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                |
+----+---------+------------+---------------+------------------+

-- 5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.
select * from suministrador where categoria between 0.11 and 0.15;

+----+---------+-----------+-----------+-----------+
| id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+-----------+-----------+-----------+
| 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 2  | Juan    | Gómez     | López     | 0.13      |
| 3  | Diego   | Flores    | Salas     | 0.11      |
| 4  | Marta   | Herrera   | Gil       | 0.14      |
| 5  | Antonio | Carretero | Ortega    | 0.12      |
| 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 7  | Antonio | Vega      | Hernández | 0.11      |
+----+---------+-----------+-----------+-----------+

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.
select categoria from suministrador order by categoria desc limit 1;

+-----------+
| categoria |
+-----------+
| 0.15      |
+-----------+

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL.
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

select id, nombre, apellido1 from consumidor where apellido2 is not null order by apellido1, apellido2, nombre;

+----+-----------+-----------+
| id |  nombre   | apellido1 |
+----+-----------+-----------+
| 5  | Marcos    | Loyola    |
| 9  | Guillermo | López     |
| 1  | Aarón     | Rivero    |
| 3  | Adolfo    | Rubio     |
| 8  | Pepe      | Ruiz      |
| 2  | Adela     | Salas     |
| 10 | Daniel    | Santana   |
| 6  | María     | Santana   |
+----+-----------+-----------+

-- (Consultas Multitabla Where)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total =  2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct con.id, con.nombre, con.apellido1, con.apellido2 from consumidor as con, compra as com where con.id=com.id_consumidor;^

+----+--------+-----------+-----------+
| id | nombre | apellido1 | apellido2 |
+----+--------+-----------+-----------+
| 5  | Marcos | Loyola    | Méndez    |
| 1  | Aarón  | Rivero    | Gómez     |
| 2  | Adela  | Salas     | Díaz      |
| 8  | Pepe   | Ruiz      | Santana   |
| 7  | Pilar  | Ruiz      |           |
| 4  | Adrián | Suárez    |           |
| 3  | Adolfo | Rubio     | Flores    |
| 6  | María  | Santana   | Moreno    |
+----+--------+-----------+-----------+

-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select distinct com.*, con.* from compra as com, consumidor as con where con.id=com.id_consumidor order by con.nombre; 

+----+---------+------------+---------------+------------------+----+--------+-----------+-----------+---------+-----------+
| id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+---------+------------+---------------+------------------+----+--------+-----------+-----------+---------+-----------+
| 2  | 270.65  | 2019-09-10 | 1             | 5                | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 15 | 370.85  | 2022-03-11 | 1             | 5                | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 3  | 65.26   | 2020-10-05 | 2             | 1                | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 11 | 75.29   | 2019-08-17 | 3             | 7                | 3  | Adolfo | Rubio     | Flores    | Sevilla |           |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                | 4  | Adrián | Suárez    |           | Jaén    | 300       |
| 1  | 150.5   | 2020-10-05 | 5             | 2                | 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
| 5  | 948.5   | 2020-09-10 | 5             | 2                | 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
| 13 | 545.75  | 2022-01-25 | 6             | 1                | 6  | María  | Santana   | Moreno    | Cádiz   | 100       |
| 14 | 145.82  | 2020-02-02 | 6             | 1                | 6  | María  | Santana   | Moreno    | Cádiz   | 100       |
| 4  | 110.5   | 2019-08-17 | 8             | 3                | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 10 | 250.45  | 2018-06-27 | 8             | 2                | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                | 7  | Pilar  | Ruiz      |           | Sevilla | 300       |
+----+---------+------------+---------------+------------------+----+--------+-----------+-----------+---------+-----------+

-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.

select com.*, sum.* from compra as com, suministrador as sum where sum.id=com.id_consumidor order by nombre;

+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 4  | 110.5   | 2019-08-17 | 8             | 3                | 8  | Alfredo | Ruiz      | Flores    | 0.05      |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                | 8  | Alfredo | Ruiz      | Flores    | 0.05      |
| 10 | 250.45  | 2018-06-27 | 8             | 2                | 8  | Alfredo | Ruiz      | Flores    | 0.05      |
| 1  | 150.5   | 2020-10-05 | 5             | 2                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 5  | 948.5   | 2020-09-10 | 5             | 2                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                | 7  | Antonio | Vega      | Hernández | 0.11      |
| 2  | 270.65  | 2019-09-10 | 1             | 5                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 15 | 370.85  | 2022-03-11 | 1             | 5                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 11 | 75.29   | 2019-08-17 | 3             | 7                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 3  | 65.26   | 2020-10-05 | 2             | 1                | 2  | Juan    | Gómez     | López     | 0.13      |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                | 2  | Juan    | Gómez     | López     | 0.13      |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                | 2  | Juan    | Gómez     | López     | 0.13      |
| 13 | 545.75  | 2022-01-25 | 6             | 1                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 14 | 145.82  | 2020-02-02 | 6             | 1                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                | 4  | Marta   | Herrera   | Gil       | 0.14      |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+

-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
select con.*, com.*, sum.* from consumidor as con, compra as com, suministrador as sum where con.id=com.id_consumidor and sum.id=com.id_suministrador;
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+

-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
select con.*, com.fecha, com.total from consumidor as con, compra as com where con.id=com.id_consumidor and com.fecha regexp '2020-' and com
.total between 300 and 1000;

+----+--------+-----------+-----------+---------+-----------+------------+-------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria |   fecha    | total |
+----+--------+-----------+-----------+---------+-----------+------------+-------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 2020-09-10 | 948.5 |
+----+--------+-----------+-----------+---------+-----------+------------+-------+

-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
select sum.nombre, sum.apellido1, sum.apellido2 from suministrador as sum, compra as com, consumidor as con where sum.id=com.id_suministrador and con.id=com.id_consumidor and con.nombre regexp 'María' and con.apellido1 regexp 'Santana' and con.apellido2 regexp 'Moreno';

+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Daniel | Sáez      | Vega      |
| Daniel | Sáez      | Vega      |
+--------+-----------+-----------+
-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
select con.nombre from consumidor as con, compra as com, suministrador as sum where sum.id=com.id_suministrador and con.id=com.id_consumidor and sum.nombre regexp 'Daniel' and sum.apellido1 regexp 'Sáez' and sum.apellido2 regexp 'Vega';

+--------+
| nombre |
+--------+
| Adela  |
| Pilar  |
| Adela  |
| Adela  |
| María  |
| María  |
+--------+

-- (Consultas Multitabla Join)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total = 2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct con.id, con.nombre, con.apellido1, con.apellido2 from consumidor as con join compra as com on con.id=com.id order by con.nombre asc;

+----+-----------+-----------+-----------+
| id |  nombre   | apellido1 | apellido2 |
+----+-----------+-----------+-----------+
| 1  | Aarón     | Rivero    | Gómez     |
| 2  | Adela     | Salas     | Díaz      |
| 3  | Adolfo    | Rubio     | Flores    |
| 4  | Adrián    | Suárez    |           |
| 10 | Daniel    | Santana   | Loyola    |
| 9  | Guillermo | López     | Gómez     |
| 5  | Marcos    | Loyola    | Méndez    |
| 6  | María     | Santana   | Moreno    |
| 8  | Pepe      | Ruiz      | Santana   |
| 7  | Pilar     | Ruiz      |           |
+----+-----------+-----------+-----------+

-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select com.*, con.* from compra as com join consumidor as con on com.id_consumidor=con.id order by con.nombre desc;
+----+---------+------------+---------------+------------------+----+--------+-----------+-----------+---------+-----------+
| id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+---------+------------+---------------+------------------+----+--------+-----------+-----------+---------+-----------+
| 6  | 2400.6  | 2019-07-27 | 7             | 1                | 7  | Pilar  | Ruiz      |           | Sevilla | 300       |
| 4  | 110.5   | 2019-08-17 | 8             | 3                | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 10 | 250.45  | 2018-06-27 | 8             | 2                | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 13 | 545.75  | 2022-01-25 | 6             | 1                | 6  | María  | Santana   | Moreno    | Cádiz   | 100       |
| 14 | 145.82  | 2020-02-02 | 6             | 1                | 6  | María  | Santana   | Moreno    | Cádiz   | 100       |
| 1  | 150.5   | 2020-10-05 | 5             | 2                | 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
| 5  | 948.5   | 2020-09-10 | 5             | 2                | 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                | 4  | Adrián | Suárez    |           | Jaén    | 300       |
| 11 | 75.29   | 2019-08-17 | 3             | 7                | 3  | Adolfo | Rubio     | Flores    | Sevilla |           |
| 3  | 65.26   | 2020-10-05 | 2             | 1                | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 2  | 270.65  | 2019-09-10 | 1             | 5                | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 15 | 370.85  | 2022-03-11 | 1             | 5                | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
+----+---------+------------+---------------+------------------+----+--------+-----------+-----------+---------+-----------+

-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
select com.*, sum.* from compra as com join suministrador as sum on com.id_suministrador=sum.id;

+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+

-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
select con.*, sum.* from consumidor as con join compra as com on con.id=com.id_consumidor join suministrador as sum on sum.id=com.id_suministrador;

┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴───────────┴───────────┴───────────┘

-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
select con.* from consumidor as con join compra as com on con.id=com.id_consumidor where com.fecha regexp '2020-' and com.total between 300 and 1000;

+----+--------+-----------+-----------+---------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+--------+-----------+-----------+---------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
+----+--------+-----------+-----------+---------+-----------+
-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
select sum.nombre, sum.apellido1, sum.apellido2 from suministrador as sum join compra as com on sum.id=com.id_suministrador join consumidor as con on con.id=com.id_consumidor where con.nombre regexp 'María' and con.apellido1 regexp 'Santana' and con.apellido2 regexp 'Moreno';

┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘
-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
select con.nombre from consumidor as con, suministrador as sum join compras as com on sum.id=


-- ---------------------------
-- Consultas resumen (funciones)
-- -----------------------------------------------
-- 0,2 puntos la correcta. (1-6) 1,2 puntos
-- 0,25 puntos la correcta. (7-10) 1 punto.
-- Total = 2,2 puntos
-- -----------------------------------------------

-- 1. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.
-- 2. Calcula el número total de suministradores distintos que aparecen en la tabla compra.
-- 3. Calcula el número total de consumidores que aparecen en la tabla consumidor.
-- 4. Calcula cuál es la mayor cantidad que aparece en la tabla compra.
-- 5. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.

-- 6. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores.
-- Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra.
-- Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.
select con.id, con.nombre, con.apellido1, con.apellido2, com.fecha, max(com.total) from consumidor as con, compra as com where con.id=com.id_consumidor group by com.fecha;

┌────┬────────┬───────────┬───────────┬────────────┬────────────────┐
│ id │ nombre │ apellido1 │ apellido2 │   fecha    │ max(com.total) │
├────┼────────┼───────────┼───────────┼────────────┼────────────────┤
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2018-06-27 │ 250.45         │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2018-09-10 │ 5760.0         │
│ 7  │ Pilar  │ Ruiz      │           │ 2019-07-27 │ 2400.6         │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2019-08-17 │ 110.5          │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2019-09-10 │ 270.65         │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2019-10-10 │ 2480.4         │
│ 6  │ María  │ Santana   │ Moreno    │ 2020-02-02 │ 145.82         │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2020-04-25 │ 3045.6         │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2020-09-10 │ 948.5          │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2020-10-05 │ 150.5          │
│ 4  │ Adrián │ Suárez    │           │ 2020-10-10 │ 1983.43        │
│ 6  │ María  │ Santana   │ Moreno    │ 2022-01-25 │ 545.75         │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2022-03-11 │ 2389.23        │
└────┴────────┴───────────┴───────────┴────────────┴────────────────┘
-- 7. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores,
-- teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.
select con.id, con.nombre, con.apellido1, con.apellido2, com.fecha, max(com.total) from consumidor as con, compra as com where con.id=com.id_consumidor group by com.fecha having com.total > 2000;

┌────┬────────┬───────────┬───────────┬────────────┬────────────────┐
│ id │ nombre │ apellido1 │ apellido2 │   fecha    │ max(com.total) │
├────┼────────┼───────────┼───────────┼────────────┼────────────────┤
│ 2  │ Adela  │ Salas     │ Díaz      │ 2018-09-10 │ 5760.0         │
│ 7  │ Pilar  │ Ruiz      │           │ 2019-07-27 │ 2400.6         │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2019-10-10 │ 2480.4         │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2020-04-25 │ 3045.6         │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2022-03-11 │ 2389.23        │
└────┴────────┴───────────┴───────────┴────────────┴────────────────┘

-- 8. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17.
-- Muestra el identificador del suministrador, nombre, apellidos y total.
select sum.id, sum.nombre, sum.apellido1, sum.apellido2, max(com.total), com.fecha from suministrador as sum, compra as com where sum.id=com.id_suministrador and com.fecha regexp '2020-08-17';

┌────┬────────┬───────────┬───────────┬────────────────┬───────┐
│ id │ nombre │ apellido1 │ apellido2 │ max(com.total) │ fecha │
├────┼────────┼───────────┼───────────┼────────────────┼───────┤
│    │        │           │           │                │       │
└────┴────────┴───────────┴───────────┴────────────────┴───────┘
-- 9. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores.
-- Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra.
-- Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.

-- 10. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.

-- ---------------------
-- Subconsultas
-- -----------------------------------------------
-- 0,2 puntos la correcta (1-5).
-- 0,3 puntos la correcta (6-9).
-- Total = 2,2 puntos
-- -----------------------------------------------

--- Con operadores básicos de comparación

-- 1. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select * from compra where id_consumidor = (select id from consumidor where nombre regexp 'Adela');

┌────┬────────┬────────────┬───────────────┬──────────────────┐
│ id │ total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼────────────┼───────────────┼──────────────────┤
│ 3  │ 65.26  │ 2020-10-05 │ 2             │ 1                │
│ 7  │ 5760.0 │ 2018-09-10 │ 2             │ 1                │
│ 12 │ 3045.6 │ 2020-04-25 │ 2             │ 1                │
└────┴────────┴────────────┴───────────────┴──────────────────┘
-- 2. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.
select fecha, min(total) from compra where id_consumidor = (select id from consumidor where nombre regexp 'Pepe' and apellido1 regexp 'Ruiz' and apellido2 regexp 'Santana');

┌────────────┬────────────┐
│   fecha    │ min(total) │
├────────────┼────────────┤
│ 2019-08-17 │ 110.5      │
└────────────┴────────────┘

-- 3. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)
select count(id) from compra where id_suministrador = (select id from suministrador where nombre regexp 'Daniel' and apellido1 regexp 'Sáez' and apellido2 regexp 'Vega');

┌───────────┐
│ count(id) │
├───────────┤
│ 6         │
└───────────┘
-- 4. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)
select * from consumidor where id = (select id_consumidor from compra where total = (select max(total) from compra where fecha regexp '2021-'));

-- 5. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.

-- 6. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).
select * from consumidor where id not in (select id_consumidor from compra);

┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘

-- 7. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).
select * from suministrador where id not in (select id_suministrador from compra);

┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘

-- 8. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
select  con.* from consumidor as con where not exists (select com.id_consumidor from compra as com where com.id_consumidor=con.id);

┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘

-- 9. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
select sum.* from suministrador as sum where not exists (select com.id_suministrador from compra as com where com.id_suministrador=sum.id);

┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘