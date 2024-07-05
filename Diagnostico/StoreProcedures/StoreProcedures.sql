

--Declaraciones de uso de variaciones en transac-sql

--declaracion de una variable
declare @numeroCal int 
declare @calif decimal(10,2)

--asignacion de variables
set @numeroCal = 10 
if @numeroCal<=0
begin
set @numeroCal=1
end 
declare @i = 1
while  (@i<= @numeroCal)
begin
set @calif= @calif + 10
set @i = @i +1
end
@calif = @calif/ @numeroCal
print('	El resultado es:'+@calif

--parametros salida
Create or alter procedure calcular_area
--parametros de entrada
@radio float,
--parametro de salida 
@area float output
as 
begin
    set  @area = PI()* @radio * @radio
end 
go

declare @resp float
exec calcular_area @radio = 22.3, @area = @resp output
print 'El are es:'+cast (@resp as varchar)
go

use NORTHWND

create or alter procedure sp_obtenerdatosempleo
@numeroEmpleado int,
@fullname nvarchar (35) output
as
begin
select concat(FirstName,'',LastName)
from
Employees
where EmployeeID=@numeroEmpleado
end;
go

declare  @nombrecompleto nvarchar(35)
exec sp_obtenerdatosempleo @numeroEmpleado = 3, @fullname = @nombrecompleto output
print @nombrecompleto
go



create or alter procedure sp_obtenerdatosempleo2
@numeroEmpleado int,
@fullname nvarchar (35) output
as
begin
declare @verificar int
set @verificar = (select count (*) from Employees where EmployeeID =@numeroEmpleado)
if @verificar > 0
begin
select @fullname = concat(FirstName,'',LastName)
from
Employees
where EmployeeID=@numeroEmpleado
end
else
begin
print 'No exite'
end
end;
go

declare  @nombrecompleto nvarchar(35)
exec sp_obtenerdatosempleo2 @numeroEmpleado = 4, @fullname = @nombrecompleto output
print @nombrecompleto
go



create database etlempresa
use etlempresa


select * from Customers
create table cliente 
(
clienteid int not null identity(1,1),
clientebk nchar(5) not null,
empresa nvarchar (40) not null,
ciudad nvarchar (15) not null,
region nvarchar (15) not null,
pais nvarchar (15) not null,
constraint pk_cliente
primary key (clienteid)

);

create proc sp_etl_carga_cliente
as
begin
insert into etlempresa.dbo.cliente
select CustomerID, upper (CompanyName)as 'Empresa',upper (City)'Ciudad',
upper(isnull (Region,'sin region '))as Region, upper (Country) as 'Pais'
from NORTHWND.dbo.Customers

select * from NORTHWND.dbo.Customers as nc
left join etlempresa.dbo.cliente etle
on nc.CustomerID = etle.clientebk
where etle.clientebk is null;

update cl
set
cl.empresa =upper (c.CompanyName),
cl.ciudad =upper (c.City),
cl.pais =upper (c.Country),
cl.region =upper (isnull (c.region,'sin region'))
FROM NORTHWND.dbo.Customers as c
inner join etlempresa.dbo.cliente as cl
on c.CustomerID=cl.clientebk

select * from NORTHWND.dbo.Customers as c
inner join etlempresa.dbo.cliente as cl
on c.CustomerID=cl.clienteid

select * from NORTHWND.dbo.Customers
where CustomerID ='CLIB1'

UPDATE NORTHWND.dbo.Customers
set CompanyName ='pepsi'
where CustomerID='CLIB1'


truncate table etlempresa.ebo.cliente
