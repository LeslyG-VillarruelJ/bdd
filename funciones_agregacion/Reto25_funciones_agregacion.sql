-- Relacion cuentas con usuario
-- Agregación 1
select avg(cast(saldo as numeric)) saldo_promedio
from usuario us, cuentas ct
where us.cedula = ct.cedula_propietario
and cedula = '17111'
-- Agregación 2
select tipo_cuenta, count(*)
from usuario
group by tipo_cuenta


-- Relacion clientes con compras
-- Agragación 1
select co.cedula, sum(monto) monto_total_compras
from clientes cl, compras co
where cl.cedula = co.cedula
group by co.cedula
-- Agregación 2
select fecha_compra, count(*) 
from compras
where fecha_compra ='2024-03-27'
group by fecha_compra



-- Relación estudiantes y profesores
-- Agregación 1
select codigo_profesor, count(*)
from estudiantes st, profesores pr
where st.codigo_profesor = pr.codigo
group by codigo_profesor
-- Agregación 2
select round(avg((extract (year from current_date)) - ((extract (year from fecha_nacimiento))))) edad_promedio
from estudiantes


-- Relación entre personas y préstamos
-- Agregación 1
select pe.cedula cedula, sum(pr.monto) monto_total_prestamos
from personas pe, prestamos pr
where pe.cedula = pr.cedula
group by pe.cedula
-- Agregación 2
select count(*) total_personas
from personas
where numero_hijos > 1


-- Relación productos y ventas
-- Agregación 1
select max(precio) precio_maximo
from productos
-- Agregación 2
select sum(cantidad) cantidad_total_vendida
from ventas


-- Relación transacciones y banco
-- Agregación 1
select count(*) total_transacciones_credito
from transacciones
where tipo = 'C'
-- Agregación 2
select numero_cuenta, round(avg(cast(monto as decimal)),2) monto_promedio
from transacciones
group by numero_cuenta


-- Relación videojuegos y plataformas
-- Agregación 1
select codigo_videojuego, count(*) total_plataformas
from plataformas
group by codigo_videojuego
-- Agregación 2
select round(avg(valoracion),2) valoracion_promedio
from videojuegos


-- Relación registros y empleado
-- Agregación 1
select codigo_empleado as cedula_empleado, count(*) total_registros_entrada
from registros
group by codigo_empleado
-- Agregacion 2
select min(fecha) fecha_minima, max(fecha) fecha_maxima
from registros