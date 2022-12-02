-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 05:04 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL,
  `access` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `nama`, `password`, `access`) VALUES
(101, 'MUHAMMAD AMIRUL HAKIMI BIN JASNI', 'mirul@1234', 'admin'),
(102, 'MUHAMMAD ANAS BIN SUHAIMI ', 'anas@2131', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `info_hadir`
--

CREATE TABLE `info_hadir` (
  `ndp` int(10) NOT NULL,
  `tarikh` date NOT NULL DEFAULT current_timestamp(),
  `sem` int(1) NOT NULL,
  `waktu_kehadiran` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `ndp` int(10) NOT NULL,
  `waktu_kehadiran` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`ndp`, `waktu_kehadiran`) VALUES
(23221117, '2022-12-02 14:14:51');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `nama` varchar(50) NOT NULL,
  `ndp` int(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `no_tel` int(15) NOT NULL,
  `id_history` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`nama`, `ndp`, `password`, `no_tel`, `id_history`) VALUES
('niko', 23221101, '01234', 111719282, '1'),
('IZZAT IZHAM BIN ABDUL KHA\'HAR', 23221103, 'amm183', 183562363, '5'),
('MUHAMMAD FARIS IQMAL BIN MOHAMMAD RAZI', 23221104, 'mal1234', 175944746, '4'),
('MUHAMMAD HAIZUL IQMAL BIN HARFAIZAL', 23221117, 'haizul1715', 182403183, '3'),
('MUHAMMAD AMIRUL HAKIMI BIN JASNI', 23221142, '123456', 111719282, '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_hadir`
--
ALTER TABLE `info_hadir`
  ADD PRIMARY KEY (`ndp`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`ndp`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ndp`),
  ADD KEY `nama` (`nama`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
