
-------------------------------
-----Parcial 2 - 16/11/24,-----
-------------------------------

--Ejercicio 1 - Actualizacion de precios

do $$

declare codProveedor

begin

	update producto.producto as p
	set p.precio_unitario = p.precio_unitario+(p.precio_unitario *0.15)
	from persona.proveedor pr
	where pr.id = p.id_proveedor and pr.codio = codProveedor

	raise notice 'Actualizacion completada'

	exception
		when others then
			raise notice 'Error' 
end;
$$;

--Ejercicio 2 - Consulta de ventas por sucursal
select
	s.codigo as codigoSucursal,
	s.descripcion as nombreSucursal,
	coalesce(l.descripcion,'Localidad Desconocida') as localidad,
	coalesce(prov.descripcion,'Provincia Desconocida') as provincia,
	sum(f.total) as ventaTotal
from venta.factura f
join persona.empleado e on e.id = f.id_empleado
join persona.sucursal s on s.id = e.id_sucursal 
left join persona.localidad l on l.id = s.id_localidad 
left join persona.provincia prov on prov.id = l.id_provincia
group by s.codigo, s.descripcion, l.descripcion,prov.descripcion
where f.fecha_confirmacion is not null
order by sum(f.total) desc


--Ejercicio 3 - Vista para DW

create view vista_facturacion_dw as
select
	c.codigo as codigoCliente,
	f.numero as numeroFactura,
	f.fecha_registro as fechaFacturacion,
	f.total as total_facturado,
	p.codigo as codigoProducto,
	fd.cantidad as cantidadVendido,
	p.precio_unitario as precio_unitario,
	p.costo_unitario as costo_unitario
from venta.factura f
join venta.factura_detalle fd on fd.id_factura = f.id
join persona.cliente c on c.id = f.id_cliente
join producto.producto p on p.id = fd.id_producto
where
	extract(year from f.fecha_registro) > '2021' and
	f.fecha_confirmacion is not null

---------------------------------------------
-----Recuperatorio Parcial 2 - 27/11/24,-----
---------------------------------------------

--Ejercicio 1 -  Actualizacion de estructura y pasaje de datos

create sequence venta.factura_estado2_id;
create table venta.factura_estado2(
	id bigint not null,
	id_factura bigint not null,
	item_estado integer not null,
	fechaHora_estado time with time zone not null,
	tipo_estado varchar(10) not null,
	observacion_estado varchar(255) null
);

alter table venta.factura_estado2
	add constraint pk_factura_estado primary key (id),
	add constraint fk_factura_estado foreign key (id_factura)
		references venta.factura(id),
	add constraint ak_factura_estado unique (id_factura, item_estado),
	add constraint ck_factura_estado check (tipo_estado in ('ET','OK','AN'));

insert into venta.factura_estado2(id, id_factura,item_estado, fechaHora_estado,tipo_estado)
select (nexval('venta.factura_estado2_id'), f.id, 1, f.fecha_registro, 'ET')
from venta.factura f

insert into venta.factura_estado2(id, id_factura, item_estado, fechaHora_estado,tipo_estado)
select (nextval('venta.factura_estado2_id'),f.id,2,f.fecha_confirmacion,'OK')
from venta.factura f
where f.fecha_confirmacion is not null

insert into venta.factura_estado2(id, id_factura, item_estado, fechaHora_estado,tipo_estado)
select (nextval('venta.factura_estado2_id'),f.id,3,f.fecha_confirmacion,'AN')
from venta.factura f
where f.fecha_anulacion is not null

alter table venta.factura
	add column id_estado_actual2 bigint null,
	add constraint fk3_factura foreign key (id_estado_actual2) refereces
		venta.factura_estado2(id);

update venta.factura as f
set f.id_estado_actual2 = fe.id
from venta.factura_estado2 fe
where f.id = fe.id_factura and fe.fechaHora_estado = (select max(fe2.fechaHora_Estado)
														from venta.factura_estado2
														where fe2.id_Factura = f.id)
alter table venta.factura
	drop column fecha_anulacion,
	drop column fecha_confirmacion;


--Ejercicio 2: Funcion PostgreSQL

create or replace function f_calcular_promedio_facturacion(anio numeric(38,2), mes numeric(38,2), p_marca varchar(50))
returns numeric(38,2)
language plpgsql
as $$
declare
	promedio numeric(38,2);
begin
	if not exists (select 1 from producto.marca where descripcion = p_marca) and p_marca <> '*' then
		raise exception 'La marca no existe'
	end if;
	if exists (select 1 from producto.marca where descripcion = p_marca) and p_marca <> '*' then
		
		select
			avg(f.total) into promedio
		from venta.factura f
		join venta.factura_detalle fd on fd.id_factura = f.id
		join producto.producto p on p.id = fd.id_producto
		join producto.marca m on m.id = p.id_marca
		join venta.factura_estado fe on fe.id_factura = f.id
		where m.descripcion = p_marca and fe.tipo_estado = 'OK' and
			extract(year from f.fecha_registro) = anio and
			extract(month from f.fecha_registro) = mes
			
		return promedio;
	end if;
		
	if p_marca = '*' then
		select
			avg(f.total) into promedio
		from venta.factura f
		join venta.factura_estado fe on fe.id_factura = f.id
		where fe.tipo_estado = 'OK' and
			extract(year from f.fecha_registro) = anio and
			extract(month from f.fecha_registro) = mes
		
			return promedio;
	end if;
	
	return promedio;
end;
$$;



do $$
	declare codigo numeric(38,2) := 1735;
	
	begin	
		update producto.producto as p
		set p.precio_unitario = p.precio_unitario *1.15
		from persona.proveedor pr
		where pr.id = p.id_proveedor and codigo = pr.codigo
	end;
$$;


create index nombre on venta.factura