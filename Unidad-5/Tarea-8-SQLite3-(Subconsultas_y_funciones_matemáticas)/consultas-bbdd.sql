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
/**
**/
-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
/**
**/
-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
/**
**/
-- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
/**
**/
-- Consulta para contar el número de coches vendidos por cliente.
/**
**/
-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
/**
**/
-- Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
/**
**/
-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
/**
**/
-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
select cl.nombre, cl.edad from clientes as cl, coches as c where c.precio > 30000 and cl.id_cliente=c.id_coche;
/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Francisco Ruiz  │ 33   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
**/
-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".
/**
**/
-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
/**
**/