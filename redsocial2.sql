-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2024 a las 16:02:01
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `redsocial2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumes`
--

CREATE TABLE `albumes` (
  `id_alb` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `albumes`
--

INSERT INTO `albumes` (`id_alb`, `usuario`, `fecha`, `nombre`) VALUES
(3, 7, '2024-07-19', 'Publicaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `id_ami` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `para` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`id_ami`, `de`, `para`, `fecha`, `estado`) VALUES
(50, 7, 8, '2024-07-19 09:54:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chats`
--

CREATE TABLE `chats` (
  `id_cha` int(11) NOT NULL,
  `id_cch` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `para` int(11) NOT NULL,
  `mensaje` varchar(500) NOT NULL,
  `fecha` datetime NOT NULL,
  `leido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chats`
--

INSERT INTO `chats` (`id_cha`, `id_cch`, `de`, `para`, `mensaje`, `fecha`, `leido`) VALUES
(31, 0, 7, 8, 'hola', '2024-07-19 09:55:25', 0),
(32, 4, 7, 8, 'hola', '2024-07-19 09:55:31', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_com` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime NOT NULL,
  `publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_com`, `usuario`, `comentario`, `fecha`, `publicacion`) VALUES
(33, 7, 'funciona?', '2024-07-19 09:56:27', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_chats`
--

CREATE TABLE `c_chats` (
  `id_cch` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `para` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c_chats`
--

INSERT INTO `c_chats` (`id_cch`, `de`, `para`) VALUES
(4, 7, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `id_fot` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `ruta` varchar(200) NOT NULL,
  `album` int(11) NOT NULL,
  `publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`id_fot`, `usuario`, `fecha`, `ruta`, `album`, `publicacion`) VALUES
(3, 7, '2024-07-19', '550B7C883E0FB.jpg', 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id_lik` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`id_lik`, `usuario`, `post`, `fecha`) VALUES
(11, 7, 5, '2024-07-19 09:52:33'),
(12, 8, 5, '2024-07-19 10:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_not` int(11) NOT NULL,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `leido` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_pub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id_not`, `user1`, `user2`, `tipo`, `leido`, `fecha`, `id_pub`) VALUES
(6, 7, 7, 'ha comentado', 1, '2024-07-19 09:56:27', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id_pub` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `contenido` text NOT NULL,
  `imagen` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `comentarios` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id_pub`, `usuario`, `fecha`, `contenido`, `imagen`, `album`, `comentarios`, `likes`) VALUES
(5, 7, '2024-07-19 09:48:35', 'prueba', 3, 3, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_use` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `nacimiento` date NOT NULL DEFAULT '2000-01-01',
  `avatar` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sexo` varchar(10) NOT NULL DEFAULT 'Nin',
  `fecha_reg` datetime NOT NULL,
  `verificado` int(11) NOT NULL DEFAULT 0,
  `privada` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_use`, `nombre`, `usuario`, `contrasena`, `nacimiento`, `avatar`, `email`, `sexo`, `fecha_reg`, `verificado`, `privada`) VALUES
(7, 'test', 'test1', '$2y$10$hHvd7pZGBL.B/.hHljt4b.BxfPp3AJPA3t8dxBWKuuQSiLAqvzt7G', '2002-08-10', '7_1721397456.gif', 'ctanet25@gmail.com', 'H', '2024-07-03 13:25:00', 0, 0),
(8, 'prueba2', 'test2', '$2y$10$pJ39ojKJj/M2J1viA5SxaeiBpWRI8p7iIST9JAaQIvym/OpSxGYei', '2000-01-01', '8_1721397531.jpg', 'jorgenico.py24@fpuna.edu.py', 'H', '2024-07-19 09:53:53', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albumes`
--
ALTER TABLE `albumes`
  ADD PRIMARY KEY (`id_alb`);

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`id_ami`);

--
-- Indices de la tabla `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id_cha`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_com`);

--
-- Indices de la tabla `c_chats`
--
ALTER TABLE `c_chats`
  ADD PRIMARY KEY (`id_cch`);

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id_fot`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_lik`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_not`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id_pub`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_use`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `albumes`
--
ALTER TABLE `albumes`
  MODIFY `id_alb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `amigos`
--
ALTER TABLE `amigos`
  MODIFY `id_ami` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `chats`
--
ALTER TABLE `chats`
  MODIFY `id_cha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_com` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `c_chats`
--
ALTER TABLE `c_chats`
  MODIFY `id_cch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id_fot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id_lik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_not` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id_pub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_use` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
