--consultas avanzadas 
select c.CategoryID as 'Nombre Catefgoria', 
p.ProductName as 'Nombre del proucto', p.UnitPrice as 'precio'
, p.UnitsInStock as 'existencia'
from 

Categories as c
inner join Products as p
on  c.CategoryID = p.CategoryID
where CategoryName in('Berages