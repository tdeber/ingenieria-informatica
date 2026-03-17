
---------------------------------------------------
-----Trabajo Práctico Nro 1: Consultas con SQL-----
---------------------------------------------------

--1. Esquema persona

--a. Sucursales con informacion de empleados
select
	s.descripcion as sucursal,
	p.descripcion as provincia,
	l.descripcion as localidad,
	pf.nombre ||','|| pf.apellido as empleado
from persona.sucursal s 
join persona.localidad l on l.id = s.id_localidad
join persona.provincia p on p.id = l.id_provincia 
join persona.empleado e on e.id_sucursal = s.id
join persona.persona_fisica pf on pf.id = e.id_persona_fisica
order by provincia, localidad, sucursal, empleado

--b. Cliente con información de datos personales
select
	c.codigo as codigoCliente,
	pf.nombre ||','|| pf.apellido as nombre,
	l.descripcion as localidad,
	pr.descripcion as provincia
from persona.cliente c
join persona.persona p on p.id = c.id_persona
join persona.persona_fisica pf on pf.id_persona = p.id
left join persona.localidad l on l.id = p.id_localidad
left join persona.provincia pr on pr.id = l.id_provincia
union
select
	c.codigo as codigoCliente,
	pj.denominacion as nombre,
	l.descripcion as localidad,
	pr.descripcion as provincia
from persona.cliente c
join persona.persona p on p.id = c.id_persona
join persona.persona_juridica pj on pj.id_persona = p.id
left join persona.localidad l on l.id = p.id_localidad
left join persona.provincia pr on pr.id = l.id_provincia
order by nombre;

--c. Proveedores con información de datos personales
select
	pr.codigo as codigoProveedor,
	pf.nombre ||','|| pf.apellido as nombre,
	l.descripcion as localidad,
	prov.descripcion as provincia
from persona.proveedor pr
join persona.persona_juridica pj on pj.id = pr.id_persona_juridica
join persona.persona p on p.id = pj.id_persona
join persona.persona_fisica pf on pf.id_persona = p.id
left join persona.localidad l on l.id = p.id_localidad
left join persona.provincia prov on prov.id = l.id_provincia
union
select
	pr.codigo as codigoProveedor,
	pj.denominacion as nombre,
	l.descripcion as localidad,
	prov.descripcion as provincia
from persona.proveedor pr
join persona.persona_juridica pj on pj.id = pr.id_persona_juridica
join persona.persona p on p.id = pj.id_persona
left join persona.localidad l on l.id = p.id_localidad
left join persona.provincia prov on prov.id = l.id_provincia
order by nombre;

--d. Personas con multiples roles
select
	pf.nombre ||','|| pf.apellido as nombre,
	case
		when e.id is not null then 'EMPLEADO' else
		null 
	end as rol_empleado,
	case
		when c.id is not null then 'CLIENTE' else
		null
	end as rol_cliente,
	case
		when pr.id is not null then 'PROVEEDOR' else
		null
	end rol_proveedor
from persona.persona p
join persona.persona_fisica pf on pf.id_persona = p.id
left join persona.persona_juridica pj on pj.id_persona = p.id
left join persona.empleado e on e.id_persona_fisica = pf.id
left join persona.cliente c on c.id_persona = p.id
left join persona.proveedor pr on pr.id_persona_juridica = pj.id
where (e.id is not null and c.id is not null) or
		(e.id is not null and pr.id is not null) or
		(c.id is not null and pr.id is not null)
union
select
	pj.denominacion as nombre,
	case
		when e.id is not null then 'EMPLEADO' else
		null
	end as rol_empleado,
	case
		when c.id is not null then 'CLIENTE' else
		null
	end as rol_cliente,
	case
		when pr.id is not null then 'PROVEEDOR' else
		null
	end as rol_proveedor
from persona.persona p
left join persona.persona_fisica pf on pf.id_persona = p.id
join persona.persona_juridica pj on pj.id_persona = p.id
left join persona.empleado e on e.id_persona_fisica = pf.id
left join persona.cliente c on c.id_persona = p.id
left join persona.proveedor pr on pr.id_persona_juridica = pj.id
where (e.id is not null and c.id is not null) or
		(e.id is not null and pr.id is not null) or
		(c.id is not null and pr.id is not null)
	
	
--2. Esquema producto
		
--a.Productos con información de marca, cat, proveedor

select
	m.descripcion as marca,
	p.descripcion as producto,
	sc.descripcion as subcat,
	c.descripcion as categoria,
	pr.codigo as proveedor
from producto.producto p
join producto.marca m on m.id = p.id_marca
left join producto.subcategoria sc on sc.id = p.id_subcategoria
left join producto.categoria c on c.id = sc.id_categoria
left join persona.proveedor pr on pr.id = p.id_proveedor
order by m.descripcion, p.descripcion, c.descripcion
	
--3. Esquema venta

--a.
create or replace function facturaDetalle(desde date, hasta date)
returns table(
	fecha date,
	cantProductos numeric(38,2),
	codCliente int4,
	codEmpleado int4,
	promocion varchar(50),
	forma_pago varchar(50)
)
language plpgsql
as $$
	begin
		return query
		select
			f.fecha_registro as fecha,
			sum(fd.cantidad) as cantProductos,
			c.codigo as codCliente,
			e.codigo as codEmpleado,
			coalesce('Sin Promo',promo.descripcion) as promocion,
			forma_pago.descripcion as forma_pago
		from venta.factura f
		join venta.factura_detalle fd on fd.id_factura = f.id
		join persona.cliente c on c.id = f.id_cliente
		join persona.empleado e on e.id = f.id_empleado
		left join venta.promocion promo on promo.id = f.id_promocion
		left join venta.forma_pago forma_pago on forma_pago.id = f.id_forma_pago
		where f.fecha_registro between desde and hasta
		group by f.fecha_registro, c.codigo, e.codigo, promo.descripcion, forma_pago.descripcion
		order by f.fecha_registro;
	end;
$$;

DROP FUNCTION facturadetalle(date,date)
select * from facturaDetalle('2020-05-05','2023-08-08');
		
--b.
create or replace function volVentas(desde date, hasta date)
returns table(
	anio numeric(38,2),
	mes numeric(38,2),
	total numeric(38,2)
)
language plpgsql
as $$
	begin
		return query
		select
			extract(year from f.fecha_registro) as anio,
			extract(month from f.fecha_registro) as mes,
			sum(f.total) as total
		from venta.factura f
		where f.fecha_registro between desde and hasta
		group by extract(year from f.fecha_registro), extract(month from f.fecha_registro)
		order by anio, mes, total;
	end;
$$;

select * from volVentas('2020-01-05','2023-08-08');

--c.

select
	extract(year from f.fecha_registro),
	p.descripcion,
	sum(fd.cantidad)
from venta.factura f
join venta.factura_detalle fd on fd.id_factura = f.id
join producto.producto p on p.id = fd.id_producto
group by extract(year from f.fecha_registro), p.descripcion
order by extract(year from f.fecha_registro) desc,sum(fd.cantidad) desc

--d.

--Vista de Resumen de Ventas
create view RVentas as
	select
		extract(year from f.fecha_registro) as anio,
		extract(month from f.fecha_registro) as mes,
		p.descripcion as producto,
		sum(fd.cantidad) as cantidadTotal
	from venta.factura f
	join venta.factura_detalle fd on fd.id_factura = f.id
	join producto.producto p on p.id = fd.id_producto
	group by extract(year from f.fecha_registro),extract(month from f.fecha_registro),p.descripcion;

select * from rventas;
