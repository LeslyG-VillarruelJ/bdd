-- Insertar registros en la tabla productos todos los campos
insert into productos(codigo, nombre, descripcion, precio, stock)
values (001, 'Coca-Cola', 'Gaseosa negra', 0.75, 5);

insert into productos(codigo, nombre, descripcion, precio, stock)
values (002, 'Galletas', 'Galletas de sal', 0.50, 10);

insert into productos(codigo, nombre, descripcion, precio, stock)
values (003, 'Leche', 'Leche entera', 1.50, 4);

insert into productos(codigo, nombre, descripcion, precio, stock)
values (004, 'Sanduche', 'Helado Pinguino', 0.80, 15);

insert into productos(codigo, nombre, descripcion, precio, stock)
values (005, 'Tatos', 'Snack', 0.25, 20);

select * from productos;