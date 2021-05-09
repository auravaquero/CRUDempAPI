-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2021 a las 00:22:06
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleado_documento`
--
CREATE DATABASE IF NOT EXISTS `empleado_documento` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `empleado_documento`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dui` varchar(10) NOT NULL,
  `fotoempleado` varchar(250) DEFAULT NULL,
  `fotodocumento` varchar(250) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `rol` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `apellido`, `dui`, `fotoempleado`, `fotodocumento`, `email`, `contraseña`, `rol`, `estado`) VALUES
(1, 'Maria ', 'Sanchez', '12345678-9', 'assets/fotoemp/msanchez.jpeg', 'assets/fotodoc/msanchezdoc.jpeg', 'msanchez@mail.com', '12345566', 1, 1),
(3, 'Francisco', 'Torres', '12345678-9', '/assets/empleados/dfverz.jpeg', '/assets/documentos/pdfverz.jpeg', 'fraz@mail.com', '1232321sj', 1, 1),
(4, 'Marina', 'Escamilla', '12345678-8', '/assets/empleados/dfverz.jpeg', '/assets/documentos/pdfverz.jpeg', 'fraz@mail.com', '1232321sj', 1, 1),
(5, 'Pablo', 'Flores', '12345478-8', '/assets/empleados/paflor.jpeg', '/assets/documentos/paflor.jpeg', 'paflor@mail.com', '1232321sj', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `nombre`) VALUES
(1, 'activo'),
(2, 'inactivo'),
(4, 'de vacaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`) VALUES
(1, 'admin'),
(2, 'general');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`,`rol`,`estado`),
  ADD KEY `fk_empleado_rol_idx` (`rol`),
  ADD KEY `fk_empleado_estado1_idx` (`estado`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
