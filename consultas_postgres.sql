psql -l
create database DemoDB;
psql DemoDB --enter into DB 'DemoDB'
\dt --view tables

---tabes
create table alumno(id int, nombre char(20), edad int, primary key(id));
create table profesor(id int,nombre char(20), edad int, primary key(id));
--inserts
insert into alumno(id,nombre,edad) values(1,'yonel',21),(2,'ruben',23);
insert into profesor(id,nombre,edad) values(1,'tejada',30),(2,'lovon',40);
--- querys
select * from alumno;
select * from profesor where nombre = 'lovon';
select id,edad  from alumno where id = 1;
