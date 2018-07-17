-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-06-2018 a las 16:44:57
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_wc_russia2018`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contest_wc`
--

DROP TABLE IF EXISTS `contest_wc`;
CREATE TABLE IF NOT EXISTS `contest_wc` (
  `n` int(2) NOT NULL AUTO_INCREMENT,
  `name_player` varchar(20) NOT NULL,
  `points_player` int(2) NOT NULL DEFAULT '0',
  `goals_player` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`n`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contest_wc`
--

INSERT INTO `contest_wc` (`n`, `name_player`, `points_player`, `goals_player`) VALUES
(6, 'Jessie', 25, 145),
(7, 'Angie', 25, 116),
(1, 'Estefanie', 24, 106),
(2, 'Hernan', 22, 120),
(4, 'Carlos', 22, 197),
(5, 'Cesar', 22, 139),
(8, 'Fabio', 22, 129),
(9, 'Vero', 21, 130),
(3, 'Jorge', 20, 141),
(10, 'Misael', 18, 149);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matches_wc`
--

DROP TABLE IF EXISTS `matches_wc`;
CREATE TABLE IF NOT EXISTS `matches_wc` (
  `n` int(2) NOT NULL AUTO_INCREMENT,
  `team_l` varchar(4) NOT NULL,
  `score_l` int(2) DEFAULT NULL,
  `score_v` int(2) DEFAULT NULL,
  `team_v` varchar(4) NOT NULL,
  PRIMARY KEY (`n`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matches_wc`
--

INSERT INTO `matches_wc` (`n`, `team_l`, `score_l`, `score_v`, `team_v`) VALUES
(1, 'rus', 5, 0, 'ksa'),
(2, 'egy', 0, 1, 'uru'),
(3, 'mar', 0, 1, 'irn'),
(4, 'por', 3, 3, 'esp'),
(5, 'fra', 2, 1, 'aus'),
(6, 'arg', 1, 1, 'isl'),
(7, 'per', 0, 1, 'den'),
(8, 'cro', 2, 0, 'nga'),
(9, 'crc', 0, 1, 'srb'),
(10, 'ger', 0, 1, 'mex'),
(11, 'bra', 1, 1, 'sui'),
(12, 'swe', 1, 0, 'kor'),
(13, 'bel', 3, 0, 'pan'),
(14, 'tun', 1, 2, 'eng'),
(15, 'col', 1, 2, 'jpn'),
(16, 'pol', 1, 2, 'sen'),
(17, 'rus', 3, 1, 'egy'),
(18, 'por', 1, 0, 'mar'),
(19, 'uru', 1, 0, 'ksa'),
(20, 'irn', 0, 1, 'esp'),
(21, 'den', 1, 1, 'aus'),
(22, 'fra', 1, 0, 'per'),
(23, 'arg', 0, 3, 'cro'),
(24, 'bra', 2, 0, 'crc'),
(25, 'nga', 2, 0, 'isl'),
(26, 'srb', 1, 2, 'sui'),
(27, 'bel', 5, 2, 'tun'),
(28, 'kor', 1, 2, 'mex'),
(29, 'ger', 2, 1, 'swe'),
(30, 'eng', 6, 1, 'pan'),
(31, 'jpn', 2, 2, 'sen'),
(32, 'pol', 0, 3, 'col'),
(33, 'uru', 3, 0, 'rus'),
(34, 'ksa', 2, 1, 'egy'),
(35, 'esp', 2, 2, 'mar'),
(36, 'irn', 1, 1, 'por'),
(37, 'aus', 0, 2, 'per'),
(38, 'den', 0, 0, 'fra'),
(39, 'nga', 1, 2, 'arg'),
(40, 'isl', 1, 2, 'cro'),
(41, 'kor', 2, 0, 'ger'),
(42, 'mex', 0, 3, 'swe'),
(43, 'srb', 0, 2, 'bra'),
(44, 'sui', 2, 2, 'crc'),
(45, 'jpn', 0, 1, 'pol'),
(46, 'sen', 0, 1, 'col'),
(47, 'pan', NULL, NULL, 'tun'),
(48, 'eng', NULL, NULL, 'bel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule_wc`
--

DROP TABLE IF EXISTS `schedule_wc`;
CREATE TABLE IF NOT EXISTS `schedule_wc` (
  `match_day` date DEFAULT NULL,
  `team_l` int(2) DEFAULT NULL,
  `team_v` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `selections_wc`
--

DROP TABLE IF EXISTS `selections_wc`;
CREATE TABLE IF NOT EXISTS `selections_wc` (
  `n` int(2) NOT NULL,
  `match_n` int(2) NOT NULL,
  `score_l` int(2) NOT NULL,
  `score_v` int(2) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  KEY `match_n` (`match_n`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `selections_wc`
--

INSERT INTO `selections_wc` (`n`, `match_n`, `score_l`, `score_v`, `correct`) VALUES
(1, 1, 2, 0, 0),
(2, 1, 1, 0, 0),
(3, 1, 2, 0, 0),
(5, 1, 1, 0, 0),
(4, 1, 2, 1, 0),
(6, 1, 2, 1, 0),
(7, 1, 4, 1, 0),
(8, 1, 2, 0, 0),
(9, 1, 2, 0, 0),
(10, 1, 3, 1, 0),
(1, 2, 1, 2, 0),
(2, 2, 0, 2, 0),
(3, 2, 3, 1, 0),
(5, 2, 1, 2, 0),
(4, 2, 1, 1, 0),
(6, 2, 1, 2, 0),
(7, 2, 1, 2, 0),
(8, 2, 2, 2, 0),
(9, 2, 1, 1, 0),
(10, 2, 2, 0, 0),
(1, 3, 1, 1, 0),
(2, 3, 2, 1, 0),
(3, 3, 1, 1, 0),
(5, 3, 1, 2, 0),
(4, 3, 2, 0, 0),
(6, 3, 2, 2, 0),
(7, 3, 1, 1, 0),
(8, 3, 0, 1, 0),
(9, 3, 1, 1, 0),
(10, 3, 0, 0, 0),
(1, 4, 1, 2, 0),
(2, 4, 1, 2, 0),
(3, 4, 1, 3, 0),
(5, 4, 1, 2, 0),
(4, 4, 2, 2, 0),
(6, 4, 2, 3, 0),
(7, 4, 2, 3, 0),
(8, 4, 1, 1, 0),
(9, 4, 0, 0, 0),
(10, 4, 2, 5, 0),
(1, 5, 3, 0, 0),
(2, 5, 3, 1, 0),
(3, 5, 2, 2, 0),
(5, 5, 2, 2, 0),
(4, 5, 3, 0, 0),
(6, 5, 2, 0, 0),
(7, 5, 3, 1, 0),
(8, 5, 3, 1, 0),
(9, 5, 3, 0, 0),
(10, 5, 4, 0, 0),
(1, 6, 2, 0, 0),
(2, 6, 2, 0, 0),
(3, 6, 1, 0, 0),
(5, 6, 2, 2, 0),
(4, 6, 3, 1, 0),
(6, 6, 3, 1, 0),
(7, 6, 4, 1, 0),
(8, 6, 3, 0, 0),
(9, 6, 2, 1, 0),
(10, 6, 5, 0, 0),
(1, 7, 0, 1, 0),
(2, 7, 1, 2, 0),
(3, 7, 1, 1, 0),
(5, 7, 1, 3, 0),
(4, 7, 1, 2, 0),
(6, 7, 1, 1, 0),
(7, 7, 0, 1, 0),
(8, 7, 1, 0, 0),
(9, 7, 1, 0, 0),
(10, 7, 2, 1, 0),
(1, 8, 2, 1, 0),
(2, 8, 1, 1, 0),
(3, 8, 2, 0, 0),
(5, 8, 1, 1, 0),
(4, 8, 2, 2, 0),
(6, 8, 2, 1, 0),
(7, 8, 1, 0, 0),
(8, 8, 0, 2, 0),
(9, 8, 1, 1, 0),
(10, 8, 1, 1, 0),
(1, 9, 1, 1, 0),
(2, 9, 0, 1, 0),
(3, 9, 1, 1, 0),
(5, 9, 2, 1, 0),
(4, 9, 3, 0, 0),
(6, 9, 1, 1, 0),
(7, 9, 1, 1, 0),
(8, 9, 1, 2, 0),
(9, 9, 0, 2, 0),
(10, 9, 2, 0, 0),
(1, 10, 3, 1, 0),
(2, 10, 2, 0, 0),
(3, 10, 3, 1, 0),
(5, 10, 1, 1, 0),
(4, 10, 1, 2, 0),
(6, 10, 2, 1, 0),
(7, 10, 3, 1, 0),
(8, 10, 1, 1, 0),
(9, 10, 3, 1, 0),
(10, 10, 3, 1, 0),
(1, 11, 2, 0, 0),
(2, 11, 3, 1, 0),
(3, 11, 2, 0, 0),
(5, 11, 3, 1, 0),
(4, 11, 4, 1, 0),
(6, 11, 3, 1, 0),
(7, 11, 4, 1, 0),
(8, 11, 2, 1, 0),
(9, 11, 2, 1, 0),
(10, 11, 3, 0, 0),
(1, 12, 0, 1, 0),
(2, 12, 1, 1, 0),
(3, 12, 2, 1, 0),
(5, 12, 2, 1, 0),
(4, 12, 2, 3, 0),
(6, 12, 2, 1, 0),
(7, 12, 2, 1, 0),
(8, 12, 0, 0, 0),
(9, 12, 2, 1, 0),
(10, 12, 1, 2, 0),
(1, 13, 2, 0, 0),
(2, 13, 3, 0, 0),
(3, 13, 0, 0, 0),
(5, 13, 3, 2, 0),
(4, 13, 2, 0, 0),
(6, 13, 2, 0, 0),
(7, 13, 2, 0, 0),
(8, 13, 3, 1, 0),
(9, 13, 3, 1, 0),
(10, 13, 2, 0, 0),
(1, 14, 0, 3, 0),
(2, 14, 1, 2, 0),
(3, 14, 0, 3, 0),
(5, 14, 1, 1, 0),
(4, 14, 1, 4, 0),
(6, 14, 0, 2, 0),
(7, 14, 0, 2, 0),
(8, 14, 1, 2, 0),
(9, 14, 0, 2, 0),
(10, 14, 0, 4, 0),
(1, 15, 1, 0, 0),
(2, 15, 1, 0, 0),
(3, 15, 2, 2, 0),
(5, 15, 1, 2, 0),
(4, 15, 2, 2, 0),
(6, 15, 2, 1, 0),
(7, 15, 1, 0, 0),
(8, 15, 2, 0, 0),
(9, 15, 2, 2, 0),
(10, 15, 3, 0, 0),
(1, 16, 0, 0, 0),
(2, 16, 2, 2, 0),
(3, 16, 1, 1, 0),
(5, 16, 0, 2, 0),
(4, 16, 3, 3, 0),
(6, 16, 2, 1, 0),
(7, 16, 0, 0, 0),
(8, 16, 3, 2, 0),
(9, 16, 0, 2, 0),
(10, 16, 0, 0, 0),
(1, 17, 1, 1, 0),
(2, 17, 1, 1, 0),
(3, 17, 2, 2, 0),
(5, 17, 1, 1, 0),
(4, 17, 2, 3, 0),
(6, 17, 2, 1, 0),
(7, 17, 2, 1, 0),
(8, 17, 1, 1, 0),
(9, 17, 1, 1, 0),
(10, 17, 1, 2, 0),
(1, 18, 2, 0, 0),
(2, 18, 2, 1, 0),
(3, 18, 1, 0, 0),
(5, 18, 2, 0, 0),
(4, 18, 4, 1, 0),
(6, 18, 2, 0, 0),
(7, 18, 2, 0, 0),
(8, 18, 3, 1, 0),
(9, 18, 2, 1, 0),
(10, 18, 3, 1, 0),
(1, 19, 2, 0, 0),
(2, 19, 2, 0, 0),
(3, 19, 2, 0, 0),
(5, 19, 1, 1, 0),
(4, 19, 2, 1, 0),
(6, 19, 3, 1, 0),
(7, 19, 1, 0, 0),
(8, 19, 2, 1, 0),
(9, 19, 2, 1, 0),
(10, 19, 3, 0, 0),
(1, 20, 0, 2, 0),
(2, 20, 0, 3, 0),
(3, 20, 0, 4, 0),
(5, 20, 1, 2, 0),
(4, 20, 0, 4, 0),
(6, 20, 0, 3, 0),
(7, 20, 0, 2, 0),
(8, 20, 0, 4, 0),
(9, 20, 1, 2, 0),
(10, 20, 0, 4, 0),
(1, 21, 1, 0, 0),
(2, 21, 1, 0, 0),
(3, 21, 1, 0, 0),
(5, 21, 1, 2, 0),
(4, 21, 2, 1, 0),
(6, 21, 2, 1, 0),
(7, 21, 1, 1, 0),
(8, 21, 3, 0, 0),
(9, 21, 1, 0, 0),
(10, 21, 2, 2, 0),
(1, 22, 2, 0, 0),
(2, 22, 3, 1, 0),
(3, 22, 2, 3, 0),
(5, 22, 1, 1, 0),
(4, 22, 4, 0, 0),
(6, 22, 3, 2, 0),
(7, 22, 3, 0, 0),
(8, 22, 2, 2, 0),
(9, 22, 2, 2, 0),
(10, 22, 3, 2, 0),
(1, 23, 1, 0, 0),
(2, 23, 2, 1, 0),
(3, 23, 3, 3, 0),
(5, 23, 3, 2, 0),
(4, 23, 5, 2, 0),
(6, 23, 1, 0, 0),
(7, 23, 1, 0, 0),
(8, 23, 1, 1, 0),
(9, 23, 2, 2, 0),
(10, 23, 2, 1, 0),
(1, 24, 2, 1, 0),
(2, 24, 4, 1, 0),
(3, 24, 3, 1, 0),
(5, 24, 2, 1, 0),
(4, 24, 4, 1, 0),
(6, 24, 3, 2, 0),
(7, 24, 4, 0, 0),
(8, 24, 3, 1, 0),
(9, 24, 2, 1, 0),
(10, 24, 3, 0, 0),
(1, 25, 0, 0, 0),
(2, 25, 1, 0, 0),
(3, 25, 1, 2, 0),
(5, 25, 1, 3, 0),
(4, 25, 3, 0, 0),
(6, 25, 1, 1, 0),
(7, 25, 1, 1, 0),
(8, 25, 1, 1, 0),
(9, 25, 2, 1, 0),
(10, 25, 1, 0, 0),
(1, 26, 0, 1, 0),
(2, 26, 2, 2, 0),
(3, 26, 0, 2, 0),
(5, 26, 2, 0, 0),
(4, 26, 0, 3, 0),
(6, 26, 2, 0, 0),
(7, 26, 1, 1, 0),
(8, 26, 1, 2, 0),
(9, 26, 2, 1, 0),
(10, 26, 0, 0, 0),
(1, 27, 2, 0, 0),
(2, 27, 2, 1, 0),
(3, 27, 1, 0, 0),
(5, 27, 3, 0, 0),
(4, 27, 3, 1, 0),
(6, 27, 2, 1, 0),
(7, 27, 2, 1, 0),
(8, 27, 2, 2, 0),
(9, 27, 2, 1, 0),
(10, 27, 1, 1, 0),
(1, 28, 1, 2, 0),
(2, 28, 0, 1, 0),
(3, 28, 1, 2, 0),
(5, 28, 1, 2, 0),
(4, 28, 1, 3, 0),
(6, 28, 1, 2, 0),
(7, 28, 1, 2, 0),
(8, 28, 1, 2, 0),
(9, 28, 1, 2, 0),
(10, 28, 2, 2, 0),
(1, 29, 2, 0, 0),
(2, 29, 3, 1, 0),
(3, 29, 3, 0, 0),
(5, 29, 2, 1, 0),
(4, 29, 4, 1, 0),
(6, 29, 2, 0, 0),
(7, 29, 3, 1, 0),
(8, 29, 2, 1, 0),
(9, 29, 2, 1, 0),
(10, 29, 4, 0, 0),
(1, 30, 3, 0, 0),
(2, 30, 2, 0, 0),
(3, 30, 3, 0, 0),
(5, 30, 3, 1, 0),
(4, 30, 4, 0, 0),
(6, 30, 3, 0, 0),
(7, 30, 2, 0, 0),
(8, 30, 2, 1, 0),
(9, 30, 3, 0, 0),
(10, 30, 5, 0, 0),
(1, 31, 2, 2, 0),
(2, 31, 1, 1, 0),
(3, 31, 2, 1, 0),
(5, 31, 1, 1, 0),
(4, 31, 3, 2, 0),
(6, 31, 2, 2, 0),
(7, 31, 1, 1, 0),
(8, 31, 1, 1, 0),
(9, 31, 0, 3, 0),
(10, 31, 2, 0, 0),
(1, 32, 2, 1, 0),
(2, 32, 1, 1, 0),
(3, 32, 0, 2, 0),
(5, 32, 2, 1, 0),
(4, 32, 1, 2, 0),
(6, 32, 1, 2, 0),
(7, 32, 0, 1, 0),
(8, 32, 0, 1, 0),
(9, 32, 1, 1, 0),
(10, 32, 1, 2, 0),
(1, 33, 0, 1, 0),
(2, 33, 1, 0, 0),
(3, 33, 0, 2, 0),
(5, 33, 2, 1, 0),
(4, 33, 1, 2, 0),
(6, 33, 2, 2, 0),
(7, 33, 1, 1, 0),
(8, 33, 2, 0, 0),
(9, 33, 2, 1, 0),
(10, 33, 1, 1, 0),
(1, 34, 0, 2, 0),
(2, 34, 0, 2, 0),
(3, 34, 1, 3, 0),
(5, 34, 0, 1, 0),
(4, 34, 0, 4, 0),
(6, 34, 1, 1, 0),
(7, 34, 0, 1, 0),
(8, 34, 1, 3, 0),
(9, 34, 0, 2, 0),
(10, 34, 0, 2, 0),
(1, 35, 3, 1, 0),
(2, 35, 2, 0, 0),
(3, 35, 4, 1, 0),
(5, 35, 2, 0, 0),
(4, 35, 5, 1, 0),
(6, 35, 2, 0, 0),
(7, 35, 2, 0, 0),
(8, 35, 3, 0, 0),
(9, 35, 2, 0, 0),
(10, 35, 4, 0, 0),
(1, 36, 0, 2, 0),
(2, 36, 1, 3, 0),
(3, 36, 0, 2, 0),
(5, 36, 2, 2, 0),
(4, 36, 1, 4, 0),
(6, 36, 0, 3, 0),
(7, 36, 0, 2, 0),
(8, 36, 1, 2, 0),
(9, 36, 1, 3, 0),
(10, 36, 0, 3, 0),
(1, 37, 0, 1, 0),
(2, 37, 0, 1, 0),
(3, 37, 0, 3, 0),
(5, 37, 3, 1, 0),
(4, 37, 3, 1, 0),
(6, 37, 2, 1, 0),
(7, 37, 2, 0, 0),
(8, 37, 0, 2, 0),
(9, 37, 0, 2, 0),
(10, 37, 1, 1, 0),
(1, 38, 0, 2, 0),
(2, 38, 1, 2, 0),
(3, 38, 3, 3, 0),
(5, 38, 2, 2, 0),
(4, 38, 1, 4, 0),
(6, 38, 1, 2, 0),
(7, 38, 0, 2, 0),
(8, 38, 1, 1, 0),
(9, 38, 1, 2, 0),
(10, 38, 1, 2, 0),
(1, 39, 1, 3, 0),
(2, 39, 0, 1, 0),
(3, 39, 0, 2, 0),
(5, 39, 0, 3, 0),
(4, 39, 2, 4, 0),
(6, 39, 1, 2, 0),
(7, 39, 0, 2, 0),
(8, 39, 2, 1, 0),
(9, 39, 2, 2, 0),
(10, 39, 1, 3, 0),
(1, 40, 1, 2, 0),
(2, 40, 1, 1, 0),
(3, 40, 0, 2, 0),
(5, 40, 2, 1, 0),
(4, 40, 0, 3, 0),
(6, 40, 1, 3, 0),
(7, 40, 1, 1, 0),
(8, 40, 1, 2, 0),
(9, 40, 1, 2, 0),
(10, 40, 0, 0, 0),
(1, 41, 1, 2, 0),
(2, 41, 0, 3, 0),
(3, 41, 1, 3, 0),
(5, 41, 0, 2, 0),
(4, 41, 2, 2, 0),
(6, 41, 1, 3, 0),
(7, 41, 0, 3, 0),
(8, 41, 0, 3, 0),
(9, 41, 0, 3, 0),
(10, 41, 1, 3, 0),
(1, 42, 2, 1, 0),
(2, 42, 0, 0, 0),
(3, 42, 2, 0, 0),
(5, 42, 1, 0, 0),
(4, 42, 3, 0, 0),
(6, 42, 2, 2, 0),
(7, 42, 1, 1, 0),
(8, 42, 3, 1, 0),
(9, 42, 1, 1, 0),
(10, 42, 3, 1, 0),
(1, 43, 1, 2, 0),
(2, 43, 0, 2, 0),
(3, 43, 1, 3, 0),
(5, 43, 0, 2, 0),
(4, 43, 1, 6, 0),
(6, 43, 1, 2, 0),
(7, 43, 1, 3, 0),
(8, 43, 1, 1, 0),
(9, 43, 2, 2, 0),
(10, 43, 1, 4, 0),
(1, 44, 1, 0, 0),
(2, 44, 2, 1, 0),
(3, 44, 3, 1, 0),
(5, 44, 2, 1, 0),
(4, 44, 2, 3, 0),
(6, 44, 1, 1, 0),
(7, 44, 2, 0, 0),
(8, 44, 2, 1, 0),
(9, 44, 1, 1, 0),
(10, 44, 2, 2, 0),
(1, 45, 1, 2, 0),
(2, 45, 2, 2, 0),
(3, 45, 3, 0, 0),
(5, 45, 1, 1, 0),
(4, 45, 4, 2, 0),
(6, 45, 1, 2, 0),
(7, 45, 0, 1, 0),
(8, 45, 0, 1, 0),
(9, 45, 1, 1, 0),
(10, 45, 3, 0, 0),
(1, 46, 0, 2, 0),
(2, 46, 2, 2, 0),
(3, 46, 1, 3, 0),
(5, 46, 2, 2, 0),
(4, 46, 2, 2, 0),
(6, 46, 1, 2, 0),
(7, 46, 1, 2, 0),
(8, 46, 0, 0, 0),
(9, 46, 1, 1, 0),
(10, 46, 1, 2, 0),
(1, 47, 0, 1, 0),
(2, 47, 1, 1, 0),
(3, 47, 1, 1, 0),
(5, 47, 1, 3, 0),
(4, 47, 1, 1, 0),
(6, 47, 1, 1, 0),
(7, 47, 1, 1, 0),
(8, 47, 0, 3, 0),
(9, 47, 1, 2, 0),
(10, 47, 2, 2, 0),
(1, 48, 2, 2, 0),
(2, 48, 2, 2, 0),
(3, 48, 4, 0, 0),
(5, 48, 2, 1, 0),
(4, 48, 4, 1, 0),
(6, 48, 2, 2, 0),
(7, 48, 1, 1, 0),
(8, 48, 1, 2, 0),
(9, 48, 2, 2, 0),
(10, 48, 3, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams_wc`
--

DROP TABLE IF EXISTS `teams_wc`;
CREATE TABLE IF NOT EXISTS `teams_wc` (
  `n` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(4) NOT NULL,
  PRIMARY KEY (`n`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;