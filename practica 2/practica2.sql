/*
*/
create database cinemex;

/*
create table empleado(
  idempleado varchar(20) not null primary key,
  nombre varchar(50),
  direccion varchar(100),
  tel varchar(20),
  sexo varchar(1)
);
create table cinemex(
  idcinemex int not null primary key,
  nombre varchar(45),
  direccion varchar(45),
  tel varchar(20),
  email varchar(50)
);
###
create table cinemexEmpleado(
  cinemex_idCinemex int not null,
  empleado_idEmpleado varchar(20) not null,
  primary key(cinemex_idCinemex,empleado_idEmpleado),
  foreign key (cinemex_idCinemex) references cinemex(idcinemex) on delete cascade on update cascade,
  foreign key (empleado_idEmpleado) references empleado(idempleado) on delete cascade on update cascade
);
## show create table cinemexEmpleado;
alter table empleado add column salario double;
alter table empleado add column email varchar(50);
##
create table gerente(
  idgerente int not null primary key,
  nombre varchar(45),
  turno varchar(15),
  noCel int,
  salario double,
  cinemex_idCinemex int,
  foreign key(cinemex_idCinemex) references cinemex(idcinemex) on delete cascade on update cascade
);

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
#
###crear entidad cartelera y relacionar con cinemex
create table cartelera(
  idcartelera int not null primary key,
  nombre varchar(100),
  fechainicio date,
  fechafin date,
  clasificacion varchar(10)
);

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
