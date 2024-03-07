-- Crear tabla cuentas
create table registros(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hota time not null,
	constraint registros_pk primary key(codigo_registro)
)