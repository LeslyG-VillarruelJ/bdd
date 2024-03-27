-- RELACIÓN CUENTAS CON USUARIO

-- Crear tabla usuario
create table usuario(
	cedula char(5) not null,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	tipo_cuenta varchar(20),
	limite_credito decimal(10,5),
	constraint cedula_pk primary key(cedula)
)

select * from usuario

-- Agregar la columna cedula_propietario que es la foreigh key de la relacion entre las tablas
select * from cuentas
-- Dado que el atributo cedula_propietario si existe solo se agrega el constraint de foreign key
delete from cuentas
-- Se elimina los registros para poder realizar el foreign key
alter table cuentas
add constraint cedula_propietario_fk 
foreign key (cedula_propietario)
references usuario(cedula)
-- 10 inserciones en tabla usuario
INSERT INTO usuario (cedula, nombre, apellido, tipo_cuenta, limite_credito) 
VALUES ('17111', 'Juan', 'Perez', 'Corriente', 5000.00);
INSERT INTO usuario (cedula, nombre, apellido, tipo_cuenta, limite_credito) 
VALUES ('19222', 'Maria', 'Gomez', 'Ahorros', 10000.00);
INSERT INTO usuario (cedula, nombre, apellido) 
VALUES ('17333', 'Carlos', 'Lopez');
INSERT INTO usuario (cedula, nombre, apellido, tipo_cuenta, limite_credito) 
VALUES ('18444', 'Ana', 'Rodriguez', 'Ahorros', 15000.00);
INSERT INTO usuario (cedula, nombre, apellido, tipo_cuenta, limite_credito) 
VALUES ('17555', 'Pedro', 'Martinez', 'Corriente', 8000.00);
INSERT INTO usuario (cedula, nombre, apellido) 
VALUES ('15666', 'Laura', 'Sanchez');
INSERT INTO usuario (cedula, nombre, apellido) 
VALUES ('19777', 'Diego', 'Hernandez');
INSERT INTO usuario (cedula, nombre, apellido, tipo_cuenta, limite_credito) 
VALUES ('18888', 'Sofia', 'Diaz', 'Ahorros', 9000.00);
INSERT INTO usuario (cedula, nombre, apellido, tipo_cuenta, limite_credito) 
VALUES ('19999', 'Julia', 'Torres', 'Corriente', 7000.00);
INSERT INTO usuario (cedula, nombre, apellido) 
VALUES ('17345', 'Daniel', 'Garcia');
-- 10 inserciones tabla cuentas
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10001', '17111', '2022-09-01', 250.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10002', '19222', '2022-10-15', 500.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10003', '17333', '2022-11-20', 750.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10004', '18444', '2022-12-05', 300.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10005', '17555', '2023-01-10', 400.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10006', '15666', '2023-02-15', 600.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10007', '19777', '2023-03-20', 200.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10008', '18888', '2023-04-25', 900.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10009', '19999', '2023-05-30', 150.00);
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creación, saldo)
VALUES ('10010', '17345', '2023-06-10', 800.00);
-- REALIZAMOS LO MISMO CON LAS DEMAS TABLAS Y SUS RELACIONES

-- RELACION CLIENTES - COMPRAS
create table compras(
	id_compra int not null,
	cedula char(10) not null,
	fecha_compra date not null,
	monto decimal(10,2) not null,
	constraint id_compra_pk primary key (id_compra),
	constraint cedula_cliente foreign key (cedula) references clientes(cedula)
)
select * from compras
select * from clientes
-- Registros tabla clientes
-- Inserción 1
INSERT INTO clientes (cedula, nombre, apellido, edad)
VALUES ('1734567890', 'Juan', 'Pérez', 35),
		('1822222222', 'María', 'Gómez', 28),
		('1937777777', 'Mónica', 'López', 40),
		('1544444444', 'Pedro', 'Martínez', 45),
		('1755555555', 'Laura', 'Sánchez', 22),
		('1966666666', 'Sofía', 'Díaz', 30),
		('1777777777', 'Diego', 'Hernández', 38),
		('1888888888', 'Mónica', 'González', 55),
		('1999999999', 'Carlos', 'Rodríguez', 50),
		('1710101010', 'Ana', 'Pérez', 27);
-- Realizamos un registro en la tabla compra para verificar que si se tiene la
-- relacion
INSERT INTO compras (id_compra, cedula, fecha_compra, monto)
VALUES (1, '1937777777', '2024-03-27', 50.00);

-- RELACION PRODUCTOS - VENTAS
create table ventas(
	id_venta int not null,
	codigo_producto int not null,
	fecha_venta date not null,
	cantidad int,
	constraint id_venta_pk primary key (id_venta),
	constraint codigo_producto_fk foreign key (codigo_producto) references productos(codigo)
)
select * from ventas
select * from productos
-- Registros en tabla productos
INSERT INTO productos (codigo, nombre, descripcion, precio, stock)
VALUES 
    (16, 'Martillo', 'Herramienta para golpear', 20.00, 50),
    (17, 'Tornillo', 'Elemento de sujeción', 1.50, 100),
    (18, 'Destornillador', 'Herramienta para apretar tornillos', 15.00, 30),
    (19, 'Martillo neumático', NULL, 150.00, 10),
    (20, 'Llave inglesa', 'Herramienta para apretar o aflojar tornillos', 25.00, 20),
    (21, 'Lámpara', NULL, 30.00, 15),
    (22, 'Máquina de coser', 'Para coser telas', 200.00, 5),
    (23, 'Cinta métrica', 'Instrumento de medición', 5.00, 40),
    (24, 'Mesa', 'Mueble para poner objetos encima', 100.00, 8),
    (25, 'Máquina de café', 'Prepara café', 50.00, 12);
-- Registro en la tabla ventas
INSERT INTO ventas (id_venta, codigo_producto, fecha_venta, cantidad)
VALUES (1, 22, '2024-03-27', 5);


-- RELACION VIDEOJUEGOS - PLATAFORMAS
create table plataformas(
	id_plataforma int not null,
	nombre_plataforma varchar(50) not null,
	codigo_videojuego int not null,
	constraint id_plataforma_pk primary key (id_plataforma),
	constraint codigo_videojuego_fk foreign key (codigo_videojuego) references videojuegos(codigo)
)
select * from plataformas
select * from videojuegos
-- Registros en la tabla videojuegos
INSERT INTO videojuegos (codigo, nombre, descripcion, valoracion)
VALUES 
    (1, 'Call of Duty: Modern Warfare', 'Juego de guerra moderna', 90),
    (2, 'Fortnite', 'Juego de batalla real', 85),
    (3, 'The Legend of Zelda: Breath of the Wild', 'Aventura épica de fantasía', 95),
    (4, 'FIFA 22', 'Simulador de fútbol', 88),
    (5, 'Civilization VI', 'Juego de estrategia por turnos', 92),
    (6, 'Counter-Strike: Global Offensive', 'Juego de disparos en primera persona', 89),
    (7, 'Doom Eternal', 'Juego de disparos en primera persona', 91),
    (8, 'God of War', 'Aventura épica de guerra', 96),
    (9, 'Dark Souls III', 'Juego de rol de acción', 93),
    (10, 'Battlefield V', 'Juego de guerra en primera persona', 87);
-- Registro en la tabla plataformas
INSERT INTO plataformas (id_plataforma, nombre_plataforma, codigo_videojuego)
VALUES (1, 'PlayStation 5', 8);


-- RELACION PROFESORES - ESTUDIANTES
select * from estudiantes
-- dado que la tabla esta creada y esta posee la foreign key se elemina los registros
-- y se añade la FK
delete from estudiantes
-- se crea la tabla profesores
create table profesores(
	codigo int not null,
	nombre varchar(50) not null,
	constraint codigo_pk primary key (codigo)
)
-- FK
alter table estudiantes
add column codigo_profesor int not null;
alter table estudiantes
add constraint codigo_profesor_fk
foreign key (codigo_profesor)
references profesores(codigo)
-- Registros tabla profesores
INSERT INTO profesores (codigo, nombre)
VALUES (1, 'Francisco'),
		(2, 'María'),
		(3, 'Juan'),
		(4, 'Francisca'),
		(5, 'Pedro');
-- Registros en la tabla estudiantes
-- Inserciones en la tabla estudiantes
INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
VALUES 
    ('1711111111', 'Ana', 'Gómez', 'ana@example.com', '2000-05-10', 1),
    ('1822222222', 'Pedro', 'Martínez', 'pedro@example.com', '1999-08-15', 2),
    ('1933333333', 'Sofía', 'Fernández', 'sofia@example.com', '2001-02-20', 3),
    ('1544444444', 'Marina', 'Hernández', 'marina@example.com', '2002-11-25', 1),
    ('1755555555', 'Francisco', 'López', 'francisco@example.com', '2000-07-30', 1),
    ('1766666666', 'Daniel', 'Nuñez', 'daniel@example.com', '2003-04-05', 4),
    ('1877777777', 'Laura', 'Sánchez', 'laura@example.com', '2001-09-12', 5),
    ('1988888888', 'Carolina', 'Núñez', 'carolina@example.com', '2000-12-18', 3),
    ('1599999999', 'Elena', 'Cabrera', 'elena@example.com', '2002-03-22', 2),
    ('1710101010', 'Gabriel', 'Alvarez', 'gabriel@example.com', '2001-06-28', 4);


-- RELACION REGISTROS_ENTRADA - EMPLEADO
select * from registros
-- dado que la tabla contiene datos y esta posee la FK se elimina
delete from registros
-- crea la tabla empleado
create table empleado(
	codigo_empleado int not null,
	nombre varchar(25) not null,
	fecha date not null,
	hora time not null,
	constraint codigo_empleado_pk primary key (codigo_empleado)
)
-- registros en empleado
INSERT INTO empleado (codigo_empleado, nombre, fecha, hora)
VALUES (2201, 'Juan', '2024-03-27', '08:00:00');
-- FK tabla registros
alter table registros
add column codigo_empleado int not null;
alter table registros
add constraint codigo_empleado_fk
foreign key (codigo_empleado)
references empleado(codigo_empleado)
-- registros en registros
INSERT INTO registros (codigo_registro, cedula_empleado, fecha, hora, codigo_empleado)
VALUES 
    (1, '1712345678', '2023-08-02', '08:30:00', 2201),
    (2, '1712345678', '2023-08-05', '10:15:00', 2201),
    (3, '1712345678', '2023-08-10', '09:45:00', 2201),
    (4, '1712345678', '2023-09-15', '11:00:00', 2201),
    (5, '1712345678', '2023-09-20', '08:20:00', 2201),
    (6, '1712345678', '2023-10-05', '09:30:00', 2201),
    (7, '1712345678', '2023-10-10', '10:45:00', 2201),
    (8, '1712345678', '2023-11-15', '08:40:00', 2201),
    (9, '1712345678', '2023-11-20', '12:00:00', 2201),
    (10, '1712345678', '2023-12-01', '11:30:00', 2201);
	

-- RELACION PERSONA - PRESTAMO
select * from personas
-- se crea la tabla prestamo
create table prestamos(
	cedula char(10) not null,
	monto money,
	fecha_prestamo date,
	hora_prestamo time,
	garante varchar(40),
	constraint cedula_prestamo_pk primary key (cedula),
	constraint cedula_fk foreign key (cedula) references personas(cedula)
)
select * from prestamos
-- Registro tabla personas
-- Agregar registro a la tabla personas
INSERT INTO personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos, estado_civil_codigo)
VALUES ('1712345679', 'Sean', 'Apellido', NULL, NULL, NULL, NULL, NULL, 'C');
-- Registro tabla prestamos
-- Inserciones en la tabla prestamos
-- existe un problema con la tabla prestamos dado que como cedula es PK no se puede repetir
INSERT INTO personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos, estado_civil_codigo)
VALUES 
    ('1712345670', 'Laura', 'Martínez', 1.65, '1990-05-15', '08:30:00', 5000.00, 2, 'C'),
    ('1712345671', 'Carlos', 'González', 1.78, '1985-09-20', '10:45:00', 8000.00, 1, 'S'),
    ('1712345672', 'Elena', 'López', 1.70, '1982-07-10', '11:15:00', 3000.00, 3, 'U'),
    ('1712345674', 'Diego', 'Pérez', 1.85, '1978-12-28', '12:30:00', 7000.00, 0, 'C'),
    ('1712345675', 'Sofía', 'Gómez', 1.62, '1995-03-05', '14:00:00', 4000.00, 2, 'S'),
    ('1712345676', 'Ana', 'Hernández', 1.75, '1989-11-18', '15:20:00', 6000.00, 1, 'U'),
    ('1712345677', 'Pedro', 'Ruiz', 1.80, '1987-08-22', '16:45:00', 2000.00, 2, 'C');
	
INSERT INTO prestamos (cedula, monto, fecha_prestamo, hora_prestamo, garante)
VALUES 
    ('1712345678', 500.00, '2024-03-27', '09:00:00', 'Juan'),
    ('1712345673', 700.00, '2024-03-28', '10:30:00', 'María'),
    ('1712345679', 250.00, '2024-03-29', '11:45:00', 'Pedro'),
    ('1712345670', 800.00, '2024-03-30', '12:15:00', 'Laura'),
    ('1712345671', 300.00, '2024-04-01', '13:00:00', 'Ana'),
    ('1712345672', 600.00, '2024-04-02', '14:30:00', 'Diego'),
    ('1712345674', 450.00, '2024-04-03', '15:45:00', 'Sofía'),
    ('1712345675', 900.00, '2024-04-04', '16:00:00', 'Carlos'),
    ('1712345676', 150.00, '2024-04-05', '17:20:00', 'Elena'),
    ('1712345677', 950.00, '2024-04-06', '18:30:00', 'Francisco');


-- RELACION TRANSACCONES - BANCO
select * from transacciones
-- crear tabla banco
create table banco(
	codigo_banco int not null,
	codigo_transaccion int not null,
	detalle varchar(100),
	constraint codigo_banco_pk primary key (codigo_banco),
	constraint codigo_transaccion_fk foreign key (codigo_transaccion) references transacciones(codigo)
)
-- registros transacciones
-- Inserciones en la tabla transacciones
INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES 
    (11, '22001', 500.00, 'C', '2024-03-27', '08:00:00'),
    (12, '22002', 700.00, 'D', '2024-03-27', '08:30:00'),
    (13, '22003', 250.00, 'C', '2024-03-27', '09:00:00'),
    (14, '22004', 800.00, 'D', '2024-03-27', '09:30:00'),
    (15, '22002', 300.00, 'C', '2024-03-27', '10:00:00'),
    (16, '22003', 600.00, 'D', '2024-03-27', '10:30:00'),
    (17, '22004', 450.00, 'C', '2024-03-27', '11:00:00'),
    (18, '22001', 900.00, 'D', '2024-03-27', '11:30:00'),
    (19, '22002', 150.00, 'C', '2024-03-27', '12:00:00'),
    (20, '22003', 950.00, 'D', '2024-03-27', '12:30:00');
-- registros en la tabla banco
INSERT INTO banco (codigo_banco, codigo_transaccion, detalle)
VALUES (1, 1, 'Depósito inicial');
