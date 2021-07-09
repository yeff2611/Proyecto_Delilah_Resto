create database DB_Delilah_Resto

use DB_Delilah_Resto

create table tbl_estado(
id_estado int not null primary key auto_increment,
descripcion_estado varchar(100) not null
)

create table tbl_rol(
id_rol int not null primary key auto_increment,
nombre_rol varchar(255) not null,
descripcion_rol varchar(255) not null
)


create table tbl_usuario(
id_usuario int not null primary key auto_increment,
nombre_usuario varchar(50) not null,
contrasenia varchar(20) not null,
nombre varchar(255) not null,
apellido varchar(255) not null,
email varchar(255) unique,
telefono int not null,
direccion varchar(255) not null,
id_rol int not null default 2,
/*foreign key(id_Estado) references tbl_Estado(id_Estado),*/
foreign key(id_rol) references tbl_rol(id_rol)
)


create table tbl_tipo_pago(
id_tipo_pago int not null primary key auto_increment,
nombre_tipo_pago varchar(255) not null,
descripcion_tipo_pago varchar(255) not null
)

select * from tbl_pedido tp 

create table tbl_pedido(
id_pedido int not null primary key auto_increment,
descripcion_pedido varchar(255) not null,
fecha_pedido datetime default CURRENT_TIMESTAMP not null,
id_estado int not null,
id_usuario int not null,
id_tipo_pago int not null,
foreign key(id_estado) references tbl_estado(id_estado),
foreign key(id_usuario) references tbl_usuario(id_usuario),
foreign key(id_tipo_pago) references tbl_tipo_pago(id_tipo_pago)
)

create table tbl_producto(
id_producto int not null primary key auto_increment,
nombre_producto varchar(255) not null,
descripcion_producto varchar(255),
costo_producto int not null
)

create table tbl_pedido_producto(
id_pedido_producto int NOT NULL auto_increment,
id_pedido int not null,
id_producto int not null,
cantidad int not null,
primary key(id_pedido_producto, id_pedido, id_producto),
foreign key(id_pedido) references tbl_pedido(id_pedido),
foreign key(id_producto) references tbl_producto(id_producto)
)



/*Poblacion de datos*/
INSERT INTO tbl_estado (Descripcion_Estado) values ('Activo'),
('Inactivo'),
('Cancelado'),
('Nuevo'),
('Confimado'),
('Preparando'),
('Enviando'),
('Entregado')

select * from tbl_estado te 


insert into tbl_tipo_pago (Nombre_Tipo_Pago, Descripcion_Tipo_Pago) values ('Efectivo', 'Pago en efectivo'),
('Tarjeta de Credito', 'Pago con todas las tarjetas de credito'),
('Tarjeta Debido', 'Pago con todas las tarjetas debito'),
('Paypal', 'Pago electronico por medio de paypal')

select * from tbl_tipo_pago ttp 

insert into tbl_rol (Nombre_Rol, Descripcion_Rol) values('Administrador', 'Este rol permite acceso total a todas las funcionalidades'),
('Viewer','Este rol solo permite consultas')

select * from tbl_rol tr 

insert into tbl_producto (nombre_producto, descripcion_producto, costo_producto) values('Hamburguesa', 'Hamburguesa sencilla', 15000),
('Pizza peper','Pizza doble queso y peperoni', 12000),
('Quesadilla mex','Quesadilla mexicana', 14000),
('Ceviche Camaron','Coctel ceviche de camaron', 22000)

select * from tbl_producto where id_producto =1

insert into tbl_usuario (nombre_usuario, contrasenia, nombre, apellido, email, telefono, direccion) 
values('yef125','253535','Yeff','Vargas','yvargas@correo.com',56565,'Cra 1 #43 - 55')
/*('Carola2525','321','Carola','Marin','Carola@correo.com',4457766,'Cra 8 #43 - 72', 2),
('Ander1420','98765','Anderson','Restrepo','andres@correo.com',3332528,'Cra 15 #88 - 33', 2)*/

select * from tbl_usuario tu 
