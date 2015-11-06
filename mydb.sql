-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-10-2015 a las 10:06:27
-- Versión del servidor: 5.5.44
-- Versión de PHP: 5.3.10-1ubuntu3.19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Detalles`
--

CREATE TABLE IF NOT EXISTS `Detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Intereses_id` int(11) NOT NULL,
  `Usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Detalles_Intereses_idx` (`Intereses_id`),
  KEY `fk_Detalles_Usuarios1_idx` (`Usuarios_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `Detalles`
--

INSERT INTO `Detalles` (`id`, `Intereses_id`, `Usuarios_id`) VALUES
(5, 1, 4),
(6, 3, 1),
(7, 4, 4),
(8, 4, 1),
(9, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Intereses`
--

CREATE TABLE IF NOT EXISTS `Intereses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intereses` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `Intereses`
--

INSERT INTO `Intereses` (`id`, `intereses`) VALUES
(1, 'Futbol'),
(2, 'Fisica'),
(3, 'Noticias'),
(4, 'Alimentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE IF NOT EXISTS `Usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'Suli', '123'),
(2, 'Haydee', '123'),
(3, 'Yeni', '1234'),
(4, 'vanesa', '123'),
(5, 'Alejandra', '1234'),
(6, 'Fausto', '123'),
(7, 'Miel', '12345');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Detalles`
--
ALTER TABLE `Detalles`
  ADD CONSTRAINT `fk_Detalles_Intereses` FOREIGN KEY (`Intereses_id`) REFERENCES `Intereses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detalles_Usuarios1` FOREIGN KEY (`Usuarios_id`) REFERENCES `Usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
