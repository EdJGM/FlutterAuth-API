-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2024 a las 02:24:57
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
-- Base de datos: `app_users`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `created_at`) VALUES
(1, 'usuario1', '$2y$10$y28vckAzSjH9TNovACPwEu8WuNQxH701AIfum5g/tEeI0chtJ5kxe', 'correo@example.com', '2024-11-14 14:51:13'),
(2, 'usuario2', '$2y$10$zTgPMOgWZnlS8vhfjhQSO.LYBVuivy1/L3TmlFqcot6KO9yfuQjE2', 'usuario2@gmail.com', '2024-11-14 15:23:05'),
(3, 'usuario3', '$2y$10$GRg7ewLIZF8JjubOS4jKL.c0YMuRPzagY6T9UC8/PMHdx/d6d/XsG', 'usuario3@gmail.com', '2024-11-14 15:26:21'),
(4, 'usuario4', '$2y$10$tujM8rjD1cWq0JDOOgMWPOUJfhxcWVjrk96MHHqv9xFA6hXPQd7c2', 'usuario4@gmail.com', '2024-11-14 15:37:17'),
(5, 'User', '$2y$10$KPTZMuaTNYtqJy7bTd5qZemmiug18s/gVMB.8Zih2uUJx9mQR8Ac2', 'user@gmail.com', '2024-11-17 01:41:57'),
(8, 'usuario5', '$2y$10$eXlj3yumJPqGcfR1oUGCyeQGWX5mBz1WiT5kOOtj8NqKyillVQ7U2', 'usuario5@gmail.com', '2024-11-17 02:08:54');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
