	
-----Funciones Agregadas-----
				
--1.

select
	extract(month from f.fecha_registro),
	avg(f.total)
from venta.factura f
group by extract(month from f.fecha_registro)
order by extract(month from f.fecha_registro);

select
	count(distinct(c.codigo))
from persona.cliente c
join persona.persona p on p.id = c.id_persona
where p.email is not null;

select
	m.descripcion,
	min(p.precio_unitario),
	max(p.precio_unitario)
from producto.marca m
join producto.producto p on p.id_marca = m.id
group by m.descripcion
order by m.descripcion;
	
select sum(f.total) from venta.factura f;

--2.
select
	m.descripcion as nombre_marca,
	avg(p.precio_unitario) as precio_promedio
from producto.marca m
join producto.producto p on p.id_marca = m.id
group by m.descripcion
order by m.descripcion
	
	--El que le sigue lo salteo porque es algo que vivo hago siempre--

-----Subconsultas-----

--1.
select
	p.descripcion
from producto.producto p 
where p.precio_unitario > (select avg(p2.precio_unitario)
							from producto.producto p2 );

select
	m.descripcion,
	count(distinct(p.codigo))
from producto.marca m
join producto.producto p on p.id_marca = m.id
group by m.descripcion
having count(distinct(p.codigo)) > (select count(distinct(p2.codigo))
										from producto.producto p2 
										join producto.marca m2 on m2.id = p2.id_marca
										where m2.descripcion = 'MSI')
--2.
select
	extract(year from f.fecha_registro) as anio,
	extract(month from f.fecha_registro) as mes,
	count(distinct(f.numero)) as cantidad
from venta.factura f
where f.total > (select avg(f2.total)
					from venta.factura f2
					where extract(year from f2.fecha_registro) = extract(year from f.fecha_registro)
					and extract(month from f2.fecha_registro) = extract(month from f.fecha_registro)
					)
group by extract(year from f.fecha_registro),extract(month from f.fecha_registro)
order by extract(year from f.fecha_registro),extract(month from f.fecha_registro);

select
	m.descripcion
from producto.marca m
where ((select count(distinct(p.codigo)) from producto.producto p where p.id_marca = m.id) > 14)
