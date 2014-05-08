CREATE TABLE venta(id_venta     	int NOT NULL AUTO_INCREMENT, 
                   cliente      	char(20) , 
                   producto    	char(20) ,
                   fecha_venta 	datetime ,
                   cantidad  	int      ,
                   precio_unitario 	int      ,
                   precio_total       int      ,
                   PRIMARY KEY (id_venta)
                   );


INSERT INTO `venta`( `cliente`, `producto`, `fecha_venta`, `cantidad`, `precio_unitario`, `precio_total`) 
VALUES ('yonel','cuaderno','2013-01-01 00:00:00',1,13,13);


CREATE FUNCTION get_fecha(cont int) RETURNS DATETIME
RETURN DATE_ADD('2013-01-01 00:00:00', INTERVAL cont SECOND);

//usando la funcion get_fecha que aumenta en 120 segundos a una fecha inicial
INSERT INTO `venta`( `cliente`, `producto`, `fecha_venta`, `cantidad`, `precio_unitario`, `precio_total`) 
VALUES ('yonel','gato',get_fecha(120),1,20,20);


/////////////----venta.cpp-----//////////////

#include <mysql++/mysql++.h>
// instalar libreria:  $ sudo apt-get install libmysql++ libmysql++-dev
// compilar:           $ g++ -o m test1.cpp -lmysqlpp -I /usr/include/mysql++/ -I /usr/include/mysql
#include <iostream>
#include <iomanip>
using namespace std;


int main(){
     
string usuarios[]={"Daniel","Juan","Adrian","Marc","Alejandro","Jose","David","Angel","Diego","Pablo"
                   "Ana","Daniela","Isa","Pamela","Karen","Laura","Avril","Maria","Lucia","Paula"
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
    if (conn.connect(NULL,"localhost","root", "levesques")) {
        conn.select_db("ventas");
        mysqlpp::Query query = conn.query();
        for(int i=0;i<cantida_registros;i++){///c
            int p=rand()%50;///c
            int cantidad = rand()%10; if(cantidad==0){cantidad++;}
            //query.reset();
            query<<"INSERT INTO `venta`( `cliente`, `producto`, `fecha_venta`, `cantidad`, `precio_unitario`, `precio_total`)"; 
            query<<"VALUES ('"<< usuarios[rand()%30] <<"','"<< productos[p] <<"',get_fecha("<< i*60 <<"),"<< cantidad <<","<< precio_unitario[p] <<","<< cantidad*precio_unitario[p]<<");";
            query.execute();
        }
    }
return 0;
}

//////////////////////////
