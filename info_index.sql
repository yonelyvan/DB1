_________acceso desde terminal________
  mysql -h localhost -u root -p  --entrar en mysql , poner password

  SHOW PROCESSLIST; --ver prosesos
  KILL 416;   -- matar proseso 416
  --------------------------------




  
DROP TRIGGER IF EXISTS `indice_invertido`;CREATE DEFINER=`root`@`localhost` TRIGGER `indice_invertido` AFTER INSERT ON `isam`
 FOR EACH ROW INSERT INTO `raices`(`palabra`, `subpalabra`, `year`, `month`, `ids`)
VALUES 
(NEW.palabra, subcadena1 (NEW.comentario) , YEAR(NEW.fecha),    MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena2 (NEW.comentario) , YEAR(NEW.fecha) ,   MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena3 (NEW.comentario) , YEAR(NEW.fecha) ,   MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena4 (NEW.comentario) , YEAR(NEW.fecha) ,   MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena5 (NEW.comentario) , YEAR(NEW.fecha) ,   MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena6 (NEW.comentario) , YEAR(NEW.fecha) ,   MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena7 (NEW.comentario) , YEAR(NEW.fecha) ,   MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena8 (NEW.comentario) , YEAR(NEW.fecha) ,   MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena9 (NEW.comentario) , YEAR(NEW.fecha) ,   MONTH(NEW.fecha) ,  NEW.id),
(NEW.palabra, subcadena10(NEW.comentario) , YEAR(NEW.fecha) ,  MONTH(NEW.fecha) ,  NEW.id)
ON DUPLICATE KEY UPDATE ids= CONCAT(ids,' ',NEW.id;
  
  __________________________________
create procedure get_tweet(llave bigint)
SELECT * FROM `isam` WHERE id=llave;
---------
CREATE PROCEDURE get_ids( d DATE, wordCHAR( 15 ) ) SELECT  `ids` 
FROM  `raices` 
WHERE palabra = word
AND fecha = d
  _____________________________________
 //actualizar si existe tabla o sino crear e insertar

INSERT INTO raices (palabra, fecha, ids) VALUES ('uno','2013-01-01','123456')
ON DUPLICATE KEY UPDATE ids= CONCAT(ids,' ','123456');

  
  
  ///triger para indices invertidos
  

INSERT INTO `raices`(`palabra`, `fecha`, `ids`) 
VALUES 
(subcadena1 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena2 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena3 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena4 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena5 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena6 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena7 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena8 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena9 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena10(NEW.comentario) , date(NEW.fecha) , NEW.id);
DROP TRIGGER IF EXISTS `indice_text`;
////////////////////////////////////////////////
DROP TRIGGER IF EXISTS `indice_invertido`;CREATE DEFINER=`root`@`localhost` TRIGGER `indice_invertido` AFTER INSERT ON `isam` FOR EACH ROW INSERT INTO `raices`(`palabra`, `fecha`, `ids`) 
VALUES 
(subcadena1 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena2 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena3 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena4 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena5 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena6 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena7 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena8 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena9 (NEW.comentario) , date(NEW.fecha) , NEW.id),
(subcadena10(NEW.comentario) , date(NEW.fecha) , NEW.id)

ON DUPLICATE KEY UPDATE ids= CONCAT(ids,' ',NEW.id);





  
  
  
  
  
  ---------------------------
  CREATE FULLTEXT INDEX buscar
    ON isam30 (palabra,comentario)
  ___________________________________

CREATE TABLE raices(
subpalabra CHAR( 15 ) ,
fecha date,
ids VARCHAR( 2000 )
)
_____________________________
  CREATE PROCEDURE set_palabra(palabra char(20),llave CHAR(20),f1 DATETIME,f2 DATETIME)
    SELECT * FROM isam 
    where palabra = palabra;
     limit 0,20;
  
  create table historial(id  INT, palabra CHAR(20),F1 DATETIME, F2 DATETIME, last INT );
  
  ____________________________________
  
  
DROP TRIGGER IF EXISTS `indice_text`;CREATE DEFINER=`root`@`localhost` TRIGGER `indice_text` 
AFTER INSERT ON `isam` FOR EACH ROW INSERT INTO `palabras`(`id`, `palabra`) 
VALUES 
(NEW.id,subcadena1(NEW.comentario)),
(NEW.id,subcadena2(NEW.comentario)),
(NEW.id,subcadena3(NEW.comentario)),
(NEW.id,subcadena4(NEW.comentario)),
(NEW.id,subcadena5(NEW.comentario)),
(NEW.id,subcadena6(NEW.comentario)),
(NEW.id,subcadena7(NEW.comentario)),
(NEW.id,subcadena8(NEW.comentario)),
(NEW.id,subcadena9(NEW.comentario)),
(NEW.id,subcadena10(NEW.comentario));

CREATE FUNCTION subcadena2 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-9), ' ', 1)

CREATE FUNCTION subcadena3 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-8), ' ', 1)

CREATE FUNCTION subcadena4 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-7), ' ', 1)

CREATE FUNCTION subcadena5 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-6), ' ', 1)

CREATE FUNCTION subcadena6 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-5), ' ', 1)

CREATE FUNCTION subcadena7 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-4), ' ', 1)

CREATE FUNCTION subcadena8 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-3), ' ', 1)

CREATE FUNCTION subcadena9 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-2), ' ', 1)

CREATE FUNCTION subcadena10 (s char(150)) RETURNS char(15)
RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(s,' ',-1), ' ', 1)




_________________________

  SELECT * 
FROM isam30
WHERE fecha
BETWEEN  '2013-12-00 00:07:45'
AND  '2013-12-15 00:07:45'
AND palabra =  'manuales'
AND MATCH (
comentario
)
AGAINST (
'libro'
)
LIMIT 0 , 20
_______________________________________________
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
CREATE TABLE isam50(id bigint NOT NULL AUTO_INCREMENT, 
                   palabra     char(20) , 
                   cuenta      char(20) ,
                   fecha       char(20) ,
                   comentario  char(200)  , 
                   PRIMARY KEY (id),
                   index using BTREE(palabra),
                   fulltext(comentario)
  )
  ENGINE = MYISAM;

INSERT INTO isam50(palabra,cuenta,fecha,comentario)
SELECT palabra,cuenta,fecha,comentario
FROM   isam
WHERE id_tweet=609876554876530;


 SELECT DATE_ADD('2013-01-01 00:00:00', INTERVAL 1 SECOND); -- '2013-01-01 00:00:01'
 INSERT INTO `tiempo`(`fecha`) VALUES ( DATE_ADD('2013-01-01 00:00:00', INTERVAL 1 SECOND) ); 
--______________________________________________________
--________table oficial______________________
CREATE TABLE isam30(id bigint NOT NULL AUTO_INCREMENT, 
                   palabra     char(20) , 
                   cuenta      char(20) ,
                   fecha       DATETIME ,
                   comentario  char(200)  , 
                   PRIMARY KEY (id),
                   index using BTREE(palabra),
                   index using BTREE(fecha),
                   fulltext(comentario)
  )
  ENGINE = MYISAM;
  
  
   CREATE TABLE historial( id INT NOT NULL AUTO_INCREMENT ,
                           palabra CHAR(15) ,
                           subpalabra CHAR(15) ,
                           f1 datetime,
                           f2 datetime,
                           limite int,
                           PRIMARY KEY ( id ) 
                          );
  
--_______________________________________________________

--FUNCIONES //////////////////////////////////////////
CREATE FUNCTION t1 (s DATETIME) RETURNS DATETIME
RETURN DATE_ADD(S, INTERVAL 1 SECOND);

CREATE FUNCTION get_fecha(cont bigint) RETURNS DATETIME
RETURN DATE_ADD('2013-01-01 00:00:00', INTERVAL cont SECOND);


CREATE PROCEDURE set_palabra( id BIGINT, palabraCHAR( 20 ) ) INSERT INTO  `palabras` (  `id` ,  `palabra` ) 
VALUES (
id, palabra
)


--////////////////////////////////////////////

------------------------------ editar tablas como aumentar columna eliminar añadir indice etc
http://flossblog.wordpress.com/2011/01/24/crear-modificar-eliminar-tablas-en-mysql/

UPDATE tiempo SET tweet="hello world" WHERE 1; -- modificar datos de una tabla



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
