USE VX;
SET @@autocommit = 1;

-- Creacion de usuarios.

CREATE USER IF NOT EXISTS 'Lucas_Martinez'@'localhost' IDENTIFIED BY 'lulu1212';
CREATE USER IF NOT EXISTS 'Andrea_Boceli'@'localhost' IDENTIFIED BY 'andre3434';

-- Dar permiso de solo lectura.

GRANT SELECT ON *.* TO 'Lucas_Martinez'@'localhost';

-- Dar perimos de lectura, sinsercion y modificacion de datos.

GRANT SELECT, INSERT, UPDATE ON *.* TO 'Andrea_Boceli'@'localhost';

SELECT * FROM mysql.user WHERE USER LIKE '%Lucas_Martinez%'

