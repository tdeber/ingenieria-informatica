-------------------------------------------------------------
-----Trabajo Práctico Nro 2: Procedimientos almacenados,-----
-----triggers, estructura de compras y gestion de stock
-------------------------------------------------------------

--2.
create schema compra;

create table factura_compra(
	id bigint,
	version integer,
	id_proveedor bigint,
	numero integer,
	fecha date,
	descuento numeric(38,2),
	total numeric(38,2)
);

alter table factura_compra
add constraint pk_factura_compra primary key (id),
add constraint fk_factura_compra foreign key (id_proveedor)
	references persona.proveedor(id),
add constraint uk_factura_compra unique (id_proveedor, numero);

create table factura_compra_detalle(
	id bigint,
	version integer,
	id_factura bigint,
	item_fact_compra integer,
	cantidad_compra numeric(38,2),
	precio_compra numeric(38,2),
	id_producto bigint
);

alter table factura_compra_detalle
	add constraint pk_factura_compra_detalle primary key (id),
	add constraint fk1_factura_compra_detalle foreign key (id_producto)
		references producto.producto(id),
	add constraint fk2_factura_compra_detalle foreign key (id_producto)
		references producto.producto(id),
	add constraint uk_factura_compra_detalle unique (id_factura, item_fact_compra);

--4.


create or replace function actTtFacturas()
returns trigger
language plpgsql
as $$
begin
	update venta.factura as f
	set f.total = coalesce((select sum(fd.cantidad * fd.precio_unitario)
					from venta.factura_detalle fd
					where fd.id_factura = f.id),0)
	where f.id = new.id_factura;
	
	return new;

	exception
		when others then
			raise exception 'Error al act total de factura';

end;
$$;

create trigger trActFactura
after insert or update on venta.factura_detalle
for each row
execute function actTtFacturas();

--Repito 
