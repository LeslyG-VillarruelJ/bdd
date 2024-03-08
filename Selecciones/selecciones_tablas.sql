-- Productos
-- 1.
select * from productos
where nombre like 'Q%';
-- 2.
select * from productos
where descripcion is null;
-- 3.
select * from productos
where precio
between money(2) and money(3);


-- Cuentas
-- 1.
select numero_cuenta, saldo from cuentas
-- 2.
select * from cuentas
where fecha_creación
between current_date - 60 and current_date
-- 3.
select numero_cuenta, saldo from cuentas
where fecha_creación
between current_date - 60 and current_date

-- Estudiantes
-- 1.
select nombre, cedula from estudiantes
-- 2.
select * from estudiantes
where cedula like '17%'
-- 3.
select nombre, apellido from estudiantes
where nombre like 'A%'

-- Registros
-- 1.
select cedula_empleado, fecha, hora from registros
-- 2.
select * from registros
where hora
between '7:00' and '14:00'
-- 3.
select * from registros
where hora > '8:00'

-- Videojuegos
-- 1.
select * from videojuegos
where nombre like 'C%'
-- 2.
select * from videojuegos
where valoracion
between 9 and 10

-- Transacciones
-- 1.
select * from transacciones
where tipo = 'D'
-- 2.
select * from transacciones
where monto
between money(200) and money(2000)
-- 3.
select codigo, monto, tipo, fecha from transacciones
where fecha is not null