root
mysql -u root -p
--Respaldo path hasta el bin
--una vez dentro 
--respaldo 
mysquldump -u root -p nombre
--SQL ESTANDAR ....VARIOS LENGUAJES
create database club1;
use database club1;
create table proveedor(
idProveedor INT NOT NULL primary key,
nombre varchar(30),
tel int
);
create table club(
idClub INT NOT NULL primary key,
nombre varchar(50),
direccion varchar(300),
estado varchar(20)
);
--para visualizar las relaciones existentes:
--SHOW tables
--para acceder a metadatos:
Desc nombre_relacion;
create table asociado(
idAsociado int not null primary key,
nombre varchar(20),
ap varchar(20),
am varchar(20),
genero varchar(10),
fichaContratacion date, 
idClub int,
foreign key(idClub) references club(idClub) on delete cascade on update cascade
);
show create table asociado;
create table clubProveedor(
idClub int not null, 
idProveedor int not null,
primary key(idClub, idProveedor),
foreign key(idClub) references club(idClub) on delete cascade on update cascade,
foreign key(idProveedor) references proveedor(idProveedor) on delete cascade on update cascade
);


--_____________________________________________________________________
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

create table emailAso( 
idAsociado int not null, 
email varchar(30) not null, 
primary key(idAsociado,email), 
foreign key(idAsociado) references empleado(idAsociado) 
on delete cascade on update cascade 
);