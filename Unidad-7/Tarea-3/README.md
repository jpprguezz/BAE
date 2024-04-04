# Tarea 3: Trabajo con Índices

- Crea una base de datos que tendrá por nombre Base_Indices

- En la BD crea una tabla de nombre MOVIMIENTO con la   siguiente estructura:

```sql
CREATE TABLE movimiento (
    Identificador INT PRIMARY KEY AUTO_INCREMENT,
    Articulo VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Cantidad INT NOT NULL
);
```

- Ejecuta la siguiente sentencia sql para generar datos de prueba:

```sql
CREATE TABLE NumerosUnicos (
Numero INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO NumerosUnicos (Numero)
SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
SELECT 
    n.Numero,
    CONCAT('Producto', n.Numero),
    DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
    FLOOR(RAND() * 1000000) + 1
FROM 
    NumerosUnicos n;

    DROP TABLE NumerosUnicos;
```