-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2018 at 10:11 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_suzu`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(3) NOT NULL,
  `no_order` varchar(15) NOT NULL,
  `id_paket` int(3) NOT NULL,
  `tgl_order` date NOT NULL,
  `id_status` int(3) NOT NULL,
  `tot_harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id_paket` int(3) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `id_susu` int(3) NOT NULL,
  `jml_susu` int(3) NOT NULL,
  `harga` int(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_paket`
--

INSERT INTO `tb_paket` (`id_paket`, `nama`, `id_susu`, `jml_susu`, `harga`) VALUES
(1, 'Paket Deluxe', 15, 2, 100),
(2, 'Paket Hemat', 11, 99, 1485000),
(80, 'Teknologi', 12, 3, 75000),
(100, 'Paket Segar', 13, 3, 60000),
(111, 'Paket Hemat', 13, 1, 20000),
(777, 'Paket Super Hemat', 13, 5, 100000),
(8112, 'Paket Hemat', 13, 1, 20000),
(123123, '2', 13, 5, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE `tb_status` (
  `id_status` int(3) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_status`
--

INSERT INTO `tb_status` (`id_status`, `nama`) VALUES
(1, 'Diterima'),
(2, 'Dibatalkan'),
(3, 'Selesai'),
(4, 'Belum Terverifikasi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_susu`
--

CREATE TABLE `tb_susu` (
  `id_susu` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `vol_liter` int(15) NOT NULL,
  `harga` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_susu`
--

INSERT INTO `tb_susu` (`id_susu`, `nama`, `vol_liter`, `harga`) VALUES
(11, 'Sapi Murni', 2, 15000),
(12, 'Kambing', 1, 25000),
(13, 'Kedelai', 3, 20000),
(15, 'Susu Segar', 7, 28000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(3) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `tb_susu`
--
ALTER TABLE `tb_susu`
  ADD PRIMARY KEY (`id_susu`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
