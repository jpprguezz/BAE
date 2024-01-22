<div align="justify">

# SQL: Todo lo básico para manejar tablas

## Comandos basicos para modificar una BBDD

- `CREATE`: Crea la tabla 
- `ALTER`: Añade o elimina objetos de la tabla
- `DROP`: Elimina objetos en la tabla
- `TRUNCATE`: Elimina TODOS los datos de la tabla
- `SELECT`: Selecciona los datos que quieras de la tablas (indicar datos a seleccionar)
- `INSERT`: Ayuda a colocar datos en la tabla (indicar datos a colocar)

### Crear una BBDD con SQLite3

```sql
sqlite3 nombre_base_datos.db
```
### Empezar a modificar la BBDD

Una BDDD esta compuesta por tablas. Para crear esas tablas debemos colocar este comando:

```sql
CREATE TABLE ejemplo (

);
```
Después de esto, debemos añadirle columnas a la tabla. Deberemos especificar en ella que tipo de dato es, además de dejar claro cual es la clave primaria entre otras cosas. Los datos deben introducirse de esta manera:

```sql
    ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellidos TEXT NOT NULL,
    fecha_de_nacimiento TEXT NULL,
    comment TEXT NOT NULL
```

Una vez sepamos estos datos, debemos combinarlos para crear una tabla. Podemos observar en la tabla que al lado de los datos encontramos ciertos datos remarcados en rojo tales como `NOT NULL, PRIMARY KEY,etc`. `NOT NULL` hace que el valor al que se lo ponemos no pueda quedar nunca en blanco y `PRIMARY KEY` junto a `AUTOINCREMENT` (el cual hace que el numero de ID se genere automaticamente) hacen que el dato ID sea la Primary Key. Aparte, podemos indicar el tipo de dato que es con `INTEGER` para indicar que es un número, como `TEXT` para indicar que es un dato de puro texto. Así debe quedar: 

```sql
CREATE TABLE ejemplo (
    ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellidos TEXT NOT NULL,
    fecha_de_nacimiento TEXT NULL,
    frase_memorable TEXT NOT NULL
);
```

Para insertar datos en una tabal creada, debemos indicarlos con el comando `INSERT`. Para ello colocamos el comando `INSERT INTO nombre_de_la_tabla` y debemos colocar tanto las columnas como los datos a las que queremos colocar los datos. Estos deben ser indicados de manera alineada, es decir la primera fila debe indicar las columnas y la segundo, junto al comando `VALUES` debe indicar los datos. Algo así quedaría:

```sql
INSERT INTO ejemplo ( nombre, apellidos, fecha_de_nacimiento, frase_memorable ) VALUES ( 'José', 'Peña', '01-01-2001.', 'holap' );
```

Ahora podemos generar nuestra primera tabla. Para ver la tabla, es tan facil como poner `SELECT * FROM nombre_de_la_tabla;` habiendo puesto anteriormente `.mode table` para mostrar los datos en forma de tabla. Después de haber insertado lo anterior, esto tendriamos: 

```sql
+----+--------+-----------+---------------------+-----------------+
| ID | nombre | apellidos | fecha_de_nacimiento | frase_memorable |
+----+--------+-----------+---------------------+-----------------+
| 2  | José   | Peña      | 01-01-2001.         | holap           |
+----+--------+-----------+---------------------+-----------------+
```

Para poder poner seudonimos a las tablas, usamo AS

```sql
SELECT * FROM ejemplo AS ejem, ejemplo2 AS ejem2;
```
## Comandos basicos para BBDD

Para poder acceder a información de la base de datos o modificarla hay ciertos comandos:

### Comandos de actualización

1. `UPDATE`: Sirve para poder cambiar directamente la informaciónd de cualquier lado, después de haber seleccionado con el comando, que se quiere cambiar, por ejemplo    

```sql
UPDATE empleados SET salario = salario * 1.1 WHERE cargo = 'Analista';
```
En esta tabla observamos que en la tabla empleados, se le cambia el salario sumandole 1.1 a los analistas.

2. `DELETE`: Sirve para eliminar información, y al igual que UPDATE, hay que ponerle una condición.

```sql
DELETE FROM empleados WHERE salario < 30000;
```
Con esta conculta, se eliminaria cualqueir registro de la tabla empleados donde el salario fuera menor de 30000.

3. `AND`: Para cuando WHERE lleva más de una condición:

```sql
SELECT column1, column2, ... FROM table_name WHERE condition1 AND condition2 AND condition3 ...;
```

4. `OR`: Cuando WHERE lleva dos o más condiciones, de las que se debe cumplir alguna si o si: 

```sql
SELECT column1, column2, ... FROM table_name WHERE condition1 OR condition2 OR condition3 OR...;
```

5. `LIMIT`: Para limitar los resultados que te de la condulta que hagas: 

```sql
SELECT column1, column2, ... FROM table_name LIMIT 10
```

6. `OFFSET`: Usado para saltar la cantidad indicada de datos. Se suele usar junto a LIMIT:

```sql
SELECT column1, column2, ... FROM table_name LIMIT 10 OFFSET 50
```

7. `ORDER BY`: Se usa para ordenar campos de forma ascendente (ASC) o descendente (DESC)

```sql
SELECT column1, column2, ... FROM table_name ORDER BY column1, column2, ... ASC;
```

8. `GROUP BY`: Usado para organizar datos iguales en grupos, basados en columnas. Se usa junto a otras consultas para contar como MIN, MAX, COUNT o SUM:

```sql
SELECT column1, column2, ... FROM table_name GROUP BY column1, column2, ...
```

9. `COUNT`: Para contar registros:

```sql
SELECT COUNT(column_name) FROM table_name;
```

10. `MIN` y `MAX`: Selecciona el valor más pequeño o grande de una columna:

```sql
SELECT MIN(column_name) FROM table_name;
```
```sql
SELECT MAX(column_name) FROM table_name;
```

11. `SUM`: Usado para sumar todos los valores de una columna: 

```sql
SELECT SUM(column_name) FROM table_name;
```

12. `AVG`: Para obtener el promedio de todos los valores de una tabla:

```sql
SELECT AVG(column_name) FROM table_name;
```

13. `JOIN`: Usado para unir datos de una tabla con otra:

```sql
SELECT column1, column2, ... FROM table1 JOIN table2 ON  table1.column1 = table2.column2
```

Una consulta puede dar valor vacio, y para poder evitar eso ponemos select lo_q_se_quiera_from x;

(FALTAN CONSULTAS)

encontrar productos vendidos en más de una fecha
select p.id, p.nombre from productos as p, ventas as v where p.id=v.id_productos group by p.id,p.nombre having count (distinct(v.fecha))

















</div>
