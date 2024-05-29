-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-05-2024 a las 14:46:15
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `tienda`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `SP_CREAR_FACTURA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_FACTURA` (IN `_PRODUCTO` VARCHAR(50), IN `_PRECIO` INT(10), IN `_FECHA` VARCHAR(10))   BEGIN 
INSERT INTO `factura`(`producto`, `precio`, `fecha`) VALUES (_PRODUCTO,_PRECIO,_FECHA);
END$$

DROP PROCEDURE IF EXISTS `SP_ELIMINAR_FACTURA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_FACTURA` (IN `_ID` INT(10))   BEGIN
DELETE FROM `factura` WHERE id = _ID;
END$$

DROP PROCEDURE IF EXISTS `SP_LISTAR_FACTURA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_FACTURA` ()   BEGIN 
SELECT `producto`,`precio`,`fecha` FROM `factura`;
END$$

DROP PROCEDURE IF EXISTS `SP_MODIFICAR_FACTURA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_FACTURA` (IN `_PRODUCTO` VARCHAR(50), IN `_PRECIO` INT(10), IN `_FECHA` VARCHAR(50), IN `_ID` INT(10))   BEGIN
UPDATE `factura` SET `producto`=_PRODUCTO,`precio`=_PRECIO,`fecha`= _FECHA WHERE ID = _ID;
END$$

DROP PROCEDURE IF EXISTS `SP_MOSTRAR_FACTURA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_FACTURA` (IN `_ID` INT(10))   BEGIN
SELECT `producto`,`precio`,`fecha` FROM `factura` WHERE id = _ID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) NOT NULL,
  `precio` int NOT NULL,
  `fecha` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `producto`, `precio`, `fecha`) VALUES
(1, 'Shampoo', 17500, '23/03/2024'),
(2, 'Acondicionador', 27000, '12/02/2024');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
