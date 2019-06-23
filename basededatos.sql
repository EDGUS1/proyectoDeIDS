-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-09-2013 a las 07:35:22
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `carritocompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroventa` int(11) NOT NULL,
  `nombre` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `cantidad` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `subtotal` text COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`Id`, `numeroventa`, `nombre`, `imagen`, `precio`, `cantidad`, `subtotal`) VALUES
(1, 1, 'Galaxy s4', 'galaxy.jpg', '9800', '2', '19600'),
(2, 1, 'cebolla', 'cebolla.jpg', '10.5', '1', '10.5'),
(3, 2, 'computadora hp', 'computadora.jpg', '7400.5', '1', '7400.5'),
(4, 2, 'Elemnt Skateboard', 'element.jpg', '700', '5', '3500');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'cebolla', 'esta es una cebolla', 'cebolla.jpg', 10.5),
(2, 'camara', 'esta es una camara', 'camara.jpg', 2200),
(3, 'computadora hp', 'esta es una computadora', 'computadora.jpg', 7400.5),
(4, 'Galaxy s4', 'Este ees el nuevo samsung galaxy :D', 'galaxy.jpg', 9800),
(5, 'Elemnt Skateboard', 'Nuevo modelo de la patineta', 'element.jpg', 700),
(6, 'Jalapenos', 'Jalapenos ya que estamos en Mexico', 'jalapenos.jpg', 15);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
