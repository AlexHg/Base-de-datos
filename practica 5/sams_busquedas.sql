# Fechas examenes
# Practicos: 1ro - 20 de abril; 2do - 27 de abril
# Teorico: viernes 22 de abril
# Avance protecto: 18 al 22 de abril

#resolver las siguientes consultas
#1. Mostrar el nombre de los gerentes que se apellidan Garcia y visualisar el nombre del club donde estas asignados
select g.nombre, c.nombre
from gerente g, club c 
where g.idclub = c.idclub
and (g.nombre like "Garc_a%"
or g.nombre like "% Garc_a%")
order by c.nombre, g.nombre;


#2. mostrar el tel y nombre de los clubes existentes en el edo de gerrero
select c.nombre, c.tel, e.nombre
from club c, estado e 
where c.idedo = e.idedo
and e.nombre = "Guerrero"
order by c.nombre;


#3. mostrar el nombre y tel de aquellos socios que se apellidan lopez
select nombre, tel
from socio 
where nombre like "%Lopez%"
order by nombre;


#4. mostrar el nombre de los gerentes de aquellos clubes existentes en el edo de veracruz
select g.nombre, c.nombre, e.nombre
from gerente g, club c , estado e
where g.idclub = c.idclub
and c.idedo = e.idedo
and e.nombre = "Veracruz"
order by c.nombre, g.nombre;


#5. mostrar el nombre de los productos y sus respectivos proveedores 
select prod.nombre, prov.nombre
from producto prod, proveedor prov 
where prod.idproveedor = prov.idproveedor
order by prod.nombre, prov.nombre;


#6. mostrar el nombre de los clubes que ofrecen el servicio de apple shop
select c.nombre, s.nombre
from club c, servicio s, servicioclub sc
where s.nombre like "Apple Shop"
and s.idservicio = sc.idservicio
and c.idclub = sc.idclub
order by c.nombre;


#7. mostrar el nombre del club y el numero de gerentes que tiene
select c.nombre, count(g.nombre)
from club c, gerente g 
where c.idclub = g.idclub
order by c.nombre;



#8. mostrar la informacion de aquellos gerentes que se llaman luis e incluir el nombre y estado del club dnde estan asignados
select g.nombre, c.nombre, e.nombre
where gerente g, club c, estado e
and g.idclub = c.idclub
and c.idedo = e.idedo
and g.nombre like "% % Luis %"
order by g.nombre;


#9. mostrar el nombre del club del donde se encuentran registrados los socios que tienen los siguientes identificadores... 15, 20, 100 y 185
select s.idsocio, s.nombre, c.nombre
from socio s, club c, socioclub sc
where s.idsocio=sc.idsocio
and sc.idclub = c.idclub
and s.idsocio in(15,20,100,185)
order by s.nombre;


#10. mostrar el nombre del club y los servicios que ofrece para aquellos clubes que tienen los siguientes codigos postales 90610, 58260, 54850, 32399
select c.nombre, s.nombre
from club c, servicio s, servicioclub sc 
where c.idclub = sc.idclub
and sc.idservicio = s.idservicio
and (c.direccion like "%90610%"
or c.direccion like "%58260%"
or c.direccion like "%54850%"
or c.direccion like "%32399%")
order by c.nombre;