-- Insertar registros tabla productos en campos obligatorios
insert into productos(codigo, nombre, precio, stock)
values (006, 'Caumal', 0.05, 7);

insert into productos(codigo, nombre, precio, stock)
values (007, 'Sanduche de pernil', 1.25, 3);

insert into productos(codigo, nombre, precio, stock)
values (008, 'PaFritas', 0.30, 13);

select * from productos;