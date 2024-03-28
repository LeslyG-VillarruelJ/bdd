-- Usuario y cuentas
-- Consulta
select cs.numero_cuenta, u.nombre from
usuario u, cuentas cs
where u.cedula = cs.cedula_propietario
and (cs.saldo between money(100) and money(1000)) 
-- Subconsulta
select * from
usuario u, cuentas cs
where u.cedula = cs.cedula_propietario
and (cs.fecha_creación between '2022-09-21' and '2023-09-21') 


-- Clientes y compras
-- Consulta
select cl.nombre, cl.apellido from
clientes cl
where cl.cedula like '%7%'
-- subconsulta
select *
from clientes
where cedula = (select  cedula from clientes where nombre = 'Mónica' limit 1);


-- Estudiantes y profesores
-- Consulta
select pr.codigo, st.nombre, st.apellido from
estudiantes st, profesores pr
where st.apellido like '%n%'
-- Subconsulta
select st.* from
estudiantes st, profesores pr
where st.codigo_profesor = pr.codigo
and pr.nombre = 'Francisco'


-- Persona y préstamo
-- Consulta
select pe.cantidad_ahorrada, pr.monto, pr.garante from
personas pe, prestamos pr
where pr.monto between money(100) and money(1000)
-- Subconsulta
select pe.* from
personas pe, prestamos pr
where pe.cedula = pr.cedula
and pe.cedula = (select cedula from personas where nombre = 'Sean')


-- Productos y ventas
-- Consulta
select pr.nombre, pr.stock, ve.cantidad from
productos pr, ventas ve
where pr.nombre like '%m%'
or descripcion is null
-- subconsulta
select pr.nombre, pr.stock from
productos pr, ventas ve
where pr.codigo = ve.codigo_producto
and ve.cantidad = 5


-- Transacciones y banco
-- Consulta
select * from
transacciones tr, banco ba
where tr.tipo = 'C' 
and (tr.numero_cuenta between '22001' and '22004')
-- Subconsulta
select tr.* from
transacciones tr, banco ba
where tr.codigo = ba.codigo_transaccion
and ba.codigo_banco = 1


-- videojuegos y plataformas
-- Consulta
select vi.nombre, vi.descripcion, vi.valoracion, pl.nombre_plataforma
from videojuegos vi, plataformas pl
where (descripcion = 'Guerra' and valoracion > 7)
or ((vi.nombre like 'C%' and valoracion > 8) or vi.nombre like 'D%')
-- Subconsulta
select pl.* from
videojuegos vi, plataformas pl
where vi.codigo = pl.codigo_videojuego
and pl.codigo_videojuego = (select codigo from videojuegos
						   where nombre = 'God of War')
						   

-- Registros y empleado
select re.cedula_empleado, re.fecha, em.nombre
from registros re, empleado em
where ((re.fecha between '2023-08-01' and '2023-08-31') 
	   or (re.cedula_empleado like '17%' 
		   and (re.hora between '08:00' and '12:00')))
or ((re.fecha between '2023-10-06' and '2023-10-20')
   or (re.cedula_empleado like '08%' 
	   and (re.hora between '09:00' and '13:00')))
-- Subconsulta
select re.codigo_registro, em.nombre from
registros re, empleado em
where re.codigo_empleado = em.codigo_empleado
and codigo_registro = (select codigo_registro from registros 
					   where codigo_empleado = '2201' limit 1)