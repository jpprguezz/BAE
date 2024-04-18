# Tarea 1

- Primero creamos la base de datos e insertamos las tablas y sus datos:

```sql
CREATE DATABASE IF NOT EXISTS SimpleDB;

USE SimpleDB;

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);
```

```sql

INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Alba', 'alba@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Paco', 'paco@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Antonio', 'antonio@example.com');

INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 4', 14.08);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 5', 16.75);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 6', 27.20);
```

- Crea procedimientos almacenados para realizar operaciones como insertar un nuevo usuario, actualizar el nombre de un usuario, etc.

    - Procedimiento para insertar un nuevo usuario.

    ```sql
    DELIMITER $$
    CREATE PROCEDURE insertar_nuevo_usuario(IN UserName VARCHAR(50), IN Email VARCHAR(100))
    BEGIN
    INSERT INTO Users (UserName, Email) VALUES (UserName, Email);
    END
    $$
    ```
    ```sql
    call insertar_nuevo_usuario('Alfonso','alfonso@example.com');
    ```
    ```sql
    select * from Users;

    +--------+----------+---------------------+
    | UserID | UserName | Email               |
    +--------+----------+---------------------+
    |      1 | Juan     | juan@example.com    |
    |      2 | María    | maria@example.com   |
    |      3 | Pedro    | pedro@example.com   |
    |      4 | Alba     | alba@example.com    |
    |      5 | Paco     | paco@example.com    |
    |      6 | Antonio  | antonio@example.com |
    |      7 | Alfonso  | alfonso@example.com |
    +--------+----------+---------------------+
    ```

    - Procedimiento para actualizar el nombre de un usuario.

    ```sql
    DELIMITER $$
    CREATE PROCEDURE actualizar_nombre_usuario(IN ID INT, IN NewName VARCHAR(50), IN Name VARCHAR(50))
    BEGIN
    UPDATE Users SET UserName=NewName WHERE UserID=ID;
    END
    $$
    ```
    ```sql
    call actualizar_nombre_usuario(6, 'Pedro','Antonio');
    ```
    ```sql
    select * from Users;

    +--------+----------+---------------------+
    | UserID | UserName | Email               |
    +--------+----------+---------------------+
    |      1 | Juan     | juan@example.com    |
    |      2 | María    | maria@example.com   |
    |      3 | Pedro    | pedro@example.com   |
    |      4 | Alba     | alba@example.com    |
    |      5 | Paco     | paco@example.com    |
    |      6 | Pedro    | antonio@example.com |
    |      7 | Alfonso  | alfonso@example.com |
    +--------+----------+---------------------+
    ```

    - Implementa funciones para realizar cálculos o consultas:

        - Función para calcular el precio total de un conjunto de productos.

        ```sql
        DELIMITER //

        CREATE FUNCTION PrecioTotalProductos() RETURNS FLOAT DETERMINISTIC
        BEGIN
            DECLARE Resultado FLOAT;
            SELECT SUM(Price) FROM Products INTO Resultado;
            RETURN Resultado;
        END;
        //
        DELIMITER ;
        ```

        ```sql
        select PrecioTotalProductos();

        +------------------------+
        | PrecioTotalProductos() |
        +------------------------+
        |                 105.27 |
        +------------------------+
        ```

        - Función para contar el número de usuarios.

        ```sql
        DELIMITER //

        CREATE FUNCTION TotalUsuarios() RETURNS INT DETERMINISTIC
        BEGIN
            DECLARE Resultado INT;
            SELECT COUNT(UserID) FROM Users INTO Resultado;
            RETURN Resultado;
        END;
        //
        DELIMITER ;
        ```

        ```sql
        select TotalUsuarios();
        
        +-----------------+
        | TotalUsuarios() |
        +-----------------+
        |               7 |
        +-----------------+
        ```