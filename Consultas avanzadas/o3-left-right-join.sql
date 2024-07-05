create  database pruebajoinsg1;
use pruebajoinsg1;

create table proveedor(
provid int not null identity(1,1),
nombre varchar (50) not null,
limite_credito money not null
constraint pk_proveedor
primary key (provid),
constraint unico_nombrepro
unique(nombre)
);

create table productos(
productid int not null identity(1,1),
nombre varchar (50) not null,
precio money not null,
existencia int not null,
proveedor int,
constraint pk_productos
primary key (productid),
constraint unico_nombre_proveedor
unique (nombre),
constraint fk_proveedor_productos
foreign key (proveedor )
references proveedor(provid)
)

--agregar registros a las tablas proveedor y producto

insert into proveedor (nombre,limite_credito)
values
('Proveedor1',5000),
('Proveedor2',5754),
('Proveedor3',5769),
('Proveedor4',5677),
('Proveedor5',6666);

select * from proveedor ;

insert into productos(nombre,precio,existencia,proveedor)
values
('Producto1',56,34,1),
('Producto2',56.56,12,1),
('Producto3',45.6,36,2),
('Producto4',22.34,666,3);

select * from productos;

select * from
proveedor as p
inner join productos as pr
 on pr.proveedor= p.provid

