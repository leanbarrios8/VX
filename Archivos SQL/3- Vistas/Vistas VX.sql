USE VX;
SET @@autocommit = 1;

--
-- VISTA DE TABLA PRECIO
--

DROP VIEW IF EXISTS VISTA_PRECIO;

CREATE VIEW VISTA_PRECIO AS
SELECT
    id_precio,
    id_stock_precio,
    costo,
    venta,
    precio_fecha_ins
FROM
    PRECIO;


--
-- VISTA DE COMPRAS POR NUMERO DE CLIENTE
--

DROP VIEW IF EXISTS VISTA_VENTAS_CONTACTO;

CREATE VIEW VISTA_VENTAS_CONTACTO AS
SELECT
	T1.id_contacto,
	T1.nombre_contacto,
    T2.monto_venta,
    T2.id_contacto_v
FROM
	CONTACTO T1
JOIN
	VENTA T2 ON T1.id_contacto = T2.id_contacto_v;
   

--
-- TESTEO DE VISTAS
--


-- VISTA TABLA PRECIOS


SELECT * FROM VISTA_PRECIO;


-- VISTA COMPRAS POR CLIENTE


SELECT * FROM VISTA_VENTAS_CONTACTO
WHERE id_contacto = 3;


SELECT * FROM VISTA_VENTAS_CONTACTO
WHERE id_contacto = 5;
    