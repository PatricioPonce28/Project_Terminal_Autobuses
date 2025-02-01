-- Cifrar el documento de identidad de los pasajeros usando AES_ENCRYPT
SET SQL_SAFE_UPDATES = 0;

UPDATE Personas
SET documento_identidad = AES_ENCRYPT(documento_identidad, 'clave_secreta')
WHERE tipo_persona = 'Pasajero';

-- Cifrar detalles de pago, como el método de pago (por ejemplo, 'Efectivo', 'Tarjeta', 'Transferencia')
UPDATE Pagos
SET metodo_pago = AES_ENCRYPT(metodo_pago, 'clave_secreta');
SET SQL_SAFE_UPDATES = 1;
-- Desencriptar datos cuando sea necesario
-- Ejemplo: si se necesita leer el documento de identidad del pasajero
SELECT id_persona, AES_DECRYPT(documento_identidad, 'clave_secreta') AS documento_identidad
FROM Personas
WHERE tipo_persona = 'Pasajero';

-- Desencriptar los detalles de pago si es necesario
SELECT id_pago, AES_DECRYPT(metodo_pago, 'clave_secreta') AS metodo_pago
FROM Pagos;
