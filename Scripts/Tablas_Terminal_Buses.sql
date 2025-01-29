create database terminal_buses;
use terminal_buses;
-- Tabla Personas (Padre)
CREATE TABLE Personas (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    documento_identidad VARCHAR(20) UNIQUE NOT NULL,
    tipo_persona ENUM('Pasajero', 'Conductor', 'Controlador') NOT NULL
);

-- Tabla Pasajeros
CREATE TABLE Pasajeros (
    id_persona INT PRIMARY KEY,
    email VARCHAR(150) UNIQUE,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_persona) REFERENCES Personas(id_persona)
);

-- Tabla Conductores
CREATE TABLE Conductores (
    id_persona INT PRIMARY KEY,
    licencia VARCHAR(20) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Personas(id_persona)
);

-- Tabla Cobradores
CREATE TABLE Cobradores (
    id_persona INT PRIMARY KEY,
    turno ENUM('Mañana', 'Tarde', 'Noche') NOT NULL,
    fecha_contratacion DATE NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Personas(id_persona)
);

-- Tabla Terminales
CREATE TABLE Terminales (
    id_terminal INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Tabla Buses
CREATE TABLE Buses (
    id_bus INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    capacidad INT NOT NULL,
    fecha_mantenimiento DATE,
    disponibilidad ENUM('Disponible', 'Mantenimiento') DEFAULT 'Disponible'
);

-- Tabla Rutas
CREATE TABLE Rutas (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ruta VARCHAR(100) NOT NULL,
    distancia DECIMAL(5, 2),
    tiempo_estimado TIME,
    tarifa_estandar DECIMAL(10, 2),
    id_bus INT,
    FOREIGN KEY (id_bus) REFERENCES Buses(id_bus)
);

-- Tabla Viajes
CREATE TABLE Viajes (
    id_viaje INT AUTO_INCREMENT PRIMARY KEY,
    ciudad_salida VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    fecha_salida DATETIME NOT NULL,
    fecha_llegada DATETIME NOT NULL,
    id_terminal INT,
    id_ruta INT,
    FOREIGN KEY (id_terminal) REFERENCES Terminales(id_terminal),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

-- Tabla Reservas
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    fecha_reserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    asiento_disponibles INT NOT NULL,
    id_pasajero INT,
    id_viaje INT,
    estado ENUM('Confirmada', 'Cancelada') DEFAULT 'Confirmada',
    FOREIGN KEY (id_pasajero) REFERENCES Pasajeros(id_persona),
    FOREIGN KEY (id_viaje) REFERENCES Viajes(id_viaje)
);

-- Tabla Pagos
CREATE TABLE Pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    metodo_pago ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);

-- Tabla Ticket
CREATE TABLE Ticket (
    id_ticket INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    codigo_ticket VARCHAR(20) UNIQUE NOT NULL,
    estado ENUM('Emitido', 'Cancelado') DEFAULT 'Emitido',
    fecha_emision DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);


