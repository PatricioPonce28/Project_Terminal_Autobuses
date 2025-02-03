use terminal_buses;
-- Triggers

drop trigger before_reservas_update;
CREATE TABLE log_reservas_pagos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    tabla VARCHAR(50),
    operacion ENUM('UPDATE', 'DELETE'),
    id_registro INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(50),
    detalles TEXT
);

DELIMITER $$
CREATE TRIGGER before_reservas_update
BEFORE UPDATE ON Reservas
FOR EACH ROW
BEGIN
    INSERT INTO log_reservas_pagos (tabla, operacion, id_registro, usuario, detalles)
    VALUES ('Reservas', 'UPDATE', OLD.id_reserva, USER(), 
            CONCAT('Antes: ', OLD.estado, ', Después: ', NEW.estado));
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_reservas_delete
BEFORE DELETE ON Reservas
FOR EACH ROW
BEGIN
    INSERT INTO log_reservas_pagos (tabla, operacion, id_registro, usuario, detalles)
    VALUES ('Reservas', 'DELETE', OLD.id_reserva, USER(), 
            CONCAT('Estado: ', OLD.estado));
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_pagos_update
BEFORE UPDATE ON Pagos
FOR EACH ROW
BEGIN
    INSERT INTO log_reservas_pagos (tabla, operacion, id_registro, usuario, detalles)
    VALUES ('Pagos', 'UPDATE', OLD.id_pago, USER(), CONCAT('Antes: ', OLD.monto, ', Después: ', NEW.monto));
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_pagos_delete
BEFORE DELETE ON Pagos
FOR EACH ROW
BEGIN
    INSERT INTO log_reservas_pagos (tabla, operacion, id_registro, usuario, detalles)
    VALUES ('Pagos', 'DELETE', OLD.id_pago, USER(), CONCAT('Monto: ', OLD.monto));
END $$
DELIMITER ;

INSERT INTO log_reservas_pagos (tabla, operacion, id_registro, usuario, detalles)
VALUES ('Reservas', 'UPDATE', 123, 'usuario_prueba', 'Antes: Activo, Después: Cancelado');

INSERT INTO log_reservas_pagos (tabla, operacion, id_registro, usuario, detalles)
VALUES ('Pagos', 'DELETE', 456, 'usuario_prueba', 'Monto: 100.00');

UPDATE log_reservas_pagos
SET detalles = 'Antes: Inactivo, Después: Activo'
WHERE id_auditoria = 1;

DELETE FROM log_reservas_pagos
WHERE id_auditoria = 1;

select * from log_reservas_pagos;
