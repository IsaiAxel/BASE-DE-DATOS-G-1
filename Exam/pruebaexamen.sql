--CREAR LAS TABLAS SOLICITADAS 

--crear base de datos
create database ejercicioexamen;
use ejercicioexamen;

create table proveedor(
idprov int not null identity(1,1),
nombre varchar (50) not null,
limite_credito money not null,
constraint pk_proveedor
primary key (idprov),
constraint unico_nombre_proveedor
unique(nombre)
);

--categoria
create table categoria(
idcatego int not null,
nombre varchar (50)not null,
constraint pk_categoria
primary key (idcatego),
constraint unico_nombre
unique(nombre)
);


create table producto(
idprod int not null,
nombre varchar(50) not null,
precio money not null,
existencia int not null,
proveedor int,
idcatego int
constraint pk_producto
primary key(idprod),
constraint fk_producto_prov
foreign key (proveedor)
references proveedor(idprov),
constraint fk_producto_categoria
foreign key (idcatego)
references categoria (idcatego)
);

insert into proveedor(nombre,limite_credito)
values('coca-cola', 98777),
('pecsi',234567),
('Hay me pica',44566),
('Hay me duele',45677),
('Tengo miedo',22344);


insert into categoria
values(1, 'lacteos'),
(2,'linea blanca'),
(3,'dulces'),
(4,'vinos'),
(5,'abarrotes');

select * from proveedor

insert into producto
values (1,'mascara',78.9,20,5,5)

insert into producto(proveedor,existencia,idcatego,idprod,nombre)
values (3,34,5,56.7,2, 'Manita rascadora' )

insert into producto
values (3,'Tonayan',1450,56,4,4),
(4,'caramelo',200,21,1,3),
(5,'Terry',200,24,4,4)


--consultas con inner join
select * from producto


select *
from categoria as c
join producto as p
on c.idcatego=p.idcatego

select c.idcatego,p.idcatego,c.nombre,p.nombre,p.precio
from categoria as c
join producto as p
on c.idcatego=p.idcatego

select *,(p.precio * p.existencia) as importe
from categoria as c
join producto as p
on c.idcatego=p.idcatego;

--Consulta de tabla derivada
select c.idcatego,c.nombre,p.nombre,p.existencia,p.precio,(p.precio *p.existencia) as importe
from (select idcatego,nombre from categoria)as c
inner join
(select nombre,precio,existencia,idcatego  from producto) as p
on c.idcatego=p.idcatego;

--Tabla derivada
use NORTHWND
select * 
from(select OrderID,OrderDate,ShipCity,RequiredDate from Orders) as o

--inner join con 3 tablas
use ejercicioexamen

select*
from categoria as c
inner join producto as p
on c.idcatego=p.idcatego
inner join proveedor as pr
on pr.idprov=p.proveedor;

select*
from categoria as c
left join 
producto as p
on c.idcatego=p.idcatego
where p.idcatego is null;

select * from producto
where idcatego in (1,2)

--
select c.nombre,p.nombre, p.precio,p.existencia
from categoria as c
left join 
producto as p
on c.idcatego=p.idcatego
where p.idcatego is null;


select c.nombre,p.nombre, p.precio,p.existencia
from (select nombre,idcatego from categoria) as c
left join 
(select precio,idcatego,existencia, nombre from producto )as p
on c.idcatego=p.idcatego;

--right join
select c.nombre,p.nombre, p.precio,p.existencia
from (select nombre,idcatego from categoria) as c
right join 
(select precio,idcatego,existencia, nombre from producto )as p
on c.idcatego=p.idcatego;

insert into producto
values (6,'p6',45.6,12,2,null)


--full join
select *
from (select nombre,idcatego from categoria) as c
full join 
(select precio,idcatego,existencia, nombre from producto )as p
on c.idcatego=p.idcatego

--
select*
from categoria as c
left join producto as p
on c.idcatego=p.idcatego
left join proveedor as pr
on pr.idprov=p.proveedor;

select*
from categoria as c
left join producto as p
on c.idcatego=p.idcatego
inner join proveedor as pr
on pr.idprov=p.proveedor;

select*
from categoria as c
full join producto as p
on c.idcatego=p.idcatego
inner join proveedor as pr
on pr.idprov=p.proveedor;

select*
from categoria as c
right join producto as p
on c.idcatego=p.idcatego
full join proveedor as pr
on pr.idprov=p.proveedor;

