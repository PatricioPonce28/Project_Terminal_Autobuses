-- detectar consultas lentas
SHOW PROCESSLIST;

EXPLAIN SELECT * FROM Viajes WHERE ciudad_salida = 'Bogotá';
-- alterar las que considere innecesarias 
ALTER TABLE Viajes DROP INDEX idx_ciudad_salida ;
ALTER TABLE Viajes ADD INDEX idx_ciudad_salida (ciudad_salida);
-- en caso de que las consultas sean lentas por MYSQL verificar con:
SHOW VARIABLES LIKE 'key_buffer_size';
SHOW VARIABLES LIKE 'query_cache_size';

SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 2;  -- Umbral de 2 segundos para consultas lentas
-- monitorear las consultas 
SELECT * FROM mysql.slow_log WHERE start_time >= '2025-02-01';
SHOW STATUS LIKE 'Queries';
SHOW VARIABLES LIKE 'slow_query_log';
-- path de donde se guardan las consultas lentas
SHOW VARIABLES LIKE 'slow_query_log_file';



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
