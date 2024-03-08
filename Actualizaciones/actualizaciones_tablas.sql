-- Productos
-- 1.
select * from productos

update productos set stock = 0
where descripcion is null

-- Cuentas
-- 1.
select * from cuentas
where cedula_propietario like '17%'

update cuentas set saldo = 10.0
where cedula_propietario like '17%'

-- Estudiantes
-- 1.
select * from estudiantes

update estudiantes set apellido = 'Hernández'
where cedula like '17%'

-- Registros
-- 1.
select * from registros

update registros set cedula_empleado = '08234579'
where extract(month from fecha ) = 8

-- Videojuegos
-- 1.
select * from videojuegos

update videojuegos set descripcion = 'Mejor puntuado'
where valoracion > 9

-- Transacciones
-- 1.
select * from transacciones

update transacciones set tipo = 'T'
where (monto > money(100) and monto < money(500))
and extract(month from fecha) = 9
and (hora between '14:00' and '20:00')