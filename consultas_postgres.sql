-- instalacion
https://wiki.postgresql.org/wiki/Working_with_Eclipse
-- en directorio project/pgsql
export PATH=$HOME/project/bin:$PATH
export PGDATA=DemoDir
initdb
---------------------------------------------
psql -l
createdb DemoDB  -- create database DemoDB;
psql DemoDB --enter into DB 'DemoDB'
\dt --ver tablas
\q  -- salir 

---tabes
create table alumno(id int, nombre char(20), edad int, primary key(id));
create table profesor(id int,nombre char(20), edad int, primary key(id));
--inserts
insert into alumno(id,nombre,edad) values(1,'yonel',21),(2,'ruben',23);
insert into profesor(id,nombre,edad) values(1,'prof1',30),(2,'prof2',40);
--- querys
select * from alumno;
select * from profesor where nombre = 'prof2';
select id,edad  from alumno where id = 1;



