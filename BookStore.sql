-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              5.5.52-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- PARTE 2. e 3. Creación de la Base de Datos y Gestión de Usuarios
-- 1. Creación de la base de datos, tablas y datos.

-- Volcando estructura de base de datos para bookstore
CREATE DATABASE IF NOT EXISTS `bookstore`; 
USE `bookstore`;

-- Volcando estructura para tabla bookstore.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `apellido` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `telefono` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `idx_clientes_telefono` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bookstore.clientes: ~10 rows (aproximadamente)
INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `email`, `telefono`) 
VALUES
	(1, 'Ana', 'Garcia', 'ana.garcia@g.com', 666111222),
	(2, 'Maria', 'Lopez', 'maria.lopez@g.com', 666111333),
	(3, 'Gorka', 'Martinez', 'gorka.martinez@g.com', 666111444),
	(4, 'David', 'Perez', 'david.perez@g.com', 666222555),
	(5, 'Julia', 'Maion', 'julia.maion@g.com', 666111777),
	(6, 'Esteban', 'Soresina', 'esteban.soresina@g.com', 666122333),
	(7, 'Francisco', 'Arko', 'francisco.arko@g.com', 666112444),
	(8, 'Lorea', 'Nazabal', 'lorea.nazabal@g.com', 666221777),
	(9, 'Idoia', 'Gurmendi', 'idoia.gurmendi@g.com', 666121554),
	(10, 'Uxua', 'Arego', 'uxua.arego@g.com', 666123444);

-- Volcando estructura para tabla bookstore.libros
CREATE TABLE IF NOT EXISTS `libros` (
  `id_libro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `precio` float NOT NULL,
  `cantidad_en_stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_libro`),
  KEY `idx_libros_autor` (`titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bookstore.libros: ~11 rows (aproximadamente)
INSERT INTO `libros` (`id_libro`, `titulo`, `autor`, `genero`, `precio`, `cantidad_en_stock`) 
VALUES
	(1, 'Accabadora', 'Michela_Murgia', 'Narrativa', 13.66, 3),
	(2, 'Canne_al_vento', 'Grazia_Deledda', 'Narrativa', 9.99, 1),
	(3, 'Capitan_Fracassa', 'Théophile_Gautier', 'Avventura', 15.59, 2),
	(4, 'Via_col_vento', 'Margaret_Mitchell', 'Romanzo_storico', 18.29, 7),
	(5, 'Notre_Dame_de_Paris', 'Victor_Hugo', 'Romanzo_storico', 14.59, 6),
	(6, 'La_vasca_del_Führer', 'Serena Dandini', 'Biografico', 17.5, 1),
	(7, 'Il_Conte_di_Montecristo', 'Alexandre Dumas', 'Avventura', 21.99, 4),
	(8, 'Gita_al_faro', 'Virginia_Woolf', 'Narrativa', 11.39, 7),
	(9, 'Memorie_di_Adriano', 'Marguerite_Yourcenar', 'Romanzo_storico', 17.99, 3),
	(10, 'Kafka_sulla_spiaggia', 'Haruki_Murakami', 'Narrativa', 15.2, 1),
	(11, 'Le_braci', 'Sándor_Márai', 'Narrativa', 7.29, 2);

-- Volcando estructura para tabla bookstore.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL DEFAULT '0',
  `fecha_pedido` date NOT NULL,
  `monto_total` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pedido`),
  KEY `idx_pedidos_fecha` (`fecha_pedido`),
  KEY `idx_pedidos_cliente` (`id_cliente`),
  CONSTRAINT `FK_pedidos_clientes` FOREIGN KEY (`id_cliente`) 
  REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bookstore.pedidos: ~10 rows (aproximadamente)
INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `fecha_pedido`, `monto_total`) VALUES
	(1, 1, '2023-05-10', 27.32),
	(2, 2, '2023-05-11', 9.99),
	(3, 3, '2023-05-12', 31.18),
	(4, 4, '2023-05-13', 18.29),
	(5, 5, '2023-05-14', 14.59),
	(6, 6, '2023-05-15', 17.5),
	(7, 7, '2023-05-16', 21.99),
	(8, 8, '2023-05-17', 11.39),
	(9, 9, '2023-05-18', 17.99),
	(10, 10, '2023-05-19', 15.2);

-- Volcando estructura para tabla bookstore.items_pedido
CREATE TABLE IF NOT EXISTS `items_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_libro` int(11) NOT NULL DEFAULT '0',
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `precio_por_item` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pedido`,`id_libro`) USING BTREE,
  KEY `FK_id_libro` (`id_libro`),
  CONSTRAINT `FK_id_libro` FOREIGN KEY (`id_libro`) 
  REFERENCES `libros` (`id_libro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_pedido` FOREIGN KEY (`id_pedido`) 
  REFERENCES `pedidos` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bookstore.items_pedido: ~10 rows (aproximadamente)
INSERT INTO Items_Pedido (id_pedido, id_libro, cantidad, precio_por_item) VALUES
(1, 1, 2, 13.66),
(2, 2, 1, 9.99),
(3, 3, 2, 15.59),
(4, 4, 1, 18.29),
(5, 5, 1, 14.59),
(6, 6, 1, 17.50),
(7, 7, 1, 21.99),
(8, 8, 1, 11.39),
(9, 9, 1, 17.99),
(10, 10, 1, 15.20);


-- 2. Creación de usuarios y privilegios
/* Creacion de un usuario Gerente (acceso completo a todos los datos)*/
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'password_gerente';
GRANT ALL PRIVILEGES ON bookshop.* TO 'gerente'@'localhost';

/*Creazione utente AgenteVentas (acceso de lectura a las tablas libros, clientes y pedidos,
 y acceso de escritura solo a la tabla pedidos)*/
CREATE USER 'agente_ventas'@'localhost' IDENTIFIED BY 'password_agente';
GRANT SELECT ON bookshop.libros TO 'agente_ventas'@'localhost';
GRANT SELECT ON bookshop.clientes TO 'agente_ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookshop.pedidos TO 'agente_ventas'@'localhost';
GRANT SELECT ON bookshop.items_pedido TO 'agente_ventas'@'localhost';


-- PARTE 4: Scripring para optimizar

-- 1. Crear un procedimiento almacenado para gestión de Inventario: 
-- Actualizar automáticamente la cantidad_en_stock en la tabla libros cuando se realiza un nuevo pedido.

DELIMITER //

CREATE PROCEDURE realizar_pedido(
  IN pid_pedido INT,
  IN pid_cliente INT,
  IN pid_libro INT,
  IN pcantidad INT,
  IN pprecio DECIMAL(10,2)
)
BEGIN
  -- Inserta el nuevo pedido (simplificado
  INSERT INTO pedidos (id_pedido, id_cliente, fecha_pedido, monto_total)
  VALUES (pid_pedido, pid_cliente, CURDATE(), pcantidad * pprecio);

  -- Inserta el artículo
  INSERT INTO items_pedido (id_pedido, id_libro, cantidad, precio_por_item)
  VALUES (pid_pedido, pid_libro, pcantidad, pprecio);

  -- Actualiza el inventario
  UPDATE libros
  SET cantidad_en_stock = cantidad_en_stock - pcantidad
  WHERE id_libro = pid_libro;
END;
//

DELIMITER ;

-- Ejecutar el procedimiento para un nuevo pedido

CALL realizar_pedido(1001, 1, 2, 3, (SELECT precio FROM libros WHERE id_libro = 2));

-- 2. Informes de Ventas:
-- Generar un trigger para el informe diario de ventas que resuma el monto total de ventas por género.

-- Crear tabla para almacenar el informe diario de ventas
CREATE TABLE report_ventas_diarias (
    id_report INT AUTO_INCREMENT PRIMARY KEY,
    data_report DATE NOT NULL,
    genero VARCHAR(50) NOT NULL,
    total_ventas DECIMAL(10,2) NOT NULL,
    numero_pedidos INT NOT NULL
);

-- Trigger para el informe diario de ventas
DELIMITER //
CREATE TRIGGER report_ventas
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
    -- Elimina posibles registros anteriores con la misma fecha
    DELETE FROM report_ventas_diarias WHERE data_report = DATE(NEW.fecha_pedido);
    
    -- Inserta los nuevos datos agregados
    INSERT INTO report_ventas_diarias (data_report, genero, total_ventas, numero_pedidos)
    SELECT 
        DATE(NEW.fecha_pedido),
        l.genero,
        SUM(ip.cantidad * ip.precio_por_item),
        COUNT(DISTINCT p.id_pedido)
    FROM pedidos p
    JOIN items_pedido ip ON p.id_pedido = ip.id_pedido
    JOIN libros l ON ip.id_libro = l.id_libro
    WHERE DATE(p.fecha_pedido) = DATE(NEW.fecha_pedido)
    GROUP BY l.genero;
END //
DELIMITER ;

-- Para activar el trigger generamos nuevos pedidos
CALL realizar_pedido(1002, 1, 1, 1, (SELECT precio FROM libros WHERE id_libro = 1));
CALL realizar_pedido(1003, 1, 8, 1, (SELECT precio FROM libros WHERE id_libro = 8));
CALL realizar_pedido(1004, 1, 10, 2, (SELECT precio FROM libros WHERE id_libro = 10));
CALL realizar_pedido(1005, 3, 11, 1, (SELECT precio FROM libros WHERE id_libro = 11));
CALL realizar_pedido(1006, 2, 11, 1, (SELECT precio FROM libros WHERE id_libro = 11));
CALL realizar_pedido(1007, 2, 3, 1, (SELECT precio FROM libros WHERE id_libro = 3));


-- Consulta para verificar el informe diario de ventas
/* Al realizar una SELECT de la nueva tabla creada, se podrá visualizar que durante el día se realizaron
6 pedidos del género "Narrativa" y 1 del género "Avventura" */

SELECT  *
FROM report_ventas_diarias;

-- 3. Respaldo y Recuperación: 
-- Implementar un script para respaldar la base de datos a un archivo.
	
	-- Modificar el usuario y la contraseña
@echo Starting BackUp

set MYSQL_BIN="C:\Program Files\MariaDB 5.5\bin\mysqldump.exe"
set DB_USER=User
set DB_PASS=****
set DB_NAME=BookStore
set BACKUP_DIR="C:\BackupMySQL"

:: Crea carpeta si no existe
if not exist %BACKUP_DIR% mkdir %BACKUP_DIR%

:: Genera nombre file con data
set BACKUP_FILE=%DB_NAME%_%DATE:/=-%.sql

:: Ejecuta backup
%MYSQL_BIN% -u%DB_USER% -p%DB_PASS% %DB_NAME% > %BACKUP_DIR%\%BACKUP_FILE%

echo Backup completado en %BACKUP_DIR%\%BACKUP_FILE%
pause

-- PARTE 5. Indexes y optimización de consultas

-- 1. Creacion de una cosnulta compleja:

SELECT p.fecha_pedido, 
concat(c.id_cliente, '. ', c.nombre, ' ', c.apellido) AS Cliente, 
l.id_libro, l.titulo, ip.cantidad, p.monto_total
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN items_pedido ip ON p.id_pedido = ip.id_pedido
JOIN libros l ON ip.id_libro = l.id_libro
WHERE l.genero = 'Narrativa'
AND p.fecha_pedido >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);

-- 2. Optimizacion consulta para analizar el plan de ejecución

EXPLAIN SELECT p.fecha_pedido, 
concat(c.id_cliente, '. ', c.nombre, ' ', c.apellido) AS Cliente, 
l.id_libro, l.titulo, ip.cantidad, p.monto_total
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN items_pedido ip ON p.id_pedido = ip.id_pedido
JOIN libros l ON ip.id_libro = l.id_libro
WHERE l.genero = 'Narrativa'
AND p.fecha_pedido >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);

-- 3. Creacion de indices como tecnica de optimización para mejorar el rendimiento de la consulta

CREATE INDEX idx_pedidos_fecha ON pedidos(fecha_pedido);
CREATE INDEX idx_libros_autor ON libros(titulo);
CREATE INDEX idx_pedidos_cliente ON pedidos(id_cliente);
CREATE INDEX idx_clientes_telefono ON clientes(telefono);

-- PARTE 6. Planificación de Tareas Administrativa

-- 1. Programacion de una tarea para realizar copias de seguridad

  -- Modificar el usuario y la contraseña
@echo off
:: Script di backup diario per MariaDB/MySQL - BookShop

:: Configuración
set DB_USER=User
set DB_PASSWORD=****
set DB_NAME=BookStore
set BACKUP_DIR=C:\BackupDB
set MYSQL_BIN="C:\Program Files\MariaDB 5.5\bin\mysqldump.exe"

:: Crea directory backup si no existe
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

:: Nombre file backup
set BACKUP_FILE=%DB_NAME%_%DATE:/=-%.sql

:: Ejecuta backup
%MYSQL_BIN% -u%DB_USER% -p%DB_PASSWORD% %DB_NAME% > %BACKUP_DIR%\%BACKUP_FILE%

:: Elimina backup mas viejos de 30 dias
forfiles /p "%BACKUP_DIR%" /m BookShop_Backup_*.sql /d -30 /c "cmd /c del @file"

echo Backup completado: %BACKUP_FILE%
pause



/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
