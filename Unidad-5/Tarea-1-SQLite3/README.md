# Primeros pasos en SQL

## Paso 1: Crear Una tabla con un campo de cada tipo

1 y 2. Primero creamos la tabla, a la cual le iremos añadiendo campos (cada campo a su vez tiene su tipo especifico al lado)

```sql
create table tarea1 (
	 id text,
	 texto text,
     entero integer,
     decimal real,
     fecha date,
     booleano boolean

);
```

## Paso 2: Insertar 50 entradas

1. Aquí debemos insertar todos nuestros datos en una tabala. Con el siguiente comando, hemos introducido nuestros datos fila por fila. Pondremos de ejemplo, el comando que usamos con la fila 50:

``` sql
insert into tarea1 (id, texto,entero,decimal,fecha,booleano) values ('1','Ejemplo1','25','10.5','2022-05-15','0');
```

En el comando se insertan primero los campos de la table y a continuación, se introducen los valores (los cuales deben estar alineados con su campo correspondiente). Esto nos daría nos daría como resultado una línea de nuestra BBDD. Por ello, colocando las siguientes 49, obtendriamos una tabla como la que tenemos aqui debajo

``` code
+----+-----------+--------+---------+------------+----------+
| id |   texto   | entero | decimal |   fecha    | booleano |
+----+-----------+--------+---------+------------+----------+
| 1  | Ejemplo1  | 25     | 10.5    | 2022-05-15 | 0        |
| 2  | Ejemplo2  | 63     | 45.7    | 2022-06-22 | 1        |
| 3  | Ejemplo3  | 12     | 30.0    | 2022-07-10 | 0        |
| 4  | Ejemplo4  | 78     | 75.2    | 2022-08-05 | 1        |
| 5  | Ejemplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 6  | Ejemplo6  | 55     | 60.3    | 2022-10-08 | 1        |
| 7  | Ejemplo7  | 10     | 40.1    | 2022-11-17 | 0        |
| 8  | Ejemplo8  | 87     | 22.6    | 2022-12-03 | 1        |
| 9  | Ejemplo9  | 31     | 55.0    | 2023-01-20 | 0        |
| 10 | Ejemplo10 | 68     | 90.4    | 2023-02-14 | 1        |
| 11 | Ejemplo11 | 15     | 12.8    | 2023-03-22 | 0        |
| 12 | Ejemplo12 | 72     | 48.6    | 2023-04-09 | 1        |
| 13 | Ejemplo13 | 22     | 33.7    | 2023-05-01 | 0        |
| 14 | Ejemplo14 | 93     | 20.2    | 2023-06-18 | 1        |
| 15 | Ejemplo15 | 37     | 15.4    | 2023-07-05 | 0        |
| 16 | Ejemplo16 | 81     | 82.9    | 2023-08-11 | 1        |
| 17 | Ejemplo17 | 45     | 28.3    | 2023-09-27 | 0        |
| 18 | Ejemplo18 | 60     | 50.6    | 2023-10-15 | 1        |
| 19 | Ejemplo19 | 5      | 8.7     | 2023-11-22 | 0        |
| 20 | Ejemplo20 | 76     | 65.1    | 2023-12-08 | 1        |
| 21 | Ejemplo21 | 33     | 20.3    | 2024-01-14 | 0        |
| 22 | Ejemplo22 | 70     | 55.8    | 2024-02-29 | 1        |
| 23 | Ejemplo23 | 13     | 42.7    | 2024-03-18 | 0        |
| 24 | Ejemplo24 | 89     | 78.4    | 2024-04-25 | 1        |
| 25 | Ejemplo25 | 49     | 15.9    | 2024-05-12 | 0        |
| 26 | Ejemplo26 | 62     | 60.7    | 2024-06-20 | 1        |
| 27 | Ejemplo27 | 8      | 35.2    | 2024-07-07 | 0        |
| 28 | Ejemplo28 | 95     | 25.6    | 2024-08-23 | 1        |
| 29 | Ejemplo29 | 27     | 50.0    | 2024-09-10 | 0        |
| 30 | Ejemplo30 | 74     | 85.3    | 2024-10-05 | 1        |
| 31 | Ejemplo31 | 18     | 11.8    | 2024-11-12 | 0        |
| 32 | Ejemplo32 | 83     | 47.6    | 2024-12-28 | 1        |
| 33 | Ejemplo33 | 38     | 32.7    | 2025-01-15 | 0        |
| 34 | Ejemplo34 | 101    | 70.2    | 2025-02-01 | 1        |
| 35 | Ejemplo35 | 52     | 18.4    | 2025-03-20 | 0        |
| 36 | Ejemplo36 | 67     | 83.9    | 2025-04-06 | 1        |
| 37 | Ejemplo37 | 43     | 28.3    | 2025-05-13 | 0        |
| 38 | Ejemplo38 | 58     | 50.6    | 2025-06-30 | 1        |
| 39 | Ejemplo39 | 9      | 8.7     | 2025-07-17 | 0        |
| 40 | Ejemplo40 | 82     | 65.1    | 2025-08-23 | 1        |
| 41 | Ejemplo41 | 26     | 20.3    | 2025-09-09 | 0        |
| 42 | Ejemplo42 | 73     | 55.8    | 2025-10-26 | 1        |
| 43 | Ejemplo43 | 14     | 42.7    | 2025-11-13 | 0        |
| 44 | Ejemplo44 | 90     | 78.4    | 2025-12-30 | 1        |
| 45 | Ejemplo45 | 50     | 15.9    | 2026-01-16 | 0        |
| 46 | Ejemplo46 | 63     | 60.7    | 2026-02-03 | 1        |
| 47 | Ejemplo47 | 7      | 35.2    | 2026-03-22 | 0        |
| 48 | Ejemplo48 | 96     | 25.6    | 2026-04-08 | 1        |
| 49 | Ejemplo49 | 28     | 50.0    | 2026-05-25 | 0        |
| 50 | Ejemplo50 | 75     | 85.3    | 2026-06-11 | 1        |
+----+-----------+--------+---------+------------+----------+
```

## Paso 3

1. Para obtener todos los datos de nuestra tabla, simpelemente colocamos: 

``` sql
select * from tarea1;
```
De esta manera podremos ver todos nuestros datos de forma ordenada

2. En cambio si queremos ver las entradas en el campo "entero" que sean mayor a cincuenta, colocamos:

```sql
select * from tarea1 where entero>50;
```

## Paso 4

1. Para eliminar entradas, debemos hacer lo siguiente:

```sql
 delete from tarea1 where booleano='1';
```
En este caso hemos eliminado las filas en las que el valor booleano es 1, es decir, True.

1. En el caso de que queramos modificar alguna entrada, debemos colocar esto:

```sql
update tarea1 set entero="Modificado" where entero<30;
```
2. Ahora eliminaremmos las entradas donde "entero" sea igual a 50 con el siguiente comando: 

```sql
delete from tarea1 where entero=50;
```
3. Ahora incrementaremos a 10 las entradas del campo "entero" las cuales su booleano sea False:

```sql
update tarea1 set entero = entero+10 where booleano=0;
```

4. A continuación eliminaremos las entradas del campo "decimal" que valga menos de 50

```sql
delete from tarea1 where decimal<50;
```
5. Por último actualizaremos el campo "fecha" y pondremos la de hoy:

```sql
update tarea1 set fecha='2023-12-15' where fecha;
```

## Estado final de la tabla

```
+----+-----------+--------+---------+------------+----------+
| id |   texto   | entero | decimal |   fecha    | booleano |
+----+-----------+--------+---------+------------+----------+
| 9  | Ejemplo9  | 41     | 55.0    | 2023-12-15 | 0        |
| 29 | Ejemplo29 | 10     | 50.0    | 2023-12-15 | 0        |
| 49 | Ejemplo49 | 10     | 50.0    | 2023-12-15 | 0        |
+----+-----------+--------+---------+------------+----------+
```