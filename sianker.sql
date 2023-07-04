-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jul 2023 pada 15.08
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `puskesmas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `id_booking` varchar(12) NOT NULL,
  `tgl_booking` date NOT NULL,
  `selesai_periksa` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `antrian` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `selesai_periksa`, `id_user`, `antrian`) VALUES
('07052023004', '2023-05-07', '2023-05-08', 12, 1),
('09052023005', '2023-05-09', '2023-05-10', 16, 1),
('09052023006', '2023-05-09', '2023-05-10', 11, 2),
('09052023007', '2023-05-09', '2023-05-10', 18, 3),
('15062023008', '2023-06-15', '2023-06-16', 26, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking_detail`
--

CREATE TABLE `booking_detail` (
  `id` int(11) NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `booking_detail`
--

INSERT INTO `booking_detail` (`id`, `id_booking`, `id_poli`) VALUES
(34, '07052023004', 2),
(35, '09052023005', 1),
(36, '09052023006', 4),
(37, '09052023007', 2),
(38, '15062023008', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `no_periksa` varchar(12) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_periksa`
--

INSERT INTO `detail_periksa` (`no_periksa`, `id_poli`) VALUES
('02042023003', 1),
('03042023003', 1),
('21062023003', 2),
('23052022001', 2),
('23052022002', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(5) NOT NULL,
  `nama_dok` varchar(128) NOT NULL,
  `ttl` varchar(128) NOT NULL,
  `jenis_kel` varchar(128) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nama_dok`, `ttl`, `jenis_kel`, `alamat`, `email`) VALUES
(1, 'Tati Ermawati, Sp.A', '08-02-1997', 'perempuan', 'Cikampek', 'tati@gmail.co.ID'),
(2, 'Feri Firmansyah, drg', '28-02-1990', 'Laki-laki', 'Cikampek', 'feri@gmail.com'),
(3, 'Kamala, Sp. OG', '16-08-1996', 'Perempuan', 'Cikampek', 'kamala@gmail.com'),
(4, 'Amalia Rizki Ramdani, dr', '24-07-1985', 'Perempuan', 'Cikampek', 'amalia@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksa`
--

CREATE TABLE `periksa` (
  `no_periksa` varchar(12) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `status` enum('Periksa','Selesai','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `periksa`
--

INSERT INTO `periksa` (`no_periksa`, `tgl_periksa`, `id_booking`, `id_user`, `tgl_kembali`, `tgl_selesai`, `status`) VALUES
('02042023003', '2023-04-02', '01042023001', 12, '2023-04-02', '2023-04-03', 'Selesai'),
('03042023003', '2023-04-03', '02042023002', 13, '2023-04-03', '2023-04-03', 'Selesai'),
('21062023003', '2023-06-21', '03042023003', 14, '2023-06-21', '0000-00-00', 'Periksa'),
('23052022001', '2022-05-23', '23052022001', 1, '2022-05-23', '2022-05-23', 'Selesai'),
('23052022002', '2022-05-23', '23052022001', 1, '2022-05-23', '2022-05-23', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id` int(5) NOT NULL,
  `nama_poli` varchar(128) NOT NULL,
  `id_dok` int(11) NOT NULL,
  `dc` varchar(128) NOT NULL,
  `jam_praktek` varchar(128) NOT NULL,
  `stok` int(11) NOT NULL,
  `diperiksa` int(11) NOT NULL,
  `dibooking` int(11) NOT NULL,
  `image` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `id_dok`, `dc`, `jam_praktek`, `stok`, `diperiksa`, `dibooking`, `image`) VALUES
(1, 'POLI ANAK', 1, 'Tati Ermawati, Sp.A', '08.00 - 11.00', 29, 1, 0, 'anak.jpg'),
(2, 'POLI GIGI', 2, 'Feri Firmansyah, drg', '08.00 - 11.00', 29, 1, 0, 'gigi.jpg'),
(3, 'POLI KANDUNGAN', 3, 'Kamala, Sp. OG', '08.00 - 11.00', 29, 0, 1, 'kandungan.jpg'),
(4, 'POLI UMUM', 4, 'Amalia Rizki Ramdani, dr	', '08.00 - 11.00', 28, 0, 2, 'umum.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(123) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `tgl_booking` datetime DEFAULT NULL,
  `id_user` varchar(12) NOT NULL,
  `email_user` varchar(128) DEFAULT NULL,
  `id_poli` int(11) DEFAULT NULL,
  `nama_poli` varchar(255) NOT NULL,
  `dc` varchar(255) NOT NULL,
  `jam_praktek` varchar(128) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `temp`
--

INSERT INTO `temp` (`id`, `tgl_booking`, `id_user`, `email_user`, `id_poli`, `nama_poli`, `dc`, `jam_praktek`, `image`) VALUES
(1, '2023-06-21 10:02:53', '28', 'nhaya@gmail.com', 1, 'POLI ANAK', 'Tati Ermawati, Sp.A', '08.00 - 11.00', 'anak.jpg'),
(2, '2023-07-04 11:48:45', '29', 'nunghayati12@gmail.com', 3, 'POLI KANDUNGAN', 'Kamala, Sp. OG', '08.00 - 11.00', 'kandungan.jpg'),
(3, '2023-07-04 11:52:44', '30', 'nh12@gmail.com', 2, 'POLI GIGI', 'Feri Firmansyah, drg', '08.00 - 11.00', 'gigi.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nik` varchar(128) NOT NULL,
  `ttl` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `no_telp` varchar(128) NOT NULL,
  `jenis_kel` varchar(128) NOT NULL,
  `alamat` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_input` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `nik`, `ttl`, `email`, `no_telp`, `jenis_kel`, `alamat`, `role_id`, `is_active`, `tanggal_input`, `password`, `image`) VALUES
(21, 'Aulia', '12345677891', '12-09-2002', 'aulia01@gmail.com', '08154263821', 'Perempuan', 'Cikampek', 1, 1, 1686143386, '$2y$10$Qb1Ts8Q4Y0Z9S9ztKM4RgeskwziSZjQw8ue0GGNqL.UpqqFYuJ7aa', 'pro1686126057.jpg'),
(24, 'rahma syr', '12210555', '2003-10-22', 'rahma@gmail.com ', '098xx', 'Prmpn', 'sbg', 1, 1, 1686146843, '22b3ffad0f3eb35bea0d823bdc62b80b', 'pro-1686129009.jpg'),
(25, 'nung hayati', '123456', '2023-06-14', 'nunghayati@gmai.com', '0987xxx', 'Perempuan', 'jtsr', 2, 1, 1686147159, '$2y$10$YmpmzALlTuB6SmnsieX0Tuaua2ik0.waqYslIksPdl/KaTLFU9Eu2', 'basic.jpg'),
(26, 'Yori', '123456778910', '1999-09-24', 'yori@gmail.com', '08158848809', 'Perempuan', 'Karawang', 2, 1, 1686835355, '$2y$10$l9bNOW6o5DE/8nD.8D0Zse0iLnPaZ86gSYCv7Ohvj5HAqnsZoh6DC', 'basic.jpg'),
(27, 'nung', '123456787', '2002-12-29', 'nung@gmail.com', '089812345678', 'perempuan', 'cklng', 1, 1, 1686835355, 'nung123', ''),
(28, 'nhaya', '123456789098765', '2003-12-12', 'nhaya@gmail.com', '085889703027', 'Perempuan', 'Cikalongsari', 1, 1, 1687334550, '$2y$10$0vXQIKjCfVlUQZAgDKV9HuU.r/gJuwYddVYmYZYk3ytqVJP0u1WOa', 'basic.jpg'),
(29, 'Nung Hayati', '09876543321', '2002-12-29', 'nunghayati12@gmail.com', '081511791762', 'Perempuan', 'Karawang', 2, 1, 1688282057, '$2y$10$Gf/IkmShBHcqHIBs/Mcw6.WtTO4CCndH4aCMOVSXgT.Smhq9k.DmS', 'basic.jpg'),
(30, 'nung', '098765543562', '2000-01-12', 'nh12@gmail.com', '09876789', 'p', 'krw', 2, 1, 1688464280, '$2y$10$f7iH046XajxYHG4ACdQcEei/6x4MS3jUQ0BHxjCHC/czA16LkUYAa', 'basic.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indeks untuk tabel `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD UNIQUE KEY `no_periksa` (`no_periksa`,`id_poli`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`no_periksa`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_dok` (`id_dok`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
