-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
 select c.marca, c.modelo, c.precio, cl.nombre from coches as c, clientes as cl, ventas as v where c.id_coche=v.id_coche and cl.id_cliente=v.id_cliente;
/**
┌────────────┬────────────────┬─────────┬─────────────────┐
│   marca    │     modelo     │ precio  │     nombre      │
├────────────┼────────────────┼─────────┼─────────────────┤
│ Toyota     │ Sedán 2022     │ 25000.0 │ Juan Pérez      │
│ Honda      │ Hatchback 2021 │ 22000.0 │ María Gómez     │
│ Ford       │ SUV 2023       │ 30000.0 │ Carlos López    │
│ Chevrolet  │ Coupé 2022     │ 28000.0 │ Ana Martínez    │
│ Nissan     │ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │
│ Volkswagen │ Compacto 2021  │ 20000.0 │ Laura Sánchez   │
│ Hyundai    │ Híbrido 2022   │ 27000.0 │ Miguel González │
│ Mazda      │ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │
│ Tesla      │ Eléctrico 2021 │ 40000.0 │ Elena Torres    │
└────────────┴────────────────┴─────────┴─────────────────┘
**/

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
select clientes.*, coches.precio as coche_precio from clientes, ventas, coches where clientes.id_cliente = ventas.id_cliente and coches.id_coche = ventas.id_coche and coches.precio > (select avg(precio) from coches);
/**
┌────────────┬─────────────────┬──────┬────────────────┐
│ id_cliente │     nombre      │ edad │   direccion    │
├────────────┼─────────────────┼──────┼────────────────┤
│ 3          │ Carlos López    │ 35   │ Calle C #789   │
│ 5          │ Pedro Rodríguez │ 40   │ Calle E #234   │
│ 8          │ Isabel Díaz     │ 38   │ Avenida H #111 │
│ 10         │ Elena Torres    │ 29   │ Avenida J #333 │
└────────────┴─────────────────┴──────┴────────────────┘
**/
-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas
select modelo, precio from coches where id_coche not in (select id_coche from ventas);
/**
┌─────────────┬─────────┐
│   modelo    │ precio  │
├─────────────┼─────────┤
│ Pickup 2022 │ 31000.0 │
└─────────────┴─────────┘
**/

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.
select sum(c.precio) as total from coches as c, ventas as v where c.id_coche = v.id_coche;
/**
┌──────────┐
│  total   │
├──────────┤
│ 259000.0 │
└──────────┘
**/

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?
select c.modelo, v.fecha_venta, cl.nombre from coches as c, ventas as v, clientes as cl where c.id_coche = v.id_coche and cl.id_cliente = v.id_cliente order by fecha_venta desc;
/**
┌────────────────┬─────────────┬─────────────────┐
│     modelo     │ fecha_venta │     nombre      │
├────────────────┼─────────────┼─────────────────┤
│ Eléctrico 2021 │ 2023-10-05  │ Elena Torres    │
│ Deportivo 2023 │ 2023-08-25  │ Isabel Díaz     │
│ Híbrido 2022   │ 2023-07-20  │ Miguel González │
│ Compacto 2021  │ 2023-06-15  │ Laura Sánchez   │
│ Camioneta 2023 │ 2023-05-05  │ Pedro Rodríguez │
│ Coupé 2022     │ 2023-04-10  │ Ana Martínez    │
│ SUV 2023       │ 2023-03-25  │ Carlos López    │
│ Hatchback 2021 │ 2023-02-20  │ María Gómez     │
│ Sedán 2022     │ 2023-01-15  │ Juan Pérez      │
└────────────────┴─────────────┴─────────────────┘
**/

-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
select modelo, precio from coches where precio = (select max(precio) from coches);
/**
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ Eléctrico 2021 │ 40000.0 │
└────────────────┴─────────┘
**/

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT
select id_cliente, count(*) as cantidad_comprados from ventas group by id_cliente having count(*) >= 1;
/**
┌────────────┬────────────────────┐
│ id_cliente │ cantidad_comprados │
├────────────┼────────────────────┤
│ 1          │ 1                  │
│ 2          │ 1                  │
│ 3          │ 1                  │
│ 4          │ 1                  │
│ 5          │ 1                  │
│ 6          │ 1                  │
│ 7          │ 1                  │
│ 8          │ 1                  │
│ 10         │ 1                  │
└────────────┴────────────────────┘
**/

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.
select nombre from clientes where id_cliente in (select id_cliente from ventas where id_coche in (select id_coche from coches WHERE marca = 'Toyota'));
/**
┌────────────┐
│   nombre   │
├────────────┤
│ Juan Pérez │
└────────────┘
**/

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 
select avg(edad) as promedio_edad from clientes where id_cliente in (select id_cliente from coches where precio > 25000);
/**
┌───────────────┐
│ promedio_edad │
├───────────────┤
│ 31.7          │
└───────────────┘
**/

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
