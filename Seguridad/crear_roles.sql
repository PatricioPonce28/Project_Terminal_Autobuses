-- Crear los roles
CREATE ROLE 'Administrador';
CREATE ROLE 'Usuario';

-- Asignar permisos al rol 'Administrador' 
GRANT ALL PRIVILEGES ON terminal_buses.* TO 'Administrador'@'%';

-- Asignar permisos al rol 'Usuario' (acceso limitado a Reservas, Pagos y Ticket)
GRANT SELECT, INSERT, UPDATE ON terminal_buses.Reservas TO 'Usuario'@'%';
GRANT SELECT, INSERT ON terminal_buses.Pagos TO 'Usuario'@'%';
GRANT SELECT, UPDATE ON terminal_buses.Ticket TO 'Usuario'@'%';

-- Crear usuarios y asignarles roles
-- Administrador
GRANT 'Administrador' TO 'admin'@'%';

-- Usuario
GRANT 'Usuario' TO 'user'@'%';
