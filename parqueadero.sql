-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2023 a las 03:07:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueadero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_tipo`
--

CREATE TABLE `documento_tipo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `documento_tipo`
--

INSERT INTO `documento_tipo` (`id`, `tipo`) VALUES
(1, 'CC'),
(2, 'CE'),
(3, 'Pasaporte'),
(5, 'RC'),
(4, 'TI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `id` int(11) NOT NULL,
  `estatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `estatus`) VALUES
(1, 'Habilitado'),
(2, 'Inhabilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_realizado`
--

CREATE TABLE `pago_realizado` (
  `id` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `id_pago_tipo` int(11) NOT NULL,
  `nu_referencia` varchar(25) NOT NULL,
  `nu_monto` decimal(10,2) NOT NULL,
  `f_pago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pago_realizado`
--

INSERT INTO `pago_realizado` (`id`, `id_reserva`, `id_pago_tipo`, `nu_referencia`, `nu_monto`, `f_pago`) VALUES
(7, 13, 1, '', 5.00, '2023-12-14 15:17:34'),
(8, 14, 4, '59641125', 5.00, '2023-12-15 01:48:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_tipo`
--

CREATE TABLE `pago_tipo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pago_tipo`
--

INSERT INTO `pago_tipo` (`id`, `tipo`) VALUES
(1, 'Efectivo'),
(4, 'TDC'),
(3, 'TDD'),
(2, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `id_documento_tipo` int(11) NOT NULL,
  `nu_documento` varchar(15) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `celular` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombres`, `apellidos`, `id_documento_tipo`, `nu_documento`, `direccion`, `telefono`, `celular`, `email`) VALUES
(1, 'Shaquille Oneall', 'Montero Vergel', 1, '26598677', 'Funza', '', '3243925356', 'shaquille.montero.vergel@gmail.com'),
(15, 'Ralidivet', 'Vergel Vergel', 1, '13027763', 'Funza', '', '3243925356', 'shaquille.montero.vergel123@gmail.com'),
(17, 'Jose Daniel', 'Monasterios', 1, '2659867', 'Funza', '', '123123', 'asdasd@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_trabajador` int(11) NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_salida` timestamp NULL DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `iva` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id`, `id_vehiculo`, `id_trabajador`, `fecha_ingreso`, `fecha_salida`, `subtotal`, `iva`, `total`) VALUES
(13, 13, 1, '2023-12-14 15:14:52', '2023-12-14 15:14:59', 0.00, 0.00, 0.00),
(14, 15, 1, '2023-12-15 01:44:14', '2023-12-15 01:45:40', 2.00, 0.32, 2.32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_costo`
--

CREATE TABLE `reserva_costo` (
  `id` int(11) NOT NULL,
  `id_vehiculo_tipo` int(11) NOT NULL,
  `costo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `reserva_costo`
--

INSERT INTO `reserva_costo` (`id`, `id_vehiculo_tipo`, `costo`) VALUES
(1, 1, 120),
(2, 2, 120),
(3, 3, 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_trabajador_rol` int(11) NOT NULL,
  `id_estatus` int(11) NOT NULL,
  `id_trabajador_contrato` int(11) NOT NULL,
  `sueldo` decimal(10,0) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`id`, `id_persona`, `id_trabajador_rol`, `id_estatus`, `id_trabajador_contrato`, `sueldo`, `user`, `password`, `salt`) VALUES
(1, 1, 1, 1, 1, 100, 'Shaquille', '$2a$10$oOp3ckwW1dzqy874Wx.Ds.YuTid7r6xO4MdsFu.sNnAjUoMDuYgcm', '$2a$10$oOp3ckwW1dzqy874Wx.Ds.'),
(11, 15, 1, 1, 1, 100, 'Ralidivet', '$2a$10$Pk.gv.n/01kSGh3OKkMCpuQJhhEFuPN2CklKJuy68mxXL4rPTsJke', '$2a$10$Pk.gv.n/01kSGh3OKkMCpu'),
(12, 17, 1, 1, 1, 100, 'Ramon', '$2a$10$4kihmwvmwlsbCF1L37/eOev1Ct98zjrHjGrRhR3iqa0cEEfeXJ33C', '$2a$10$4kihmwvmwlsbCF1L37/eOe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_contrato`
--

CREATE TABLE `trabajador_contrato` (
  `id` int(11) NOT NULL,
  `contrato` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `trabajador_contrato`
--

INSERT INTO `trabajador_contrato` (`id`, `contrato`) VALUES
(1, 'u');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_rol`
--

CREATE TABLE `trabajador_rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `trabajador_rol`
--

INSERT INTO `trabajador_rol` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL,
  `id_vehiculo_modelo` int(11) NOT NULL,
  `id_vehiculo_tipo` int(11) NOT NULL,
  `id_propietario` int(11) NOT NULL,
  `id_estatus` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `color` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id`, `id_vehiculo_modelo`, `id_vehiculo_tipo`, `id_propietario`, `id_estatus`, `placa`, `color`, `ano`) VALUES
(13, 18, 1, 1, 1, 'PLA123', 'Rojo', 1998),
(14, 19, 1, 17, 1, 'PLA321', 'Rojo', 2005),
(15, 19, 1, 17, 1, 'PLA32', 'Fucsia', 2010);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_marca`
--

CREATE TABLE `vehiculo_marca` (
  `id` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vehiculo_marca`
--

INSERT INTO `vehiculo_marca` (`id`, `marca`) VALUES
(15, 'Lamborgini');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_modelo`
--

CREATE TABLE `vehiculo_modelo` (
  `id` int(11) NOT NULL,
  `id_vehiculo_marca` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vehiculo_modelo`
--

INSERT INTO `vehiculo_modelo` (`id`, `id_vehiculo_marca`, `modelo`) VALUES
(19, 15, 'Aventador'),
(17, 15, 'Gallardo'),
(18, 15, 'Muercielago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_tipo`
--

CREATE TABLE `vehiculo_tipo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vehiculo_tipo`
--

INSERT INTO `vehiculo_tipo` (`id`, `tipo`) VALUES
(1, 'Auto'),
(2, 'Moto'),
(3, 'Camión');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documento_tipo`
--
ALTER TABLE `documento_tipo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estatus` (`estatus`);

--
-- Indices de la tabla `pago_realizado`
--
ALTER TABLE `pago_realizado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nu_referencia` (`nu_referencia`,`id_pago_tipo`),
  ADD KEY `id_pago_total` (`id_reserva`),
  ADD KEY `id_pago_tipo` (`id_pago_tipo`);

--
-- Indices de la tabla `pago_tipo`
--
ALTER TABLE `pago_tipo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_documento_tipo_2` (`id_documento_tipo`,`nu_documento`),
  ADD KEY `id_documento_tipo` (`id_documento_tipo`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_trabajador` (`id_trabajador`);

--
-- Indices de la tabla `reserva_costo`
--
ALTER TABLE `reserva_costo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `costo` (`costo`,`id_vehiculo_tipo`),
  ADD KEY `id_vehiculo_tipo` (`id_vehiculo_tipo`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_persona` (`id_persona`),
  ADD UNIQUE KEY `user` (`user`),
  ADD UNIQUE KEY `salt` (`salt`),
  ADD KEY `id_estatus` (`id_estatus`),
  ADD KEY `id_trabajador_contrato` (`id_trabajador_contrato`),
  ADD KEY `id_trabajador_rol` (`id_trabajador_rol`);

--
-- Indices de la tabla `trabajador_contrato`
--
ALTER TABLE `trabajador_contrato`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contrato` (`contrato`);

--
-- Indices de la tabla `trabajador_rol`
--
ALTER TABLE `trabajador_rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rol` (`rol`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `id_vehiculo_modelo` (`id_vehiculo_modelo`),
  ADD KEY `id_propietario` (`id_propietario`),
  ADD KEY `id_estatus` (`id_estatus`),
  ADD KEY `id_vehiculo_tipo` (`id_vehiculo_tipo`);

--
-- Indices de la tabla `vehiculo_marca`
--
ALTER TABLE `vehiculo_marca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marca` (`marca`);

--
-- Indices de la tabla `vehiculo_modelo`
--
ALTER TABLE `vehiculo_modelo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_vehiculo_marca` (`id_vehiculo_marca`,`modelo`) USING BTREE;

--
-- Indices de la tabla `vehiculo_tipo`
--
ALTER TABLE `vehiculo_tipo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `documento_tipo`
--
ALTER TABLE `documento_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pago_realizado`
--
ALTER TABLE `pago_realizado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pago_tipo`
--
ALTER TABLE `pago_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `reserva_costo`
--
ALTER TABLE `reserva_costo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `trabajador_contrato`
--
ALTER TABLE `trabajador_contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `trabajador_rol`
--
ALTER TABLE `trabajador_rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `vehiculo_marca`
--
ALTER TABLE `vehiculo_marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `vehiculo_modelo`
--
ALTER TABLE `vehiculo_modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `vehiculo_tipo`
--
ALTER TABLE `vehiculo_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pago_realizado`
--
ALTER TABLE `pago_realizado`
  ADD CONSTRAINT `pago_realizado_ibfk_1` FOREIGN KEY (`id_pago_tipo`) REFERENCES `pago_tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pago_realizado_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_documento_tipo`) REFERENCES `documento_tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva_costo`
--
ALTER TABLE `reserva_costo`
  ADD CONSTRAINT `reserva_costo_ibfk_1` FOREIGN KEY (`id_vehiculo_tipo`) REFERENCES `vehiculo_tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `trabajador_ibfk_1` FOREIGN KEY (`id_trabajador_contrato`) REFERENCES `trabajador_contrato` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trabajador_ibfk_2` FOREIGN KEY (`id_estatus`) REFERENCES `estatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trabajador_ibfk_3` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_estatus`) REFERENCES `estatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_ibfk_2` FOREIGN KEY (`id_propietario`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_ibfk_3` FOREIGN KEY (`id_vehiculo_modelo`) REFERENCES `vehiculo_modelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo_modelo`
--
ALTER TABLE `vehiculo_modelo`
  ADD CONSTRAINT `vehiculo_modelo_ibfk_1` FOREIGN KEY (`id_vehiculo_marca`) REFERENCES `vehiculo_marca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
