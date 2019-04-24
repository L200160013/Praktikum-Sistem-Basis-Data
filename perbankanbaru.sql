-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 08:10 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `perbankan`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang_bank`
--

CREATE TABLE IF NOT EXISTS `cabang_bank` (
  `kode_cabang` varchar(20) NOT NULL,
  `nama_cabang` varchar(45) NOT NULL,
  `alamat_cabang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cabang_bank`
--

INSERT INTO `cabang_bank` (`kode_cabang`, `nama_cabang`, `alamat_cabang`) VALUES
('BRUB', 'Bank Rut Unit Boyolali', 'jl. Ahmad yani 45'),
('BRUK', 'Bank Rut Unit Klaten', 'jl. Suparman 23'),
('BRUM', 'Bank Rut Unit Magelang', 'jl. P.Tendean 63'),
('BRUS', 'Bank Rut Unit Surakarta', 'jl. Slamet Riyadi 18'),
('BRUW', 'Bank Rut Unit Wonogiri', 'jl. Untung Sutropati 12'),
('BRUY', 'Bank Rut Unit Yogyakarta', 'jl. Anggrek 21');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE IF NOT EXISTS `nasabah` (
  `id_nasabah` int(11) NOT NULL,
  `nama_nasabah` varchar(45) NOT NULL,
  `alamat_nasabah` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id_nasabah`, `nama_nasabah`, `alamat_nasabah`) VALUES
(1, 'Sutopo', 'Jl. Jendral Sudirman 12'),
(2, 'Maryati', 'Jl. MT. Haryono 31'),
(3, 'Suparman', 'Jl. Hasanudin 81'),
(4, 'Kartika Padmasari', 'Jl. Manggis 15'),
(5, 'Budi Eko Prayogo', 'Jl. Kantil 30'),
(6, 'Satria Eka Jaya', 'Jl. Slamet Riyadi 45'),
(7, 'Indri Hapsari', 'Jl. Sutoyo 5'),
(8, 'Sari Murti', 'Jl. Pangandaran 11'),
(9, 'Canka Lokananta', 'Jl. Tidar 86'),
(10, 'Budi Murtono', 'Jl. Merak 22'),
(11, 'Joko Ndo Kondo', 'Jl. Bareng jadian kagak'),
(12, 'Jon Koplo', 'Jl. Angin Besar 12'),
(13, 'Anggit', 'Solo'),
(1000, 'Sutopo', 'Jl. Jendral Sudirman'),
(2000, 'Maryati', 'Jl. MT Haryono 31');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah_has_rekening`
--

CREATE TABLE IF NOT EXISTS `nasabah_has_rekening` (
  `id_nasabahFK` int(11) NOT NULL DEFAULT '0',
  `no_rekeningFK` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah_has_rekening`
--

INSERT INTO `nasabah_has_rekening` (`id_nasabahFK`, `no_rekeningFK`) VALUES
(1, 104),
(2, 103),
(3, 105),
(3, 106),
(4, 101),
(4, 107),
(5, 102),
(5, 107),
(6, 109),
(7, 111),
(8, 112),
(9, 110),
(10, 108),
(10, 113);

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE IF NOT EXISTS `rekening` (
  `no_rekening` int(11) NOT NULL,
  `kode_cabangFK` varchar(20) DEFAULT NULL,
  `pin` varchar(20) NOT NULL DEFAULT 'abcd',
  `saldo` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`no_rekening`, `kode_cabangFK`, `pin`, `saldo`) VALUES
(101, 'BRUS', '1111', 500000),
(102, 'BRUS', '2222', 350000),
(103, 'BRUS', '3333', 750000),
(104, 'BRUM', '4444', 900000),
(105, 'BRUW', '5555', 200000),
(106, 'BRUS', '6666', 300000),
(107, 'BRUS', '7777', 100000),
(108, 'BRUB', '0000', 500000),
(109, 'BRUS', '9999', 0),
(110, 'BRUY', '1234', 550000),
(111, 'BRUK', '4321', 150000),
(112, 'BRUK', '0123', 300000),
(113, 'BRUY', '8888', 255000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
`no_transaksi` bigint(20) unsigned NOT NULL,
  `id_nasabahFK` int(11) DEFAULT NULL,
  `no_rekeningFK` int(11) DEFAULT NULL,
  `jenis_transaksi` varchar(20) NOT NULL DEFAULT 'debit',
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `id_nasabahFK`, `no_rekeningFK`, `jenis_transaksi`, `tanggal`, `jumlah`) VALUES
(32, 3, 105, 'debit', '2009-11-10 00:00:00', 50000),
(33, 2, 103, 'debit', '2009-11-10 00:00:00', 40000),
(34, 4, 101, 'kredit', '2009-11-12 00:00:00', 20000),
(35, 3, 106, 'debit', '2009-11-13 00:00:00', 50000),
(36, 5, 107, 'kredit', '2009-11-13 00:00:00', 30000),
(37, 1, 104, 'kredit', '2009-11-15 00:00:00', 200000),
(38, 9, 110, 'kredit', '2009-11-15 00:00:00', 150000),
(39, 5, 102, 'debit', '2009-11-16 00:00:00', 20000),
(40, 3, 105, 'kredit', '2009-11-18 00:00:00', 50000),
(41, 4, 107, 'debit', '2009-11-19 00:00:00', 100000),
(42, 2, 103, 'debit', '2009-11-19 00:00:00', 100000),
(43, 1, 104, 'debit', '2009-11-19 00:00:00', 50000),
(44, 4, 107, 'kredit', '2009-11-20 00:00:00', 200000),
(45, 3, 105, 'debit', '2009-11-21 00:00:00', 40000),
(46, 1, 104, 'kredit', '2009-11-22 00:00:00', 100000),
(47, 4, 101, 'kredit', '2009-11-22 00:00:00', 20000),
(48, 2, 103, 'debit', '2009-11-22 00:00:00', 50000),
(49, 5, 102, 'debit', '2009-11-25 00:00:00', 50000),
(50, 10, 108, 'debit', '2009-11-26 00:00:00', 100000),
(51, 3, 106, 'kredit', '2009-11-27 00:00:00', 50000),
(52, 2, 103, 'kredit', '2009-11-28 00:00:00', 200000),
(53, 3, 105, 'kredit', '2009-11-28 00:00:00', 100000),
(54, 5, 102, 'debit', '2009-11-30 00:00:00', 20000),
(55, 1, 104, 'debit', '2009-12-01 00:00:00', 50000),
(56, 2, 103, 'debit', '2009-12-02 00:00:00', 40000),
(57, 4, 101, 'debit', '2009-12-04 00:00:00', 50000),
(58, 2, 103, 'kredit', '2009-12-05 00:00:00', 100000),
(59, 5, 102, 'kredit', '2009-12-05 00:00:00', 200000),
(60, 7, 109, 'debit', '2009-12-05 00:00:00', 100000),
(61, 9, 110, 'debit', '2009-12-06 00:00:00', 20000),
(62, 19, 110, 'kredit', '2017-05-24 00:00:00', 50000),
(68, 10, 111, 'kredit', '2017-05-24 00:00:00', 250000),
(69, 6, 106, 'debit', '2017-05-24 00:00:00', 125000),
(70, 7, 103, 'kredit', '2017-05-24 00:00:00', 130000),
(72, 8, 101, 'kredit', '2017-05-24 00:00:00', 357000),
(73, 2, 110, 'debit', '2017-05-24 00:00:00', 547000),
(76, 5, 110, 'debit', '2017-05-24 00:00:00', 26000),
(77, 19, 110, 'kredit', '2017-05-24 00:00:00', 50000),
(78, 19, 110, 'kredit', '2017-05-24 00:00:00', 50000),
(79, 12, 101, 'debit', '2017-05-26 00:00:00', 9700000),
(80, 12, 101, 'debit', '2017-05-26 00:00:00', 8500000),
(81, 1, 111, 'kredit', '2017-05-26 00:00:00', 520000),
(85, 13, 109, 'debit', '2017-05-26 00:00:00', 700000),
(86, 19, 110, 'kredit', '2017-05-30 00:00:00', 50000),
(87, 19, 110, 'kredit', '2017-06-06 00:00:00', 50000),
(88, 19, 110, 'kredit', '2017-06-06 00:00:00', 50000),
(89, 13, 109, 'debit', '2017-06-08 00:00:00', 700000),
(90, 13, 109, 'debit', '2017-06-08 00:00:00', 700000),
(91, 13, 109, 'debit', '2017-06-08 00:00:00', 700000),
(92, 5, 103, 'debit', '2017-06-14 00:00:00', 263000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabang_bank`
--
ALTER TABLE `cabang_bank`
 ADD PRIMARY KEY (`kode_cabang`), ADD UNIQUE KEY `nama_cabang` (`nama_cabang`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
 ADD PRIMARY KEY (`id_nasabah`);

--
-- Indexes for table `nasabah_has_rekening`
--
ALTER TABLE `nasabah_has_rekening`
 ADD PRIMARY KEY (`id_nasabahFK`,`no_rekeningFK`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
 ADD PRIMARY KEY (`no_rekening`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
 ADD PRIMARY KEY (`no_transaksi`), ADD UNIQUE KEY `no_transaksi` (`no_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
MODIFY `no_transaksi` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
