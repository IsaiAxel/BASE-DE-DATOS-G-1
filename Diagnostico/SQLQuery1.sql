use NORTHWND;
--LEGUANJE SQL-LMD
--selcccionar todos los productos
SELECT * FROM Products;
--seleccionar todas las categorias
select * from Categories;
--seleccionar proovedore
select *from Suppliers;

--seleccionar clientes
select * from Customers;
--seleccionar los empleados
select* from Employees;

--seleccionar todos las paqueterias
select * from Shippers;

--seleccionar las ordenes
select *from Orders;

--seleccionar los detalles de ordenes
select * from [Order Details];


--consultas simples
select ProductID, ProductName, UnitsInStock, UnitPrice from Products;

--Alias de columna
select ProductID AS NombrepProducto, ProductName AS 'Nombre Producto', UnitsInStock, UnitPrice AS 'Precio' from Products;

--Alias de tablas
select Products.ProductID AS NombrepProducto, ProductName AS 'Nombre Producto', UnitsInStock, UnitPrice AS 'Precio' from Products;

select * from 
Products AS p, Categories AS c
where p.CategoryID = c.CategoryID


--Campo calculado 
--seleccionar todos los productos mostrano el id del producto,el nombre,precio y el importe

select *, (UnitPrice*UnitsInStock) AS 'importe' from Products;

select ProductID AS 'Numero Producto', ProductName AS 'Nombre de Producto',
UnitsInStock as 'Existencia',UnitPrice as ' Precio', 
(UnitPrice*UnitsInStock) AS 'Importe' 
from Products;

--selecionar todas las ordenes que fueron emitidas por los empleados
--Nancy Davolio,anne dodsworth y andrew fuller
select*from Orders
where EmployeeID=1
or EmployeeID=9
or EmployeeID=2;

select*from Orders
where EmployeeID in(1,9,2);

--seleccionar las ordenes dividiendo la fecha de orden en año ,mes y dia
select OrderDate as 'Fecha de orden',
year(OrderDate) as 'Año',
month (OrderDate) as 'Mes',
day(OrderDate) as 'Dia'
from Orders;

--seleccionar todos los nombres de los empleados 
select CONCAT(FirstName,'',LastName) 
from Employees;

--selecionar todos los productos done la existencia se amayor o igual a 40
-- y el precio sea menor a 19

select ProductName as'Nombre del producto', UnitPrice as 'precio',
UnitsInStock as 'existencia'
from Products
where UnitsInStock >= 40
and UnitPrice <19;

--seleccionar todas las ordenes realizadas de abril a agosto de 1996

select OrderID,CustomerID,EmployeeID,OrderDate
from Orders
where OrderDate >= '1996-04-01' and OrderDate<= '1996-08-31'

select OrderID,CustomerID,EmployeeID,OrderDate
from Orders
where OrderDate between '1996-04-01' and  '1996-08-31'

--seleccionar todas las ordenes entre 19996 y 1998
select OrderID,CustomerID,EmployeeID,OrderDate
from Orders
where OrderDate between '1996-04-01' and  '1998-08-31'

--seleccionar todas las ordenes de 1996 y 1999

select OrderID,CustomerID,EmployeeID,OrderDate
from Orders
where OrderDate between '1996-04-01' and  '1999-08-31'

select* from Orders
where YEAR(OrderDate) between '1996' and '1998';

select* from Orders
where YEAR(OrderDate) in ('1996' , '1999')

--seleccionar todos los productos que comiencen con c

select * from Products
where ProductName like 'c%';

--seleccionar todos los campos que terminen con s 

select * from Products
where ProductName like '%s';

--selecciona todos los productos que contenga la palabra no

select * from Products
where ProductName like '%no%';
 
 --seleccionar los productos que tenga a o n

 select * from Products
where ProductName like '%[AN]%'

 select * from Products
where ProductName like '%A%'
or ProductName like '%N%'

--seleccionar todos los productos que comiencen entre la letra A y N
 select * from Products
where ProductName like '%[A-N]%'


select o.OrderID as 'numero de orden',
o,OrderDate as 'fecha de orden'
concat(firs) from Employees as E
INNER JOIN
Orders as o 


--crea una tabla a partir de una consulta

--Crear base de datos
create database pruebaxyz;

--Utilizar base de datos
use pruebaxyz;

--Crear una tabla a partir de una consulta con cero registros
select top 0 *
into pruebaxyz.dbo.products2
from NORTHWND.dbo.Products;

--Agregar un constraint a la tabla de products2
alter table products2
add CONSTRAINT pk_products2
primary key(productoid)
alter table 


select * from products2

--Llenar una tabla a partir de una consulta

insert into pruebaxyz.dbo.products2 (ProductName, SupplierID,
CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock, UnitsOnOrder,
ReorderLevel,Discontinued)
select  ProductName, SupplierID,
CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock, UnitsOnOrder,
ReorderLevel,Discontinued
from NORTHWND.dbo.Products;

-- Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado
-- del representante de ventas de cada pedido.
--nombre de cliente
use NORTHWND;
select o.CustomerID, o.EmployeeID, o.OrderID, o.OrderDate
from Orders as o;

select c.CompanyName as 'Nombre del cliente',
CONCAT(e.FirstName,'',e.LastName) as 'Nombre de empleado', o.OrderID, o.OrderDate,
(od.Quantity * od.UnitPrice) as 'importe'
from Customers as c
inner join
Orders as o
on o.CustomerID= c.CustomerID
inner join Employees as e
on o.EmployeeID= e.EmployeeID
inner join [Order Details] as od
on od.OrderID=o.OrderID
where YEAR(o.OrderDate) in ('1996','1998');
--cunatas ordenes se a realizado en 1996 y 1998
use NORTHWND;
select o.CustomerID, o.EmployeeID, o.OrderID, o.OrderDate
from Orders as o;

select COUNT(*) as  'Total de ordenes'
from Customers as c
inner join
Orders as o
on o.CustomerID= c.CustomerID
inner join Employees as e
on o.EmployeeID= e.EmployeeID
inner join [Order Details] as od
on od.OrderID=o.OrderID
where YEAR(o.OrderDate) in ('1996','1998');





--Ejercicio 2: Mostrar el nombre del producto, el nombre del proveedor y el precio unitario de cada producto.
select p.ProductName as 'Nombre de producto',
s.CompanyName as 'Nombre del proveedor'

from Products as p
inner join Suppliers as s
on p.SupplierID= s.SupplierID
--Ejercicio 3: Listar el nombre del cliente, el ID del pedido y la fecha del pedido para cada pedido.
--Ejercicio 4: Obtener el nombre del empleado, el título del cargo y el departamento del empleado para cada empleado.
--Ejercicio 5: Mostrar el nombre del proveedor, el nombre del contacto y el teléfono del contacto para cada proveedor.
--Ejercicio 6: Listar el nombre del producto, la categoría del producto y el nombre del proveedor para cada producto.
--Ejercicio 7: Obtener el nombre del cliente, el ID del pedido, el nombre del producto y la cantidad del producto para cada detalle del pedido.
--Ejercicio 8: Obtener el nombre del empleado, el nombre del territorio y la región del territorio para cada empleado que tiene asignado un territorio.
--Ejercicio 9: Mostrar el nombre del cliente, el nombre del transportista y el nombre del país del transportista para cada pedido enviado por un transportista.
--Ejercicio 10: Obtener el nombre del producto, el nombre de la categoría y la descripción de la categoría para cada producto que pertenece a una categoría.







