-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2025 at 11:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dukcapil`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pengajuan`
--

CREATE TABLE `jenis_pengajuan` (
  `id_jenis_pengajuan` int(11) NOT NULL,
  `nama_pengajuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `id_pengajuan` varchar(50) NOT NULL,
  `id_jenis_pengajuan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `status` enum('terkonfirmasi','ditolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_akta_kelahiran`
--

CREATE TABLE `pengajuan_akta_kelahiran` (
  `id_pengajuan_akta_kelahiran` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nomor_kk` varchar(16) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `akta_nikah` varchar(255) NOT NULL,
  `surat_keterangan_lahir` varchar(255) NOT NULL,
  `ktp_ayah` varchar(255) NOT NULL,
  `ktp_ibu` varchar(255) NOT NULL,
  `ktp_saksi_pertama` varchar(255) NOT NULL,
  `ktp_saksi_kedua` varchar(255) NOT NULL,
  `formulir_f101` varchar(255) NOT NULL,
  `formulir_f102` varchar(255) NOT NULL,
  `status` enum('menunggu','terkonfirmasi','selesai','ditolak') DEFAULT 'menunggu',
  `id_jenis_pengajuan` int(11) NOT NULL,
  `tanggal_pengambilan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_kia`
--

CREATE TABLE `pengajuan_kia` (
  `id_pengajuan_kia` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nomor_kk` varchar(16) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `akta_kelahiran` varchar(255) NOT NULL,
  `kartu_keluarga` varchar(255) NOT NULL,
  `formulir_f102` varchar(255) NOT NULL,
  `status` enum('menunggu','terkonfirmasi','selesai','ditolak') DEFAULT 'menunggu',
  `id_jenis_pengajuan` int(11) NOT NULL,
  `tanggal_pengambilan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_kk`
--

CREATE TABLE `pengajuan_kk` (
  `id_pengajuan_kk` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nomor_kk` varchar(16) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `akta_kelahiran` varchar(255) DEFAULT NULL,
  `akta_cerai` varchar(255) DEFAULT NULL,
  `akta_kematian` varchar(255) DEFAULT NULL,
  `akta_nikah` varchar(255) DEFAULT NULL,
  `formulir_f102` varchar(255) NOT NULL,
  `formulir_f106` varchar(255) NOT NULL,
  `status` enum('menunggu','terkonfirmasi','selesai','ditolak') DEFAULT 'menunggu',
  `id_jenis_pengajuan` int(11) NOT NULL,
  `tanggal_pengambilan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_ktp`
--

CREATE TABLE `pengajuan_ktp` (
  `id_pengajuan_ktp` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nomor_kk` varchar(16) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `akta_kelahiran` varchar(255) NOT NULL,
  `kartu_keluarga` varchar(255) NOT NULL,
  `surat_pengantar` varchar(255) NOT NULL,
  `formulir_f102` varchar(255) NOT NULL,
  `status` enum('menunggu','terkonfirmasi','selesai','ditolak') DEFAULT 'menunggu',
  `id_jenis_pengajuan` int(11) NOT NULL,
  `tanggal_pengambilan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `role` enum('admin','pengguna') NOT NULL DEFAULT 'pengguna',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama_lengkap`, `email`, `password`, `nik`, `tanggal_lahir`, `jenis_kelamin`, `nomor_telepon`, `foto`, `role`, `created_at`, `updated_at`) VALUES
(2, 'admin duk', 'admin@gmail.com', '$2b$12$480I3lZ1aAi7OIATkcC/o.VeEDTBqGkNQXd1NCmmOyQPYxaPgxd2u\r\n', '5210411302', '2005-03-06', 'Laki-laki', '08969696966969', NULL, 'admin', '2025-03-08 17:09:48', '2025-03-08 17:30:28'),
(3, 'Admin Sistem', 'admin@example.com', '$2b$10$XHUM7XP3WKSYVDK33TZcjepNuA0tt3/YK.CReySpZ1W0vOISkRKTO', '3201123456789201', '1990-01-01', 'Laki-laki', '081234567891', NULL, 'admin', '2025-03-08 17:35:34', '2025-03-08 17:41:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_pengajuan`
--
ALTER TABLE `jenis_pengajuan`
  ADD PRIMARY KEY (`id_jenis_pengajuan`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Indexes for table `pengajuan_akta_kelahiran`
--
ALTER TABLE `pengajuan_akta_kelahiran`
  ADD PRIMARY KEY (`id_pengajuan_akta_kelahiran`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Indexes for table `pengajuan_kia`
--
ALTER TABLE `pengajuan_kia`
  ADD PRIMARY KEY (`id_pengajuan_kia`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Indexes for table `pengajuan_kk`
--
ALTER TABLE `pengajuan_kk`
  ADD PRIMARY KEY (`id_pengajuan_kk`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Indexes for table `pengajuan_ktp`
--
ALTER TABLE `pengajuan_ktp`
  ADD PRIMARY KEY (`id_pengajuan_ktp`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_pengajuan`
--
ALTER TABLE `jenis_pengajuan`
  MODIFY `id_jenis_pengajuan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `notifikasi_ibfk_2` FOREIGN KEY (`id_jenis_pengajuan`) REFERENCES `jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Constraints for table `pengajuan_akta_kelahiran`
--
ALTER TABLE `pengajuan_akta_kelahiran`
  ADD CONSTRAINT `pengajuan_akta_kelahiran_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `pengajuan_akta_kelahiran_ibfk_2` FOREIGN KEY (`id_jenis_pengajuan`) REFERENCES `jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Constraints for table `pengajuan_kia`
--
ALTER TABLE `pengajuan_kia`
  ADD CONSTRAINT `pengajuan_kia_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `pengajuan_kia_ibfk_2` FOREIGN KEY (`id_jenis_pengajuan`) REFERENCES `jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Constraints for table `pengajuan_kk`
--
ALTER TABLE `pengajuan_kk`
  ADD CONSTRAINT `pengajuan_kk_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `pengajuan_kk_ibfk_2` FOREIGN KEY (`id_jenis_pengajuan`) REFERENCES `jenis_pengajuan` (`id_jenis_pengajuan`);

--
-- Constraints for table `pengajuan_ktp`
--
ALTER TABLE `pengajuan_ktp`
  ADD CONSTRAINT `pengajuan_ktp_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `pengajuan_ktp_ibfk_2` FOREIGN KEY (`id_jenis_pengajuan`) REFERENCES `jenis_pengajuan` (`id_jenis_pengajuan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
