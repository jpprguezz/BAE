-- Obtener todos los clientes.
select * from Clientes;
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos
select sum(cantidad) from Pedidos;
/**
┌───────────────┐
│ sum(cantidad) │
├───────────────┤
│ 54            │
└───────────────┘
**/
-- Obtener el precio promedio de los productos:
select AVG(precio) from Productos;
/**
┌──────────────────┐
│   AVG(precio)    │
├──────────────────┤
│ 188.294285714286 │
└──────────────────┘
**/
-- Obtener los clientes que tienen un email válido (contiene '@'):
select nombre, email from Clientes where email regexp '@';
/**
┌─────────────────┬───────────────────────────┐
│     nombre      │           email           │
├─────────────────┼───────────────────────────┤
│ Juan Pérez      │ juan@example.com          │
│ María Gómez     │ maria@example.com         │
│ Carlos López    │ carlos@example.com        │
│ Ana Rodríguez   │ ana@example.com           │
│ Luisa Martínez  │ luisa@example.com         │
│ Pedro Sánchez   │ pedro@example.com         │
│ Laura García    │ laura@example.com         │
│ Miguel Martín   │ miguel@example.com        │
│ Elena González  │ elena@example.com         │
│ David Torres    │ david@example.com         │
│ Sofía Ruiz      │ sofia@example.com         │
│ Javier López    │ javier@example.com        │
│ Carmen Vargas   │ carmen@example.com        │
│ Daniel Muñoz    │ daniel@example.com        │
│ Isabel Serrano  │ isabel@example.com        │
│ Alejandro Muñoz │ alejandro@example.com     │
│ Raquel Herrera  │ raquel@example.com        │
│ Francisco Mora  │ francisco@example.com     │
│ Marina Díaz     │ marina@example.com        │
│ Antonio Jiménez │ antonio@example.com       │
│ Beatriz Romero  │ beatriz@example.com       │
│ Carlos Gómez    │ carlos.gomez@example.com  │
│ Clara Sánchez   │ clara.sanchez@example.com │
│ Andrés Martínez │ andres@example.com        │
│ Lucía Díaz      │ lucia@example.com         │
│ Mario Serrano   │ mario@example.com         │
│ Eva Torres      │ eva.torres@example.com    │
│ Roberto Ruiz    │ roberto@example.com       │
│ Celia García    │ celia@example.com         │
└─────────────────┴───────────────────────────┘
**/

-- Obtener el producto más caro.
select nombre, max(precio) from Productos;
/**
┌────────┬─────────────┐
│ nombre │ max(precio) │
├────────┼─────────────┤
│ Laptop │ 1200.0      │
└────────┴─────────────┘
**/

-- Obtener los pedidos realizados en febrero de 2024.
select * from Pedidos where fecha_pedido regexp '2024-02';
/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
│ 2         │ 2          │ 2           │ 1        │ 2024-02-02   │
│ 3         │ 3          │ 3           │ 3        │ 2024-02-03   │
│ 4         │ 4          │ 4           │ 1        │ 2024-02-04   │
│ 5         │ 5          │ 5           │ 2        │ 2024-02-05   │
│ 6         │ 6          │ 6           │ 1        │ 2024-02-06   │
│ 7         │ 7          │ 7           │ 3        │ 2024-02-07   │
│ 8         │ 8          │ 8           │ 2        │ 2024-02-08   │
│ 9         │ 9          │ 9           │ 1        │ 2024-02-09   │
│ 10        │ 10         │ 10          │ 2        │ 2024-02-10   │
│ 11        │ 11         │ 11          │ 1        │ 2024-02-11   │
│ 12        │ 12         │ 12          │ 3        │ 2024-02-12   │
│ 13        │ 13         │ 13          │ 1        │ 2024-02-13   │
│ 14        │ 14         │ 14          │ 2        │ 2024-02-14   │
│ 15        │ 15         │ 15          │ 1        │ 2024-02-15   │
│ 16        │ 16         │ 16          │ 3        │ 2024-02-16   │
│ 17        │ 17         │ 17          │ 2        │ 2024-02-17   │
│ 18        │ 18         │ 18          │ 1        │ 2024-02-18   │
│ 19        │ 19         │ 19          │ 2        │ 2024-02-19   │
│ 20        │ 20         │ 20          │ 1        │ 2024-02-20   │
│ 21        │ 21         │ 21          │ 3        │ 2024-02-21   │
│ 22        │ 22         │ 22          │ 1        │ 2024-02-22   │
│ 23        │ 23         │ 23          │ 2        │ 2024-02-23   │
│ 24        │ 24         │ 24          │ 1        │ 2024-02-24   │
│ 25        │ 25         │ 25          │ 3        │ 2024-02-25   │
│ 26        │ 26         │ 26          │ 2        │ 2024-02-26   │
│ 27        │ 27         │ 27          │ 1        │ 2024-02-27   │
│ 28        │ 28         │ 28          │ 2        │ 2024-02-28   │
│ 29        │ 29         │ 29          │ 1        │ 2024-02-29   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos por producto.
/**
**/
-- Obtener los clientes que han realizado más de un pedido.
/**
**/
-- Obtener los productos que tienen un precio registrado.
/**
**/
-- Obtener la fecha del primer pedido realizado:
/**
**/
-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':
/**
**/
-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
/**
**/
-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.
/**
**/
-- Obtener los productos con precio entre 100 y 500.
/**
**/
-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.
/**
**/
-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.
/**
**/
-- Obtener el precio máximo de los productos.
/**
**/
-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.
/**
**/
-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.
/**
**/
-- Obtener los productos que no tienen un precio registrado.
/**
**/
-- Obtener la fecha del último pedido realizado.
/**
**/
-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.
/**
**/
-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.
/**
**/
-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
/**
**/
-- Obtener los clientes cuyos nombres no contienen la letra 'i':
/**
**/
-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
/**
**/
-- Obtener el precio mínimo de los productos.
/**
**/
-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
/**
**/
-- Obtener la fecha del último pedido realizado por el cliente con ID 3.
/**
**/
-- Obtener los productos que tienen una 'a' al final del nombre.
/**
**/
-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).
/**
**/
-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.
/**
**/
-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
/**
**/
-- Obtener los productos cuyos nombres terminan con una consonante.
/**
**/
-- Obtener los productos cuyos nombres empiezan con una vocal.
/**
**/