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

//usando la la funcion get_fecha q aumenta en 120 segundos a una fecha inicial
INSERT INTO `venta`( `cliente`, `producto`, `fecha_venta`, `cantidad`, `precio_unitario`, `precio_total`) 
VALUES ('yonel','gato',get_fecha(120),1,20,20);


