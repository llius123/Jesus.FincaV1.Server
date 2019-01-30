-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 09:51 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finca`
--

-- --------------------------------------------------------

--
-- Table structure for table `comunidad`
--

CREATE TABLE `comunidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `nif` varchar(100) DEFAULT NULL,
  `iban` varchar(100) DEFAULT NULL,
  `sufijo` varchar(100) DEFAULT NULL,
  `cod_poblacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comunidad`
--

INSERT INTO `comunidad` (`id`, `nombre`, `direccion`, `nif`, `iban`, `sufijo`, `cod_poblacion`) VALUES
(1, 'test', 'test', 'test', 'test', 'test', 1),
(2, 'test', 'q', 'q', 'qwe', 'q', 1);

-- --------------------------------------------------------

--
-- Table structure for table `factura_proveedor`
--

CREATE TABLE `factura_proveedor` (
  `id` int(11) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_tipofactura` int(11) DEFAULT NULL,
  `base_imponible0` decimal(10,2) DEFAULT NULL,
  `base_imponible1` decimal(10,2) DEFAULT NULL,
  `base_imponible2` decimal(10,2) DEFAULT NULL,
  `base_imponible3` decimal(10,2) DEFAULT NULL,
  `tipo_iva1` decimal(10,2) DEFAULT NULL,
  `tipo_iva2` decimal(10,2) DEFAULT NULL,
  `tipo_iva3` decimal(10,2) DEFAULT NULL,
  `cuota_iva1` decimal(10,2) DEFAULT NULL,
  `cuota_iva2` decimal(10,2) DEFAULT NULL,
  `cuota_iva3` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_comunidad` int(11) DEFAULT NULL,
  `num_factura` varchar(100) DEFAULT NULL,
  `cobrado` char(1) DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `incidencia`
--

CREATE TABLE `incidencia` (
  `id` int(11) NOT NULL,
  `id_vecino` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `atendido` char(1) NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `incidencia`
--

INSERT INTO `incidencia` (`id`, `id_vecino`, `descripcion`, `fecha_creacion`, `atendido`) VALUES
(1, 2, 'post', '2018-12-12', 'n'),
(2, 2, 'post', '2018-12-12', 's'),
(3, 2, 'post', '2018-12-12', 'n'),
(4, 2, 'post', '2018-12-12', 'n'),
(5, 2, 'post', '2018-12-12', 'n'),
(6, 2, 'post', '1970-01-01', 'n'),
(7, 2, 'post', '1970-01-01', 'n'),
(8, 2, 'post', '1970-01-01', 'n'),
(9, 2, 'post', '1970-01-01', 'n'),
(10, 2, 'post', '1970-01-01', 's'),
(11, 2, 'post', '1973-11-26', 'n'),
(12, 2, 'post', '2018-12-11', 'n'),
(13, 2, 'post', '2018-12-11', 'n'),
(14, 2, 'post', '2018-12-11', 'n'),
(15, 2, 'post', '2018-12-12', 'n'),
(16, 2, 'post', '1970-01-01', 'n'),
(17, 2, '12', '1970-01-01', 's'),
(18, 2, '12', '1973-11-26', 's'),
(19, 2, 'hola', '2018-12-12', 's');

-- --------------------------------------------------------

--
-- Table structure for table `poblacion`
--

CREATE TABLE `poblacion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cod_provincia` int(11) DEFAULT NULL,
  `cod_postal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poblacion`
--

INSERT INTO `poblacion` (`id`, `descripcion`, `cod_provincia`, `cod_postal`) VALUES
(1, 'test2', 1, 1),
(2, 'q', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cod_poblacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`id`, `direccion`, `telefono`, `email`, `cod_poblacion`) VALUES
(1, 'LUL', 'wqe', 'qwqweqwe', 2),
(2, 's', 'qwe', 'qwe', 2),
(4, 'qwe', 'e', 'e', 2),
(5, 'qwe', 'e', 'e', 2),
(6, 'qwe', 'qwe', 'q', 2);

-- --------------------------------------------------------

--
-- Table structure for table `provincia`
--

CREATE TABLE `provincia` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cod_provincia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provincia`
--

INSERT INTO `provincia` (`id`, `descripcion`, `cod_provincia`) VALUES
(1, 'qweqw', '1'),
(2, 'q', 'qwe');

-- --------------------------------------------------------

--
-- Table structure for table `recibo`
--

CREATE TABLE `recibo` (
  `id` int(11) NOT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `num_registro` decimal(10,2) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `importe` int(11) DEFAULT NULL,
  `fecha_cobro` datetime DEFAULT NULL,
  `id_vecino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `descripcion`) VALUES
(1, 'test'),
(2, 'segundo');

-- --------------------------------------------------------

--
-- Table structure for table `tarea`
--

CREATE TABLE `tarea` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarea`
--

INSERT INTO `tarea` (`id`, `fecha`, `descripcion`) VALUES
(2, '2019-01-16', 'qwe'),
(6, '2019-01-17', 'qwe'),
(8, '2019-01-22', 'qwe'),
(12, '2019-01-30', 'q');

-- --------------------------------------------------------

--
-- Table structure for table `tarea_tag`
--

CREATE TABLE `tarea_tag` (
  `id_tarea` int(11) DEFAULT '0',
  `id_tag` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarea_tag`
--

INSERT INTO `tarea_tag` (`id_tarea`, `id_tag`) VALUES
(2, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tipofactura`
--

CREATE TABLE `tipofactura` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipofactura`
--

INSERT INTO `tipofactura` (`id`, `descripcion`) VALUES
(1, 'qweqweqweqwe'),
(3, 'q');

-- --------------------------------------------------------

--
-- Table structure for table `tipovecino`
--

CREATE TABLE `tipovecino` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipovecino`
--

INSERT INTO `tipovecino` (`id`, `descripcion`) VALUES
(1, 'qweqweqwe'),
(2, 'vecino'),
(3, 'qweqweqwe'),
(7, 'qweqwee'),
(8, 'qeqweqweqwe'),
(12, 'qwe'),
(13, 'qweqwe'),
(14, 'q');

-- --------------------------------------------------------

--
-- Table structure for table `vecino`
--

CREATE TABLE `vecino` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  `nif` varchar(100) DEFAULT NULL,
  `iban` varchar(100) DEFAULT NULL,
  `porcentaje_participacion` decimal(5,2) DEFAULT NULL,
  `id_comunidad` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `id_tipovecino` int(11) DEFAULT NULL,
  `cod_poblacion` int(11) DEFAULT NULL,
  `login` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vecino`
--

INSERT INTO `vecino` (`id`, `nombre`, `direccion`, `numero`, `nif`, `iban`, `porcentaje_participacion`, `id_comunidad`, `email`, `telefono`, `id_tipovecino`, `cod_poblacion`, `login`, `pass`) VALUES
(2, 'test', 'test', 'test', 'test', 'test', '1.00', 1, 'test', 'test', 1, 1, 'admin', 'admin'),
(3, 'qweqweqwewqe', 'ewqqweqwe', 'qweeee', 'qwe', 'qwe', '1.00', 1, 'qwe', 'qwe', 3, 2, 'user', 'qwe'),
(7, 'qweqweqwewqe', 'ewqqweqwe', 'qweeee', 'qwe', 'qwe', '1.00', 1, 'qwe', 'qwe', 3, 2, 'user', 'qwe'),
(34, 'pepe', 'qwe', '12', 'qwe', 'qweqweqwe', '12.00', 2, 'qw', 'qw', 7, 1, 'q', 'q'),
(35, 'q', 'qwe', 'qwe', 'qwe', 'qweqwe', '12.00', 1, 'qwe', 'qwe', 1, 1, 'qwe', 'qwe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comunidad`
--
ALTER TABLE `comunidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comunidad_poblacion_fk` (`cod_poblacion`);

--
-- Indexes for table `factura_proveedor`
--
ALTER TABLE `factura_proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factura_proveedor_tipofactura_fk` (`id_tipofactura`),
  ADD KEY `factura_proveedor_proveedor_fk` (`id_proveedor`),
  ADD KEY `factura_proveedor_comunidad_fk` (`id_comunidad`);

--
-- Indexes for table `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incidencia_vecino_fk` (`id_vecino`);

--
-- Indexes for table `poblacion`
--
ALTER TABLE `poblacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poblacion_provincia_fk` (`cod_provincia`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_poblacion_fk` (`cod_poblacion`);

--
-- Indexes for table `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recibo_vecino_fk` (`id_vecino`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarea_tag`
--
ALTER TABLE `tarea_tag`
  ADD KEY `FK_tarea_tag_tarea` (`id_tarea`),
  ADD KEY `FK_tarea_tag_tag` (`id_tag`);

--
-- Indexes for table `tipofactura`
--
ALTER TABLE `tipofactura`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipovecino`
--
ALTER TABLE `tipovecino`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vecino`
--
ALTER TABLE `vecino`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vecino_tipovecino_fk` (`id_tipovecino`),
  ADD KEY `vecino_poblacion_fk` (`cod_poblacion`),
  ADD KEY `vecino_comunidad_fk` (`id_comunidad`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comunidad`
--
ALTER TABLE `comunidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `factura_proveedor`
--
ALTER TABLE `factura_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `poblacion`
--
ALTER TABLE `poblacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recibo`
--
ALTER TABLE `recibo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tarea`
--
ALTER TABLE `tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tipofactura`
--
ALTER TABLE `tipofactura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipovecino`
--
ALTER TABLE `tipovecino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `vecino`
--
ALTER TABLE `vecino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comunidad`
--
ALTER TABLE `comunidad`
  ADD CONSTRAINT `comunidad_poblacion_fk` FOREIGN KEY (`cod_poblacion`) REFERENCES `poblacion` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `factura_proveedor`
--
ALTER TABLE `factura_proveedor`
  ADD CONSTRAINT `factura_proveedor_comunidad_fk` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_proveedor_proveedor_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_proveedor_tipofactura_fk` FOREIGN KEY (`id_tipofactura`) REFERENCES `tipofactura` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `incidencia_vecino_fk` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `poblacion`
--
ALTER TABLE `poblacion`
  ADD CONSTRAINT `poblacion_provincia_fk` FOREIGN KEY (`cod_provincia`) REFERENCES `provincia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_poblacion_fk` FOREIGN KEY (`cod_poblacion`) REFERENCES `poblacion` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `recibo_vecino_fk` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tarea_tag`
--
ALTER TABLE `tarea_tag`
  ADD CONSTRAINT `FK_tarea_tag_tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`),
  ADD CONSTRAINT `FK_tarea_tag_tarea` FOREIGN KEY (`id_tarea`) REFERENCES `tarea` (`id`);

--
-- Constraints for table `vecino`
--
ALTER TABLE `vecino`
  ADD CONSTRAINT `vecino_poblacion_fk` FOREIGN KEY (`cod_poblacion`) REFERENCES `poblacion` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `vecino_tipovecino_fk` FOREIGN KEY (`id_tipovecino`) REFERENCES `tipovecino` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
