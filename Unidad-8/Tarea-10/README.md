# Tarea 10

Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características: Trigger: trigger_guardar_email_after_update:

Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de actualización.
Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
La tabla log_cambios_email contiene los siguientes campos:
    - id: clave primaria (entero autonumérico)
    - id_alumno: id del alumno (entero)
    - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
    - old_email: valor anterior del email (cadena de caracteres)
    - new_email: nuevo valor con el que se ha actualizado


```sql
CREATE TABLE log_cambios_email (
    id INTEGER PRIMARY KEY,
    id_alumno INTEGER,
    fecha_hora DATE,
    old_email VARCHAR(100),
    new_email VARCHAR(100)
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id)

);

DELIMITER //

CREATE TRIGGER trigger_guardar_email_after_update
AFTER UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        INSERT INTO log_cambios_email(id_alumno, fecha_hora, old_email, new_email) 
        VALUES (OLD.id, NOW(), OLD.email, NEW.email);
    END IF;
END;
//
```



