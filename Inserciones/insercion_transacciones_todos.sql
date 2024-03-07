-- Insertar registros en la tabla transacciones
INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (1, '12345', 100.00, 'C', '2024-03-07', '09:00:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (2, '54321', 50.00, 'D', '2024-03-07', '09:15:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (3, '13579', 200.00, 'C', '2024-03-07', '09:30:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (4, '97531', 75.00, 'D', '2024-03-07', '10:00:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (5, '24680', 150.00, 'C', '2024-03-07', '10:30:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (6, '86420', 25.00, 'D', '2024-03-07', '11:00:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (7, '13579', 300.00, 'C', '2024-03-07', '11:30:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (8, '97531', 50.00, 'D', '2024-03-07', '12:00:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (9, '24680', 175.00, 'C', '2024-03-07', '12:30:00');

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (10, '86420', 30.00, 'D', '2024-03-07', '13:00:00');

select * from transacciones;