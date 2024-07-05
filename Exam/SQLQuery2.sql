create database Pruebadinamica;

use Pruebadinamica;

select top 0*
into Pruebadinamica.dbo.empleado
from NORTHWND.dbo.Employees

alter table empleado
add CONSTRAINT pk_empleado
primary key(EmployeeID)

insert into Pruebadinamica.dbo.empleado (EmployeeID, FirstName, LastName, 
Address, HomePhone, Country)
select EmployeeID,FirstName,LastName,Address, HomePhone, Country  
from NORTHWND.dbo.Employees;

select * from empleado;