use terminal_buses;

CREATE TABLE DescuentosCargos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Descuento', 'Cargo') NOT NULL,
    descripcion VARCHAR(255),
    porcentaje DECIMAL(5, 2) NOT NULL
);

DELIMITER //
CREATE PROCEDURE CalcularPrecioTotalReserva(
    IN id_reserva INT,
    OUT precio_total DECIMAL(10, 2),
    OUT descuento_total DECIMAL(10, 2),
    OUT cargo_total DECIMAL(10, 2)
)
BEGIN
    DECLARE precio_base DECIMAL(10, 2);

    SELECT monto INTO precio_base
    FROM Pagos
    WHERE id_reserva = id_reserva
    LIMIT 1;

    SELECT IFNULL(SUM(porcentaje), 0) INTO descuento_total
    FROM DescuentosCargos
    WHERE tipo = 'Descuento';

    SELECT IFNULL(SUM(porcentaje), 0) INTO cargo_total
    FROM DescuentosCargos
    WHERE tipo = 'Cargo';

    SET precio_total = precio_base - (precio_base * (descuento_total / 100)) + (precio_base * (cargo_total / 100));
END //
DELIMITER ;

CALL CalcularPrecioTotalReserva(5, @precio_total, @descuento_total, @cargo_total);
SELECT @precio_total AS PrecioTotal, @descuento_total AS DescuentoTotal, @cargo_total AS CargoTotal;