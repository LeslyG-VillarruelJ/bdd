-- Relación muchos a muchos entre usuarios y grupo
create table usuarios(
	codigo int not null,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	fecha_nacimiento date,
	constraint usuarios_pk primary key (codigo)
)

create table grupo(
	codigo int not null,
	nombre varchar(25) not null,
	descripcion varchar(75),
	fecha_creacion date,
	constraint grupo_pk primary key (codigo)
)

create table usuario_grupo(
	us_id int not null,
	gr_id int not null,
	constraint us_id_pk foreign key(us_id) references usuarios(codigo),
	constraint gr_id_pk foreign key(gr_id) references grupo(codigo),
	constraint usuario_grupo_pk primary key (us_id, gr_id)
)

-- Consulta 1
select us.nombre, gr.nombre
from usuarios us, grupo gr, usuario_grupo us_gr
where us.codigo = us_gr.us_id
and gr.codigo = us_gr.gr_id
-- Subonsulta 1
select nombre
from usuarios
where codigo IN (select us_id from usuario_grupo where gr_id = 1)
-- Función de agregación 1
select gr.nombre, count(us_gr.us_id) usuarios_por_grupo
from grupo gr, usuario_grupo us_gr
where gr.codigo = us_gr.gr_id
group by gr.nombre
-- Consulta 2
select us.nombre, gr.nombre
from usuarios us, grupo gr, usuario_grupo us_gr
where us.codigo = us_gr.us_id
and gr.codigo = us_gr.gr_id
and gr.nombre like '%intensivo%'
-- Subconsulta 2
select nombre nombre_usuario
from usuarios
where codigo IN (select us_id from usuario_grupo where gr_id = 2)
-- Funcion de agregación 2
select gr.nombre, max(us_gr.us_id) max_valor_usuario, min(us_gr.us_id) min_valor_usuario
from grupo gr, usuario_grupo us_gr
where gr.codigo = us_gr.gr_id
group by gr.nombre
-- Consulta 3
select us.nombre, gr.fecha_creacion
from usuarios us, grupo gr, usuario_grupo us_gr
where us.codigo = us_gr.us_id
and gr.codigo = us_gr.gr_id
and (fecha_creacion between '2020-03-08' and '2022-03-08')
-- Subconsulta 3
select nombre nombre_usuario
from usuarios
where codigo IN (select us_id from usuario_grupo where gr_id = 3)
-- Función de agragación 3
select gr.descripcion, count(us_gr.us_id) usuarios_por_grupo
from grupo gr, usuario_grupo us_gr
where gr.codigo = us_gr.gr_id
and gr.descripcion like '%matutino%'
group by gr.descripcion



-- Relación muchos a muchos entre habitaciones y huéspedes
create table habitaciones(
	habitacion_numero int not null,
	precio_por_noche decimal not null,
	piso int not null,
	max_personas int,
	constraint habitaciones_pk primary key (habitacion_numero)
)

create table huespedes(
	codigo int not null,
	nombres varchar(45) not null,
	apellidos varchar(45) not null,
	telefono char(10),
	correo varchar(45),
	direccion varchar(45),
	ciudad varchar(45),
	pais varchar(45),
	constraint huespedes_pk primary key (codigo)
)

create table reservas(
	inicio_fecha date, 
	fin_fecha date,
	habitacion int not null,
	huesped_id int not null,
	constraint habitaciones_fk foreign key (habitacion) references habitaciones(habitacion_numero),
	constraint huespedes_fk foreign key (huesped_id) references huespedes(codigo),
	constraint reservas_pk primary key (habitacion, huesped_id)
)
-- Consulta 1
select ha.habitacion_numero, hu.nombres, hu.apellidos
from habitaciones ha, huespedes hu, reservas re
where ha.habitacion_numero = re.habitacion
and hu.codigo = re.huesped_id
-- Subconsulta 1
select nombres, apellidos
from huespedes
where codigo in (select huesped_id from reservas where habitacion = 2)
-- Función de agregación 1
select ha.habitacion_numero, count(re.huesped_id) numero_huespedes
from habitaciones ha, reservas re
where ha.habitacion_numero = re.habitacion
group by ha.habitacion_numero
-- Consulta 2
select ha.habitacion_numero, ha.piso, hu.nombres, hu.apellidos
from habitaciones ha, huespedes hu, reservas re
where ha.habitacion_numero = re.habitacion
and hu.codigo = re.huesped_id
and ha.piso = 4
-- Subconsulta 2
select nombres, apellidos
from huespedes
where codigo in (select huesped_id from reservas where habitacion = 3)
-- Función de agregación 2
select ha.habitacion_numero, avg(re.huesped_id) promedio_huespedes
from habitaciones ha, reservas re
where ha.habitacion_numero = re.habitacion
group by ha.habitacion_numero
-- Consulta 3
select ha.habitacion_numero, hu.nombres, hu.apellidos
from habitaciones ha, huespedes hu, reservas re
where ha.habitacion_numero = re.habitacion
and hu.codigo = re.huesped_id
-- Subconsulta 3
select nombres, apellidos
from huespedes
where codigo in (select huesped_id from reservas where habitacion = 4)
-- Función de agregación 3
select ha.habitacion_numero, sum(precio_por_noche) total_por_habitacion
from habitaciones ha, reservas re
where ha.habitacion_numero = re.habitacion
group by ha.habitacion_numero



-- Relación muchos a muchos entre municipio y proyecto
create table ciudad(
	codigo int not null,
	nombre varchar(45) not null,
	constraint ciudad_pk primary key (codigo)
)

create table municipio(
	codigo int not null,
	nombre varchar(45),
	ciudad_id int not null,
	constraint ciudad_fk foreign key (ciudad_id) references ciudad(codigo),
	constraint municipio_pk primary key (codigo)
)

create table proyecto(
	codigo int not null,
	proyecto varchar(50) not null,
	monto money not null,
	fecha_inicio date,
	fecha_entraga date,
	constraint proyecto_pk primary key (codigo)
)

create table proyecto_municipio(
	municipio_id int not null,
	proyecto_id int not null,
	constraint municipio_fk foreign key (municipio_id) references municipio(codigo),
	constraint proyecto_fk foreign key (proyecto_id) references proyecto(codigo),
	constraint proyecto_municipio_pk primary key (municipio_id, proyecto_id)
)
-- Consulta 1
select mu.nombre, pr.proyecto
from municipio mu, proyecto pr, proyecto_municipio pr_mu
where mu.codigo = pr_mu.municipio_id
and pr.codigo = pr_mu.proyecto_id
-- Subconsulta 1
select proyecto
from proyecto
where codigo in (select proyecto_id from proyecto_municipio where municipio_id = 1)
-- Función de agregación 1
select mu.nombre, count(pr_mu.proyecto_id) proyectos_por_municipio
from municipio mu, proyecto_municipio pr_mu
where mu.codigo = pr_mu.municipio_id
group by mu.nombre
-- Consulta 2
select mu.nombre, pr.proyecto
from municipio mu, proyecto pr, proyecto_municipio pr_mu
where mu.codigo = pr_mu.municipio_id
and pr.codigo = pr_mu.proyecto_id
and mu.nombre like '%GAD%'
-- Función de agregación 2
select mu.nombre, min(pr_mu.proyecto_id) minimo
from municipio mu, proyecto_municipio pr_mu
where mu.codigo = pr_mu.municipio_id
group by mu.nombre
-- Consulta 3
select mu.nombre municipio, ci.nombre ciudad
from municipio mu, ciudad ci
where mu.ciudad_id = ci.codigo
-- Subconsulta 3
select proyecto
from proyecto
where codigo in (select proyecto_id from proyecto_municipio where municipio_id = 3)
-- Función de agregación 3
select mu.nombre, max(pr_mu.proyecto_id) maximo
from municipio mu, proyecto_municipio pr_mu
where mu.codigo = pr_mu.municipio_id
group by mu.nombre