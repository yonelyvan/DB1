============constellation==========================
create database constellation;


CREATE TABLE dim_productos( id_producto int NOT NULL AUTO_INCREMENT,
 			    producto    char(50), 
 			    categoria   char(50),
 			    precio      float,
 			    PRIMARY KEY (id_producto)
 			  );


CREATE TABLE dim_tiendas  (     id_tienda   int NOT NULL AUTO_INCREMENT, 
				tienda     char(50),
		 		ciudad     char(50), 
		 		posicion   char(50),
		 		pais       char(50),
		 		PRIMARY KEY (id_tienda)
		 	   );  


CREATE TABLE dim_tiempos  (     id_tiempo   int NOT NULL AUTO_INCREMENT, 
				day         int,
				month       int, 
				year        int,
				PRIMARY KEY (id_tiempo)
		           );

---- tablas de hechos
CREATE TABLE hechos    ( id_tienda   int, 
			 id_producto int, 
			 id_tiempo   int, 
			 venta       int
		       );

CREATE TABLE hechos_tienda_producto (   id_tienda   int, 
					id_producto int, 
					venta       int
				     ); 

CREATE TABLE hechos_tienda_tiempo   (   id_tienda   int, 
					id_tiempo   int, 
					venta       int
				     );

CREATE TABLE hechos_producto_tiempo (	id_producto int, 
					id_tiempo   int, 
					venta       int
				     );

--copiar de una tabla de una BD a otra ...----------------------------------------
insert into constellation.dim_tiendas select * from estrella.dim_tiendas
insert into constellation.dim_tiempos select * from estrella.dim_tiempos
insert into constellation.dim_productos select * from estrella.dim_productos
------------------------------------------------------------------------
insert into constellation.hechos select id_tienda, id_producto,id_tiempo, venta from estrella.hechos
insert into constellation.hechos_tienda_producto select id_tienda, id_producto, venta from estrella.hechos
insert into constellation.hechos_tienda_tiempo select id_tienda, id_tiempo, venta from estrella.hechos
insert into constellation.hechos_producto_tiempo select id_producto, id_tiempo, venta from estrella.hechos

--------trigers actualizan cada ves q se inserta en tabla estrella.hechos 
CREATE DEFINER=`root`@`localhost` TRIGGER `tienda_producto` 
AFTER INSERT ON `hechos` FOR EACH ROW 
INSERT INTO `hechos_tienda_producto`(`id_tienda`, `id_producto`, `venta`) 
VALUES (new.id_tienda, new.id_producto, new.venta);
--

CREATE DEFINER=`root`@`localhost` TRIGGER `tienda_tiempo` 
AFTER INSERT ON `hechos` FOR EACH ROW 
INSERT INTO `hechos_tienda_tiempo`(`id_tienda`, `id_tiempo`, `venta`) 
VALUES (new.id_tienda, new.id_tiempo, new.venta);
--

CREATE DEFINER=`root`@`localhost` TRIGGER `producto_tiempo` 
AFTER INSERT ON `hechos` FOR EACH ROW 
INSERT INTO `hechos_producto_tiempo`(`id_producto`, `id_tiempo`, `venta`) 
VALUES (new.id_producto, new.id_tiempo, new.venta);
--
==============================================================================









===============estrella=================================

--dim_productos (id_producto, producto, categoria, precio)
--dim_tiendas   (id_tienda, tienda, ciudad, posicion, pais)
--dim_tiempos   (id_tiempo, day, month, year)
--dim_echos     (id_tienda, id_producto, id_tiempo, venta)

CREATE TABLE dim_productos( id_producto int NOT NULL AUTO_INCREMENT,
 			    producto    char(50), 
 			    categoria   char(50),
 			    precio      float,
 			    PRIMARY KEY (id_producto)
 			   );


CREATE TABLE dim_tiendas  ( id_tienda   int NOT NULL AUTO_INCREMENT, 
			    tienda     char(50),
	 		    ciudad     char(50), 
	 		    posicion   char(50),
	 		    pais       char(50),
	 		    PRIMARY KEY (id_tienda)
	 		  );  


CREATE TABLE dim_tiempos  ( id_tiempo   int NOT NULL AUTO_INCREMENT, 
		            day         int,
			    month       int, 
			    year       int,
			    PRIMARY KEY (id_tiempo)
		           );


CREATE TABLE dim_echos    ( id_tienda   int, 
           		    id_producto int, 
			    id_tiempo   int, 
			    venta       float
			 ); 

--funciones

CREATE FUNCTION get_date(cont bigint) RETURNS DATE
RETURN DATE_ADD('2013-01-01', INTERVAL cont DAY);

---- la tarea 

--1
SELECT year ,sum(dim_productos.id_producto * precio)
FROM (dim_hechos  inner join dim_tiempos  on dim_hechos.id_tiempo = dim_tiempos.id_tiempo)  inner join dim_productos on dim_hechos.id_producto = dim_productos.id_producto
group by year;

--2
SELECT pais,categoria,year ,sum(dim_productos.id_producto * precio)
FROM ((dim_hechos  inner join dim_tiempos  on dim_hechos.id_tiempo = dim_tiempos.id_tiempo)  inner join dim_productos on dim_hechos.id_producto = dim_productos.id_producto)
      inner join dim_tiendas on dim_hechos.id_tienda = dim_tiendas.id_tienda
      group by pais,categoria,year;
--3
SELECT pais, ciudad, sum(dim_productos.id_producto * precio)
FROM   (dim_hechos inner join dim_productos on dim_hechos.id_producto = dim_productos.id_producto) inner join  dim_tiendas on dim_hechos.id_tienda = dim_tiendas.id_tienda
group by pais, ciudad;

















------------------------------------------------

CREATE TABLE venta(id_venta     	int NOT NULL AUTO_INCREMENT, 
                   cliente      	char(20) , 
                   producto    	char(20) ,
                   fecha_venta 	datetime ,
                   cantidad  	int ,
                   precio_unitario 	int ,
                   precio_total       int ,
                   PRIMARY KEY (id_venta)
                   );


INSERT INTO `venta`( `cliente`, `producto`, `fecha_venta`, `cantidad`, `precio_unitario`, `precio_total`) 
VALUES ('yonel','cuaderno','2013-01-01 00:00:00',1,13,13);


CREATE FUNCTION get_date(cont int) RETURNS DATE
RETURN DATE_ADD('2011-01-01 00:00:00', INTERVAL cont SECOND);

--usando la funcion get_fecha que aumenta en 120 segundos a una fecha inicial
INSERT INTO `venta`( `cliente`, `producto`, `fecha_venta`, `cantidad`, `precio_unitario`, `precio_total`) 
VALUES ('yonel','gato',get_date(120),1,20,20);
------------------------------------------
--modelo ventas 

CREATE TABLE ventas(Cat_producto char(20),
                    producto_key      int,
                    producto     char(20),
                    region       char(20),
                    vendedor     char(20),
	            cliente_key       int, 
                    cliente      char(20), 
                    factura    	char(20),
                    d_01         char(20),
                    d_02         char(20),
                    d_03         char(20),
                    d_04         char(20),
                    d_05         char(20),
                    d_06         char(20),
                    date_id          date,
                    ventas	      int,
                    costo             int,
                    unidades          int,
                    M_01              int,
                    M_02              int,
                    M_03              int
                    );
------------------------------------------




/////////////----venta.cpp-----//////////////

#include <mysql++/mysql++.h>
///-- instalar libreria:  $ sudo apt-get install libmysql++ libmysql++-dev
///-- compilar:           $ g++ -o venta venta.cpp -lmysqlpp -I /usr/include/mysql++/ -I /usr/include/mysql
///-- ejecutar:           $ ./venta
#include <iostream>
#include <iomanip>
using namespace std;


int main(){
     
string usuarios[]={"Daniel","Juan","Adrian","Marc","Alejandro","Jose","David","Angel","Diego","Pablo",
                   "Ana","Daniela","Isa","Pamela","Karen","Laura","Avril","Maria","Lucia","Paula",
                   "Sara","Sofia","Mercy","Marisol","Jimena","Martin","Luci","Norma","Persi","Niki"}; 

string productos[]={"Lapiz","Cuaderno","Goma","Marcador","Corrector","Borrador","Folder","Colores","Temperas","Tijera",
                   "Lapiz","Cuaderno","Goma","Marcador","Corrector","Borrador","Folder","Colores","Temperas","Tijera",
                   "Lapiz","Cuaderno","Goma","Marcador","Corrector","Borrador","Folder","Colores","Temperas","Tijera",
                   "Lapiz","Cuaderno","Goma","Marcador","Corrector","Borrador","Folder","Colores","Temperas","Tijera",
                   "Lapiz","Cuaderno","Goma","Marcador","Corrector","Borrador","Folder","Colores","Temperas","Tijera"};

int precio_unitario[]={1,5,2,3,3,4,1,5,12,6,
                      1,5,2,3,3,4,1,5,12,6,
                      1,5,2,3,3,4,1,5,12,6,
                      1,5,2,3,3,4,1,5,12,6,
                      1,5,2,3,3,4,1,5,12,6};

int cantida_registros =3000;

    mysqlpp::Connection conn(false);
    if (conn.connect(NULL,"localhost","root", "123456")) { //-- cambiar contraseña
        conn.select_db("ventas"); //--conecta a la BD 'ventas' 
        mysqlpp::Query query = conn.query();
        
        for(int i=0;i<cantida_registros;i++){
            int p=rand()%50; //--selecion del producto
            int cantidad = rand()%10; if(cantidad==0){cantidad++;} //--ningun producto cuesta .s/0.0
            
            query.reset();
            query<<"INSERT INTO `venta`( `cliente`, `producto`, `fecha_venta`, `cantidad`, `precio_unitario`, `precio_total`)"; 
            query<<"VALUES ('"<< usuarios[rand()%30] <<"','"<< productos[p] <<"',get_fecha("<< i*60 <<"),"<< cantidad <<","<< precio_unitario[p] <<","<< cantidad*precio_unitario[p]<<");";
            query.execute();
        }
    }
return 0;
}

//////////////////////////
