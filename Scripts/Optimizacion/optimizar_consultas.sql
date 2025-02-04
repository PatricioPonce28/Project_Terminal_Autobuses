-- Monitoreo de índices existentes
SHOW INDEX FROM Personas;
SHOW INDEX FROM Pagos;
SHOW INDEX FROM Reservas;
SHOW INDEX FROM Ticket;

-- Analizar tablas para ver uso de índices
ANALYZE TABLE Personas;
ANALYZE TABLE Pagos;
ANALYZE TABLE Reservas;
ANALYZE TABLE Ticket;

-- Eliminar índices innecesarios (Si es necesario)
DROP INDEX idx_no_utilizado ON Personas;
DROP INDEX idx_no_utilizado ON Pagos;
DROP INDEX idx_no_utilizado ON Reservas;
DROP INDEX idx_no_utilizado ON Ticket;

-- Crear índices óptimos para mejorar consultas frecuentes
CREATE INDEX idx_documento_identidad ON Personas(documento_identidad);
CREATE INDEX idx_fecha_pago ON Pagos(fecha_pago);
CREATE INDEX idx_estado_reserva ON Reservas(estado);
CREATE INDEX idx_codigo_ticket ON Ticket(codigo_ticket);
