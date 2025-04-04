USE VX;
SET @@autocommit = 1;

--
-- INSERCION TABLA VENTA
--

INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,1,1,9536,1);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,2,2,63200,2);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (2,5,3,85499,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,5,4,325000,4);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (4,3,5,1000,5);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (2,3,4100,1,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,4,2,63200,2);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,1,3,85499,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,1,4,325000,4);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,2,5,4300,5);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,3,1,4160,1);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,4,2,63220,2);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (4,4,3,85489,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (4,5,4,325100,4);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (1,3,5,4400,5);

SET @@autocommit = 1;
SELECT @@autocommit;

START TRANSACTION;

DELETE FROM VENTA WHERE ID_PRODUCTO = 5;

-- TESTEO

ROLLBACK;
COMMIT;

SELECT * FROM VENTA WHERE ID_PRODUCTO = 5;

INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (2,5,3,85499,3);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (3,5,4,325000,4);
INSERT INTO VENTA (RED_VENTA, ID_PRODUCTO, CANTIDAD, MONTO_VENTA, ID_CONTACTO_V) VALUES (4,5,4,325100,4);

--
-- INSERCION TABLA CONTACTO
--

START TRANSACTION;

INSERT INTO CONTACTO VALUES ('16','Marcelo Rojas','Juan b justo 2381','01120400949','venex@venex.com','3');
INSERT INTO CONTACTO VALUES ('17','Lucas Chavez','Av luz 5000','011669852','epec@epox.com','3');
INSERT INTO CONTACTO VALUES ('18','Esteban Quito','Jeronimo cortez 1','03515594896','cba@gobcba.com','3');
INSERT INTO CONTACTO VALUES ('19','Nadia Flores','Calle 50','0112040402','fap@fapesa.com','3');
SAVEPOINT SP1;
INSERT INTO CONTACTO VALUES ('20','CocaCola','Felix Frias 1213','01122201325','vx@venex.com','4');
INSERT INTO CONTACTO VALUES ('21','Branca','La pampa 355','0114698533','elit@elit.com','4');
INSERT INTO CONTACTO VALUES ('22','Patricio Estrella','Cochabamba 610','0351633259','compras@crucial.com','4');
INSERT INTO CONTACTO VALUES ('23','Bob Esponja','Av siempre viva 100','03513559487','herediaventas@fix.com','4');
SAVEPOINT SP2;

ROLLBACK;

SELECT * FROM CONTACTO;


-- TESTEO

DELETE FROM CONTACTO WHERE ID_CONTACTO BETWEEN 11 AND 14;

SELECT * FROM CONTACTO;

COMMIT;

SELECT * FROM CONTACTO WHERE CATEGORIA = 3;
SELECT * FROM CONTACTO WHERE CATEGORIA = 4; -- Mantenemos desde el sp2
