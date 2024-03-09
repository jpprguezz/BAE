# Tarea 1

### Primer creamos la base de datos

````sql
create database tarea1;
````

### A continuación insertamos las tablas y sus datos en la base de datos

```sql
CREATE TABLE IF NOT EXISTS usuarios (
id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (100),
    edad INT,
    correo TEXT(100)
);

INSERT INTO usuarios (nombre, edad, correo) VALUES
('Juan', 25, 'juan@example.com'),
('María', 30, 'maria@example.com'),
('Pedro', 28, 'pedro@example.com');

CREATE TABLE IF NOT EXISTS productos (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (100),
    precio NUMERIC(10, 2),
    cantidad INTEGER
);

INSERT INTO productos (nombre, precio, cantidad) VALUES
('Camisa', 25.99, 100),
('Pantalón', 35.50, 80),
('Zapatos', 59.99, 50);

CREATE TABLE IF NOT EXISTS pedidos (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    usuario_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    fecha_pedido DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

INSERT INTO pedidos (usuario_id, producto_id, cantidad, fecha_pedido) VALUES
(1, 1, 2, '2024-03-01'),
(2, 2, 1, '2024-03-02'),
(3, 3, 3, '2024-03-03');
```

### Realizamos las consultas pedidas

- Mostrar todos los usuarios.
```sql
select * from usuarios;

+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```
- Mostrar todos los productos.
```sql
select * from productos;

+----+----------+--------+----------+
| id | nombre   | precio | cantidad |
+----+----------+--------+----------+
|  1 | Camisa   |  25.99 |      100 |
|  2 | Pantalón |  35.50 |       80 |
|  3 | Zapatos  |  59.99 |       50 |
+----+----------+--------+----------+
```
- Mostrar todos los pedidos.
```sql
select * from pedidos;

+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  1 |          1 |           1 |        2 | 2024-03-01   |
|  2 |          2 |           2 |        1 | 2024-03-02   |
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
```

- Mostrar los usuarios que tienen más de 25 años.
```sql
select * from usuarios where edad > 25;

+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```

- Mostrar los productos con un precio mayor a 50.
```sql
select * from productos where precio > 50;

+----+---------+--------+----------+
| id | nombre  | precio | cantidad |
+----+---------+--------+----------+
|  3 | Zapatos |  59.99 |       50 |
+----+---------+--------+----------+
```
- Mostrar los pedidos realizados el día de hoy.

- Mostrar el total de productos en stock.
```sql
select sum(cantidad) as total_cantidad_productos from productos;

+--------------------------+
| total_cantidad_productos |
+--------------------------+
|                      230 |
+--------------------------+
```
- Mostrar el promedio de edades de los usuarios.
```sql
select avg(edad) as edad_premedio_usuarios from usuarios;

+------------------------+
| edad_premedio_usuarios |
+------------------------+
|                27.6667 |
+------------------------+
```
- Mostrar los usuarios que tienen la letra 'a' en su nombre
```sql
select nombre from usuarios where nombre like '%a%';

+--------+
| nombre |
+--------+
| Juan   |
| María  |
+--------+
```
- Mostrar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio desc;

+----+----------+--------+----------+
| id | nombre   | precio | cantidad |
+----+----------+--------+----------+
|  3 | Zapatos  |  59.99 |       50 |
|  2 | Pantalón |  35.50 |       80 |
|  1 | Camisa   |  25.99 |      100 |
+----+----------+--------+----------+
```
- Mostrar los pedidos realizados por el usuario con ID 2.
```sql
select * from pedidos where usuario_id=2;

+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  2 |          2 |           2 |        1 | 2024-03-02   |
+----+------------+-------------+----------+--------------+
```
- Mostrar los usuarios ordenados por edad de forma ascendente.
```sql
select * from usuarios order by edad asc;

+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  3 | Pedro  |   28 | pedro@example.com |
|  2 | María  |   30 | maria@example.com |
+----+--------+------+-------------------+
```

- Mostrar los productos con un precio entre 20 y 50.
```sql
select * from productos where precio between 20 and 50;

+----+----------+--------+----------+
| id | nombre   | precio | cantidad |
+----+----------+--------+----------+
|  1 | Camisa   |  25.99 |      100 |
|  2 | Pantalón |  35.50 |       80 |
+----+----------+--------+----------+
```
- Mostrar los usuarios que tienen un correo de dominio 'example.com'.
```sql
select * from usuarios where correo like '%example.com';

+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
```
- Mostrar los pedidos con una cantidad mayor a 2
```sql
select * from pedidos where cantidad > 2;

+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
```
