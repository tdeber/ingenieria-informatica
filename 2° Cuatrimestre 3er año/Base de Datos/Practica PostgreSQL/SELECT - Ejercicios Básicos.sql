
------------------------------------------------
------SELECT - GUIA 1- EJERCICIOS BÁSICPS-----
------------------------------------------------

-----Select Simple-----
--1.
select * from producto.categoria;
select * from producto.producto;
select * from producto.marca;

--2.
select
	m.codigo,
	m.descripcion
from producto.marca m
where m.descripcion like 'E%';

-----Enlace de dos tablas-----
--1.
select
	m.codigo,
	m.descripcion,
	p.descripcion
from producto.marca m
inner join producto.producto p on p.id_marca = m.id
order by m.descripcion, p.descripcion;

--1.2 Ahora los productos pueden no tener marca

select
	m.codigo,
	m.descripcion,
	p.descripcion
from producto.producto p 
left join producto.marca m on m.id = p.id_marca
order by m.descripcion, p.descripcion;

--2.
select
	m.codigo,
	m.descripcion,
	p.descripcion
from producto.marca m
inner join producto.producto p on p.id_marca = m.id
where m.descripcion in ('Acer','AMD')
order by m.descripcion, p.descripcion;


-----Salidas Agrupadas-----
--2.
select
	m.descripcion,
	count(distinct(p.codigo))
from producto.marca m
join producto.producto p on p.id_marca = m.id
group by m.descripcion
order by count(distinct(p.codigo))

--3.
select
	m.descripcion,
	count(distinct(p.codigo))
from producto.marca m
join producto.producto p on p.id_marca = m.id
group by m.descripcion
having count(distinct(p.codigo)) > 2
order by count(distinct(p.codigo))

-----Otras consultas-----

--1.
select 
	max(pf.fecha_nacimiento)
from persona.persona_fisica pf;

--2.
select 
	min(pf.fecha_nacimiento)
from persona.persona_fisica pf;

--3.
select
	pf.nombre,
	pf.apellido,
	pf.fecha_nacimiento
from persona.persona_fisica pf 
where pf.fecha_nacimiento = (select max(fecha_nacimiento) from persona.persona_fisica)
	or pf.fecha_nacimiento = (select min(fecha_nacimiento) from persona.persona_fisica)
