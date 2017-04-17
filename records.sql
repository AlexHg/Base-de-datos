/*1. renombrar la relacion asociado y llamarle empleado*/
alter table asociado rename as empleado;
--2. agregar un campo para almacenar el salario de un empleado
alter table empleado add column salario double;
--3. renombrar el campo llamado nombre en proveedor y llamarlo "proveedor"
alter table proveedor change column nombre proveedor varchar(30)
--4. eliminar el sexo en los empleados
alter table empleado DROP column genero;
--5. modificar la definicion de la relacion empleado para almacenar multiples correos electronicos para dicho asociado.
--crear la relacion miembro


--llave primaria
idClub INT NOT NULL primary key

--para acceder a metadatos:
Desc nombre_relacion;

--Llave foranea
idClub int,
foreign key(idClub) references club(idClub) on delete cascade on update cascade

--Multiples llaves foraneas
idClub int not null, 
idProveedor int not null,
primary key(idClub, idProveedor),
foreign key(idClub) references club(idClub) on delete cascade on update cascade,
foreign key(idProveedor) references proveedor(idProveedor) on delete cascade on update cascade



#por si la cago--
#drop table nombre_table; elimina tabla
#drop database nombre_BD; elimina BD

#cuando es llave foranea compuesta, lleva atributo not null

alter table gerente modify column noCel varchar(22);
####
alter table empleado rename as asociado;
####
alter table asociado modify column direccion varchar(200);
###
#Eliminar llave foranea (FK) entre gerente y cinemex
#1.conocer el id del contrait
#2.Eliminar FK
alter table gerente drop foreign key gerente_ibfk_1; #borramos gerente y cinemex
###
#de cinemex
#eliminar PK existente
#2.agregar PK compuesta
alter table cinemex drop primary key; #hay tablas que necesitan esta pk para la relacion
#hay que romper todas esas relaciones.
#eliminar todos los enlaces de las fk que hace referencia esta pk
#1 entre cinemex y gerente
#2 entre cinemex y cinemexEmpleado

alter table cinemexEmpleado drop foreign key cinemexEmpleado_ibfk_1;
##
#3. emilinar primary key
alter table cinemex drop primary key;

##hacer la pk compuesta por atributos (idcinemex y nombre)
#4. agregar la pk compuesta
alter table cinemex add primary key (idcinemex,nombre);

#a)agregar campo b) indicar que el campo agredo es FK
#a)
alter table cinemex add column idcartelera int;
#b)
alter table cinemex add foreign key (idcartelera) references cartelera(idcartelera) on delete cascade on update cascade;


### crear relacion eliminada de cinmex y gerente
alter table gerente add column nombreG varchar(45);
#
alter table gerente add foreign key (cinemex_idCinemex,nombreG) references cinemex(idcinemex,nombre) on delete cascade on update cascade;


#on delete cascade on update cascade; para cuando se actualiza el padre igualmente el hijo
