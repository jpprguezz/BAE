## Crear las tablas

```sql
create table clientes (
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