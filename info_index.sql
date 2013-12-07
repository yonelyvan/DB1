SHOW INDEX FROM name_table;           // muestra las indices q tien la tabla 'name_tyable'.
DROP INDEX name_index ON  name_table; // elimina el indice 'name_index' de la tabla 'nname_table'.

==========================================
ALTER TABLE name_table ADD INDEX (id); // al hacer las consultas sera mas rapido ya q usa un BTREE por defecto.
CREATE INDEX id_index ON redes(id);    // crear index


CREATE UNIQUE INDEX indice USING BTREE ON redes (id); ///

============otros===================
_____________________// ids repetidos
SELECT id, COUNT( * ) 
FROM name_table
GROUP BY id
HAVING COUNT( * ) >1
_____________________// eliminar primary key
ALTER TABLE name_table
  DROP PRIMARY KEY,
____________________
-------------------------------------------------------------------
// repetidos
SELECT id,count(*) FROM temp GROUP BY id HAVING COUNT( * ) >1; 

//copia a una tabla “temporal” sin repetidos
CREATE TABLE temporal AS SELECT * FROM ciudades GROUP BY (id);

///copiamos todos los ids de los registros repetidos
CREATE TABLE temporal AS SELECT id FROM a group by id  having count(*)>1; 
------------------------------------------------------------------------

tratamiento cadenas de texto:
SELECT ORD( 'A' ) //retorna:   65
select char(65,66,67); ///retorna:   ABC
SELECT CONCAT( 'Holi,', ' ', 'cm vay?' ) // retorna:   holi, cm vay?
concat_ws(separador,cadena1,cadena2,...): "ws" son las iniciales de "with separator". El primer argumento especifica el separador que utiliza para los demás argumentos; el separador se agrega entre las cadenas a concatenar. Ejemplo:
SELECT CONCAT_WS( '-', '1', '2', '3' );  ///retorna  1-2-3
SELECT FIND_IN_SET( 'hola', 'como esta,hola,buen dia' ) retorna 2 // la posición de ‘hola’
SELECT LENGTH( 'Hola' )  /// retorna 4 
SELECT SPACE( 'hola                como              vay' )//elimina espacios en blanco dejando solo un espacio 
SELECT SUBSTRING( 'MySQL con Clase', 7, 3 ) // retorna ‘con’ imprime de la pocicion 7 los siguiente 3 chars


//////////////////////////////////////////////////////////////////////////////////////////
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('www.mysql.com.pe','.',-4), '.', 1);   /// 'www'

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('www.mysql.com.pe','.',-3), '.', 1);   ///'mysql'
 
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('www.mysql.com.pe','.',-2), '.', 1);   ///'com'

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('www.mysql.com.pe','.',-1), '.', 1);   ///'pe'
////////////////////////////////////////////////////////////////////////////////////

//============================6
alter table tweets add fulltext(`comentario`); ///indice fulltext permite buscar algo semejante como like '%palabra%'
// solo funciona para motor de almacenamiento MYISAN .(motores mas conocidoe MYISA Y InnoDB)

SELECT * FROM  `tenm` 
WHERE MATCH (`comentario`) AGAINST ('+reves -coat'); // retirna tweets q contienes esa palabra

__________________________________________________
//para id_tweet usamos un btree indice unico 
//para palabra y fecha un btree  acepta repeticiones

create table isam (id_tweet    bigint,
                   palabra     char(20) , 
                   cuenta      char(20) ,
                   fecha       DATE      ,
                   comentario  char(200)  , 
                   
                   unique index using BTREE(id_tweet),
                   index using BTREE(palabra),
                   index using BTREE(fecha),
                   fulltext(comentario)
                   )
                   ENGINE = MYISAM;
                   
      
///buscando sub cadenas en comentario usando motor de almacenamiento MYISAM y un indice FULLTEXT             
SELECT * 
FROM  `isam` 
WHERE MATCH (comentario) AGAINST ('+reves coat'IN BOOLEAN MODE)
limit 0,20
______________________________________________________































































































==============================
Manipulación:

drop table [table]; - Elimina la tabla, incluyendo registros y estructura.
drop table if exists [table]; - Elimina la tabla, pero verifica que exista.
truncate table [table]; - Elimina los registros, pero mantiene la esrtuctura de la tabla.
rename table [table] to [nuevo nombre de tabla]; - Renombra una tabla.
Algunos comandos útiles:

select * from [table] limit [numero]; - Muestra los registros desde el 1 hasta el número.
Ej. select * from tabla limit 10; - Muestra los 10 primeros registros.
select * from [table] limit [numero inicio],[numero]; - Muestra los registros desde el número de inicio hasta número inicio + número.
Ej. select * from tabla limit 11,10; - Muestra desde registro 11 hasta el 20.
Bases de datos en consola

$ mysqladmin -u -p create - crear base de datos.
$ mysqladmin -u -p drop - borrar la base de datos.
$ mysqladmin -u root -p proc - listar procesos en ejecución.
$ mysqladmin -u root -p -i 5 status - verificar status cada 5 segundos.
$ mysqldump --opt -u -h -p > /path/to/file - Exportar base de datos a fichero.
$ mysqldump --opt -u -h --all-databases -p > /path/to/file - Exportar TODAS las bases de datos a fichero.
$ mysql -h -u -p < /path/to/file - Importar el fichero a mysql
$ mysqlcheck -o -u root -p --all-databases - Optimizar las bases de datos.
Verificación y reparación de bases de datos erroneas:

check table [table]; - Verificar tabla.
repair table [table]; - Reparar tabla rota.