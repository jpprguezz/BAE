<div align="justify">

# SQL

## Comandos basicos para modificar una BBDD

- CREATE: Crea la tabla 
- ALTER: Añade o elimina objetos de la tabla
- DROP: Elimina objetos en la tabla
- TRUNCATE: Elimina TODOS los datos de la tabla
- SELECT: Selecciona los datos que quieras de la tablas (indicar datos a seleccionar)
- INSERT: Ayuda a colocar datos en la tabla (indicar datos a colocar)

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

Una vez sepamos estos datos, debemos combinarlos para crear una tabla. Podemos observar en la tabla que al lado de los datos encontramos ciertos datos remarcados en rojo tales como `NOT NULL, PRIMARY KEY,etc`. `NOT NULL` hace que el valor al que se lo ponemos no pueda quedar nunca en blanco y `PRIMARY KEY` junto a `AUTOINCREMENT` hacen que el dato ID sea la Primary Key. Así debe quedar: 

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

Ahora podemos generar nuestra primera tabla


























</div>