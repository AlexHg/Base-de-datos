#1. Mostrar los datos correspondientes de los clubes existentes de la BD

Select * from club;

#2. Mostrar nombre y el tel de todos los clubes

select nombre, tel from club;

select tel, nombre from club;

#3. Mostrar el nombre completo de los socios

select nombre from socio;
	#ordenado
	select nombre from socio order by nombre;
	#ordenado descendiente
	select nombre from socio order by nombre desc;

#4.
select nombre, preciounitario from producto order by preciounitario; 

select nombre as club, tel from club order by nombre;

select nombre as "nombre_clubes", tel from club order by nombre;

#5. nombre de los proveedores

select nombre from proveedores order by nombre;

#6. Proyectar el campo id Edo en la relacion club
	#1. se elimina duplicidad "distinct"
	#2. se ordenan la relacion resltante

select distinct idedo from club order by idedo;
#Ó
select idedo from club group by idedo;

#7 Mostrar el nombre de los clubes que se encuentran o presentan los siguientes codigos postales
		select direccion from club where nombre = "Acapulco"

		select nombre from club where idclub = 10;

		select nombre from club where idclub = 13 or idclub = 14 or idclub = 17;
		select nombre from club where idclub in(13,14,17,20)

		select idclub, tel from  club where nombre in("Oaxaca","Veracruz","Pachuca");
		select idclub, nombre, tel from  club where nombre like "Cordo%";
		select idclub, nombre, tel from  club where nombre like "Xala%";


		# %lo que sea que tenga antes/despues   _la letra que tenga antes/despues
		select idclub, nombre from gerente where nombre like "%Hernandez%" order by nombre;

select nombre from club where direccion like "%94470%" or direccion like "%62270%" or direccion like "%55700";
