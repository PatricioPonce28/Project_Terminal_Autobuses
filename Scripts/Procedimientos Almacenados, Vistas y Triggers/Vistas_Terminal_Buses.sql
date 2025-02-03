use terminal_buses;
-- Vistas 
-- 1era Vista
CREATE VIEW VistaViajesPasajerosReservas AS
SELECT
    v.id_viaje,
    v.ciudad_salida,
    v.destino,
    v.fecha_salida,
    v.fecha_llegada,
    p.id_persona AS id_pasajero,
    p.nombres AS nombre_pasajero,
    p.documento_identidad,
    r.id_reserva,
    r.fecha_reserva,
    r.asiento_disponibles,
    r.estado
FROM
    Viajes v
JOIN
    Reservas r ON v.id_viaje = r.id_viaje
JOIN
    Pasajeros pa ON r.id_pasajero = pa.id_persona
JOIN
    Personas p ON pa.id_persona = p.id_persona;

SELECT * FROM VistaViajesPasajerosReservas;

    
-- 2da Vista 
CREATE OR REPLACE VIEW VistaBusConductorCobrador AS
SELECT
    b.id_bus,
    b.placa,
    b.modelo,
    b.capacidad,
    b.fecha_mantenimiento,
    b.disponibilidad,
    c.id_persona AS id_conductor,
    p1.nombres AS nombre_conductor,
    c.licencia,
    c.fecha_contratacion AS fecha_contratacion_conductor,
    co.id_persona AS id_cobrador,
    p2.nombres AS nombre_cobrador,
    co.turno,
    co.fecha_contratacion AS fecha_contratacion_cobrador
FROM
    Buses b
LEFT JOIN
    Conductores c ON b.id_bus = c.id_persona
LEFT JOIN
    Personas p1 ON c.id_persona = p1.id_persona
LEFT JOIN
    Cobradores co ON b.id_bus = co.id_persona
LEFT JOIN
    Personas p2 ON co.id_persona = p2.id_persona;
    
SELECT * FROM VistaBusConductorCobrador;
