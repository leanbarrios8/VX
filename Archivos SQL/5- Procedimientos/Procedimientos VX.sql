USE VX;
SET @@autocommit = 1;

--
-- PROCEDURE PARA ACTUALIZAR STOCK -----
--


DROP PROCEDURE IF EXISTS SP_ACTUALIZAR_STOCK;

DELIMITER //
CREATE PROCEDURE SP_ACTUALIZAR_STOCK(
	IN p_id_stock INT,
    IN p_nuevo_stock VARCHAR(40)
)
BEGIN
	DECLARE stock_original VARCHAR(40);
    -- Obtener el stock original
    SELECT STOCK INTO stock_original FROM STOCK WHERE id_stock = p_id_stock; 
    -- Actualizar el stock
    UPDATE STOCK SET STOCK = p_nuevo_stock WHERE id_stock = p_id_stock; 
END //
DELIMITER ;


--
-- PROCEDURE ACTUALIZAR MONTO VENTA Y PAGO
--


DROP PROCEDURE IF EXISTS SP_ACTUALIZAR_MONTO_PAGO_VENTA;

DELIMITER //
CREATE PROCEDURE SP_ACTUALIZAR_MONTO_PAGO_VENTA (
	IN p_id_venta INT,
    IN p_nuevo_monto_pago INT
)
BEGIN
	DECLARE existe_pago INT;
    
    -- Verificar si la venta tiene un pago asociado
    SELECT COUNT(*) INTO existe_pago FROM PAGO WHERE id_venta_p = p_id_venta;
    IF existe_pago > 0 THEN
		-- Actualizar el monto de pago en la tabla pago
        UPDATE PAGO SET monto_pago = p_nuevo_monto_pago WHERE id_venta_p = p_id_venta;
        -- Actualizar el monto en la tabla venta
        UPDATE VENTA SET monto_venta = p_nuevo_monto_pago WHERE id_Venta = p_id_venta;
	ELSE
		SELECT 'No existe pago asociado a la venta' AS ERROR;
	END IF;
END //
DELIMITER ;


--
-- PROCEDURE PARA ELIMINAR UN CONTACTO, VENTA Y PAGOS
--


DROP PROCEDURE IF EXISTS SP_ELIMINAR_CONTACTO_PAGO_VENTA;

DELIMITER //
CREATE PROCEDURE SP_ELIMINAR_CONTACTO_PAGO_VENTA(
    IN p_id_contacto BIGINT
)
BEGIN
	DECLARE cliente_existente INT;

	-- Verificamos si existe el cliente
	SELECT COUNT(*) INTO cliente_existente FROM CONTACTO WHERE id_contacto = p_id_contacto;
    
    IF cliente_existente = 0 
		THEN
			SIGNAL SQLSTATE '45000' -- Cadena para ingresar error personalizado
            SET MESSAGE_TEXT = 'El cliente no existe. No se pudo eliminar';
	ELSE
		-- Eliminar pagos asociados a ventas del contacto
		DELETE FROM PAGO
		WHERE id_venta_p IN (SELECT id_venta FROM VENTA WHERE id_contacto_v = p_id_contacto);
		-- Eliminar ventas del contacto
		DELETE FROM VENTA WHERE id_contacto_v = p_id_contacto;
		-- Finalmente, eliminar el contacto
		DELETE FROM CONTACTO WHERE id_contacto = p_id_contacto;
	END IF;
END //
DELIMITER ;


--
-- TESTEO DE PROCEDIMIENTOS
--

-- TESTEO PROCEDURE SP_ACTUALIZAR_STOCK

CALL SP_ACTUALIZAR_STOCK(1, '55');
CALL SP_ACTUALIZAR_STOCK(2, '21');

SELECT * FROM STOCK;
SELECT * FROM LOG_STOCK;
SELECT * FROM LOG_STOCK_UPDATE;


-- TEST PROCEDURE SP_ACTUALIZAR_MONTO_PAGO_VENTA

CALL SP_ACTUALIZAR_MONTO_PAGO_VENTA(1,2);
CALL SP_ACTUALIZAR_MONTO_PAGO_VENTA(3,3);

SELECT * FROM VENTA;
SELECT * FROM LOG_VENTA;
SELECT * FROM LOG_VENTA_UPDATE;

-- TEST PROCEDURE SP_ELIMINAR_CONTACTO_PAGO_VENTA

SELECT * FROM CONTACTO; -- Verificamos existe el dato 3
SELECT * FROM VENTA;
SELECT * FROM PAGO;

CALL SP_ELIMINAR_CONTACTO_PAGO_VENTA(3);

SELECT * FROM CONTACTO; -- Verificamos nuevamente y no existe ni el dato ni ventas con ese id de contacto
SELECT * FROM VENTA;
SELECT * FROM PAGO;

