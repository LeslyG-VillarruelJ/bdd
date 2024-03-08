-- Productos
-- 1.
select * from productos
where stock = 10 and precio < money(10)
-- 2.
select nombre, stock from productos
where nombre like '%m%' or descripcion is null
-- 3.
select nombre from productos
where descripcion is null or stock = 0


-- Cuentas
-- 1.
select numero_cuenta, saldo from cuentas
where saldo > money(100) and saldo < money(1000)
-- 2.
select * from cuentas
where fecha_creación
between current_date - 365 and current_date
-- 3.
select * from cuentas
where saldo = money(0) or cedula_propietario like '%2'


-- Estudiantes
-- 1.
select nombre, apellido from estudiantes
where nombre like 'M%' or apellido like '%z'
-- 2.
select nombre from estudiantes
where cedula like '%32%' 
and cedula like '18%'
-- 3.
select nombre, apellido from estudiantes
where cedula like '%06' 
and cedula like '17%'


-- Registros
-- 1.
select * from registros
where extract(month from fecha) = 9
or cedula_empleado like '17%'
-- 2
select * from registros
where extract(month from fecha) = 8
and cedula_empleado like '17%'
and hora between '08:00' and '12:00'
-- 3.
select * from registros
where (extract(month from fecha) = 8
and cedula_empleado like '17%'
and hora between '08:00' and '12:00')
or (extract(month from fecha) = 9
and cedula_empleado like '08%'
and hora between '09:00' and '13:00')


--Videojuegos
-- 1.
select * from videojuegos
where nombre like '%c%' or valoracion = 7
-- 2.
select * from videojuegos
where (codigo between 3 and 7)
or valoracion = 7
-- 3.
select * from videojuegos
where (valoracion > 7 and nombre like 'C%')
or (valoracion > 8 and nombre like 'D%')


-- Transacciones
-- 1.
select * from transacciones
where tipo = 'C' 
and (numero_cuenta between '22001' and '22004')
-- 2.
select * from transacciones
where tipo = 'D'
and fecha = '25/05/2023'
and (numero_cuenta between '22007' and '22010')
-- 3.
select * from transacciones
where (codigo between 1 and 5)
and (numero_cuenta between '22002' and '22004')
and (fecha = '26/05/2023' or fecha = '29/05/2023')