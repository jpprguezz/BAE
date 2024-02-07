-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
select cl.nombre, cl.edad, c.marca from clientes as cl, coches as c where c.marca = 'Toyota';
/**
┌─────────────────┬──────┬────────┐
│     nombre      │ edad │ marca  │
├─────────────────┼──────┼────────┤
│ Juan Pérez      │ 30   │ Toyota │
│ María Gómez     │ 25   │ Toyota │
│ Carlos López    │ 35   │ Toyota │
│ Ana Martínez    │ 28   │ Toyota │
│ Pedro Rodríguez │ 40   │ Toyota │
│ Laura Sánchez   │ 32   │ Toyota │
│ Miguel González │ 27   │ Toyota │
│ Isabel Díaz     │ 38   │ Toyota │
│ Francisco Ruiz  │ 33   │ Toyota │
│ Elena Torres    │ 29   │ Toyota │
└─────────────────┴──────┴────────┘
**/
-- Consulta para calcular el precio promedio de los coches vendidos.
select avg(precio) as precio_promedio from coches;
/**
┌─────────────────┐
│ precio_promedio │
├─────────────────┤
│ 29000.0         │
└─────────────────┘
**/
-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
select c.modelo, c.marca, cl.edad, cl.nombre from coches as c, clientes as cl where cl.edad < 30 and c.id_coche=cl.id_cliente;
/**
┌────────────────┬───────────┬──────┬─────────────────┐
│     modelo     │   marca   │ edad │     nombre      │
├────────────────┼───────────┼──────┼─────────────────┤
│ Hatchback 2021 │ Honda     │ 25   │ María Gómez     │
│ Coupé 2022     │ Chevrolet │ 28   │ Ana Martínez    │
│ Híbrido 2022   │ Hyundai   │ 27   │ Miguel González │
│ Eléctrico 2021 │ Tesla     │ 29   │ Elena Torres    │
└────────────────┴───────────┴──────┴─────────────────┘
**/
-- Consulta para contar el número de coches vendidos de cada marca.
select c.marca, count(c.id_coche) as coches_vendidos from coches as c, ventas as v  where v.id_coche=c.id_coche group by c.marca;
/**
┌────────────┬─────────────────┐
│   marca    │ coches_vendidos │
├────────────┼─────────────────┤
│ Chevrolet  │ 1               │
│ Ford       │ 1               │
│ Honda      │ 1               │
│ Hyundai    │ 1               │
│ Mazda      │ 1               │
│ Nissan     │ 1               │
│ Tesla      │ 1               │
│ Toyota     │ 1               │
│ Volkswagen │ 1               │
└────────────┴─────────────────┘
**/
-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
select cl.nombre, cl.direccion, r.fecha_reparación from clientes as cl, reparacion as r where fecha_reparación regexp '2024' and cl.id_cliente=r.id_cliente;
/**
┌─────────────────┬────────────────┬──────────────────┐
│     nombre      │   direccion    │ fecha_reparación │
├─────────────────┼────────────────┼──────────────────┤
│ Francisco Ruiz  │ Calle I #222   │ 2024-01-05       │
│ Elena Torres    │ Avenida J #333 │ 2024-02-10       │
│ Juan Pérez      │ Calle A #123   │ 2024-03-15       │
│ María Gómez     │ Avenida B #456 │ 2024-04-20       │
│ Carlos López    │ Calle C #789   │ 2024-05-25       │
│ Ana Martínez    │ Avenida D #101 │ 2024-06-10       │
│ Pedro Rodríguez │ Calle E #234   │ 2024-07-05       │
│ Laura Sánchez   │ Avenida F #567 │ 2024-08-15       │
│ Miguel González │ Calle G #890   │ 2024-09-20       │
│ Isabel Díaz     │ Avenida H #111 │ 2024-10-25       │
│ Francisco Ruiz  │ Calle I #222   │ 2024-11-05       │
│ Elena Torres    │ Avenida J #333 │ 2024-12-10       │
└─────────────────┴────────────────┴──────────────────┘
**/
-- Consulta para calcular el total gastado en reparaciones por cada cliente.
-- No existe la columna reparaciones
/**
**/
-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
select cl.nombre, cl.edad, c.precio from clientes as cl, coches as c where precio > 30000 and cl.id_cliente=c.id_coche;
/**
┌─────────────────┬──────┬─────────┐
│     nombre      │ edad │ precio  │
├─────────────────┼──────┼─────────┤
│ Pedro Rodríguez │ 40   │ 32000.0 │
│ Isabel Díaz     │ 38   │ 35000.0 │
│ Francisco Ruiz  │ 33   │ 31000.0 │
│ Elena Torres    │ 29   │ 40000.0 │
└─────────────────┴──────┴─────────┘
**/
-- Consulta para calcular el precio medio de los coches vendidos en 2023.
select avg(c.precio) from coches as c, ventas as v where v.fecha_venta regexp '2023';
/**
┌───────────────┐
│ avg(c.precio) │
├───────────────┤
│ 29000.0       │
└───────────────┘
**/
-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
select cl.nombre, cl.direccion, c.marca from clientes as cl, coches as c where c.marca regexp 'Ford';
/**
┌─────────────────┬────────────────┬───────┐
│     nombre      │   direccion    │ marca │
├─────────────────┼────────────────┼───────┤
│ Juan Pérez      │ Calle A #123   │ Ford  │
│ María Gómez     │ Avenida B #456 │ Ford  │
│ Carlos López    │ Calle C #789   │ Ford  │
│ Ana Martínez    │ Avenida D #101 │ Ford  │
│ Pedro Rodríguez │ Calle E #234   │ Ford  │
│ Laura Sánchez   │ Avenida F #567 │ Ford  │
│ Miguel González │ Calle G #890   │ Ford  │
│ Isabel Díaz     │ Avenida H #111 │ Ford  │
│ Francisco Ruiz  │ Calle I #222   │ Ford  │
│ Elena Torres    │ Avenida J #333 │ Ford  │
└─────────────────┴────────────────┴───────┘
**/
-- Consulta para contar el número de coches vendidos por año.
select substr(fecha_venta, 1, 4) as año_venta, count(id_coche) as coches_por_año from ventas group by año_venta;
/**
┌───────────┬────────────────┐
│ año_venta │ coches_por_año │
├───────────┼────────────────┤
│ 2023      │ 18             │
└───────────┴────────────────┘
**/
-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
select cl.nombre, cl.edad from clientes as cl, ventas as v, coches as c, reparacion as r where cl.id_cliente = v.id_cliente and c.id_coche = v.id_coche and c.precio > 30000 and c.id_coche = r.id_coche and cl.id_cliente = r.id_cliente;
/**
┌──────────────┬──────┐
│    nombre    │ edad │
├──────────────┼──────┤
│ Isabel Díaz  │ 38   │
│ Elena Torres │ 29   │
└──────────────┴──────┘
**/
-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
select sum(c.precio) as precio_total from ventas as v, coches as c, clientes as cl where cl.edad < 30 and cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche;
/**
┌──────────────┐
│ precio_total │
├──────────────┤
│ 117000.0     │
└──────────────┘
**/
-- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
select distinct(c.modelo) from coches as c, ventas as v, reparacion as r where v.fecha_venta regexp '2023-' and c.id_coche=v.id_coche=r.id_coche;
/**
┌────────────────┐
│     modelo     │
├────────────────┤
│ Sedán 2022     │
│ Hatchback 2021 │
│ SUV 2023       │
│ Coupé 2022     │
│ Camioneta 2023 │
│ Compacto 2021  │
│ Híbrido 2022   │
│ Deportivo 2023 │
│ Eléctrico 2021 │
└────────────────┘
**/
-- Consulta para contar el número de coches vendidos por cliente.
select cl.id_cliente, cl.nombre, count(v.id_coche) as coches_vendidos from clientes as cl, ventas as v where cl.id_cliente=v.id_cliente group by cl.id_cliente
/**
┌────────────┬─────────────────┬─────────────────┐
│ id_cliente │     nombre      │ coches_vendidos │
├────────────┼─────────────────┼─────────────────┤
│ 1          │ Juan Pérez      │ 1               │
│ 2          │ María Gómez     │ 1               │
│ 3          │ Carlos López    │ 1               │
│ 4          │ Ana Martínez    │ 1               │
│ 5          │ Pedro Rodríguez │ 1               │
│ 6          │ Laura Sánchez   │ 1               │
│ 7          │ Miguel González │ 1               │
│ 8          │ Isabel Díaz     │ 1               │
│ 10         │ Elena Torres    │ 1               │
└────────────┴─────────────────┴─────────────────┘
**/
-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
select c.marca, c.modelo, c.precio from coches as c, clientes as cl, ventas as v where c.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad > 35;
/**
┌────────┬────────────────┬─────────┐
│ marca  │     modelo     │ precio  │
├────────┼────────────────┼─────────┤
│ Nissan │ Camioneta 2023 │ 32000.0 │
│ Mazda  │ Deportivo 2023 │ 35000.0 │
└────────┴────────────────┴─────────┘
**/
-- Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
select sum(c.precio) as total_precio from clientes as cl, coches as c, ventas as v where cl.direccion regexp 'Calle' and cl.id_cliente=v.id_cliente and c.id_coche=v.id_coche;
/**
┌──────────────┐
│ total_precio │
├──────────────┤
│ 114000.0     │
└──────────────┘
**/
-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
-- No se muestran resultados/coincidencias
/**
**/
-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
select avg(c.precio) as media_precio_2023 from clientes as cl, coches as c, ventas as v, reparacion as r where cl.edad > 30 and c.id_coche=v.id_coche=r.id_coche and v.id_cliente=cl.id_cliente=r.id_cliente;
/**
┌───────────────────┐
│ media_precio_2023 │
├───────────────────┤
│ 29250.0           │
└───────────────────┘
**/
-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".
select coches.modelo, coches.año from clientes, coches, ventas where clientes.id_cliente=ventas.id_cliente and ventas.id_coche=coches.id_coche and clientes.direccion regexp 'Avenida';
/**
┌────────────────┬──────┐
│     modelo     │ año  │
├────────────────┼──────┤
│ Hatchback 2021 │ 2021 │
│ Coupé 2022     │ 2022 │
│ Compacto 2021  │ 2021 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
└────────────────┴──────┘
**/
-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
select cl.id_cliente, cl.nombre, count(r.id_cliente) as reparaciones_cantidad from reparacion as r, clientes as cl where cl.id_cliente=r.id_cliente group by cl.id_cliente
/**
┌────────────┬─────────────────┬───────────────────────┐
│ id_cliente │     nombre      │ reparaciones_cantidad │
├────────────┼─────────────────┼───────────────────────┤
│ 1          │ Juan Pérez      │ 2                     │
│ 2          │ María Gómez     │ 2                     │
│ 3          │ Carlos López    │ 2                     │
│ 4          │ Ana Martínez    │ 2                     │
│ 5          │ Pedro Rodríguez │ 2                     │
│ 6          │ Laura Sánchez   │ 2                     │
│ 7          │ Miguel González │ 2                     │
│ 8          │ Isabel Díaz     │ 2                     │
│ 9          │ Francisco Ruiz  │ 2                     │
│ 10         │ Elena Torres    │ 2                     │
└────────────┴─────────────────┴───────────────────────┘
**/