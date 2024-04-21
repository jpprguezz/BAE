# Tarea 2 

### Carga de datos

Primero realizamos la carga de datos de la base de datos jardineria

```sql
source D:\mysql\jardineria.sql;
```

- Función calcular_precio_total_pedido

    - Parámetros de entrada: codigo_pedido (INT)
    - Parámetros de salida: El precio total del pedido (FLOAT)

    ```sql
    DELIMITER//
    
    CREATE FUNCTION calcular_precio_total_pedido(codigo_pedido INT) RETURNS FLOAT DETERMINISTIC
    BEGIN
        DECLARE Resultado FLOAT;

        SELECT SUM(cantidad * precio_unidad) INTO Resultado
        FROM detalle_pedido
        WHERE codigo_pedido = codigo_pedido;

        RETURN Resultado;
    END
    //


    SELECT calcular_precio_total_pedido(3);

    +---------------------------------+
    | calcular_precio_total_pedido(3) |
    +---------------------------------+
    |                          217738 |
    +---------------------------------+
    ```

- Función calcular_suma_pedidos_cliente
    - Parámetros de entrada: codigo_cliente (INT)
    - Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)
    ```sql
    DELIMITER //
    CREATE FUNCTION calcular_suma_pedidos_cliente(codigo_cliente INT) RETURNS FLOAT DETERMINISTIC
    BEGIN
        DECLARE Resultado FLOAT;
        SELECT SUM(calcular_precio_total_pedido(codigo_pedido)) INTO Resultado
        FROM pedido
        WHERE codigo_cliente = codigo_cliente;
        RETURN Resultado;
    END 
    //
    SELECT calcular_suma_pedidos_cliente(1);
    +----------------------------------+
    | calcular_suma_pedidos_cliente(1) |
    +----------------------------------+
    |                         25039900 |
    +----------------------------------+
    ```
- Función calcular_suma_pagos_cliente
    Parámetros de entrada: codigo_cliente (INT)
    Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)
    ```sql
    DELIMITER //
    CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INT) RETURNS FLOAT DETERMINISTIC
    BEGIN
        DECLARE Resultado FLOAT;
        SELECT SUM(total) INTO Resultado
        FROM pago
        WHERE codigo_cliente = codigo_cliente;
        RETURN Resultado;
    END 
    //
    SELECT calcular_suma_pagos_cliente(1);
    +--------------------------------+
    | calcular_suma_pagos_cliente(1) |
    +--------------------------------+
    |                         197940 |
    +--------------------------------+
    ```
- Procedimiento calcular_pagos_pendientes



