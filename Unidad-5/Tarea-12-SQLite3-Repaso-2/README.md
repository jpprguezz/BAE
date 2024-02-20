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
```

Devuelve todos los datos de los dos pedidos de mayor valor.
```sql
```

Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
```sql
```


Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
```sql
```


Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
```sql
```


Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
```sql
```


Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
```sql
```


Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
```sql
```


Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
```sql
```


Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
```sql
```

## Consultas multitabla

Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
```sql
```


Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
```sql
```


Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
```sql
```


Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
```sql
```


Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
```sql
```


Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
```sql
```


Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
```sql
```

## Consultas resumen (Funciones)

Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
```sql
```


Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
```sql
```


Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
```sql
```


Calcula el número total de clientes que aparecen en la tabla cliente.
```sql
```


Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
```sql
```


Calcula cuál es la menor cantidad que aparece en la tabla pedido.
```sql
```


Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
```sql
```


Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
```sql
```


Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
```sql
```


Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
```sql
```


Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
```sql
```


Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
```sql
```


Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
```sql
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
```


Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
```sql
```


Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
```sql
```


Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
```sql
```


Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
```sql
```

### Subconsultas con IN y NOT IN

Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
```sql
```


Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
```sql
```

### Subconsultas con EXISTS y NOT EXISTS

Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
```sql
```


Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
```sql
```
