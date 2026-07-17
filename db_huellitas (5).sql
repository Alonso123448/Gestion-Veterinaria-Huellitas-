-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-07-2026 a las 20:21:36
-- Versión del servidor: 9.7.0
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_huellitas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int NOT NULL,
  `id_mascota` int DEFAULT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `motivo` text COLLATE utf8mb4_general_ci,
  `estado` enum('Pendiente','Atendida','Cancelada','No asistió') COLLATE utf8mb4_general_ci DEFAULT 'Pendiente',
  `reprogramado_por` int DEFAULT NULL,
  `fecha_reprogramacion` timestamp NULL DEFAULT NULL,
  `id_veterinario` int DEFAULT NULL,
  `es_emergencia` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_mascota`, `fecha_cita`, `hora_cita`, `motivo`, `estado`, `reprogramado_por`, `fecha_reprogramacion`, `id_veterinario`, `es_emergencia`) VALUES
(3, 4, '2026-06-10', '14:30:00', 'malestar', 'No asistió', NULL, NULL, NULL, 0),
(4, 6, '2026-06-27', '09:00:00', 'Control de peso', 'Pendiente', NULL, NULL, NULL, 0),
(5, 7, '2026-06-27', '10:30:00', 'Vacunacion anual', 'Pendiente', NULL, NULL, NULL, 0),
(6, 8, '2026-06-28', '08:30:00', 'Desparasitacion', 'Pendiente', NULL, NULL, NULL, 0),
(7, 9, '2026-06-25', '11:00:00', 'Revision piel', 'Atendida', NULL, NULL, NULL, 0),
(8, 10, '2026-06-24', '09:30:00', 'Control general', 'Atendida', NULL, NULL, NULL, 0),
(9, 11, '2026-06-29', '15:00:00', 'Primera consulta', 'Pendiente', NULL, NULL, NULL, 0),
(10, 12, '2026-06-30', '12:03:33', 'atropello', 'Atendida', NULL, NULL, NULL, 1),
(11, 13, '2026-06-30', '12:11:28', 'atropello', 'Atendida', NULL, NULL, NULL, 1),
(12, 14, '2026-06-30', '12:53:47', 'atropello desgarramiento', 'Atendida', NULL, NULL, NULL, 1),
(13, 12, '2080-05-20', '10:24:00', 'vacunacion', 'Cancelada', NULL, NULL, 2, 0),
(14, 13, '2026-07-06', '08:30:00', 'asd', 'Pendiente', NULL, NULL, 2, 0),
(15, 13, '2026-07-20', '09:00:00', 'Malestar digestivo', 'Pendiente', NULL, NULL, 2, 0),
(16, 13, '2026-07-07', '16:01:00', 'vacunacion', 'Pendiente', NULL, NULL, 6, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `dni` char(8) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_general_ci,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `dni`, `nombre`, `telefono`, `correo`, `direccion`, `fecha_registro`) VALUES
(5, '78970726', 'LLAMO VASQUEZ JOSE LUIS', '987654123', NULL, 'dsadsdsd', '2026-06-05 06:31:46'),
(6, '74521893', 'Luis Mamani Quispe', '987654321', NULL, 'Jr. Los Rosales 234', '2026-06-26 18:15:10'),
(7, '62318547', 'Ana Torres Valdivia', '912345678', NULL, 'Av. Brasil 1120', '2026-06-26 18:15:10'),
(8, '55879632', 'Jorge Huanca Flores', '945678123', NULL, 'Calle Los Pinos 45', '2026-06-26 18:15:10'),
(9, '41236987', 'Maria Lopez Cardenas', '978901234', NULL, 'Jr. Arequipa 567', '2026-06-26 18:15:10'),
(10, '63215478', 'Carlos Ramos G.', '956789012', NULL, 'Av. Universitaria 890', '2026-06-26 18:15:10'),
(11, '78970752', 'CALERO PRIETO GERARDO EFRAÍN', '987654322', 'joseluis_virgo_182@hotmail.com', NULL, '2026-06-26 19:15:30'),
(12, '78970722', 'LINO TRINIDAD SHEYLA MIRIAM', '987654321', NULL, NULL, '2026-06-30 17:03:33'),
(14, '43586348', 'BRAVO JAIMES JUAN CARLOS', '988876544', 'bravo@hotmail.com', NULL, '2026-07-01 15:11:51'),
(15, '60581325', 'QUINO PAUCARA FANNY EDITH', '965316646', 'g46879302@gmail.com', 'Callle El carmen', '2026-07-03 01:14:06'),
(16, '78970728', 'ILLA HUAYHUA ROHI YIMI', '987654334', 'illa@hotmail.com', NULL, '2026-07-03 17:43:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL,
  `id_venta` int NOT NULL,
  `tipo_item` enum('producto','servicio') NOT NULL,
  `id_item` int NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `precio_unit` decimal(8,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle`, `id_venta`, `tipo_item`, `id_item`, `descripcion`, `cantidad`, `precio_unit`, `subtotal`) VALUES
(1, 1, 'servicio', 4, 'Bano y Grooming', 1, 35.00, 35.00),
(2, 2, 'servicio', 2, 'Vacunacion', 1, 25.00, 25.00),
(3, 3, 'servicio', 2, 'Vacunacion', 1, 25.00, 25.00),
(4, 4, 'servicio', 4, 'Bano y Grooming', 1, 35.00, 35.00),
(5, 5, 'servicio', 1, 'Consulta General', 1, 30.00, 30.00),
(6, 6, 'servicio', 4, 'Bano y Grooming', 1, 35.00, 35.00),
(7, 7, 'servicio', 7, 'Limpiado de oidos', 1, 21.00, 21.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_clinico`
--

CREATE TABLE `historial_clinico` (
  `id_historial` int NOT NULL,
  `id_mascota` int DEFAULT NULL,
  `fecha_consulta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diagnostico` text COLLATE utf8mb4_general_ci NOT NULL,
  `tratamiento` text COLLATE utf8mb4_general_ci NOT NULL,
  `observaciones` text COLLATE utf8mb4_general_ci,
  `imagen` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_clinico`
--

INSERT INTO `historial_clinico` (`id_historial`, `id_mascota`, `fecha_consulta`, `diagnostico`, `tratamiento`, `observaciones`, `imagen`, `peso`, `id_usuario`) VALUES
(1, 4, '2026-06-05 06:35:10', 'sida', 'eustancia', 'tia ya tia ya fue', NULL, NULL, NULL),
(2, 4, '2026-06-05 07:05:40', 'sdsa', 'dssdsdsd', NULL, 'historial_1780643139997.png', NULL, NULL),
(3, 6, '2026-06-26 18:15:16', 'Dermatitis leve', 'Antihistaminico 5mg por 7 dias', 'Cambiar alimento', NULL, NULL, NULL),
(4, 7, '2026-06-26 18:15:16', 'Otitis externa bilateral', 'Gotas otologicas 2 veces al dia', 'Control en 10 dias', NULL, NULL, NULL),
(5, 8, '2026-06-26 18:15:16', 'Consulta rutinaria en buen estado', 'Sin tratamiento requerido', 'Proxima vacuna en 3 meses', NULL, NULL, NULL),
(6, 9, '2026-06-26 18:15:16', 'Gastroenteritis aguda', 'Metronidazol 250mg cada 12h + dieta blanda', 'Hidratacion oral', NULL, NULL, NULL),
(7, 13, '2026-06-30 17:17:21', 'dolor muscular , desgarramiento', 'pastillas, operacion urgente , descanso', '9 años aprox,  edad adulta .', 'img_1782839841589.png', 3.90, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_veterinario`
--

CREATE TABLE `horarios_veterinario` (
  `id_horario` int NOT NULL,
  `id_usuario` int NOT NULL,
  `dia_semana` varchar(15) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `horarios_veterinario`
--

INSERT INTO `horarios_veterinario` (`id_horario`, `id_usuario`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES
(2, 2, 'Lunes', '08:24:00', '10:26:00'),
(6, 6, 'Martes', '14:02:00', '16:02:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id_insumo` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `unidad` varchar(30) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL DEFAULT '0.00',
  `stock_actual` int NOT NULL DEFAULT '0',
  `stock_minimo` int NOT NULL DEFAULT '0',
  `fecha_vencimiento` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id_insumo`, `nombre`, `descripcion`, `unidad`, `imagen`, `precio`, `stock_actual`, `stock_minimo`, `fecha_vencimiento`, `estado`) VALUES
(1, 'Gasas Esteriles', 'Paquete x50', 'unidad', 'img_1782918314429.webp', 8.00, 15, 5, '2027-12-01', 'Activo'),
(2, 'Jeringas 5ml', 'Caja x100', 'caja', 'img_1782918272108.webp', 12.00, 8, 3, NULL, 'Activo'),
(3, 'Algodon Quirurgico', 'Rollo 500g', 'rollo', 'img_1782918209134.webp', 6.50, 2, 5, '2028-01-01', 'Activo'),
(4, 'Alcohol 70', 'Galon 4L', 'unidad', 'img_1782918395311.webp', 18.00, 4, 2, NULL, 'Activo'),
(5, 'Guantes Latex M', 'Caja x100', 'caja', 'img_1782918135411.webp', 22.00, 1, 4, '2027-06-01', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_actividad`
--

CREATE TABLE `logs_actividad` (
  `id_log` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `accion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_actividad` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcaje_veterinario`
--

CREATE TABLE `marcaje_veterinario` (
  `id_marcaje` int NOT NULL,
  `id_usuario` int NOT NULL,
  `tipo` enum('entrada','salida') NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `ip_origen` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marcaje_veterinario`
--

INSERT INTO `marcaje_veterinario` (`id_marcaje`, `id_usuario`, `tipo`, `fecha`, `hora`, `ip_origen`, `created_at`) VALUES
(1, 6, 'entrada', '2026-07-03', '11:57:58', '10.102.194.50', '2026-07-03 16:57:58'),
(2, 6, 'salida', '2026-07-03', '11:58:16', '10.102.194.50', '2026-07-03 16:58:16'),
(3, 6, 'entrada', '2026-07-14', '12:44:37', '10.213.184.84', '2026-07-14 17:44:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id_mascota` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `especie` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `raza` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `genero` enum('Macho','Hembra') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `alimentacion` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ambiente` enum('Interior','Exterior','Mixto') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `convive_con` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ultima_desparasitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id_mascota`, `nombre`, `imagen`, `especie`, `raza`, `genero`, `fecha_nacimiento`, `id_cliente`, `peso`, `alimentacion`, `ambiente`, `convive_con`, `ultima_desparasitacion`) VALUES
(4, 'Michilala', 'img_1782917802390.jpg', 'Gato', 'Maites', 'Macho', '2026-06-03', 5, NULL, NULL, NULL, NULL, NULL),
(6, 'Rocky', 'img_1782917842495.jpg', 'Perro', 'Labrador', 'Macho', '2020-03-15', 5, 28.50, 'Balanceado', 'Interior', NULL, NULL),
(7, 'Luna', 'img_1782917744058.jpg', 'Gato', 'Siames', 'Hembra', '2021-07-22', 5, 4.20, 'Croquetas', 'Interior', NULL, NULL),
(8, 'Max', 'img_1782917882981.jpg', 'Perro', 'Golden Retriever', 'Macho', '2019-11-10', 6, 32.00, 'Balanceado', 'Mixto', NULL, NULL),
(9, 'Nala', 'img_1782917465204.webp', 'Gato', 'Persa', 'Hembra', '2022-01-05', 7, 3.80, 'Croquetas', 'Interior', NULL, NULL),
(10, 'Toby', 'img_1782917494608.webp', 'Perro', 'Beagle', 'Macho', '2018-06-30', 8, 12.50, 'Casero', 'Exterior', NULL, NULL),
(11, 'Mia', 'img_1782917957196.webp', 'Perro', 'Shih Tzu', 'Hembra', '2023-02-14', 9, 5.10, 'Balanceado', 'Interior', NULL, NULL),
(12, 'muscal', 'img_1782917662950.jpg', 'Perro', 'chizu', 'Macho', NULL, 12, NULL, NULL, NULL, NULL, NULL),
(13, 'leco', 'img_1782917601385.jpg', 'Perro', 'chihuahua', 'Macho', NULL, 12, NULL, NULL, NULL, NULL, NULL),
(14, 'polo', 'img_1782917704409.webp', 'Gato', 'chizu', 'Macho', NULL, 12, NULL, NULL, NULL, NULL, NULL),
(15, 'Lunar', 'img_1782918875784.jpg', 'gato', 'siames', 'Macho', '2025-07-01', 14, 4.60, 'comida casera', 'Interior', 'adultos', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `id_movimiento` int NOT NULL,
  `tipo_item` enum('producto','insumo') NOT NULL,
  `id_item` int NOT NULL,
  `tipo_movimiento` enum('entrada','salida') NOT NULL,
  `cantidad` int NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `categoria` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `precio` decimal(10,2) NOT NULL,
  `stock_actual` int NOT NULL,
  `stock_minimo` int NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo') COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  `imagen` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `categoria`, `descripcion`, `precio`, `stock_actual`, `stock_minimo`, `fecha_vencimiento`, `estado`, `imagen`) VALUES
(1, 'Amoxicilina 500mg', 'Medicamentos', 'Antibiotico amplio espectro', 25.00, 30, 10, '2027-03-01', 'Activo', 'img_1783037631477.jpg'),
(2, 'Frontline Spray', 'Medicamentos', 'Antipulgas y garrapatas', 45.50, 5, 8, '2026-09-15', 'Activo', 'img_1783037564028.jpg'),
(3, 'Meloxicam 1mg', 'Medicamentos', 'Antiinflamatorio AINE', 18.00, 20, 5, '2027-06-30', 'Activo', 'img_1783037498634.jpg'),
(4, 'Suero Fisiologico', 'Medicamentos', 'Solucion NaCl 0.9% 1L', 8.50, 3, 10, '2026-08-01', 'Activo', 'img_1783037446849.webp'),
(5, 'Vitamina B Complex', 'Medicamentos', 'Suplemento vitaminico', 15.00, 25, 5, NULL, 'Activo', 'img_1783037374896.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int NOT NULL,
  `id_mascota` int NOT NULL,
  `medicamento` varchar(150) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `frecuencia` varchar(100) NOT NULL,
  `duracion_dias` int DEFAULT NULL,
  `notas` varchar(300) DEFAULT NULL,
  `fecha_prescripcion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id_receta`, `id_mascota`, `medicamento`, `dosis`, `frecuencia`, `duracion_dias`, `notas`, `fecha_prescripcion`) VALUES
(1, 6, 'Amoxicilina', '250mg', 'Cada 12 horas', 7, 'Con comida', '2026-06-26'),
(2, 9, 'Metronidazol', '125mg', 'Cada 8 horas', 5, 'Dieta blanda', '2026-06-26'),
(3, 13, 'dolocodralan', '2mg', 'cada 8 horas', 3, NULL, '2026-06-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int NOT NULL,
  `nombre_rol` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Veterinario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL DEFAULT '0.00',
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre`, `descripcion`, `precio`, `estado`) VALUES
(1, 'Consulta General', 'Revision clinica estandar', 30.00, 'Activo'),
(2, 'Vacunacion', 'Aplicacion de vacuna y carnet', 25.00, 'Activo'),
(3, 'Desparasitacion', 'Tratamiento antiparasitario', 20.00, 'Activo'),
(4, 'Bano y Grooming', 'Bano corte de unas y limpieza', 35.00, 'Activo'),
(5, 'Cirugia Menor', 'Procedimientos quirurgicos menores', 150.00, 'Activo'),
(6, 'Radiografia', 'Placa radiografica digital', 80.00, 'Activo'),
(7, 'Limpiado de oidos', 'tratamiento de oidos cerosos', 21.00, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nombre_completo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_rol` int DEFAULT NULL,
  `estado` enum('Activo','Inactivo') COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `horario_inicio` time DEFAULT NULL,
  `horario_fin` time DEFAULT NULL,
  `foto_perfil` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_completo`, `correo`, `password`, `id_rol`, `estado`, `fecha_creacion`, `horario_inicio`, `horario_fin`, `foto_perfil`) VALUES
(1, 'Administrador Manu', 'admin@huellitas.com', '$2b$10$KMjiL2R5n6sJm.wpHOa7HubYbrV7JvS2dzVo2PJF2xUGJLq6/fc92', 1, 'Activo', '2026-06-05 03:07:10', NULL, NULL, NULL),
(2, 'Dra. Carmen Quispe', 'vet@huellitas.com', '$2b$10$LlKdx36I1T7VzmlzLHQLoetgykgNhEBBy/UvdGksi/j0T6aPDb4jG', 2, 'Activo', '2026-06-26 18:11:25', '09:30:00', '16:15:00', 'img_1783037829579.jpg'),
(6, 'Alonso', 'Alonso@huellitas.com', '$2b$10$Op1aMWKDzSwShFtMxJlb6eDbzeb9mxb0TilZGAZZcGmKToCndYD5a', 2, 'Activo', '2026-07-03 01:10:45', '14:47:00', '17:48:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas_mascota`
--

CREATE TABLE `vacunas_mascota` (
  `id_vacuna` int NOT NULL,
  `id_mascota` int NOT NULL,
  `nombre_vacuna` varchar(100) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `fecha_proxima` date DEFAULT NULL,
  `notas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `vacunas_mascota`
--

INSERT INTO `vacunas_mascota` (`id_vacuna`, `id_mascota`, `nombre_vacuna`, `fecha_aplicacion`, `fecha_proxima`, `notas`) VALUES
(1, 6, 'Rabia', '2025-06-15', '2026-06-15', NULL),
(2, 6, 'Parvovirus', '2025-03-10', '2026-03-10', NULL),
(3, 7, 'Triple Felina', '2025-07-01', '2026-07-01', NULL),
(4, 8, 'Rabia', '2025-11-20', '2026-07-05', NULL),
(5, 9, 'Triple Felina', '2026-01-10', '2026-07-10', NULL),
(6, 10, 'Rabia', '2025-06-30', '2026-06-30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_mascota` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `forma_pago` enum('Efectivo','Yape','Transferencia','Mixto') NOT NULL DEFAULT 'Efectivo',
  `estado` enum('Pendiente','Pagado','Completada','Anulado','Anulada') DEFAULT 'Pendiente',
  `total` decimal(10,2) DEFAULT '0.00',
  `notas` varchar(300) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT CURRENT_TIMESTAMP,
  `metodo_pago1` varchar(30) DEFAULT NULL,
  `monto_pago1` decimal(10,2) DEFAULT NULL,
  `metodo_pago2` varchar(30) DEFAULT NULL,
  `monto_pago2` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_mascota`, `id_usuario`, `numero`, `forma_pago`, `estado`, `total`, `notas`, `fecha_venta`, `metodo_pago1`, `monto_pago1`, `metodo_pago2`, `monto_pago2`) VALUES
(1, 11, NULL, 1, '00000001', 'Efectivo', 'Completada', 35.00, NULL, '2026-06-26 14:15:45', NULL, NULL, NULL, NULL),
(2, 7, 9, 1, '00000002', 'Efectivo', 'Completada', 25.00, 'vacuna', '2026-06-30 13:11:09', NULL, NULL, NULL, NULL),
(3, 14, 15, 1, '00000003', 'Mixto', 'Pendiente', 25.00, 'vacuna', '2026-07-01 10:24:41', 'Efectivo', 15.00, 'Yape', 10.00),
(4, 10, NULL, 1, '00000004', 'Transferencia', 'Pendiente', 35.00, 'baño suave', '2026-07-01 10:25:10', NULL, NULL, NULL, NULL),
(5, 10, NULL, 1, '00000005', 'Yape', 'Pendiente', 30.00, 'consulta', '2026-07-01 10:25:32', NULL, NULL, NULL, NULL),
(6, 11, NULL, 1, '00000006', 'Efectivo', 'Pendiente', 35.00, 'lavado', '2026-07-02 19:07:40', NULL, NULL, NULL, NULL),
(7, 12, 13, 1, '00000007', 'Transferencia', 'Pendiente', 21.00, 'tranferencia random', '2026-07-14 13:06:36', NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `fk_cita_reprogramador` (`reprogramado_por`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `fk_historial_usuario` (`id_usuario`);

--
-- Indices de la tabla `horarios_veterinario`
--
ALTER TABLE `horarios_veterinario`
  ADD PRIMARY KEY (`id_horario`),
  ADD UNIQUE KEY `uk_vet_dia` (`id_usuario`,`dia_semana`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `logs_actividad`
--
ALTER TABLE `logs_actividad`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `marcaje_veterinario`
--
ALTER TABLE `marcaje_veterinario`
  ADD PRIMARY KEY (`id_marcaje`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id_mascota`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `id_mascota` (`id_mascota`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `vacunas_mascota`
--
ALTER TABLE `vacunas_mascota`
  ADD PRIMARY KEY (`id_vacuna`),
  ADD KEY `id_mascota` (`id_mascota`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  MODIFY `id_historial` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `horarios_veterinario`
--
ALTER TABLE `horarios_veterinario`
  MODIFY `id_horario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id_insumo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `logs_actividad`
--
ALTER TABLE `logs_actividad`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcaje_veterinario`
--
ALTER TABLE `marcaje_veterinario`
  MODIFY `id_marcaje` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id_mascota` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `id_movimiento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `vacunas_mascota`
--
ALTER TABLE `vacunas_mascota`
  MODIFY `id_vacuna` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cita_reprogramador` FOREIGN KEY (`reprogramado_por`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD CONSTRAINT `fk_historial_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `historial_clinico_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`);

--
-- Filtros para la tabla `horarios_veterinario`
--
ALTER TABLE `horarios_veterinario`
  ADD CONSTRAINT `horarios_veterinario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `logs_actividad`
--
ALTER TABLE `logs_actividad`
  ADD CONSTRAINT `logs_actividad_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `marcaje_veterinario`
--
ALTER TABLE `marcaje_veterinario`
  ADD CONSTRAINT `marcaje_veterinario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `vacunas_mascota`
--
ALTER TABLE `vacunas_mascota`
  ADD CONSTRAINT `vacunas_mascota_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
