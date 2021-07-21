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
id_estado int not null default 4,
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
foreign key(id_pedido) references tbl_pedido(id_pedido) on delete cascade,
foreign key(id_producto) references tbl_producto(id_producto)
)

alter table tbl_pedido_producto drop foreign key tbl_pedido_producto_ibfk_1

alter table tbl_pedido_producto add foreign key (id_pedido) references tbl_pedido(id_pedido) on delete cascade

alter table tbl_pedido_producto change foreign key (id_pedido) references tbl_pedido(id_pedido) on delete cascade



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

select * from tbl_producto

insert into tbl_usuario (nombre_usuario, contrasenia, nombre, apellido, email, telefono, direccion) 
values('yef125','253535','Yeff','Vargas','yvargas@correo.com',56565,'Cra 1 #43 - 55')
/*('Carola2525','321','Carola','Marin','Carola@correo.com',4457766,'Cra 8 #43 - 72', 2),
('Ander1420','98765','Anderson','Restrepo','andres@correo.com',3332528,'Cra 15 #88 - 33', 2)*/

select * from tbl_usuario tu 


insert into tbl_pedido (descripcion_pedido, id_usuario, id_tipo_pago) 
values('Pedido para la mesa 4, hamburguesa sin cebolla', 2, 1)

select * from tbl_pedido tp 

insert into tbl_pedido_producto (id_pedido, id_producto, cantidad) values(1,1,1),
(1,2,1),
(1,3,2)

select * from tbl_pedido_producto tpp 

select ped.id_pedido, ped.descripcion_pedido, est.id_estado, est.descripcion_estado as 'Estado Pedido', tpago.id_tipo_pago,
tpago.nombre_tipo_pago, prod.id_producto, prod.nombre_producto, prod.descripcion_producto, prod.costo_producto, ped_prod.cantidad, 
(prod.costo_producto*ped_prod.cantidad) as Precio_Total,usu.nombre_usuario, usu.email, usu.telefono, usu.direccion, ped.fecha_pedido 
from tbl_pedido ped left join tbl_pedido_producto ped_prod using(id_pedido) 
left join tbl_producto prod using(id_producto) left join tbl_usuario usu using(id_usuario)
left join tbl_estado est using(id_estado) left join tbl_tipo_pago tpago using(id_tipo_pago)
-- where ped.id_pedido = 1
order by ped.id_pedido


select * from tbl_pedido tp 

delete from tbl_pedido where id_pedido = 1

select * from tbl_estado te 

update tbl_pedido set id_estado = 1 where id_pedido = 1





