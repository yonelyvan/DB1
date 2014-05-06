CREATE TABLE venta(id_venta     	int NOT NULL AUTO_INCREMENT, 
                   cliente      	char(20) , 
                   producto    	char(20) ,
                   fecha_venta 	datetime ,
                   cantidad  	int      ,
                   precio_unitario 	int      ,
                   precio_total       int      ,
                   PRIMARY KEY (id_venta)
                    );

ALTER TABLE  `venta` ADD INDEX (  `cliente` ) ;
