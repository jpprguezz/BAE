-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
select distinct clientes.* from clientes join ventas on clientes.id_cliente = ventas.id_cliente join coches on ventas.id_coche = coches.id_coche where coches.precio > (select avg(precio)from coches);
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

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?

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

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
