create database db_facturacion 
use db_facturacion

--declare @convert_code int = 100
--select CONVERT (varchar(30), GETDATE(), @convert_code) as [result]
-- TABLAS INDEPENDIENTES
create table tbl_tipos_cliente(
codigo_tipo_cliente int identity primary key,
descripcion varchar(15),
descuento money
);

insert into tbl_tipos_cliente(descripcion, descuento) values('NORMAL', 0), ('PREFERENCIAL', 0.1), ('TERCERA EDAD', 0.3);
create table tbl_cargos(
codigo_cargo int identity primary key,
nombre varchar(50) not null,


);
insert into tbl_cargos(nombre) values('Gerente general'), ('Gerente de sucursal'), ('Jefe de recursos humanos'), 
('Jefe de bodega'), ('Bodeguero'), ('Cargador'), ('Motorista'), ('Vendedor'), ('Agente de atencion al cliente'), ('Contador'), 
('Guardia de seguridad'), ('Aseadora'), ('Analista programador');

create table tbl_sucursales(
codigo_sucursal int identity primary key,
nombre varchar(100),
correo varchar(30),
telefono varchar(30),
rtn varchar(14)
-- cai float
);
alter table tbl_sucursales add constraint UQ_sucursales_rtn unique(rtn); 
insert into tbl_sucursales(nombre, correo, telefono, rtn) values('Sucursal A', 'mailsucursalA@gmail.com', '224523333', '0801197715521'),
('Sucursal B', 'mailsucursalB@hotmail.com','22241698', '0801198715522'), 
('Sucursal C', 'mailsucursalC@outlook.com', '22890712', '0801199918901');

create table tbl_marcas(
   codigo_marca int identity primary key,
   nombre varchar(30)
);

insert into tbl_marcas(nombre) values ('Rayovac'), 
('Nike'),('Adidas'), ('Yummies'), ('Frito Lay'), 
('New Balance'), ('San Miguel'), ('Nestle'), ('Pepsi'), ('Coca cola'),
('Unilever'), ('Kraft'), ('Johnson-Johnson'), ('Pollos el cortijo'),
('Cafe maya'), ('Cuadernos Copan'), ('Bimbo'), 
('Mazda'), ('Toyota'), ('Gillette'), ('Kellogs'), ('Fans'), ('Suli'), ('Embutidos delicia'),
('Naturas'), ('Campo Fresco'), ('Kerns'), ('Clover Brand'),
('Leyde'), ('Sula');

create table tbl_proveedores(
   codigo_proveedor int identity primary key, 
   nombre varchar(50),
   direccion varchar(120),
   telefono varchar(40),
   correo varchar(40)
   --rtn varchar(15)
);

insert into tbl_proveedores(nombre, direccion, telefono, correo) values ( 'Proveedor A', 'Direccion proveedor A', '12345678', 'mailprovA@gmail.com'),
('Proveedor B', 'Direccion proveedor B', '12345678', 'mailprovB@outlook.com'), ('Proveedor C', 'Direccion proveedor C', '12345678', 'mailprovB@hotmail.com'),
('Proveedor C', 'Direccion proveedor C', '12345678', 'mailprovC@yahoo.com'), ('Proveedor D', 'Direccion proveedor D', '12345678', 'mailprovD@gmail.com'),
('Proveedor E', 'Direccion proveedor E', '12345678', 'mailprovE@outlook.com'), ('Proveedor F', 'Direccion proveedor F', '12908723', 'mailprovF@hotmail.com'),
('Proveedor G', 'Direccion proveedor G', '90982376', 'mailprovG@yahoo.com'), ('Proveedor H', 'Direccion proveedor H', '12345678', 'mailprovH@gmail.com'),
('Proveedor I', 'Direccion proveedor I', '12347689', 'mailprovI@outlook.com'), ('Proveedor J', 'Direccion proveedor J', '12345678', 'mailprovJ@gmail.com'),
('Proveedor K', 'Direccion proveedor K', '12345678', 'mailprovK@gmail.com'), ('Proveedor L', 'Direccion proveedor L', '12345678', 'mailprovL@gmail.com');

-- TABLAS DEPENDIENTES
create table tbl_empleados(
codigo_empleado int identity,
codigo_cargo int,
codigo_sucursal int,
nombre varchar(100) not null,
identidad varchar(20) not null,
sueldo_base money not null,
-- hora_entrada date,   -- datetime 
-- hora_salida date     -- datetime
direccion varchar(200),
telefono varchar(30),
correo varchar(50),

primary key(codigo_empleado, codigo_cargo, codigo_sucursal),
foreign key (codigo_cargo) references tbl_cargos(codigo_cargo) on delete cascade,
foreign key (codigo_sucursal) references tbl_sucursales(codigo_sucursal) on delete cascade

);
--alter table tbl_empleados add constraint UQ_empleados_identidad unique(identidad);  
--alter table tbl_empleados add constraint UQ_empleados_correo unique(correo);

insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (1, 1, 'Hector Josue Ardon','0801-2001-19892', 20000, 'Colonia Santo Domingo Bloque C, Casa 8', '99533283', 'hectorjosuea@hotmail.com'); 
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (2, 1, 'Alejandra Lopez Guevara', '0801-1997-00892', 17000, 'Colonia Santo Domingo Bloque C, Casa 6','89675500', 'michilopez@gmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (3, 1, 'Rita Cristina Ardon','0801-1987-89091', 17000, 'Lomas de Toncontin', '32902000', 'cristingirl@hotmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (4, 1, 'Karla Yamileth Euceda', '0906-1990-98345', 15000, 'Colonia kennedy bloque g casa 10','32001289' ,'karlagatita@outlook.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (5, 1, 'Pedro Gonzalo Rodriguez', '0801-1996-18078', 12000, 'Colonia los pinares casa 21', '95678022', 'pedritoescamoso@yahoo.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (6, 1, 'Erick Vladimir Reyes', '0801-1987-17689', 14000, 'Valle de Angeles cerca del parque obrero', '98454567', 'erickmarin5@gmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (7, 1, 'Diego Alessandro Ardon', '0801-2002-08565', 8000, 'Santa Lucia cerca de la laguna', '89223078', 'diegoprimo@yahoo.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (8,1, 'Sara Judith Millares', '0801-1994-07892', 12500, 'Colonia el trapiche', '33677901', 'sarajudithm@outlook.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (9, 1, 'Jeissel Mariela galvez','0801-1998-07238', 15000, 'Colonia tres caminos', '97235632', 'jeiselita@hotmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (10, 1, 'Marcos Rojo Llorente', '0801-1995-78457', 20000, 'San Fernando de Omoa', '87120965','marcosllorente@yahoo.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (11, 1, 'Marvin Ezequiel Ramirez', '0801-1991-78561', 8000, 'Reseidencial plaza', '96098621', 'marinramirez@hotmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (12, 1, 'Daniela Lizeth Meza', '0801-1993-17832', 12000, 'Residencial el hogar', '94563906', 'danielameza9@gmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (13, 1, 'Edson Manuel Lopez', '0801-1992-08083', 25000, 'Colonia el Cortijo', '89765643', 'eddonlopez@hotmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (8,2, 'Cesar Lagos', '0801-1970-45013', 12000, 'Barrio el Chimbo', '98117754', 'cesarlagos@yahoo.com' );
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (2, 2, 'Yeny Carolina Carias', '0901-1983-90210',17000,'Residencial Venecia', '99890154', 'yenycarolina@hotmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (2, 3, 'Raul Jose Palma', '0801-1986-08091',14000, 'Residencial Paris', '94878040', 'raulpalma@is.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (8, 3, 'Genesis Raquel Izaguire','0801-1997-98015', 13000,'Colonia las cascadas', '31095623', 'genesisraquel@claro.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (3,2, 'Karen Danelia Redondo', '0801-1995-15237',12000,'Colonia Tiloarque', '89768845', 'daneliaredondo@tigo.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (3, 3, 'Katherine Melissa Meza','0801-1992-78341', 18000,'Colonia Kennedy', '32003477', 'kathymeza92@outlook.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (8, 3, 'Lionel Andres Messi', '0901-1987-09234', 20000,'Buenos Aires', '33877321','liomessibarca@gmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (4, 2, 'Selena Gomez', '0801-1992-00654', 25000, 'Florida', '98990147', 'selenagomez@hotmail.com');
   insert into tbl_empleados(codigo_cargo, codigo_sucursal,nombre, identidad, sueldo_base, direccion, telefono, correo) values (4, 3, 'Cristiano Ronaldo', '0801-1985-58432', 25000,'Lisboa','97560982', 'cristianoronaldo@yahoo.com');



create table tbl_usuarios_del_sistema(
    codigo_empleado int,
   codigo_cargo int,
   codigo_sucursal int,
   usuario varchar(50),
   clave varchar(50),
   primary key(codigo_empleado, codigo_cargo, codigo_sucursal),
   foreign key (codigo_empleado, codigo_cargo, codigo_sucursal) references tbl_empleados(codigo_empleado, codigo_cargo, codigo_sucursal) on delete cascade
 
);

insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values (1,1, 1, 'gerentegeneral', 'asd.123');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(2,2,1, 'gerentesucursal1', 'asd.1234');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave)values(3,3,1, 'jeferrhh1', 'asd.456');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values (4,4,1, 'jefebodega1', 'asd.4567');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(8,8,1, 'vendedor1', 'asd.234');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(14,8,2, 'vendedor2', 'asd.2345');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(15, 2, 2, 'gerentesucursal2', 'asd.345');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(16,2,3, 'gerentesucursal3', 'asd.3456');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(18,3,2 , 'jeferrhh2', 'asd.567');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(19, 3, 3, 'jeferrhh3', 'asd.5678');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(20, 8, 3, 'vendedor3', 'asd.765');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(21, 4, 3, 'jefebodega2', 'asd.321');
insert into tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal, usuario, clave) values(22, 4, 3, 'jefebodega3', 'asd.4321');



create table tbl_bitacora(
   
   codigo_bitacora int identity primary key,
    codigo_empleado int,
   codigo_cargo int,
   codigo_sucursal int,
   fecha date,
   nombre_del_formulario varchar(50),
  
  foreign key (codigo_empleado, codigo_cargo, codigo_sucursal) references tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal) on delete cascade
);

create table tbl_planillas(
   codigo_planilla int identity primary key,
   codigo_empleado int,
   codigo_cargo int, 
   codigo_sucursal int,
   fecha date, 

   foreign key (codigo_empleado, codigo_cargo, codigo_sucursal) references tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal) on delete cascade

);

create table tbl_detalles_planilla(
   codigo_planilla int,
   codigo_empleado int,
   codigo_cargo int, 
   codigo_sucursal int,
   ihss float, 
   rap_fosovi float, 
   infop float,
   bonificacion float,
   sueldo_neto float,

   foreign key (codigo_empleado, codigo_cargo, codigo_sucursal) references tbl_empleados(codigo_empleado, codigo_cargo, codigo_sucursal),
   foreign key (codigo_planilla) references tbl_planillas(codigo_planilla)
);

create table tbl_clientes(
codigo_cliente int identity primary key,
codigo_tipo_cliente int,
nombre varchar(100),
telefono varchar(30),
identidad varchar(15),
direccion varchar(100),
-- rtn varchar(15),
correo varchar(50),

foreign key(codigo_tipo_cliente) references tbl_tipos_cliente(codigo_tipo_cliente) on delete cascade
);
alter table tbl_clientes add constraint UQ_clientes_identidad unique(identidad); 
alter table tbl_clientes add constraint UQ_clientes_correo unique(correo); 

create table tbl_facturas(
codigo_factura int identity,
codigo_sucursal int,
codigo_empleado int,
codigo_cargo int,
codigo_cliente int,
fecha datetime,
descuento money,
subTotal money,
impuesto money,
totalPagar money,

primary key(codigo_factura, codigo_sucursal),
foreign key (codigo_empleado, codigo_cargo, codigo_sucursal) references tbl_usuarios_del_sistema(codigo_empleado, codigo_cargo, codigo_sucursal) on delete cascade,
foreign key (codigo_cliente) references tbl_clientes(codigo_cliente) on delete cascade
);

create table tbl_articulos(

  codigo_articulo int identity primary key,
  codigo_marca int,
  codigo_proveedor int,
  descripcion varchar(400),
  precio_unitario_de_venta float,
  dias_vida_util int, 

  foreign key (codigo_marca) references tbl_marcas(codigo_marca) on delete cascade,
  foreign key (codigo_proveedor) references tbl_proveedores(codigo_proveedor) on delete cascade

);


insert into tbl_articulos(codigo_marca, codigo_proveedor, descripcion,precio_unitario_de_venta, dias_vida_util) values (1,1, 'Baterias alcalinas AA fardo de 12 pares' , 120, null),
(1, 1, 'Bombillos ahorrativos LED', 50, null),
(2, 2, 'Tenis Airmax 720 blanco-negro', 850, null),
(2,2, 'Tenis vapormax rosado', 700, null),
(2,2, 'Tenis Jordan azul-rojo-blanco', 750, null),
(4, 3, 'zambos con chicharron pequeños docena', 200, 100),
(4,3, 'anillitos pequeños', 150, 100),
(4, 3, 'Gorditos Familiares', 40,100),
(4,3, 'Palitos de papa con salsa pequeños',150, 100 ),
(4, 3, 'Cappy Infladitos pequeños', 150, 100),
(5, 4, 'Papas lays pequeñas con sal', 6, 100),
(5, 4, 'Doritos nacho atrevido pequeños', 6, 100),
(5, 4, 'Doritos queso acelerado pequeños', 6, 100),
(7, 5, 'Hot dog 200 unidades 400 gramos', 95, 45),
(7, 5, 'Jamon babaria en paquetes de media libra',25, 31),
(7, 5, 'Frijoles la chula paquete de 50 unidades',175, 32),
(7, 5, 'Mortadela en rollo', 120, 32),
(7, 6, 'Nescafe tarro 500 mg', 150, 120),
(7, 6, 'Cremora tarro 200 mg', 150, 120),
(9, 7, 'Pepsi 1.5 litros paquete', 185, 150),
(9, 7, 'Pepsi 2 litros paquete', 190, 150),
(9, 7, 'Pepsi 3 litros paquete', 200, 150),
(9, 7, 'Mirinda naranja 1.5 litros paquete',200, 150),
(9, 7, 'Mirinda uva 1.5 litro paquete', 200, 150),
(10, 8, 'Coca cola lata 100 ml paquete de 28 unidades', 430, 100),
(10, 8 ,'Coca cola 1.25 litros vidrio caja 12 unidades', 420, 100),
(11, 9, 'Desodorante AXE 100 ml unidad', 20, 300),
(11, 9, 'Ace xedex paquete de bolsas de 200 gramos 30 unidades', 150, 300),
(11,9, 'Crema Nutriderm 200 gramos unidad',30, 785),
(11, 9, 'Pasta de tomate naturas 200 gramos caja de 12 unidades', 145, 785),
(11, 9, 'Salsa de tomate naturas 200 gramos caja de 12 unidades', 145, 785),
(14, 10, 'Pollo entero con menudos', 67, 12),
(14, 10, 'Pollo entero sin menudos', 45, 12),
(14, 10, 'Pechugas deshuesadas paquete de 4 unidades', 57, 12),
(14, 10, 'Alitas picositas caja de 20 unidades', 58, 12),
(14, 10, 'Pollo en porciones de libra unidad', 24.50, 10);




create table tbl_detalle_factura(
    codigo_articulo int,
    codigo_factura int,
    codigo_sucursal int, 

   cantidad_articulos_comprados int,
   costo_unitario_historico float,
   costo_acumulado float,

   foreign key (codigo_articulo) references tbl_articulos(codigo_articulo) on delete cascade,
   foreign key (codigo_factura, codigo_sucursal) references tbl_facturas(codigo_factura, codigo_sucursal) on delete cascade,
   

);

create table tbl_inventarios(
   codigo_sucursal int,
   codigo_articulo int,
   cantidad_en_bodega int,

   primary key(codigo_sucursal, codigo_articulo),
   foreign key (codigo_sucursal) references tbl_sucursales(codigo_sucursal) on delete cascade,
   foreign key (codigo_articulo) references tbl_articulos(codigo_articulo) on delete cascade
);

insert into tbl_inventarios(codigo_sucursal, codigo_articulo, cantidad_en_bodega ) values (1,1, 50),
(1,2, 50), (1, 6, 50), (1, 7, 50), (1, 8, 50), (1, 9, 50), (1, 10, 50), (1, 11, 20), (1,12,20), (1,13,25), (1,14,25), (1,15,25),(1,16,10), (1,17,25), (1,18,20);

create table tbl_lotes(
   codigo_lote int identity,
   codigo_sucursal int, 
   fecha_ingreso date, 
   impuesto_sobre_venta_pagado float,
   costo_total float,

   primary key (codigo_lote, codigo_sucursal),
   foreign key (codigo_sucursal) references tbl_sucursales(codigo_sucursal) on delete cascade
);
create table tbl_detalle_lote(

   codigo_sucursal int, 
   codigo_lote int, 
   codigo_articulo int, 

   cantidad_comprada int, 
   precio_unitario_compra float, 
   costo_acumulado float, 

   foreign key ( codigo_lote,codigo_sucursal) references tbl_lotes( codigo_lote, codigo_sucursal),
   foreign key (codigo_articulo) references tbl_articulos(codigo_articulo)

);


create table tbl_permisos(

   codigo_permiso int identity primary key, 
   codigo_cargo int,
   permiso_inventario char(1),
   permiso_facturacion char(1),
   permiso_reportes char(1),
   permiso_planilla char(1)

   foreign key (codigo_cargo) references tbl_cargos(codigo_cargo) on delete cascade
  
);

insert into tbl_permisos(codigo_cargo, permiso_inventario, permiso_facturacion, permiso_reportes, permiso_planilla) values
('1','0','0','1', '0'), ('2','0','0','1','0'), ('3', '0', '0', '0', '1'), ('4','1','0','0','0'), ('8','0','1','0','0');








