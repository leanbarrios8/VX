USE VX;
SET @@autocommit = 0;

--
-- INSERCION DE DATOS POR TABLA --------------- 
--


-- INSERCION TABLA STOCK -----------


START TRANSACTION;

INSERT INTO STOCK VALUES ('1','15','RTX 3060','Palit','Placa de video', NOW());
INSERT INTO STOCK VALUES ('2','22','EVGA','RTX 3080 ULTRA','Placa de video', NOW());
INSERT INTO STOCK VALUES ('3','36','AM4 B550','Motherboard','Biostar', NOW());
INSERT INTO STOCK VALUES ('4','48','240GB SATAIII','Kingston','Discos Solidos', NOW());
INSERT INTO STOCK VALUES ('5','59','Memoria Ram DDR4 8GB 3600mhz','Hyperx','Ram', NOW());
INSERT INTO STOCK VALUES ('6','40','SSD 480GB Kingston A400','Kingston','Discos Solidos', NOW());
INSERT INTO STOCK VALUES ('7','95','Pen Drive 32GB CS200','Adata','Pen Drives', NOW());
INSERT INTO STOCK VALUES ('8','122','GTX 1660 Super Palit Gamerock','Palit','Placa de video', NOW());
INSERT INTO STOCK VALUES ('9','11','Gopro Hero 4','Gopro','Camaras', NOW());
INSERT INTO STOCK VALUES ('10','6','Digi 6 Con Kit','Digi','Drones', NOW());

SAVEPOINT SP1;

INSERT INTO STOCK (stock_c, nombre_stock, marca, cat, stock_fecha_ins) VALUES ('55','Ryzen 5 5600x','AMD','Procesadores', NOW());
INSERT INTO STOCK (stock_c, nombre_stock, marca, cat, stock_fecha_ins) VALUES ('19','850W 80+ GOLD RGB','Azza','Fuentes', NOW());
INSERT INTO STOCK (stock_c, nombre_stock, marca, cat, stock_fecha_ins) VALUES ('13','Cable Hdmi Comun 2MTS','Genericos','Genericos', NOW());
INSERT INTO STOCK (stock_C, nombre_stock, marca, cat, stock_fecha_ins) VALUES ('12','SAMSUNG 34" SA34UA','Samsumg','Monitores', NOW());
INSERT INTO STOCK (stock_c, nombre_stock, marca, cat, stock_fecha_ins) VALUES ('141','MONITOR 19"','Philips','Monitores', NOW());

SAVEPOINT SP2;

COMMIT;


-- INSERCION TABLA DE PRECIO -----------


START TRANSACTION;

INSERT INTO PRECIO VALUES('1','1','99','199',NOW());
INSERT INTO PRECIO VALUES('2','2','420','550',NOW());
INSERT INTO PRECIO VALUES('3','3','963','1156',NOW());
INSERT INTO PRECIO VALUES('4','4','1568','2100',NOW());
INSERT INTO PRECIO VALUES('5','5','91653','96215',NOW());

SAVEPOINT SP1;

INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('6', '4100', '4600', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('7', '11550', '12300', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('8', '9600', '11800', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('9', '14100', '21200', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('10', '5100', '7800', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('11', '50100', '56800', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('12', '25600', '27400', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('13', '99400', '125000', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('14', '1584900', '198700', NOW());

SAVEPOINT SP2;

ROLLBACK TO SP1;

INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('6', '4100', '4600', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('7', '11550', '12300', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('8', '9600', '11800', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('9', '14100', '21200', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('10', '5100', '7800', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('11', '50100', '56800', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('12', '25600', '27400', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('13', '99400', '125000', NOW());
INSERT INTO PRECIO (id_stock_precio, costo, venta, precio_fecha_ins) VALUES ('14', '1584900', '198700', NOW());

SAVEPOINT SP3;

COMMIT;


-- INSERCION TABLA CONTACTO -----------


START TRANSACTION;

INSERT INTO CONTACTO VALUES ('1','Consumidor Final','Juan b justo 2381','01120400949','venex@venex.com','1');
INSERT INTO CONTACTO VALUES ('2','Epec','Av luz 5000','011669852','epec@epox.com','1');
INSERT INTO CONTACTO VALUES ('3','Gobierno Provincia Cordoba','Jeronimo cortez 1','03515594896','cba@gobcba.com','1');
INSERT INTO CONTACTO VALUES ('4','FAPESA','Calle 50','0112040402','fap@fapesa.com','0');
INSERT INTO CONTACTO VALUES ('5','Pagina Web','Felix Frias 1213','01122201325','vx@venex.com','1');
INSERT INTO CONTACTO VALUES ('6','Elit','La pampa 355','0114698533','elit@elit.com','0');
INSERT INTO CONTACTO VALUES ('7','Crucial','Cochabamba 610','0351633259','compras@crucial.com','0');
INSERT INTO CONTACTO VALUES ('8','MundoFix','Av siempre viva 100','03513559487','herediaventas@fix.com','0');
INSERT INTO CONTACTO VALUES ('9','Lezama','Colon 1564','03514641405','conse@lezama.com','0');
INSERT INTO CONTACTO VALUES ('10','Compragamer','Tucuman 666','0111120400949','ventagayer@cg.com','0');
INSERT INTO CONTACTO VALUES ('11','UNC Cordoba','Del corro 51','03515286982','secretariadecomputacion@unc.com','1');
INSERT INTO CONTACTO VALUES ('12','CoderHouse','Bs As caballito 0','01115399854','consultascoder@coderhouse.com','0');
INSERT INTO CONTACTO VALUES ('13','Leandro Barrios Venex','Colon 1501','3514641405','compras@barrios.com','0');
INSERT INTO CONTACTO VALUES ('14','Fuerza Aerea Argentina','Av Fuerza Aerea 5100','08005551232','consultasfaa@faa.com','0');
INSERT INTO CONTACTO VALUES ('15','Rosamonte','Gorgola 312','03514641406','rosamonte@gmail.com','0');

COMMIT;


-- INSERCION TABLA VENTA -----------


START TRANSACTION;

INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,1,1,9536,1);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,2,2,63200,2);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (2,5,3,85499,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,5,4,96300,4);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (4,3,5,1000,5);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (2,3,4100,1,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,3,1,4160,1);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,4,2,600,2);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,1,3,14221,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,1,4,325000,4);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,2,5,4300,5);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,3,1,960,1);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,4,2,9853,2);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,3,1,5460,1);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (4,4,3,8429,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (4,5,4,325100,4);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,3,5,4400,5);

COMMIT;


-- INSERCION TABLA PAGO


START TRANSACTION;

INSERT INTO PAGO VALUES ('1','1','4100','1',NOW());
INSERT INTO PAGO VALUES ('2','2','600','2',NOW());
INSERT INTO PAGO VALUES ('3','3','8500','3',NOW());
INSERT INTO PAGO VALUES ('4','4','42300','4',NOW());

SAVEPOINT SP1;

INSERT INTO PAGO VALUES ('5','5','100','5',NOW());
INSERT INTO PAGO VALUES ('6','1','4100','1',NOW());
INSERT INTO PAGO VALUES ('7','2','600','2',NOW());
INSERT INTO PAGO VALUES ('8','3','8500','3',NOW());
INSERT INTO PAGO VALUES ('9','4','42300','4',NOW());

SAVEPOINT SP2;

INSERT INTO PAGO VALUES ('10','5','100','5',NOW());
INSERT INTO PAGO VALUES ('11','1','4100','1',NOW());
INSERT INTO PAGO VALUES ('12','2','600','2',NOW());
INSERT INTO PAGO VALUES ('13','3','8500','3',NOW());
INSERT INTO PAGO VALUES ('14','4','42300','4',NOW());
INSERT INTO PAGO VALUES ('15','5','100','5',NOW());

SAVEPOINT SP3;

COMMIT;


-- INSERCION TABLA ENVIO -----------


START TRANSACTION;

INSERT INTO ENVIO VALUES ('1','Andreani','1352','Av Rosamonte 10','1',NOW());
INSERT INTO ENVIO VALUES ('2','Pickup','2598','Villarica 99','2',NOW());
INSERT INTO ENVIO VALUES ('3','Andreani','4423','Colon 1560','3',NOW());
INSERT INTO ENVIO VALUES ('4','Andreani Sucursal','1699','Celso Barrios 11','4',NOW());
INSERT INTO ENVIO VALUES ('5','Andreani','5536','Presidente Roca 44','5',NOW());
INSERT INTO ENVIO VALUES ('6','Andreani','1352','Av Rosamonte 10','1',NOW());
INSERT INTO ENVIO VALUES ('7','Pickup','2598','Villarica 99','2',NOW());

SAVEPOINT SP1;

INSERT INTO ENVIO VALUES ('8','Andreani','4423','Colon 1560','3',NOW());
INSERT INTO ENVIO VALUES ('9','Andreani Sucursal','1699','Celso Barrios 11','4',NOW());
INSERT INTO ENVIO VALUES ('10','Andreani','5536','Presidente Roca 44','5',NOW());
INSERT INTO ENVIO VALUES ('11','Andreani','1352','Av Rosamonte 10','1',NOW());
INSERT INTO ENVIO VALUES ('12','Pickup','2598','Villarica 99','2',NOW());
INSERT INTO ENVIO VALUES ('13','Andreani','4423','Colon 1560','3',NOW());
INSERT INTO ENVIO VALUES ('14','Andreani Sucursal','1699','Celso Barrios 11','4',NOW());
INSERT INTO ENVIO VALUES ('15','Andreani','5536','Presidente Roca 44','5',NOW());

COMMIT;

-- 
-- TESTEO DE TABLAS -----------
-- 

SET @@autocommit = 1;

-- TESTEO STOCK:

UPDATE VX.STOCK SET STOCK = '120' WHERE ID_STOCK = 2;
UPDATE VX.STOCK SET STOCK = '340' WHERE ID_STOCK = 3;

SELECT * FROM STOCK;
SELECT * FROM LOG_STOCK;
SELECT * FROM LOG_STOCK_UPDATE;


-- TESTEO PRECIO:


UPDATE VX.PRECIO SET COSTO = '1' WHERE ID_PRECIO = 1;
UPDATE VX.PRECIO SET VENTA = '2' WHERE ID_PRECIO = 2;

SELECT * FROM PRECIO;
SELECT * FROM LOG_PRECIO;
SELECT * FROM LOG_PRECIO_UPDATE;


-- TESTEO VENTA:


UPDATE VX.VENTA SET CANTIDAD = '1' WHERE ID_VENTA = 1;
UPDATE VX.VENTA SET MONTO_VENTA = '2' WHERE ID_VENTA = 2;
UPDATE VX.VENTA SET VENTA_FECHA_INS = NOW() WHERE ID_VENTA = 3;

SELECT * FROM VENTA;
SELECT * FROM LOG_VENTA;
SELECT * FROM LOG_VENTA_UPDATE;


-- TESTEO PAGO:


SELECT * FROM PAGO;


-- TESTEO CONTACTO:


SELECT * FROM CONTACTO;


-- TESTEO ENVIO


SELECT * FROM ENVIO;

