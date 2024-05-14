# Tarea 4

Después de haber creadO la BBDD e insertadas las tablas, creamos el siguiente procedimiento

```sql
DELIMITER //
CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```
1. Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. El procedimiento debe tener parámetros de entrada.
```sql
  DELIMITER //
  CREATE PROCEDURE aumentar_salarios_5%(IN porcentaje DECIMAL(5,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          IF emp_salario <= 3200.00 THEN
            UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id;
          END IF;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```


2. Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima.
```sql
DELIMITER //
CREATE PROCEDURE calcular_salario_anual(IN porcentaje DECIMAL(5,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF  THEN
            LEAVE read_loop;
        END IF;
        SELECT id, nombre, salario * meses AS salario_anual FROM empleados;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

3. Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). El procedimiento debe tener parámetros de entrada.

```sql
DELIMITER //
CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF emp_salario >= limite_minimo AND emp_salario <= limite_maximo THEN SET emp_count = emp_count + 1;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

