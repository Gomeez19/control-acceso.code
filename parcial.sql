-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-08-2024 a las 15:18:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_usuario_sede`
--

CREATE TABLE `asignacion_usuario_sede` (
  `id` int(11) NOT NULL,
  `cedula` int(22) NOT NULL,
  `sede_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignacion_usuario_sede`
--

INSERT INTO `asignacion_usuario_sede` (`id`, `cedula`, `sede_id`) VALUES
(1, 123, 1),
(2, 2323, 1),
(3, 2222, 4),
(4, 4444, 4),
(5, 380489121, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id`, `cedula`) VALUES
(3, 4444),
(4, 11111);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad_personas`
--

CREATE TABLE `entidad_personas` (
  `id` int(11) NOT NULL,
  `entidad` varchar(255) NOT NULL,
  `personas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entidad_personas`
--

INSERT INTO `entidad_personas` (`id`, `entidad`, `personas`) VALUES
(4, 'Facultad', 10),
(5, 'Admisiones', 25),
(6, 'Eventos', 30),
(7, 'CEL', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `cedula`) VALUES
(1, 2222),
(2, 3333),
(3, 380489121),
(4, 28838921),
(5, 467263472);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `externo`
--

CREATE TABLE `externo` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `externo`
--

INSERT INTO `externo` (`id`) VALUES
(9),
(12),
(18),
(24),
(25),
(28),
(36),
(48),
(50),
(51),
(54),
(62),
(65),
(67),
(68),
(71),
(72),
(78),
(79),
(80),
(82),
(83),
(86),
(87),
(89),
(90),
(92),
(93),
(96),
(98),
(99),
(101),
(102),
(103),
(104),
(105),
(106);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE `formulario` (
  `id_formulario` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `documento` int(11) NOT NULL,
  `genero` varchar(22) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `sede_id` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `externo_id` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo',
  `fecha_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulario`
--

INSERT INTO `formulario` (`id_formulario`, `nombres`, `documento`, `genero`, `correo`, `motivo`, `sede_id`, `numero`, `externo_id`, `estado`, `fecha_registro`) VALUES
(1, 'meyle', 243241, 'Femenino', 'mey@owuqu', 'Admisiones', 3, '324242', 92, 'activo', '2024-07-31 17:52:35'),
(2, 'evelio', 7468726, 'Masculino', 'eve@hotmail.com', 'Admisiones', 2, '3489922890', 90, 'activo', '2024-07-31 17:47:52'),
(3, 'juan david', 8237918, 'Masculino', 'kasaks@hotmail', 'Admisiones', 3, '23567261', 51, 'activo', '2024-07-31 16:30:33'),
(4, 'Eduar Lengua', 10000000, 'Masculino', 'edlengua@unibarranquilla.edu.co', 'Admisiones', 1, '3003039053', 36, 'activo', '2024-07-24 00:00:00'),
(5, 'Randy', 28329310, 'Masculino', '28398929301', 'Admisiones', 3, '2838239239', 72, 'activo', '2024-07-31 16:44:55'),
(6, 'camilo', 123322231, 'Masculino', 'cami@hotmail.com', 'Admisiones', 1, '1012344663', 25, 'finalizado', NULL),
(7, 'maria', 183190101, 'Femenino', 'mar@hagdh.com', 'Facultad', 3, '37817231', 48, 'activo', '2024-07-24 20:14:56'),
(8, 'jesus', 283378221, 'Masculino', '', 'Admisiones', 3, '278379182', 87, 'activo', '2024-07-31 17:08:42'),
(9, 'erwin', 367472718, 'Masculino', 'erwin@hotmail.com', 'Admisiones', 1, '3287187822', 93, 'activo', '2024-08-01 10:33:47'),
(10, 'alexander', 378220992, 'Masculino', 'alex@gh', 'Admisiones', 3, '781782931892', 99, 'activo', '2024-08-01 10:47:30'),
(11, 'jaider', 872378918, 'Masculino', 'hotmail.com', 'Admisiones', 1, '43874093', 96, 'activo', '2024-08-01 10:41:20'),
(12, 'Jeffrey Infante', 1043660455, 'Masculino', 'jjinfante@unibarranquilla.edu.co', 'Facultad', 2, '3003039053', 9, 'finalizado', NULL),
(13, 'diego', 1217217821, 'Masculino', 'gie@gg', 'Admisiones', 3, '37282193892', 98, 'activo', '2024-08-01 10:46:49'),
(14, 'Richard', 2147483647, 'Masculino', 'rde@unibq.com', 'Admisiones', 1, '230493923', 12, 'finalizado', NULL),
(15, 'helen', 322188919, 'Femenino', 'hele@gmial.com', 'Admisiones', 3, '3713982917892', 101, 'activo', '2024-08-01 10:53:58'),
(16, 'emily', 2147483647, 'Femenino', 'emi@hotmail.com', 'Admisiones', 3, '4739872898342', 102, 'activo', '2024-08-01 10:54:39'),
(17, 'fidel', 2147483647, 'Masculino', 'fidel@gmail.com', 'Admisiones', 1, '37849782738', 103, 'activo', '2024-08-01 10:58:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `fecha` datetime NOT NULL,
  `cedula` int(11) NOT NULL,
  `sede_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`fecha`, `cedula`, `sede_id`) VALUES
('2024-07-24 16:39:17', 123, 1),
('2024-07-24 18:14:57', 2323, 1),
('2024-07-24 18:45:01', 123, 1),
('2024-07-24 18:45:09', 123, 1),
('2024-07-24 18:45:21', 123, 1),
('2024-07-24 18:52:31', 2323, 1),
('2024-07-24 18:54:08', 2222, 4),
('2024-07-24 18:54:20', 2222, 4),
('2024-07-24 19:28:54', 123, 1),
('2024-07-24 19:34:18', 123, 1),
('2024-07-24 19:39:35', 123, 1),
('2024-07-24 19:39:55', 123, 1),
('2024-07-24 20:07:56', 2222, 4),
('2024-07-24 20:15:47', 123, 1),
('2024-07-26 07:40:11', 2222, 4),
('2024-07-26 07:46:07', 2222, 4),
('2024-07-26 07:48:24', 4444, 4),
('2024-07-26 07:52:39', 2222, 4),
('2024-07-26 07:54:48', 2222, 4),
('2024-07-26 07:57:36', 2222, 4),
('2024-07-26 08:02:58', 2222, 4),
('2024-07-26 08:05:17', 2222, 4),
('2024-07-26 08:06:38', 2222, 4),
('2024-07-26 08:06:53', 2222, 4),
('2024-07-26 08:07:55', 2222, 4),
('2024-07-26 08:08:07', 2222, 4),
('2024-07-26 08:08:13', 2222, 4),
('2024-07-26 08:08:51', 2222, 4),
('2024-07-26 08:15:22', 2222, 4),
('2024-07-26 08:15:29', 2222, 4),
('2024-07-26 08:16:43', 2222, 4),
('2024-07-26 08:17:17', 2222, 4),
('2024-07-26 08:18:14', 2222, 4),
('2024-07-26 08:18:27', 2222, 4),
('2024-07-26 08:18:38', 2222, 4),
('2024-07-26 08:19:42', 2222, 4),
('2024-07-26 08:21:48', 2222, 4),
('2024-07-26 08:22:42', 2222, 4),
('2024-07-26 10:11:13', 2222, 4),
('2024-07-26 10:14:56', 2222, 4),
('2024-07-26 10:15:34', 4444, 4),
('2024-07-26 18:08:58', 2222, 4),
('2024-07-26 18:09:14', 4444, 4),
('2024-07-26 18:10:55', 2222, 4),
('2024-07-26 18:11:10', 4444, 4),
('2024-07-26 18:11:25', 123, 1),
('2024-07-26 18:26:04', 2222, 4),
('2024-07-26 18:35:43', 123, 1),
('2024-07-26 18:38:21', 123, 1),
('2024-07-31 10:09:22', 2222, 4),
('2024-07-31 16:14:38', 2222, 4),
('2024-07-31 16:14:53', 123, 1),
('2024-07-31 17:57:43', 2222, 4),
('2024-08-01 11:16:33', 123, 1),
('2024-08-01 11:22:17', 123, 1),
('2024-08-01 16:15:54', 123, 1),
('2024-08-01 17:13:03', 123, 1),
('2024-08-01 17:20:23', 123, 1),
('2024-08-01 17:20:36', 2222, 4),
('2024-08-01 17:21:19', 123, 1),
('2024-08-01 17:25:06', 2222, 4),
('2024-08-01 17:34:40', 123, 1),
('2024-08-01 17:42:26', 123, 1),
('2024-08-02 07:43:12', 123, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `fecha` date NOT NULL,
  `externo_id` int(11) NOT NULL,
  `documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id` int(11) NOT NULL,
  `carrera` varchar(20) NOT NULL,
  `Direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`id`, `carrera`, `Direccion`) VALUES
(1, 'Plaza de la paz', ' Carrera 45 No. 48-31'),
(2, 'Sede soledad', ' Calle 18 No. 39-100'),
(3, 'Centro historico', ' Calle 42 No. 45-22'),
(4, 'Posgrado', ' Carrera 58 No. 68-73');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula`, `nombre`, `rol`) VALUES
(123, 'richard', 'admin'),
(2222, 'jorge', 'estudiante'),
(2323, 'jeffrey', 'admin'),
(3333, 'reichel', 'estudiante'),
(4444, 'cristina', 'docente'),
(11111, 'carlos', 'docente'),
(28838921, 'jose', 'estudiante'),
(380489121, 'gabriela', 'estudiante'),
(467263472, 'malena', 'estudiante');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_usuario_sede`
--
ALTER TABLE `asignacion_usuario_sede`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cedula` (`cedula`),
  ADD KEY `sede_id` (`sede_id`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `entidad_personas`
--
ALTER TABLE `entidad_personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `externo`
--
ALTER TABLE `externo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`id_formulario`),
  ADD KEY `externo_id` (`externo_id`),
  ADD KEY `sede_id` (`sede_id`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`fecha`),
  ADD KEY `sede_id` (`sede_id`),
  ADD KEY `cedula` (`cedula`) USING BTREE;

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`externo_id`,`documento`),
  ADD KEY `documento` (`documento`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion_usuario_sede`
--
ALTER TABLE `asignacion_usuario_sede`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `entidad_personas`
--
ALTER TABLE `entidad_personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `externo`
--
ALTER TABLE `externo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `formulario`
--
ALTER TABLE `formulario`
  MODIFY `id_formulario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_usuario_sede`
--
ALTER TABLE `asignacion_usuario_sede`
  ADD CONSTRAINT `asignacion_usuario_sede_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`),
  ADD CONSTRAINT `asignacion_usuario_sede_ibfk_2` FOREIGN KEY (`sede_id`) REFERENCES `sede` (`id`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`);

--
-- Filtros para la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD CONSTRAINT `formulario_ibfk_1` FOREIGN KEY (`sede_id`) REFERENCES `sede` (`id`),
  ADD CONSTRAINT `formulario_ibfk_2` FOREIGN KEY (`externo_id`) REFERENCES `externo` (`id`);

--
-- Filtros para la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD CONSTRAINT `permiso_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`),
  ADD CONSTRAINT `permiso_ibfk_2` FOREIGN KEY (`sede_id`) REFERENCES `sede` (`id`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`externo_id`) REFERENCES `externo` (`id`),
  ADD CONSTRAINT `registro_ibfk_2` FOREIGN KEY (`documento`) REFERENCES `formulario` (`documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
