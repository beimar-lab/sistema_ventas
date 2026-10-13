

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2025 a las 16:42:55
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
-- Base de datos: `botanero_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` enum('PLATILLO','BEBIDA') NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `tipo`, `nombre`, `descripcion`) VALUES
(1, 'PLATILLO', 'POLLOS A LA LEÑA', 'POLLO MAS PAPAS'),
(2, 'BEBIDA', 'EMBOL', 'SANTA CRUZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_negocio`
--

CREATE TABLE `informacion_negocio` (
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `numeroMesas` tinyint(4) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_negocio`
--

INSERT INTO `informacion_negocio` (`nombre`, `telefono`, `numeroMesas`, `logo`) VALUES
('Pollos Lucy', '72629026', 5, './fotos/68f30449ab32f.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `tipo` enum('PLATILLO','BEBIDA') NOT NULL,
  `categoria` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id`, `codigo`, `nombre`, `descripcion`, `precio`, `tipo`, `categoria`) VALUES
(1, '100', 'CUARTO DE POLLO', 'POLLO MAS ARROZ ', 20.00, 'PLATILLO', 1),
(2, '110', 'ECONOMICO', 'PLARO', 15.00, 'PLATILLO', 1),
(3, '200', 'COCA COLA DE 3 LITROS', 'COCA COLA DE TRES LITROS', 19.00, 'BEBIDA', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos_venta`
--

CREATE TABLE `insumos_venta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idInsumo` bigint(20) UNSIGNED NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idVenta` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `insumos_venta`
--

INSERT INTO `insumos_venta` (`id`, `idInsumo`, `precio`, `cantidad`, `idVenta`) VALUES
(1, 1, 20.00, 2, 1),
(2, 1, 20.00, 1, 2),
(3, 1, 20.00, 1, 3),
(4, 1, 20.00, 1, 4),
(5, 1, 20.00, 10, 5),
(6, 2, 15.00, 3, 6),
(7, 1, 20.00, 1, 7),
(8, 2, 15.00, 1, 8),
(9, 2, 15.00, 1, 9),
(10, 1, 20.00, 3, 10),
(11, 3, 19.00, 1, 10),
(12, 2, 15.00, 2, 10),
(13, 1, 20.00, 1, 11),
(14, 1, 20.00, 2, 12),
(15, 1, 20.00, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `telefono`, `password`) VALUES
(1, 'oscarvallejos@gmail.com', 'Oscar Vallejos', '72629026', '$2y$10$CUKOzzZwhMKQXVRubKorrOOsmgTHGPM2HsP9.oDxcT0RCe4IGFqUq'),
(3, 'oscarvallejos@gmail.com', 'Oscar Vallejos', '72629026', 'PacoHunterDev'),
(4, 'test@example.com', 'Test User', '123456789', '$2y$10$rnnWod0aL1Lcq78gHKVrNONjP9wL/PJkhmhMW9m3k4T48if/Zikwy'),
(5, 'oscarvallejos@gmail.com', 'Oscar Vallejos', '72629026', '$2y$10$X70BIe2vy67XyX.R5ERUKeF1bwZpTwEKXw7SdOjzonVoIrue1yo1e'),
(6, 'admin@gmail.com', 'Administrador', '72629026', '$2y$10$ehSG69GUZrpiLZlPGxwZ.eRGbd5OAFiwAO2U2G004vOfBl60c7Wcq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idMesa` tinyint(4) NOT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `pagado` decimal(6,2) NOT NULL,
  `idUsuario` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `idMesa`, `cliente`, `fecha`, `total`, `pagado`, `idUsuario`) VALUES
(1, 1, 'MOSTRADOR', '2025-07-17 14:37:07', 40.00, 40.00, 1),
(2, 1, 'MOSTRADOR', '2025-07-17 14:38:23', 20.00, 20.00, 1),
(3, 1, 'MOSTRADOR', '2025-07-17 15:44:56', 20.00, 20.00, 1),
(4, 2, 'MOSTRADOR', '2025-07-17 15:51:30', 20.00, 50.00, 1),
(5, 3, 'MOSTRADOR', '2025-07-17 16:42:10', 200.00, 200.00, 1),
(6, 5, 'ALBERTO', '2025-07-17 17:06:26', 45.00, 50.00, 1),
(7, 2, 'MOSTRADOR', '2025-07-17 17:14:35', 20.00, 50.00, 1),
(8, 9, 'MOSTRADOR', '2025-07-17 17:14:46', 15.00, 20.00, 1),
(9, 11, 'MOSTRADOR', '2025-07-17 17:14:57', 15.00, 20.00, 1),
(10, 1, 'MOSTRADOR', '2025-07-17 17:19:42', 109.00, 110.00, 1),
(11, 2, 'MOSTRADOR', '2025-10-18 04:08:03', 20.00, 50.00, 1),
(12, 2, 'MOSTRADOR', '2025-10-18 04:41:51', 40.00, 100.00, 1),
(13, 1, 'MOSTRADOR', '2025-10-18 05:14:18', 20.00, 50.00, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insumos_venta`
--
ALTER TABLE `insumos_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `insumos_venta`
--
ALTER TABLE `insumos_venta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
