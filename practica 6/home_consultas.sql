#1 una vista que muestre el nombre del socio y la tarjeta 
create view v1 as 
select s.nombre as Socio, 
t.nombre as Tarjeta 
from socio s, tarjeta t
where s.idsocio = t.socio_idsocio
order by t.nombre, s.nombre;

#2 mostrar nombre asociados y su tel
create view v2 as 
select nombre as Asociado, tel as Telefono
from asociado 
order by nombre;

#3 nombre del socio y su email
create view v3 as 
select nombre as socio, email
from socio
order by nombre;

#4 nombre sucursal y estado
create view v4 as
select nombre as sucursal, estado
from homedepot
order by estado, nombre;

#5 nombre socio y monto de credito
create view v5 as 
select nombre as Socio, 
credito as Credito
from socio
order by credito, socio;

#6 el nombre de asociado y su genero
create view v6 as 
select nombre as Asociado, sexo as genero
from asociado 
order by genero, nombre; 

#7 nombre sucursal y sus departamentos
create view v7 as 
select h.nombre as Sucursal, d.nombre as Departamento
from homedepot h, depto d, hddepto x
where h.idhd = x.homedepot_idhd 
and x.depto_iddepto = d.iddepto
order by h.nombre, d.nombre;

#8 nombre socio y su direccion
create view v8 as 
select nombre as socio, direccion
from socio order by nombre;

#9 nombre sucursal y su direcc
create view v9 as
select nombre as sucursal, direccion
from homedepot
order by nombre;

#10 nombre socio y tel 
create view v10 as 
select nombre, tel as Telefono
from socio 
order by nombre;

#11 asociado 
create view v11 as
select a.nombre as asociado, h.nombre as sucursal
from asociado a, homedepot h
where a.homedepot_idhd = h.idhd
order by h.nombre, a.nombre;

#12 
create view v12 as 
	select s.nombre as socio, h.nombre as sucursal
	from socio s, homedepot h, hdsocio x
	where s.idsocio = x.socio_idsocio
	and x.homedepot_idhd = h.idhd
	order by h.nombre, s.nombre;

################# SEGUNDA PARTE

#Resolver las siguientes consultas empleando las vistas creadas en la seccion anterior.

#1 mostrar el nombre del asociado, genero, sucursal
select v11.*, v6.genero 
from v11, v6
where v11.asociado = v6.asociado;

#2 mostrar nombre de las sucursales, el edo y direccion
select v9.*, v4.estado
from v9, v4
where v9.sucursal = v4.sucursal;

#3 nombre del socio, su monto de credito y su tel
select v10.*, v5.credito
from v10, v5
where v10.nombre = v5.socio 
order by v5.credito, v5.socio;

#4 sucursal donde se encuentra registrado
select v12.*, v8.direccion
from v12, v8
where v12.socio = v8.socio
order by v12.sucursal, v12.socio;

#5 mostrar el nombre de las sucursales, su estado y el nombre 
select v11.*, v4.estado 
from v11, v4
where v11.sucursal = v4.sucursal
order by v11.sucursal, v4.estado;