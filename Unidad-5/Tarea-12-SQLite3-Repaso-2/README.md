## Crear las tablas e insertar sus datos

```sql
create table cliente (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nombre TEXT,
     apellido1 TEXT,
     apellido2 TEXT,
     ciudad TEXT,
     categoria INTEGER 
);
```

```sql
create table comercial (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nombre TEXT,
     apellido1 TEXT,
     apellido2 TEXT,
     categoria REAL 
);
```

```sql
create table pedido (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	total REAL,
     fecha TEXT,
     id_cliente INTEGER,
     id_comercial INTEGER 
);
```

## Consultas sobre una tabla
Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
```sql
select * from pedido order by fecha desc;

┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└────┴─────────┴────────────┴────────────┴──────────────┘
```


Devuelve todos los datos de los dos pedidos de mayor valor.
```sql
select * from pedido order by total desc limit 2;

┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
```

Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
```sql
```


Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
```sql
select * from pedido where fecha regexp '2017' and total > 500;

┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴─────────┴────────────┴────────────┴──────────────┘
```


Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
```sql
select nombre, apellido1, apellido2, categoria from comercial where categoria between 0.05 and 0.11;

┌─────────┬───────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │ categoria │
├─────────┼───────────┼───────────┼───────────┤
│ Diego   │ Flores    │ Salas     │ 0.11      │
│ Antonio │ Vega      │ Hernández │ 0.11      │
│ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└─────────┴───────────┴───────────┴───────────┘
```


Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
```sql
select max(categoria) as mayor_comision from comercial;

┌────────────────┐
│ mayor_comision │
├────────────────┤
│ 0.15           │
└────────────────┘
```


Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
```sql
select id, nombre, apellido1 from cliente where apellido2 is not null order by nombre desc, apellido1 desc;

┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 8  │ Pepe      │ Ruiz      │
│ 6  │ María     │ Santana   │
│ 5  │ Marcos    │ Loyola    │
│ 9  │ Guillermo │ López     │
│ 10 │ Daniel    │ Santana   │
│ 3  │ Adolfo    │ Rubio     │
│ 2  │ Adela     │ Salas     │
│ 1  │ Aarón     │ Rivero    │
└────┴───────────┴───────────┘
```


Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
```sql
select nombre from cliente where nombre like 'A%n' or nombre like 'P%' order by nombre asc;

┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
│ Pepe   │
│ Pilar  │
└────────┘
```


Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
```sql
select nombre from cliente where nombre not like 'A%' order by nombre asc;

┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘
```


Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
```sql
select distinct nombre from comercial where nombre like '%el' or nombre like '%o';

┌─────────┐
│ nombre  │
├─────────┤
│ Daniel  │
│ Diego   │
│ Antonio │
│ Manuel  │
│ Alfredo │
└─────────┘
```

## Consultas multitabla

Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
```sql
select distinct cl.id, cl.nombre, cl.apellido1, cl.apellido2 from cliente as cl, pedido as p where cl.id=p.id_cliente order by nombre asc, apellido1 asc, apellido2 asc;

┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘
```


Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
```sql
```


Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
```sql
```


Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
```sql
select p.*, co.* from pedido as p, comercial as co where p.id_comercial=co.id order by nombre asc;

┌────┬─────────┬────────────┬────────────┬──────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼────────────┼────────────┼──────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
└────┴─────────┴────────────┴────────────┴──────────────┴────┴─────────┴───────────┴───────────┴───────────┘
```


Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
```sql
select cl.nombre, p.fecha, p.total from cliente as cl, pedido as p where cl.id=p.id_cliente and fecha regexp  '2017' and p.total between 300 and 1000;

┌────────┬────────────┬───────┐
│ nombre │   fecha    │ total │
├────────┼────────────┼───────┤
│ Marcos │ 2017-09-10 │ 948.5 │
└────────┴────────────┴───────┘
```


Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
```sql
select distinct co.nombre, co.apellido1, co.apellido2 from comercial as co, pedido as p, cliente as cl where co.id=p.id_comercial and p.id_cliente=cl.id and cl.nombre='María' and cl.apellido1='Santana' and cl.apellido2='Moreno';

┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘
```


Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
```sql
select distinct cl.nombre from cliente as cl, pedido as p, comercial as co where co.id = p.id_comercial and p.id_cliente = cl.id and co.nombre = 'Daniel' and co.apellido1 = 'Sáez' and co.apellido2 = 'Vega';

┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ María  │
└────────┘
```

## Consultas resumen (Funciones)

Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
```sql
select sum(total) as total_pedidos from pedido;

┌───────────────┐
│ total_pedidos │
├───────────────┤
│ 20992.83      │
└───────────────┘
```


Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
```sql
select avg(total) as media_pedidos from pedido;

┌───────────────┐
│ media_pedidos │
├───────────────┤
│ 1312.051875   │
└───────────────┘
```


Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
```sql
select count(distinct id_comercial) as total_comerciales from pedido;

┌───────────────────┐
│ total_comerciales │
├───────────────────┤
│ 6                 │
└───────────────────┘
```


Calcula el número total de clientes que aparecen en la tabla cliente.
```sql
 select count(distinct id) as total_clientes from cliente;

┌────────────────┐
│ total_clientes │
├────────────────┤
│ 10             │
└────────────────┘
```


Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
```sql
select max(total) as maxima_cantidad from pedido;

┌─────────────────┐
│ maxima_cantidad │
├─────────────────┤
│ 5760.0          │
└─────────────────┘
```


Calcula cuál es la menor cantidad que aparece en la tabla pedido.
```sql
```


Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
```sql
select min(total) as minima_cantidad from pedido;

┌─────────────────┐
│ minima_cantidad │
├─────────────────┤
│ 65.26           │
└─────────────────┘
```


Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
```sql
select p.id_cliente, cl.nombre, cl.apellido1, cl.apellido2, date(p.fecha) as fecha, max(p.total) as max_valor from pedido as p, cliente as cl, comercial as c where p.id_cliente=cl.id group by p.id_cliente, date(p.fecha);

┌────────────┬────────┬───────────┬───────────┬────────────┬───────────┐
│ id_cliente │ nombre │ apellido1 │ apellido2 │   fecha    │ max_valor │
├────────────┼────────┼───────────┼───────────┼────────────┼───────────┤
│ 1          │ Aarón  │ Rivero    │ Gómez     │ 2016-09-10 │ 270.65    │
│ 1          │ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23   │
│ 2          │ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0    │
│ 2          │ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6    │
│ 2          │ Adela  │ Salas     │ Díaz      │ 2017-10-05 │ 65.26     │
│ 3          │ Adolfo │ Rubio     │ Flores    │ 2016-08-17 │ 75.29     │
│ 4          │ Adrián │ Suárez    │           │ 2017-10-10 │ 1983.43   │
│ 5          │ Marcos │ Loyola    │ Méndez    │ 2017-09-10 │ 948.5     │
│ 5          │ Marcos │ Loyola    │ Méndez    │ 2017-10-05 │ 150.5     │
│ 6          │ María  │ Santana   │ Moreno    │ 2017-02-02 │ 145.82    │
│ 6          │ María  │ Santana   │ Moreno    │ 2019-01-25 │ 545.75    │
│ 7          │ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6    │
│ 8          │ Pepe   │ Ruiz      │ Santana   │ 2015-06-27 │ 250.45    │
│ 8          │ Pepe   │ Ruiz      │ Santana   │ 2016-08-17 │ 110.5     │
│ 8          │ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4    │
└────────────┴────────┴───────────┴───────────┴────────────┴───────────┘
```


Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
```sql
select p.id_cliente, cl.nombre, cl.apellido1, cl.apellido2, date(p.fecha) as fecha, max(p.total) as max_valor from pedido as p, cliente as cl, comercial as c where p.id_cliente=cl.id and p.total > 2000 group by p.id_cliente, date(p.fecha);

┌────────────┬────────┬───────────┬───────────┬────────────┬───────────┐
│ id_cliente │ nombre │ apellido1 │ apellido2 │   fecha    │ max_valor │
├────────────┼────────┼───────────┼───────────┼────────────┼───────────┤
│ 1          │ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23   │
│ 2          │ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0    │
│ 2          │ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6    │
│ 7          │ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6    │
│ 8          │ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4    │
└────────────┴────────┴───────────┴───────────┴────────────┴───────────┘
```


Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
```sql
 select co.id, co.nombre, co.apellido1, co.apellido2, max(p.total) as max_valor from comercial as co, cliente as cl, pedido as p where co.id=p.id_comercial and date(p.fecha) ='2016-08-17';

┌────┬────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ max_valor │
├────┼────────┼───────────┼───────────┼───────────┤
│ 3  │ Diego  │ Flores    │ Salas     │ 110.5     │
└────┴────────┴───────────┴───────────┴───────────┘
```


Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
```sql
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, count(p.id_cliente) from cliente as cl left join pedido as p on cl.id=p.id_cliente group by cl.id, cl.nombre, cl.apellido1, cl.apellido2;

┌────┬───────────┬───────────┬───────────┬─────────────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ count(p.id_cliente) │
├────┼───────────┼───────────┼───────────┼─────────────────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │ 3                   │
│ 2  │ Adela     │ Salas     │ Díaz      │ 3                   │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ 1                   │
│ 4  │ Adrián    │ Suárez    │           │ 1                   │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ 2                   │
│ 6  │ María     │ Santana   │ Moreno    │ 2                   │
│ 7  │ Pilar     │ Ruiz      │           │ 1                   │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ 3                   │
│ 9  │ Guillermo │ López     │ Gómez     │ 0                   │
│ 10 │ Daniel    │ Santana   │ Loyola    │ 0                   │
└────┴───────────┴───────────┴───────────┴─────────────────────┘
```


Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
```sql
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, count(p.id) from cliente as cl left join pedido as p on cl.id=p.id_cliente where p.fecha regexp '2017' group by cl.id, cl.nombre, cl.apellido1, cl.apellido2 order by cl.apellido1, cl.nombre;

┌────┬────────┬───────────┬───────────┬─────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ count(p.id) │
├────┼────────┼───────────┼───────────┼─────────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2           │
│ 2  │ Adela  │ Salas     │ Díaz      │ 2           │
│ 6  │ María  │ Santana   │ Moreno    │ 1           │
│ 4  │ Adrián │ Suárez    │           │ 1           │
└────┴────────┴───────────┴───────────┴─────────────┘
```


Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
```sql
La misma consulta que la 11
```


Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
```sql
```


Devuelve el número total de pedidos que se han realizado cada año.
```sql
```

## Subconsultas

### Con operadores básicos de comparación

Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
```sql
select * from pedido as p where p.id_cliente=(select id from cliente where nombre = 'Adela' and apellido1 = 'Salas' and apellido2 = 'Díaz');

┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
```


Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
```sql
select count(*) as numero_pedidos from pedido as p where p.id_comercial = (select co.id from comercial as co where co.nombre = 'Daniel' and co.apellido1 = 'Sáez' and co.apellido2 = 'Vega');

┌────────────────┐
│ numero_pedidos │
├────────────────┤
│ 6              │
└────────────────┘
```


Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
```sql
```


Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
```sql
 select fecha, total from pedido where id_cliente = (select id from cliente where nombre = 'Pepe' and apellido1 = 'Ruiz' and apellido2 = 'Santana') order by total asc limit 1;

┌────────────┬───────┐
│   fecha    │ total │
├────────────┼───────┤
│ 2016-08-17 │ 110.5 │
└────────────┴───────┘
```


Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
```sql
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, p.id, p.fecha, p.total from cliente as cl, pedido as p where cl.id = p.id_cliente and p.fecha regexp '2017' and p.total >= (select avg(total) from pedido where fecha regexp '2017');

┌────┬────────┬───────────┬───────────┬────┬────────────┬─────────┐
│ id │ nombre │ apellido1 │ apellido2 │ id │   fecha    │  total  │
├────┼────────┼───────────┼───────────┼────┼────────────┼─────────┤
│ 4  │ Adrián │ Suárez    │           │ 8  │ 2017-10-10 │ 1983.43 │
│ 2  │ Adela  │ Salas     │ Díaz      │ 12 │ 2017-04-25 │ 3045.6  │
└────┴────────┴───────────┴───────────┴────┴────────────┴─────────┘
```

### Subconsultas con IN y NOT IN

Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
```sql
select * from cliente where id not in (select distinct id_cliente from pedido);

┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
```


Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
```sql
select * from comercial where id not in (select distinct id_comercial from pedido);

┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
```

### Subconsultas con EXISTS y NOT EXISTS

Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
```sql
select cl.* from cliente as cl where not exists(select 1 from pedido as p where p.id_cliente = cl.id);

┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
```


Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
```sql
select co.nombre from comercial as co where not exists (select 1 from pedido as p where p.id_comercial = co.id);

┌─────────┐
│ nombre  │
├─────────┤
│ Marta   │
│ Alfredo │
└─────────┘
```
