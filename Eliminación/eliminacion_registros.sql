-- Productos
-- 1.
delete from productos
where descripcion is null

select * from productos

-- Cuentas
-- 1.
delete from cuentas
where cedula_propietario like '10%'

select * from cuentas

-- Estudiantes
-- 1.
delete from estudiantes
where cedula like '%05'

select * from estudiantes

-- Registros
-- 1.
delete from registros
where extract(month from fecha) = 6

select * from registros

-- Videojuegos
-- 1.
delete from videojuegos
where valoracion < 7

select * from videojuegos

-- Transacciones
delete from transacciones
where (hora between '14:00' and '18:00')
and (extract(month from fecha) = 8)
and (extract(year from fecha) = extract(year from current_date))

select * from transacciones