DROP DATABASE VX;
CREATE DATABASE VX;
USE VX;
SET @@autocommit = 1;


--
-- TABLAS PARA BASE DE DATOS ---------------------- 
--


-- STOCK --------------------------- 


DROP TABLE IF EXISTS STOCK;
CREATE TABLE IF NOT EXISTS STOCK (
	id_stock BIGINT AUTO_INCREMENT COMMENT 'Id de producto',
	stock_c VARCHAR(40) NOT NULL COMMENT 'Stock cantidad',
	nombre_stock VARCHAR(40) NOT NULL COMMENT 'Nombre de producto',
	marca VARCHAR(15) NOT NULL COMMENT 'Marca de producto',
	cat VARCHAR(45) NOT NULL COMMENT 'Categoria de producto',
	stock_fecha_ins DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de ingreso a stock',
PRIMARY KEY (id_stock)
);


-- LOG STOCK + TRIGGER -----------


DROP TABLE IF EXISTS LOG_STOCK;
CREATE TABLE IF NOT EXISTS LOG_STOCK(
	id_log_s BIGINT AUTO_INCREMENT,
		id_stock BIGINT NOT NULL COMMENT 'Id de producto',
		stock_c VARCHAR(40) NOT NULL COMMENT 'Cantidad en stock',
	accion VARCHAR(10),
	tabla VARCHAR(10),
	usuario VARCHAR(50),
	fecha_ins DATETIME,
PRIMARY KEY (id_log_s)
);

--

DROP TRIGGER IF EXISTS TRG_LOG_STOCK;

DELIMITER //
CREATE TRIGGER TRG_LOG_STOCK AFTER INSERT ON VX.STOCK
FOR EACH ROW
BEGIN
	INSERT INTO LOG_STOCK ( 
						id_log_s,
						id_stock,
                        stock_c,
                        accion,
                        tabla,
                        usuario,
                        fecha_ins
                        )
		-- Creamos copia de los datos insertados
	VALUES (
		id_log_s,
        NEW.id_stock,
        NEW.stock_c,
        'INSERT',
        'STOCK',
        CURRENT_USER(),
        NOW()
    );
END //
DELIMITER ;


-- LOG STOCK UPDATE + TRIGGER -----------


DROP TABLE IF EXISTS LOG_STOCK_UPDATE;

CREATE TABLE IF NOT EXISTS LOG_STOCK_UPDATE(
	id_log_su BIGINT AUTO_INCREMENT,
		id_stock BIGINT NOT NULL COMMENT 'Id de producto',
		stock_original VARCHAR(40) NOT NULL COMMENT 'Cantidad en stock original',
		stock_nuevo VARCHAR(40) NOT NULL COMMENT 'Cantidad en stock nuevo',
	accion VARCHAR(10),
	tabla VARCHAR(10),
	usuario VARCHAR(50),
	fecha_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id_log_su)
);

--

DROP TRIGGER IF EXISTS TRG_LOG_STOCK_UPDATE;

DELIMITER //
CREATE TRIGGER TRG_LOG_STOCK_UPDATE AFTER UPDATE ON VX.STOCK
FOR EACH ROW
BEGIN
	INSERT INTO LOG_STOCK_UPDATE (
								id_log_su,
                                id_stock,
                                stock_original,
                                stock_nuevo,
                                accion,
                                tabla,
                                usuario,
                                fecha_actualizacion
                                )
			-- Obtenemos datos viejos y nuevos tras el update
	VALUES (
		id_log_su,
		NEW.id_stock,
        OLD.stock_c,
        NEW.stock_c,
		'UPDATE',
        'STOCK', 
        CURRENT_USER(),
        NOW()
    );
END //
DELIMITER ;


-- PRECIO ------------------------- 


DROP TABLE IF EXISTS PRECIO;

CREATE TABLE IF NOT EXISTS PRECIO (
	id_precio BIGINT AUTO_INCREMENT COMMENT 'Id de precio',
		id_stock_precio BIGINT COMMENT 'Id de producto',
        costo DECIMAL(10, 2) NOT NULL COMMENT 'Costo del producto',
        venta DECIMAL(10, 2) NOT NULL COMMENT 'Valor de venta',
        precio_fecha_ins DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT 'Fecha de carga',
CONSTRAINT `FR_PRECIO_STOCK` FOREIGN KEY (id_stock_precio) REFERENCES STOCK (id_stock) ON DELETE CASCADE,
PRIMARY KEY (id_precio)
);


-- LOG PRECIO + TRIGGER -----------


DROP TABLE IF EXISTS LOG_PRECIO;

CREATE TABLE IF NOT EXISTS LOG_PRECIO(
	id_log_p BIGINT AUTO_INCREMENT,
		id_stock_precio BIGINT NOT NULL COMMENT 'Id de producto',
		costo DECIMAL(10, 2) NOT NULL COMMENT 'Costo del producto',
        venta DECIMAL(10, 2) NOT NULL COMMENT 'Valor de venta',
	accion VARCHAR(10),
	tabla VARCHAR(10),
	usuario VARCHAR(50),
	fecha_ins DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT 'Fecha de carga',
PRIMARY KEY (id_log_p)
);

--

DROP TRIGGER IF EXISTS TRG_LOG_PRECIO;

DELIMITER //
CREATE TRIGGER TRG_LOG_PRECIO AFTER INSERT ON VX.PRECIO
FOR EACH ROW
BEGIN
	INSERT INTO LOG_PRECIO (
						id_log_p,
                        id_stock_precio,
                        costo,
                        venta,
                        accion,
                        tabla,
                        usuario,
                        fecha_ins
                        )
			-- Creamos copia de los datos insertados
	VALUES (
		id_log_p,
        id_stock_precio, 
        NEW.costo,
        NEW.venta,
        'INSERT',
        'PRECIO',
        CURRENT_USER(),
        NOW()
    );
END //
DELIMITER ;


-- LOG PRECIO UPDATE + TRIGGER -----------


DROP TABLE IF EXISTS LOG_PRECIO_UPDATE;

CREATE TABLE IF NOT EXISTS LOG_PRECIO_UPDATE(
	id_log_pu BIGINT AUTO_INCREMENT,
		id_stock_precio_u BIGINT NOT NULL COMMENT 'Id de producto',
		costo_original DECIMAL(10, 2) NOT NULL COMMENT 'Costo del producto original',
        costo_nuevo DECIMAL(10, 2) NOT NULL COMMENT 'Costo del producto nuevo',
        venta_original DECIMAL(10, 2) NOT NULL COMMENT 'Valor de venta original',
		venta_nuevo DECIMAL(10, 2) NOT NULL COMMENT 'Valor de venta nuevo',
	accion VARCHAR(10),
	tabla VARCHAR(50),
	usuario VARCHAR(100),
	fecha_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id_log_pu)
);

--

DROP TRIGGER IF EXISTS TRG_LOG_PRECIO_UPDATE;

DELIMITER //
CREATE TRIGGER TRG_LOG_PRECIO_UPDATE AFTER UPDATE ON VX.PRECIO
FOR EACH ROW
BEGIN
	INSERT INTO LOG_PRECIO_UPDATE (
								id_log_pu,
                                id_stock_precio_u,
                                costo_original,
                                costo_nuevo,
                                venta_original,
                                venta_nuevo,
                                accion,
                                tabla,
                                usuario,
                                fecha_actualizacion
                                )
			-- Obtenemos datos viejos y nuevos tras el update
	VALUES (
		id_log_pu,
        id_stock_precio_u,
		OLD.costo,
        NEW.costo, 
        OLD.venta, 
        NEW.venta, 
        'UPDATE', 
        'PRECIO', 
        CURRENT_USER(),
        NOW()
	);
END //
DELIMITER ;


-- CONTACTO ------------------------- 


DROP TABLE IF EXISTS CONTACTO;

CREATE TABLE IF NOT EXISTS CONTACTO (
	id_contacto BIGINT AUTO_INCREMENT COMMENT 'Id del contacto',
	nombre_contacto VARCHAR(50) NOT NULL COMMENT 'Nombre del contacto',
	direccion VARCHAR(20) NOT NULL COMMENT 'Dirección del contacto',
	telefono VARCHAR(15) NOT NULL COMMENT 'Teléfono del contacto',
	email VARCHAR(45) NOT NULL COMMENT 'Email del contacto',
	categoria TINYINT NOT NULL COMMENT '0 Proveedor 1 Cliente',
PRIMARY KEY (id_contacto)
);


-- VENTA --------------------------- 


DROP TABLE IF EXISTS VENTA;

CREATE TABLE IF NOT EXISTS VENTA (
	id_venta BIGINT AUTO_INCREMENT NOT NULL COMMENT 'Id de venta',
	red_venta TINYINT NOT NULL COMMENT 'Red de venta 1 Web, 2 Mercado Libre, 3 Fisico, 4 Redes',
	id_producto BIGINT NOT NULL COMMENT 'Id de producto vendido',
	cantidad INT NOT NULL COMMENT 'Cantidad adquirida',
	monto_venta DECIMAL(10, 2) NOT NULL COMMENT 'Monto de venta',
	id_contacto_v BIGINT NOT NULL COMMENT 'Id de contacto cliente o proveedor',
	venta_fecha_ins DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de venta',
PRIMARY KEY (id_venta),
CONSTRAINT `FR_VENTA_CLIENTE` FOREIGN KEY (id_contacto_v) REFERENCES CONTACTO (id_contacto) ON DELETE CASCADE,
CONSTRAINT `FR_VENTA_STOCK` FOREIGN KEY (id_producto) REFERENCES STOCK (id_stock) ON DELETE CASCADE
);


-- LOG VENTA + TRIGGER -----------


DROP TABLE IF EXISTS LOG_VENTA;

CREATE TABLE IF NOT EXISTS LOG_VENTA(
	id_log_v BIGINT AUTO_INCREMENT,
		id_producto INT NOT NULL COMMENT 'Id de producto vendido',
		cantidad INT NOT NULL COMMENT 'Cantidad adquirida',
		monto_venta DECIMAL(10, 2) NOT NULL COMMENT 'Monto de venta',
	venta_fecha_ins DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT 'Fecha de venta',
	accion VARCHAR(10),
	tabla VARCHAR(50),
	usuario VARCHAR(100),
PRIMARY KEY (id_log_v)
);

--

DROP TRIGGER IF EXISTS TRG_LOG_VENTA;

DELIMITER //
CREATE TRIGGER TRG_LOG_VENTA AFTER INSERT ON VX.VENTA
FOR EACH ROW
BEGIN
	INSERT INTO LOG_VENTA (
						id_log_v,
                        id_producto,
                        cantidad,
                        monto_venta,
                        venta_fecha_ins,
                        accion,
                        tabla,
                        usuario
                        )
			-- Creamos copia de los datos insertados
	VALUES (
		id_log_v,
        NEW.id_producto, 
        NEW.cantidad,
        NEW.monto_venta,
        NOW(),
        'INSERT',
        'STOCK',
        CURRENT_USER()
    );
END //
DELIMITER ;


-- LOG VENTA UPDATE + TRIGGER -----------


DROP TABLE IF EXISTS LOG_VENTA_UPDATE;

CREATE TABLE IF NOT EXISTS LOG_VENTA_UPDATE(
	id_log_vu BIGINT AUTO_INCREMENT,
		id_producto_original INT NOT NULL COMMENT 'Id de producto vendido',
        id_producto_nuevo INT NOT NULL COMMENT 'Id de producto nuevo vendido',
		cantidad_original INT NOT NULL COMMENT 'Cantidad adquirida',
		cantidad_nueva INT NOT NULL COMMENT 'Cantidad adquirida',
		monto_original DECIMAL(10, 2) NOT NULL COMMENT 'Monto de venta viejo',
		monto_nuevo DECIMAL(10, 2) NOT NULL COMMENT 'Monto de venta nuevo',
	accion VARCHAR(10),
	tabla VARCHAR(50),
	usuario VARCHAR(100),
	fecha_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id_log_vu)
);

--

DROP TRIGGER IF EXISTS TRG_LOG_VENTA_UPDATE;

DELIMITER //
CREATE TRIGGER TRG_LOG_VENTA_UPDATE AFTER UPDATE ON VX.VENTA
FOR EACH ROW
BEGIN
	INSERT INTO LOG_VENTA_UPDATE (
								id_log_vu,
                                id_producto_original,
                                id_producto_nuevo,
                                cantidad_original,
                                cantidad_nueva,
                                monto_original,
                                monto_nuevo,
                                accion,
                                tabla,
                                usuario,
                                fecha_actualizacion
                                )
				-- Obtenemos datos viejos y nuevos tras el update
	VALUES (
		id_log_vu,
        OLD.id_producto,
        NEW.id_producto,
		OLD.cantidad,
        NEW.cantidad, 
        OLD.monto_venta, 
        NEW.monto_venta, 
        'UPDATE', 
        'VENTA', 
        CURRENT_USER(),
        NOW()
	);
END //
DELIMITER ;


-- PAGO --------------------------- 


DROP TABLE IF EXISTS PAGO;

CREATE TABLE IF NOT EXISTS PAGO (
	id_pago BIGINT AUTO_INCREMENT NOT NULL COMMENT 'Id de pago',
	id_venta_p BIGINT NOT NULL COMMENT 'Id de venta',
	monto_pago DECIMAL(10, 2) NOT NULL COMMENT 'Monto de pago',
	id_cliente_pago BIGINT NOT NULL COMMENT 'Id de cliente',
	pago_fecha_ins DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de pago',
PRIMARY KEY(id_pago),
CONSTRAINT `FK_PAGOS_VENTA` FOREIGN KEY (id_venta_p) REFERENCES VENTA (id_venta) ON DELETE CASCADE,
CONSTRAINT `FK_PAGOS_CLIENTE` FOREIGN KEY (id_cliente_pago) REFERENCES CONTACTO (id_contacto) ON DELETE CASCADE
);


-- ENVIO --------------------------- 


DROP TABLE IF EXISTS ENVIO;

CREATE TABLE IF NOT EXISTS ENVIO (
	id_envio BIGINT AUTO_INCREMENT COMMENT 'Id de envio',
	envio_medio VARCHAR(20) NOT NULL COMMENT 'Medio por el cual se envia',
	envio_seguimiento INT NOT NULL COMMENT 'Seguimiento del envio',
	envio_direccion VARCHAR(40) NOT NULL COMMENT 'Direccion de envio, calle y altura',
	id_cliente_envio BIGINT NOT NULL COMMENT 'Id de cliente',
	envio_fecha_ins DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP NULL COMMENT 'Fecha de envio',
PRIMARY KEY (id_envio),
CONSTRAINT `FK_CLIENTE_ENVIO` FOREIGN KEY (id_cliente_envio) REFERENCES CONTACTO (id_contacto) ON DELETE CASCADE
);

