#1.- cargar la base de datos
#2.-hacer una consulta que tenga en r en su nombre empleados
select firstnme,lastname,phoneno,salary from employee where lastname like "____r%" order by lastname;
#3.- decir cuantos empleados perciben un salrio de 80000 dolares
select count(*) from employee where salary between 70000 and 80000;
--where salary>=70000 and salary <=80000;
#3.1 que diga el nombre
select firstnme,lastname from employee where salary between 70000 and 80000;
#4.- mostrar el nombre y salrio de los empleado que fueron contratados en el año 2002
select firstnme,lastname,salary,hiredate from employee where hiredate like "2002%" order by lastname;
#5.- decir cuantos empleados nacieron en  1980
select count(*) from employee where birthdate>="1980-01-01" and birthdate<="1980-12-31";
select firstnme,lastname from employee where birthdate>="1980-01-01" and birthdate<="1980-12-31";
#6.-mostrar que tengan los empleado una o como cuarto caracter
select * from employee where firstnme like "___o%" order by lastname;
#7.-como se llama el empleado que tengal el nombre del proyecto support
select e.empno,e.firstnme,e.lastname,d.deptname from employee e, department d where e.workdept=d.deptno order by d.deptname;
select e.firstnme,e.lastname,e.job,p.projname from employee e,project p,empprojact x where e.empno=x.empno and x.projno=p.projno and p.projname like "%SUPPORT%";
mostrar las actividades donde esta el empleado wing lee
select a.actdesc from act a, empprojact x,employee e where a.actno=x.actno and x.empno=e.empno and e.firstnme="Wing" and e.lastname="Lee";