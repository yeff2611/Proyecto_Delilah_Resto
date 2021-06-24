create database DB_Delilah_Resto


use DB_Delilah_Resto

/*
create table tbl_Municipio(
id_Municipio int not null primary key auto_increment,
Nombre_Municipio varchar(255)
)

create table tbl_Region(
id_Region int not null primary key auto_increment,
Nombre_Region varchar(255),
id_Municipio int not null,
foreign key(id_Municipio) references tbl_Municipio(id_Municipio)
)

create table tbl_Pais(
id_Pais int not null primary key auto_increment,
Nombre_Pais varchar(255),
id_Region int not null,
foreign key(id_Region) references tbl_Region(id_Region)
)
*/

create table tbl_Estado(
id_Estado int not null primary key auto_increment,
Descripcion_Estado int not null
)

create table tbl_Rol(
id_Rol int not null primary key auto_increment,
Nombre_Rol varchar(255) not null,
Descripcion_Rol varchar(255) not null
/*id_Estado int not null,
foreign key(id_Estado) references tbl_Estado(id_Estado)*/
)

create table tbl_Usuario(
id_Usuario int not null primary key auto_increment,
Nombre_Usuario varchar(50) not null,
Contrasenia varchar(20) not null,
Nombre varchar(255) not null,
Apellido varchar(255) not null,
Email varchar(255),
Telefono int not null,
Direccion varchar(255) not null,
id_Estado int not null,
/*id_Municipio int not null,*/
id_Rol int not null,
foreign key(id_Estado) references tbl_Estado(id_Estado),
/*foreign key(id_Municipio) references tbl_Municipio(id_Municipio),*/
foreign key(id_Rol) references tbl_Rol(id_Rol)
)

create table tbl_Tipo_Pago(
id_Tipo_Pago int not null primary key auto_increment,
Nombre_Tipo_Pago varchar(255) not null,
Descripcion_Tipo_Pago varchar(255) not null
)

create table tbl_Pedido(
id_Pedido int not null primary key auto_increment,
Descripcion_Pedido varchar(255) not null,
id_Estado int not null,
id_Usuario int not null,
id_Tipo_Pago int not null,
foreign key(id_Estado) references tbl_Estado(id_Estado),
foreign key(id_Usuario) references tbl_Usuario(id_Usuario),
foreign key(id_Tipo_Pago) references tbl_Tipo_Pago(id_Tipo_Pago)
)

create table tbl_Producto(
id_Producto int not null primary key auto_increment,
Nombre_Producto varchar(255) not null,
Descripcion_Producto varchar(255),
Costo_Producto int not null
)

create table tbl_Pedido_Producto(
id_Pedido int not null,
id_Producto int not null,
Cantidad int not null,
primary key(id_Pedido, id_Producto),
foreign key(id_Pedido) references tbl_Pedido(id_Pedido),
foreign key(id_Producto) references tbl_Producto(id_Producto)
)



