-- creacion de index posiblemente que mas se utilicen
-- Índice en 'placa' de la tabla Buses
CREATE INDEX idx_placa_buses ON Buses(placa);

-- Índice en 'id_pasajero' de la tabla Reservas
CREATE INDEX idx_id_pasajero_reservas ON Reservas(id_pasajero);
-- Índice en la columna 'id_pasajero' de Reservas para optimizar búsquedas de reservas por pasajero
CREATE INDEX idx_id_pasajero ON Reservas(id_pasajero);
-- Índice en 'id_viaje' de la tabla Reservas
CREATE INDEX idx_id_viaje_reservas ON Reservas(id_viaje);

-- Índice en 'id_terminal' de la tabla Viajes
CREATE INDEX idx_id_terminal_viajes ON Viajes(id_terminal);

-- Índice en 'ciudad' de la tabla Terminales
CREATE INDEX idx_ciudad_terminales ON Terminales(ciudad);
-- Índice en la columna 'id_reserva' de Pagos para mejorar el rendimiento al consultar pagos asociados a reservas
CREATE INDEX idx_id_reserva ON Pagos(id_reserva);



-- alterar index de ser neceasrio 
ALTER TABLE Cobradores ADD INDEX idx_turno (turno);
ALTER TABLE Buses ADD INDEX idx_disponibilidad (disponibilidad);
ALTER TABLE Rutas ADD INDEX idx_nombre_ruta (nombre_ruta);
ALTER TABLE Rutas ADD INDEX idx_tarifa (tarifa_estandar);
ALTER TABLE Viajes ADD INDEX idx_ciudad_salida (ciudad_salida);
ALTER TABLE Viajes ADD INDEX idx_destino (destino);
ALTER TABLE Viajes ADD INDEX idx_fecha_salida (fecha_salida);
ALTER TABLE Reservas ADD INDEX idx_estado (estado);
ALTER TABLE Pagos ADD INDEX idx_id_reserva (id_reserva);
ALTER TABLE Conductores ADD INDEX idx_licencia (licencia);

SHOW INDEX FROM Personas;

