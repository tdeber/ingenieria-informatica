
------------------------------------------------
------SELECT - GUIA 2- EJERCICIOS AVANZADOS-----
------------------------------------------------

-----Predicados de comparación y otros-----

--1.
select
	p.descripcion,
	p.precio_unitario
from producto.producto p
where p.precio_unitario > 100500
order by p.precio_unitario;

select * from venta.factura f
where f.numero = 110;
	
--2.
select
	p.descripcion,
	p.precio_unitario
from producto.producto p 
where p.precio_unitario between 100500 and 100555
order by p.precio_unitario;

select * from venta.factura f
where f.fecha_registro between '2022-01-01' and '2022-06-30'
order by f.fecha_registro;
	
--3.
select
	p.descripcion,
	p.id_subcategoria
from producto.producto p 
where p.id_subcategoria in ('11','13','15')
	
select
	c.codigo,
	l.descripcion
from persona.cliente c
join persona.persona p on p.id = c.id_persona
join persona.localidad l on l.id = p.id_localidad
where l.descripcion in ('Santa Fe', 'Paraná','Rosario');
	
--4.
select
	m.descripcion
from producto.marca m
where m.descripcion like 'S%';

select
	p.descripcion
from producto.producto p
where p.descripcion like '%USB%' and p.descripcion like '%Adaptador%';

--5.
select * from producto.producto p where p.id_subcategoria is null;
	
select
	c.codigo,
	c.fecha_alta,
	p.email,
	pf.nombre ||','|| pf.apellido as nombre
from persona.cliente c
join persona.persona p on p.id = c.id_persona
join persona.persona_fisica pf on pf.id_persona = p.id
where p.email is not null
union
select
	c.codigo,
	c.fecha_alta,
	p.email,
	pj.denominacion as nombre
from persona.cliente c
join persona.persona p on p.id = c.id_persona
join persona.persona_juridica pj on pj.id_persona = p.id
where p.email is not null;
	
	
--6. ¿?
select
	c.descripcion
from producto.categoria c
where exists (select 1 from producto.producto p
				join producto.subcategoria s on s.id = p.id_subcategoria 
				where s.id_categoria = c.id)
	
select
	m.descripcion
from producto.marca m
where exists(select 2 from producto.producto p 
				where p.id_marca = m.id and p.precio_unitario >100500)
	