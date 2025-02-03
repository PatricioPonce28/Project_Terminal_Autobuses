use terminal_buses;
-- Ingresos 
INSERT INTO Personas (nombres, documento_identidad, tipo_persona) VALUES
('Juan Pérez', '1234567890', 'Pasajero'),
('María Gómez', '0987654321', 'Conductor'),
('Carlos Ruiz', '1122334455', 'Controlador'),
('Ana Martínez', '2233445566', 'Pasajero'),
('Luis Fernández', '3344556677', 'Conductor'),
('Laura Sánchez', '4455667788', 'Controlador'),
('Pedro Ramírez', '5566778899', 'Pasajero'),
('Sofía Torres', '6677889900', 'Conductor'),
('Miguel López', '7788990011', 'Controlador'),
('Elena Díaz', '8899001122', 'Pasajero');

INSERT INTO Pasajeros (id_persona, email) VALUES
(1, 'juan.perez@example.com'),
(4, 'ana.martinez@example.com'),
(7, 'pedro.ramirez@example.com'),
(10, 'elena.diaz@example.com');

INSERT INTO Conductores (id_persona, licencia, fecha_contratacion) VALUES
(2, 'LIC123456', '2022-01-15'),
(5, 'LIC654321', '2022-02-20'),
(8, 'LIC789012', '2022-03-25');

INSERT INTO Cobradores (id_persona, turno, fecha_contratacion) VALUES
(3, 'Mañana', '2022-01-10'),
(6, 'Tarde', '2022-02-15'),
(9, 'Noche', '2022-03-20');

INSERT INTO Terminales (nombres, ciudad, direccion, telefono) VALUES
('Terminal Norte', 'Quito', 'Av. 6 de Diciembre', '022345678'),
('Terminal Sur', 'Quito', 'Av. Maldonado', '022345679'),
('Terminal Quitumbe', 'Quito', 'Av. Mariscal Sucre', '022345680'),
('Terminal Carcelén', 'Quito', 'Av. Panamericana Norte', '022345681'),
('Terminal Terrestre', 'Guayaquil', 'Av. Benjamín Rosales', '042345678'),
('Terminal Pascuales', 'Guayaquil', 'Av. Francisco de Orellana', '042345679'),
('Terminal Cuenca', 'Cuenca', 'Av. España', '072345678'),
('Terminal Loja', 'Loja', 'Av. Universitaria', '072345679'),
('Terminal Ambato', 'Ambato', 'Av. Bolivariana', '032345678'),
('Terminal Riobamba', 'Riobamba', 'Av. Daniel León Borja', '032345679');

INSERT INTO Buses (placa, modelo, capacidad, fecha_mantenimiento, disponibilidad) VALUES
('ABC1234', 'Mercedes', 50, '2023-01-10', 'Disponible'),
('DEF5678', 'Volvo', 45, '2023-02-15', 'Disponible'),
('GHI9012', 'Scania', 60, '2023-03-20', 'Mantenimiento'),
('JKL3456', 'Mercedes', 55, '2023-04-25', 'Disponible'),
('MNO7890', 'Volvo', 50, '2023-05-30', 'Disponible'),
('PQR1234', 'Scania', 45, '2023-06-10', 'Mantenimiento'),
('STU5678', 'Mercedes', 60, '2023-07-15', 'Disponible'),
('VWX9012', 'Volvo', 55, '2023-08-20', 'Disponible'),
('YZA3456', 'Scania', 50, '2023-09-25', 'Mantenimiento'),
('BCD7890', 'Mercedes', 45, '2023-10-30', 'Disponible');

INSERT INTO Rutas (nombre_ruta, distancia, tiempo_estimado, tarifa_estandar, id_bus) VALUES
('Ruta 1', 100.50, '02:30:00', 10.00, 1),
('Ruta 2', 150.75, '03:45:00', 15.00, 2),
('Ruta 3', 200.00, '04:00:00', 20.00, 3),
('Ruta 4', 250.25, '05:15:00', 25.00, 4),
('Ruta 5', 300.50, '06:30:00', 30.00, 5),
('Ruta 6', 350.75, '07:45:00', 35.00, 6),
('Ruta 7', 400.00, '08:00:00', 40.00, 7),
('Ruta 8', 450.25, '09:15:00', 45.00, 8),
('Ruta 9', 500.50, '10:30:00', 50.00, 9),
('Ruta 10', 550.75, '11:45:00', 55.00, 10);

INSERT INTO Viajes (ciudad_salida, destino, fecha_salida, fecha_llegada, id_terminal, id_ruta) VALUES
('Quito', 'Guayaquil', '2023-01-01 08:00:00', '2023-01-01 14:00:00', 1, 1),
('Quito', 'Cuenca', '2023-01-02 09:00:00', '2023-01-02 15:00:00', 2, 2),
('Quito', 'Loja', '2023-01-03 10:00:00', '2023-01-03 18:00:00', 3, 3),
('Quito', 'Ambato', '2023-01-04 11:00:00', '2023-01-04 13:00:00', 4, 4),
('Quito', 'Riobamba', '2023-01-05 12:00:00', '2023-01-05 14:00:00', 5, 5),
('Guayaquil', 'Quito', '2023-01-06 13:00:00', '2023-01-06 19:00:00', 6, 6),
('Guayaquil', 'Cuenca', '2023-01-07 14:00:00', '2023-01-07 20:00:00', 7, 7),
('Guayaquil', 'Loja', '2023-01-08 15:00:00', '2023-01-08 23:00:00', 8, 8),
('Guayaquil', 'Ambato', '2023-01-09 16:00:00', '2023-01-09 18:00:00', 9, 9),
('Guayaquil', 'Riobamba', '2023-01-10 17:00:00', '2023-01-10 19:00:00', 10, 10);

INSERT INTO Reservas (fecha_reserva, asiento_disponibles, id_pasajero, id_viaje, estado) VALUES
('2023-01-01 07:00:00', 40, 1, 1, 'Confirmada'),
('2023-01-02 08:00:00', 35, 4, 2, 'Confirmada'),
('2023-01-03 09:00:00', 30, 7, 3, 'Confirmada'),
('2023-01-04 10:00:00', 25, 10, 4, 'Confirmada'),
('2023-01-05 11:00:00', 20, 1, 5, 'Confirmada'),
('2023-01-06 12:00:00', 15, 4, 6, 'Confirmada'),
('2023-01-07 13:00:00', 10, 7, 7, 'Confirmada'),
('2023-01-08 14:00:00', 5, 10, 8, 'Confirmada'),
('2023-01-09 15:00:00', 0, 1, 9, 'Confirmada'),
('2023-01-10 16:00:00', 40, 4, 10, 'Confirmada');

INSERT INTO Pagos (id_reserva, monto, metodo_pago, fecha_pago) VALUES
(1, 10.00, 'Efectivo', '2023-01-01 07:30:00'),
(2, 15.00, 'Tarjeta', '2023-01-02 08:30:00'),
(3, 20.00, 'Transferencia', '2023-01-03 09:30:00'),
(4, 25.00, 'Efectivo', '2023-01-04 10:30:00'),
(5, 30.00, 'Tarjeta', '2023-01-05 11:30:00'),
(6, 35.00, 'Transferencia', '2023-01-06 12:30:00'),
(7, 40.00, 'Efectivo', '2023-01-07 13:30:00'),
(8, 45.00, 'Tarjeta', '2023-01-08 14:30:00'),
(9, 50.00, 'Transferencia', '2023-01-09 15:30:00'),
(10, 55.00, 'Efectivo', '2023-01-10 16:30:00');

INSERT INTO Ticket (id_reserva, codigo_ticket, estado, fecha_emision) VALUES
(1, 'TICKET001', 'Emitido', '2023-01-01 07:45:00'),
(2, 'TICKET002', 'Emitido', '2023-01-02 08:45:00'),
(3, 'TICKET003', 'Emitido', '2023-01-03 09:45:00'),
(4, 'TICKET004', 'Emitido', '2023-01-04 10:45:00'),
(5, 'TICKET005', 'Emitido', '2023-01-05 11:45:00'),
(6, 'TICKET006', 'Emitido', '2023-01-06 12:45:00'),
(7, 'TICKET007', 'Emitido', '2023-01-07 13:45:00'),
(8, 'TICKET008', 'Emitido', '2023-01-08 14:45:00'),
(9, 'TICKET009', 'Emitido', '2023-01-09 15:45:00'),
(10, 'TICKET010', 'Emitido', '2023-01-10 16:45:00');