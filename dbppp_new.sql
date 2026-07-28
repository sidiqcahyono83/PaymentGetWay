-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jul 2026 pada 06.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbppp_new`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `area`
--

CREATE TABLE `area` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `area`
--

INSERT INTO `area` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
('cmazk34xa0005vpbg170umf3a', 'Adikarto', '2025-05-22 15:58:08.302', '2025-05-22 15:58:23.904'),
('cmazk4a3p0006vpbgt2ekltrj', 'Adilihur', '2025-05-22 15:59:01.669', '2025-05-22 15:58:51.522'),
('cmazk4yri0007vpbg8makbide', 'Candiwulan', '2025-05-22 15:59:33.630', '2025-05-22 15:59:25.538'),
('cmazk5jf80008vpbg0z4rwud1', 'Ingas', '2025-05-22 16:00:00.405', '2025-05-22 15:59:53.530'),
('cmazk6h4t0009vpbgt1pmw986', 'Jabres', '2025-05-22 16:00:44.093', '2025-05-22 16:01:59.555'),
('cmazk8p11000avpbgnwlwt9j4', 'Joho', '2025-05-22 16:02:27.638', '2025-05-22 16:02:22.715'),
('cmazk9kw6000bvpbgk9mivko9', 'Jonggol', '2025-05-22 16:03:08.934', '2025-05-22 16:03:23.962'),
('cmazkbpb2000cvpbgaxiqr92u', 'Karangduwur', '2025-05-22 16:04:47.966', '2025-05-22 16:04:42.435'),
('cmazkc5oc000dvpbggt0fbr1n', 'kebulusan', '2025-05-22 16:05:09.181', '2025-05-22 16:05:04.891'),
('cmazkcjx0000evpbgwye73rlh', 'Klapagada', '2025-05-22 16:05:27.637', '2025-05-22 16:05:23.459'),
('cmazkd4ss000fvpbgil3pkilv', 'Pagutan', '2025-05-22 16:05:54.700', '2025-05-22 16:05:48.299'),
('cmazkdr8t000gvpbgjbdde0wf', 'Sidoharjo', '2025-05-22 16:06:23.790', '2025-05-22 16:06:19.123'),
('cmazke7f8000hvpbg36j0h97g', 'Soka Lor', '2025-05-22 16:06:44.756', '2025-05-22 16:06:40.379'),
('cmazkenuk000ivpbgtu4ejhsn', 'Soka tengah', '2025-05-22 16:07:06.045', '2025-05-22 16:07:02.131'),
('cmazkipb1000jvpbgc66jsz75', 'Sruweng', '2025-05-22 16:10:14.558', '2025-05-22 16:10:08.859'),
('cmazkjdbh000kvpbg7cf3tl0x', 'Temanggal', '2025-05-22 16:10:45.677', '2025-05-22 16:10:41.123'),
('cmazkk9a6000lvpbgwpca6hjz', 'Tepakyang', '2025-05-22 16:11:27.102', '2025-05-22 16:11:22.691'),
('cmazkkr7h000mvpbgsexiubsl', 'Wajasari', '2025-05-22 16:11:50.333', '2025-05-22 16:11:46.355'),
('cmazkl8fx000nvpbgj232l6wo', 'Wareng', '2025-05-22 16:12:12.670', '2025-05-22 16:12:08.931');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bukukas`
--

CREATE TABLE `bukukas` (
  `id` varchar(191) NOT NULL,
  `tanggal` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `totalMasuk` double NOT NULL DEFAULT 0,
  `totalKeluar` double NOT NULL DEFAULT 0,
  `saldoAkhir` double NOT NULL DEFAULT 0,
  `deskripsi` varchar(191) DEFAULT NULL,
  `keterangan` varchar(191) DEFAULT NULL,
  `userId` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bukukas`
--

INSERT INTO `bukukas` (`id`, `tanggal`, `totalMasuk`, `totalKeluar`, `saldoAkhir`, `deskripsi`, `keterangan`, `userId`, `createdAt`, `updatedAt`) VALUES
('cms2rtgvs0002csj02xqy6j58', '2026-07-27 05:12:52.400', 415000, 0, 415000, 'Buku Kas Harian', 'Pencatatan Pemasukan Otomatis', 'cms2ltais00005kj0nal7jqwf', '2026-07-27 05:12:52.408', '2026-07-27 05:43:08.669'),
('cms2sa8zb0007csj0zqbevayq', '2026-07-27 05:25:55.315', 165000, 0, 330000, 'Pembayaran Invoice INV-202607-00046', 'Pembayaran dari Pak Rasimun Pakyang', 'cms2ltais00005kj0nal7jqwf', '2026-07-27 05:25:55.319', '2026-07-27 05:25:55.319');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `fullname` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phoneNumber` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `ontName` varchar(191) DEFAULT NULL,
  `redamanOlt` varchar(191) DEFAULT NULL,
  `diskon` int(11) NOT NULL DEFAULT 0,
  `status` enum('ACTIVE','SUSPENDED','TERMINATED','PENDING') NOT NULL DEFAULT 'PENDING',
  `paketId` varchar(191) DEFAULT NULL,
  `areaId` varchar(191) DEFAULT NULL,
  `odpId` varchar(191) DEFAULT NULL,
  `modemId` varchar(191) DEFAULT NULL,
  `oltId` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `username`, `fullname`, `email`, `phoneNumber`, `address`, `ontName`, `redamanOlt`, `diskon`, `status`, `paketId`, `areaId`, `odpId`, `modemId`, `oltId`, `createdAt`, `updatedAt`) VALUES
('cmazlny5d0001vp4sxzwcszgp', 'adikarto@buani', 'Ani Adikarto', NULL, '6285228505325', 'Adikarto', 'Buani-adikarto', '-13.152', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2025-11-26 13:59:27.547'),
('cmazlny6i0003vp4s3btih3z9', 'adikarto@sukadi', 'Sukadi', NULL, '6285225656543', 'Adikarto', 'Sukadi-adikarto', '-16.820', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2022-08-01 00:00:00.000', '2026-07-10 03:38:45.655'),
('cmazlny6s0005vp4s9mog73e8', 'adikarto@sumiati', 'Sumiati', NULL, '6281333129016', 'Adikarto', 'Sumiati-adikarto', '-17.078', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2022-08-05 00:00:00.000', '2026-05-09 03:04:20.586'),
('cmazlny730007vp4swrdys70m', 'adikarto@sutoro', 'Sutoro', NULL, '6287733988827', 'Adikarto,Rt02/03', 'Sutoro-adikarto', '-8.112', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2023-12-17 00:00:00.000', '2026-07-11 05:21:38.346'),
('cmazlny7c0009vp4svqhixj0j', 'adikarto@butoro', 'Toro/ Tri Kasiyati', NULL, '6282324887373', 'Adikarto', 'Butoro-adikarto', '-14.402', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2022-01-25 00:00:00.000', '2026-07-07 06:16:29.979'),
('cmazlny7m000bvp4sa5bofpk3', 'adikarto@pakkadus', 'Widodo Adikarto', NULL, '6289513205429', 'Adikarto', 'Pakkadus-adikarto', '-17.330', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2022-08-07 00:00:00.000', '2026-07-11 05:19:12.232'),
('cmazlny7x000dvp4sfl5q67zx', 'adiluhur@afifspr', 'Afif Spt', NULL, '6281336360020', 'Adiluhur', 'Afifspr-adiluhur', '-25.342', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2022-10-30 00:00:00.000', '2026-07-09 23:54:15.506'),
('cmazlny87000fvp4sajtjpt3u', 'sugran@agusriyadi', 'Agus Riyadi', NULL, '628985358970', 'Sugran Rt. 001/001', 'Agusriyadi-sugran', '-24.438', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2023-03-02 00:00:00.000', '2026-07-12 04:05:23.887'),
('cmazlny8h000hvp4sw0fxo8pz', 'sugran@agussetyawan', 'Agus Setyawan', NULL, '6285643086941', 'Sugran Rt01 Rw01', 'Agussetyawan-sugran', '-24.432', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2024-11-01 00:00:00.000', '2025-06-11 00:27:05.899'),
('cmazlny8q000jvp4s8cntpzo3', 'adiluhur@pakcarik', 'Carik Joko Adiluhur', NULL, '628567947202', 'Adilihur', 'Pakcarik-adiluhur', '-18.042', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-12 04:05:34.585'),
('cmazlny91000lvp4s2z0cyi3o', 'adiluhur@khomsatun', 'Khomsatun Adiluhur', NULL, '6281334688008', 'Adilihur', 'Khomsatun-adiluhur', '-24.816', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2022-05-11 00:00:00.000', '2026-07-06 10:58:40.772'),
('cmazlny9a000nvp4sjgrbszzn', 'adiluhur@mano', 'Mano Wibowo', NULL, '6285291212233', 'Adilihur', 'Mano-adiluhur', '-19.102', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2022-08-06 00:00:00.000', '2026-07-09 23:53:44.671'),
('cmazlny9j000pvp4sj7ybkp2o', 'sugran@meliaseptiana', 'Melia Septiana', NULL, '62895378013082', 'Adiluhur Sugran Rt. 001/001', 'Meliaseptiana-sugran', '-21.592', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2023-05-03 00:00:00.000', '2026-07-09 04:53:34.235'),
('cmazlny9s000rvp4s58swhyf4', 'adiluhur@nunukpratiwi', 'Nunuk Pratiwi', NULL, '6283872153864', 'Adiluhur', 'Nunukpratiwi-adiluhur', '-20.750', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2024-07-03 00:00:00.000', '2026-07-10 01:06:13.436'),
('cmazlnya1000tvp4sj7sj6xhs', 'adiluhur@saduki', 'Saduki', NULL, '6287728681898', 'Adiluhur Rt0102', 'Saduki-adiluhur', '-21.730', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2024-07-09 00:00:00.000', '2026-07-10 08:16:16.546'),
('cmazlnyab000vvp4saue3egxm', 'sugran@nawir', 'Sri Siti Sundari/ Nawir', NULL, '6285227790749', 'Adilihur', 'Nawir-sugran', '-22.002', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2022-01-30 00:00:00.000', '2026-04-16 09:40:29.928'),
('cmazlnyak000xvp4sc6sq8mtw', 'adiluhur@sugengwasis', 'Sugeng Wasis', NULL, '6282327425844', 'Adiluhur Rt0102', 'Sugengwasis-adiluhur', '-25.522', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2024-12-11 00:00:00.000', '2026-07-13 12:57:50.053'),
('cmazlnyau000zvp4s9vhw9qez', 'sugran@suratno', 'Suratno', NULL, '6289618672946', 'Sugran', 'Suratno-sugran', '-26.380', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2024-07-07 00:00:00.000', '2026-07-12 04:05:44.030'),
('cmazlnyb40011vp4spkhub97k', 'adiluhur@tasijah', 'Tasijah Adiluhur', NULL, '6289000000001', 'Adilihur', 'Tasijah-adiluhur', '-19.548', 0, 'TERMINATED', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2022-05-31 00:00:00.000', '2026-01-10 09:48:07.514'),
('cmazlnybe0013vp4sccldw0ih', 'adiluhur@pakyuli', 'Yuli Adiluhur', NULL, '6281321585736', 'Adilihur', 'Yuli-adiluhur', '-20.606', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-07 11:08:06.313'),
('cmazlnybo0015vp4s0l1i9a6w', 'adiluhur@baledesa', 'Baledesa Adiluhur', NULL, '6285740014661', 'Adiluhur, Rt1, Rw02', 'Baledesa-adiluhur', '-30.000', 0, 'ACTIVE', 'cmazjsfz40002vpbgwyegkqec', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2023-10-03 00:00:00.000', '2026-07-12 04:06:02.024'),
('cmazlnybw0017vp4suncxtzdv', 'candiwulan@adedwiisnaeni', 'Ade Dwi Isnaeni', NULL, '6288802480924', 'Candiwulan, Rt02/02', 'Adedwiisnaeni-candiwulan', '-25.22', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2025-04-08 00:00:00.000', '2026-07-10 16:47:36.408'),
('cmazlnyc70019vp4szdbacckx', 'candiwulan@cahyawulanamillia', 'Cahya Wulan Amillia', NULL, '6285741492607', 'Candiwulan/Rt01/02', 'Cahyawulan-candiwulan', '-', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2025-03-04 00:00:00.000', '2026-07-04 00:42:03.390'),
('cmazlnych001bvp4stdlwx2br', 'candiwulan@dedibirojasa', 'Dedi Priyono', NULL, '6281391419251', 'Candiwulan Kesongging Rt. 01/01', 'Dedibirojasa-candiwulan', '-27.448', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2023-09-07 00:00:00.000', '2025-05-29 07:44:43.801'),
('cmazlnycr001dvp4swr7wdnf3', 'candiwulan@lilisuryani', 'Lili Suryani', NULL, '6285875088840', 'Songging Rt0101', 'Lilisuryani-candiwulan', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2025-01-06 00:00:00.000', '2026-07-06 23:00:58.160'),
('cmazlnyd0001fvp4sklseqyze', 'candiwulan@masummustajab', 'Masum Mustajab', NULL, '6282136233530', 'Adikarto Rt.001/003', 'Masum-candiwulan', '-23.432', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2023-03-05 00:00:00.000', '2026-07-04 03:51:40.239'),
('cmazlnydb001hvp4sn41pxsvp', 'candiwulan@agung', 'Musa Haryadi', NULL, '6283159610989', 'Candiwulan', 'Agung-candiwulan', '-25.372', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2024-04-09 00:00:00.000', '2026-07-10 09:20:23.848'),
('cmazlnydl001jvp4siqq93lqg', 'candiwulan@puji', 'Puji Candiwulan', NULL, '62895393533664', 'Candiwulan', 'Puji-candiwulan', '-18.448', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2022-03-21 00:00:00.000', '2026-07-08 12:11:09.243'),
('cmazlnydw001lvp4sgxwa4jv9', 'candiwulan@rafisidiq', 'Rafi Sidik', NULL, '62895379162784', 'Candiwulan Rt. 01/02', 'Rafisidiq-candiwulan', '-24.852', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2023-08-24 00:00:00.000', '2026-07-11 02:20:05.726'),
('cmazlnye6001nvp4ss71b36oo', 'candiwulan@saniyah', 'Saniyah Candiwulan', NULL, '62895393533664', 'Candiwulan', 'Saniyah-candiwulan', '-21.612', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2022-03-18 00:00:00.000', '2026-07-04 00:42:17.658'),
('cmazlnyeg001pvp4se9wnx94s', 'candiwulan@songidah', 'Songidah', NULL, '6282325360117', 'Candiwulan', 'Songidah-candiwulan', '-16.718', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2023-09-15 00:00:00.000', '2026-07-10 05:44:30.822'),
('cmazlnyez001tvp4sj0ex9ph3', 'candiwulan@suliyah', 'Suliyah / Surati', NULL, '6285712967478', 'Candiwulan Bak Rt0101', 'Suliyah-candiwulanbak', '-', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2025-02-20 00:00:00.000', '2026-07-07 10:42:18.039'),
('cmazlnyf9001vvp4son13ec01', 'candiwulan@zaenatun', 'Zaenatun', NULL, '628567947201', 'Candiwulan', 'Zaenatun-canduwlan', '-17.282', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2022-03-06 00:00:00.000', '2026-07-09 04:52:42.782'),
('cmazlnyfj001xvp4sll9gjoxc', 'candiwulan@rusino', 'Rusino', NULL, '6285227429376', 'H1S3', 'Rusino-candiwulan', '-29.588', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2023-07-20 00:00:00.000', '2026-07-11 12:41:40.729'),
('cmazlnyfu001zvp4shnkeqfnn', 'candiwulan@choocheeping', 'Choo Chee Ping', NULL, '6282372907392', 'Candiwulan Pasar Tegong', 'Chocheping-candiwulan', '-25.680', 0, 'ACTIVE', 'cmazjsfz40002vpbgwyegkqec', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2023-03-03 00:00:00.000', '2026-07-11 01:39:00.940'),
('cmazlnyg30021vp4srf3ls27b', 'candiwulan@ratiman', 'Ratiman', NULL, '6281327599167', 'Candiwulan Rt. 001/001 Adimulyo. Kebumen', 'Ratiman-candiwulan', '-27.214', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2023-01-31 00:00:00.000', '2026-07-09 23:56:22.294'),
('cmazlnygc0023vp4s16vkriqb', 'candiwulan@ika', 'Ika Candiwulan', NULL, '6285868719381', 'Candiwulan', 'Ika-candiwulan', '-26.022', 0, 'ACTIVE', 'cmazjsfz40002vpbgwyegkqec', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 13:28:20.482'),
('cmazlnygl0025vp4s5tt9ptec', 'ingas@buanti', 'Anti Ingas', NULL, '6281519916237', 'Ingas', 'Buanti-ingas', '-19.790', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 03:25:54.116'),
('cmazlnygv0027vp4sm21fxopp', 'ingas@abahslamet', 'Slamet Nur Sodik', NULL, '6289666822231', 'Ingas', 'Abahslamet-ingas', '-4.242', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 05:27:57.303'),
('cmazlnyh60029vp4sx377xtjy', 'ingas@buumi', 'Aji Pambudi Santoso', NULL, '6283853771734', 'Ingas', 'Buumi-ingas', '-20.458', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2022-07-19 00:00:00.000', '2026-07-16 11:58:38.278'),
('cmazlnyhf002bvp4sjhi2yd5x', 'ingas@hartoendah', 'Endah Suprihatini', NULL, '6289681870068', 'Ingas', 'Hartoendah-ingas', '-20.088', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2022-07-21 00:00:00.000', '2026-03-18 13:27:38.573'),
('cmazlnyho002dvp4s2qsse1e5', 'ingas@sipur', 'Harsti Yaningsih', NULL, '6289678047022', 'Ingas', 'Sipur-ingas', '-21.488', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2022-07-20 00:00:00.000', '2026-07-10 03:32:01.310'),
('cmazlnyhx002fvp4ssk96t363', 'ingas@mansurainulyaqin', 'Mansur Ainul Yaqin Ahmad', NULL, '6285328771027', 'Ingas Sruweng Rt01/05', 'Mansurainulyaqin-ingas', '-22.210', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2024-09-05 00:00:00.000', '2026-07-20 09:15:37.431'),
('cmazlnyi8002hvp4s0qwr4tt5', 'sruweng@yoncell', 'Mulyo Karsono', NULL, '6281804872221', 'Jl. Raya Sruweng Rt. 01/04', 'Yoncell-sruweng', '-15.400', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2022-08-23 00:00:00.000', '2026-04-28 13:48:17.003'),
('cmazlnyig002jvp4snrzgj87c', 'ingas@Nurwahyudi', 'Nur Wahyudi Ingas', NULL, '628156895171', 'Ingas', 'Nurwahyudi-ingas', '-21.740', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-11 06:36:51.045'),
('cmazlnyir002lvp4szjcgims8', 'ingas@rafiti', 'Rr. Rafity Dyah K.W', NULL, '6283871144651', 'Sruweng Rt. 002/006', 'Rafiti-ingas', '-4.404', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2022-12-15 00:00:00.000', '2026-07-13 11:53:52.983'),
('cmazlnyiz002nvp4suvnqnc2o', 'wera@sadan', 'Sadan Wera', NULL, '6282134520006', 'Ingas', 'Sadan-wera', '-15.6320', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2024-04-08 00:00:00.000', '2026-06-25 11:00:58.691'),
('cmazlnyj9002pvp4sctfirmjh', 'wera@slametparmono', 'Slamet Pramono', NULL, '62895377202528', 'Wera Rt0301', 'Slametpramono-wera', '-20.500', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2025-02-04 00:00:00.000', '2026-07-11 05:29:32.855'),
('cmazlnyji002rvp4sx595i37p', 'ingas@sriwahyuni', 'Sri Wahyuni', NULL, '+62 815-5820-5192', 'Ingas Rt, 01/Rw, 05 Sruweng', 'Sriwahyuni-ingas', '-20.800', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2023-10-12 00:00:00.000', '2026-07-10 03:33:04.623'),
('cmazlnyjr002tvp4scysdpv1k', 'ingas@hardi', 'Suhardi', NULL, '62895377465283', 'Ingas', 'Hardi-ingas', '-21.674', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2022-05-30 00:00:00.000', '2026-07-10 03:24:10.782'),
('cmazlnyk0002vvp4snj3kq57k', 'jabres@anikwidiayanti', 'Anik Widiayanti, S.H', NULL, '6281227987041', 'Jabres Depan Notaris', 'Anikwidiayanti-sokalor', '-14.318', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2023-11-12 00:00:00.000', '2026-07-09 03:03:45.124'),
('cmazlnyk9002xvp4sqdf9cnkr', 'jabres@erimulyati', 'Eri Mulyati', NULL, '628990836779', 'Jabres Depok', 'Erimulyati-jabres', '-22.460', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2023-10-01 00:00:00.000', '2026-07-10 03:28:32.729'),
('cmazlnykj002zvp4s3qiy0v7l', 'jabres@joko', 'Joko Miyanto', NULL, '6285600448971', 'Jabres Rt. 01/02', 'Joko-jabres', '-22.220', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2023-09-13 00:00:00.000', '2026-07-11 05:38:28.056'),
('cmazlnykt0031vp4st3cihvsc', 'jabres@priagungmusianto', 'Priagung Musianto', NULL, '62882005090835', 'Jabres Rt. 003/003', 'Priagungmusianto-jabres', '-24.550', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2023-10-16 00:00:00.000', '2026-07-13 11:52:25.184'),
('cmazlnyl20033vp4sqjeaf2cx', 'jabres@sairinsudikno', 'Sairin Sudikno', NULL, '6289654426981', 'Jabres Tegalsari Rt. 03/04', 'Sairinsudikno-jabres', '-20.316', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2023-08-28 00:00:00.000', '2026-07-11 05:02:29.742'),
('cmazlnylc0035vp4s9hnfxep6', 'jabres@trinuryanti', 'Tri Nuryanti', NULL, '6282142541187', 'Jabres Depok Rt. 03/01', 'Trinuryanti-jabres', NULL, 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2025-03-28 00:00:00.000', '2025-11-26 14:00:03.241'),
('cmazlnyln0037vp4s61z60ija', 'jabres@nani2', 'Tri Yunani 2', NULL, '6285228208228', 'Jabres Depok', 'Nani2-jabres', '-18.154', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2023-11-01 00:00:00.000', '2026-07-10 03:48:57.919'),
('cmazlnylx0039vp4snyr3dvlk', 'jabres@gatotlanggeng', 'Uan Gatot Langgeng Cahaya', NULL, '6285934482330', 'Jabres Rt0104', 'Gatot-jabres', '-', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2025-04-14 00:00:00.000', '2026-07-11 05:12:45.961'),
('cmazlnym7003bvp4ss7eqvjt9', 'jabres@ulfaban', 'Ulfah Cholid / Paul', NULL, '62895410608823', 'Jabres', 'Ulfah-jabres', '-21.800', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2022-07-18 00:00:00.000', '2026-05-13 04:28:01.826'),
('cmazlnymg003dvp4s6nl6wy76', 'jabres@unginudin', 'Unginudin', NULL, '6281327474976', 'Jabres Rt03Rw04', 'Unginudin-jabres', '-17.740', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2024-06-15 00:00:00.000', '2025-11-26 14:00:15.539'),
('cmazlnymq003fvp4se871gkrq', 'jabres@zaenalakbar', 'Zaenal Akbar', NULL, '6282136458680', 'Jabres Rt01/04', 'Zaenal-jabres', '-', 0, 'SUSPENDED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2025-04-27 00:00:00.000', '2026-06-11 07:32:04.316'),
('cmazlnymy003hvp4slrp0vr69', 'jabres@nani', 'Tri Yunani', NULL, '6285228208228', 'Jabres', 'Nani-jabres', '-17.988', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2022-07-01 00:00:00.000', '2026-07-10 03:48:27.403'),
('cmazlnyn7003jvp4sixlw9cwb', 'joho@abdul', 'Abdul Kholik Joho', NULL, '6282337050908', 'Joho Rt01 Rw01', 'Abdul-joho', '-12.120', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2023-11-16 00:00:00.000', '2025-06-01 13:07:51.690'),
('cmazlnyni003lvp4sdnfl09um', 'joho@agusdono', 'Agus Dono Saptono', NULL, '6282322552722', 'Joho', 'Agusdono-joho', '-24.528', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2023-11-11 00:00:00.000', '2026-07-11 23:47:19.378'),
('cmazlnyns003nvp4s0ytj62rc', 'joho@ariefsusanto', 'Arief Susanto', NULL, '6282221941355', 'Joho, Rt04/02', 'Arifsusanto-joho', '-20.364', 0, 'TERMINATED', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-05-02 00:00:00.000', '2026-05-20 07:13:45.403'),
('cmazlnyo2003pvp4sjaj0s9s8', 'joho@bambangbudisantoso', 'Bambang Budi Santoso', NULL, '6285743920428', 'Joho', 'Bambangbudisantoso-joho', '-18.542', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2023-08-24 00:00:00.000', '2026-07-01 11:02:32.202'),
('cmazlnyob003rvp4so3kyz68k', 'joho@barokahsusanti', 'Barokah Susanti', NULL, '62895636528639', 'Joho Rt01/01', 'Barokahsusanti-joho', '-20.080', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-02-01 00:00:00.000', '2026-07-02 12:25:02.971'),
('cmazlnyok003tvp4scstonn0g', 'joho@edik', 'Edik Joho', NULL, '6289508981023', 'Joho', 'Edik-joho', '-26.022', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-10-06 00:00:00.000', '2026-07-13 02:01:54.636'),
('cmazlnyot003vvp4ssz60jvdd', 'joho@emi', 'Emi Widianti', NULL, '628816610247', 'Joho Rt01.01', 'Emi-joho', '-18.560', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-01-12 00:00:00.000', '2026-07-12 04:06:12.290'),
('cmazlnyp3003xvp4sxu9exa2b', 'joho@gono', 'Gono Joho', NULL, '62895393533664', 'Joho', 'Gono-joho', '-21.024', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-12 11:47:26.040'),
('cmazlnypf003zvp4sjdro17gu', '50018@johoindri', 'Indri Joho', NULL, '6285861684898', 'Joho', 'Buindri-joho', '-22.220', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 13:37:05.546'),
('cmazlnypp0041vp4shd4p8k67', 'joho@kusnul', 'Kusnul Joho', NULL, '62895393533664', 'Joho', 'Kusnul-joho', '-14.498', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2022-03-21 00:00:00.000', '2026-07-02 02:20:20.627'),
('cmazlnypz0043vp4sd6m1gz1t', '50012@johoaretha', 'Lusi O/Aretha S', NULL, '6285215303375', 'Joho', 'Aretha-joho', '-8.180', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2022-02-06 00:00:00.000', '2026-07-08 11:56:41.460'),
('cmazlnyq70045vp4s8bpv22zf', 'joho@meidwisetianingsih', 'Mei Dwi Setianingsih', NULL, '6288215028227', 'Johort03Rw01Adimulyo', 'Meidwisetianingsih-joho', '-22.672', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-01-01 00:00:00.000', '2026-07-10 13:41:40.155'),
('cmazlnyqg0047vp4sp2taslh5', 'joho@nandaendah', 'Nanda Endah Rahayu', NULL, '6282237675975', 'Joho/Rt5/2, Adimulyo,Kebumen', 'Nanda-joho', '-17.012', 0, 'SUSPENDED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-12-27 00:00:00.000', '2026-07-11 13:37:55.698'),
('cmazlnyqp0049vp4s6q82mfdl', 'joho@naniifan', 'Nani Ifan Joho', NULL, '6285612345678', 'Joho', 'Naniifan-joho', '-16.636', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:57:42.793'),
('cmazlnyqy004bvp4s2pn9yhdx', 'joho@nartoyo', 'Nartoyo', NULL, '62882003166144', 'Joho Rt02 Rw02', 'Nartoyo-joho', '-20.602', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-12-13 00:00:00.000', '2026-07-08 11:56:58.977'),
('cmazlnyr8004dvp4syang1lza', 'joho@natasha', 'Natasha Anggraeni', NULL, '6285540523295', 'Joho Rt0202', 'Natasha-joho', '-8.820', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-08-20 00:00:00.000', '2026-07-12 11:39:31.103'),
('cmazlnyri004fvp4s3ayt6gsg', 'joho@nurjono', 'Nurjono', NULL, '6282327061647', 'Joho', 'Nurjono-joho', '-', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-02-01 00:00:00.000', '2026-07-08 11:57:28.091'),
('cmazlnyrs004hvp4s8xdh27ci', 'joho@nursidik', 'Nursidik', NULL, '6282399635715', 'Joho, Rt01/01', 'Nursidik-joho', '-12.994', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-01-12 00:00:00.000', '2025-06-09 10:01:01.156'),
('cmazlnys2004jvp4sdtwyc9kl', 'joho@parwidi', 'Parwidi', NULL, '6282122344643', 'Joho,Rt04/02,Adimulyo', '-', '-', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-05-12 00:00:00.000', '2026-07-08 11:57:54.739'),
('cmazlnysc004lvp4s4cfuug7x', 'joho@parwito', 'Parwito', NULL, '6281325766705', 'Joho', 'Parwito-joho', '-12.612', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2022-08-08 00:00:00.000', '2025-06-01 13:08:05.625'),
('cmazlnysk004nvp4s0hem01o4', 'joho@pujiningrum', 'Puji Ningrum', NULL, '6285227647777', 'Joho Rt0301', 'Pujiningrum-joho', '-20.500', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-01-03 00:00:00.000', '2026-07-09 09:27:16.956'),
('cmazlnysu004pvp4s8kl383w6', 'joho@ragil', 'Ragil Lestari', NULL, '6283154956024', 'Joho', 'Ragil-joho', '-13.828', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2022-10-14 00:00:00.000', '2026-07-03 10:21:42.943'),
('cmazlnyt5004rvp4srhzfdg38', 'joho@rahmat', 'Rahmat Slamet', NULL, '6285216399105', 'Joho,Rt03/01', 'Rahmat-joho', '-', 0, 'TERMINATED', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-04-12 00:00:00.000', '2026-07-13 09:12:46.044'),
('cmazlnytf004tvp4sxiqlmtti', 'joho@rasih', 'Rasih Joho', NULL, '62895393533664', 'Joho', 'Rasih-joho', '-25.852', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-02 12:25:14.715'),
('cmazlnytp004vvp4savcusn7u', 'joho@sdjoho', 'Riyan Fajar Mustika', NULL, '6285702411834', 'Joho,Sd', 'Sdjoho-joho', '-23.970', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-04-17 00:00:00.000', '2026-07-07 03:11:02.113'),
('cmazlnytz004xvp4s83u13lhw', 'joho@saliman', 'Saliman', NULL, '6285711185017', 'Joho Rt01/01', 'Saliman-joho', '-18.602', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-01-12 00:00:00.000', '2026-07-10 07:09:41.827'),
('cmazlnyua004zvp4s7t735kyg', 'joho@sawijem', 'Sawijem', NULL, '6287705446900', 'Joho Rt0202', 'Sawijem-joho', '-26.980', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-08-03 00:00:00.000', '2026-07-11 13:40:45.125'),
('cmazlnyuj0051vp4sx6j9ak49', 'joho@sitinurhayati', 'Siti Nurhayati', NULL, '6283831961588', 'Joho Rt 1/01', 'Sitinurhayati-joho', '-14.480', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2023-08-23 00:00:00.000', '2026-07-10 07:37:56.775'),
('cmazlnyuu0053vp4s3yo5qojd', '50013@johoslamet', 'Slamet Joho', NULL, '62895393533664', 'Joho', 'Slamet-joho', '-8.592', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2022-02-07 00:00:00.000', '2026-07-08 13:34:04.514'),
('cmazlnyv40055vp4sw0cvtetx', 'joho@slametwidodo', 'Slamet Widodo', NULL, '6282224149282', 'Joho Rt0402', 'Slametwidodo-joho', '-', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-04-24 00:00:00.000', '2026-07-09 13:09:19.822'),
('cmazlnyvd0057vp4svxnra672', 'joho@srimurni', 'Sri Murni', NULL, '6282113118626', 'Joho', 'Srimurni-joho', '-13.260', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2022-02-01 00:00:00.000', '2026-07-11 08:31:55.807'),
('cmazlnyvn0059vp4smjh2fczj', 'joho@5.suhud', 'Suhud Joho', NULL, '6285292577776', 'Joho', 'Paksuhud-joho', '-20.364', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:57:12.742'),
('cmazlnyvv005bvp4s8emwi62c', 'joho@suroso', 'Suroso', NULL, '6283174043055', 'Joho', 'Suroso-joho', '-13.894', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2022-07-14 00:00:00.000', '2026-07-12 10:17:19.579'),
('cmazlnyw4005dvp4sn5o1abjh', 'joho@sutrimo', 'Sutrimo', NULL, '6282323731208', 'Joho', '-', '-', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-04-06 00:00:00.000', '2026-07-09 23:54:29.169'),
('cmazlnywd005fvp4s2wgstub2', '1430013@buumuljoho', 'Ummul Joho', NULL, '6287867783717', 'Joho', 'Buumul-joho', '-20.316', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 04:55:09.693'),
('cmazlnywn005hvp4s3he19lt7', 'joho@yusufrakhman', 'Yusuf Rahman', NULL, '628981405302', 'Joho Rt. 001/001', 'Yusufrakhman-joho', '-27.214', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2023-07-11 00:00:00.000', '2026-07-05 01:12:07.055'),
('cmazlnyww005jvp4sii01rb7j', 'joho@aderiyan', 'Ade Rian Kustianto', NULL, '628983038588', 'Joho Rt.001/001', 'Aderiyan-joho', '-8.900', 0, 'ACTIVE', 'cmbthpcqq0000m6nhgjwxyahb', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2023-04-01 00:00:00.000', '2026-07-10 23:34:15.082'),
('cmazlnyxg005nvp4sigfmytme', 'joho@sigit', 'Sigit Dwi Kurniawan', NULL, '6287734259105', 'Joho Rt0101', 'Sigit-joho', '-19.060', 0, 'ACTIVE', 'cmazjsfz40002vpbgwyegkqec', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2024-08-06 00:00:00.000', '2026-07-02 05:05:34.927'),
('cmazlnyxr005pvp4sgzcmbgfh', 'jonggol@ahmadi', 'Ahmadi Jonggol', NULL, '6287732924986', 'Jonggol', 'Ahmadi-jonggol', '-16.144', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-11 05:58:06.627'),
('cmazlnyy6005rvp4sli2cqng8', 'jonggol@ahmad', 'Amad Jonggol', NULL, '6283861258223', 'Jonggol', 'Ahmad-jonggol', '-23.872', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-11 05:58:45.990'),
('cmazlnyyi005tvp4sol97g55r', 'jonggol@buidah', 'Indah Jonggol', NULL, '6287728503631', 'Jonggol', 'Buidah-jonggol', '-24.432', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-11 06:03:53.242'),
('cmazlnyyv005vvp4slj744llj', 'jonggol@meno', 'Meno Gorok', NULL, '6283870082302', 'Jonggol', 'Meno-jonggol', '-17.722', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-08 03:33:47.027'),
('cmazlnyz9005xvp4sm7k732f9', 'jonggol@buretno', 'Retno Jonggol', NULL, '6285642654704', 'Jonggol', 'Buretno-jonggol', '-17.272', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-11 05:43:32.465'),
('cmazlnyzr005zvp4s1k8lfcrv', 'jonggol@rudi', 'Rudi Suryo', NULL, '6285702112369', 'Jonggol', 'Rudi-jonggol', '-23.100', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-11 06:03:06.607'),
('cmazlnz050061vp4sn89klswv', 'jonggol@supono', 'Supono Jonggol', NULL, '6285741188285', 'Jonggol', 'Supono-jonggol', '-26.980', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-08 03:37:53.753'),
('cmazlnz0f0063vp4sn5yrltxp', 'jonggol@wetanesamsul', 'Wetaane Samsul', NULL, '6285743978279', 'Jonggol', 'Wetanesamsul-jonggol', '-16.862', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-11 05:53:34.422'),
('cmazlnz0q0065vp4sc9cb39jn', 'jonggol@ahmadmuharif', 'Ahmad Muharif', NULL, '6282322597388', 'Jonggol Rt01/01Aditirto', 'Ahmadmuharif-jonggol', '-18.210', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2024-09-14 00:00:00.000', '2026-07-10 03:01:05.333'),
('cmazlnz0z0067vp4s9e64l2vn', 'jonggol@baengatun', 'Baengatun', NULL, '628980555216', 'Jonggol Rt. 001/001', 'Baengatun-jonggol', '-23.942', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-10-15 00:00:00.000', '2026-07-11 05:57:19.510'),
('cmazlnz1a0069vp4sgiclb1ef', 'jonggol@dovan', 'Dovan Arlan Fernando', NULL, '+62 852-2175-6780', 'Aditirto Dk. Jonggol Rt. 001/002 Pejagoan', 'Dovan-jonggol', '-18.634', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2022-10-19 00:00:00.000', '2026-07-11 05:52:54.667'),
('cmazlnz1k006bvp4s4b7vbmzi', 'jonggol@estikurniasih', 'Esti Kurniasih', NULL, '6285951609282', 'Jinggol Rt. 002/001', 'Estikurniasih-jonggol', '-18.508', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-05-13 00:00:00.000', '2026-02-11 15:54:10.137'),
('cmazlnz1u006dvp4sbtyq8hi3', 'jonggol@fauzen', 'Fauzen Imam Ashari', NULL, '6287822898002', 'Jonggol', 'Fauzen-jonggol', '-22.566', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-11-07 00:00:00.000', '2026-07-20 09:19:30.163'),
('cmazlnz24006fvp4so74exksk', 'jonggol@irfangi', 'Irfangi', NULL, '6285743036307', 'Jonggol', 'Irfangi-jonggol', '-25.852', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-11-08 00:00:00.000', '2026-07-08 03:31:25.942'),
('cmazlnz2c006hvp4s5logr3gp', 'jonggol@linda', 'Linda Laely Khasanah', NULL, '6287788344660', 'Bakung Rt03/01 Karangpule', 'Linda-jonggol', '-20.080', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2024-07-06 00:00:00.000', '2026-07-08 03:40:43.539'),
('cmazlnz2m006jvp4saxvl6qpb', 'jonggol@nurhidayati', 'Nur Hidayati', NULL, '6287848633555', 'Jonggol Rt. 005/001', 'Nurhidayati-jonggol', '-16.440', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-05-05 00:00:00.000', '2026-07-11 05:49:09.591'),
('cmazlnz2v006lvp4s0x28i0pg', 'jonggol@nurkhasanah', 'Nurkhasanah', NULL, '6283844580899', 'Jonggol Rt. 005/001', 'Nurkhasanah-jonggol', '-16.550', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-06-02 00:00:00.000', '2026-07-10 03:37:17.195'),
('cmazlnz35006nvp4sqow1914k', 'jonggol@sitikuswanti', 'Siti Kuswanti', NULL, '6287728607190', 'Jonggoladitirto Rt0401', 'Sitikuswanti-krpule', '-17.512', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2024-05-01 00:00:00.000', '2026-07-11 05:11:47.820'),
('cmazlnz3e006pvp4so0hf8m99', 'jonggol@sobirin', 'Sobirin', NULL, '6283852249094', 'Jonggol', 'Sobirin-jonggol', '-23.460', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-10-31 00:00:00.000', '2026-07-20 09:37:55.427'),
('cmazlnz3n006rvp4szhk7m5k7', 'jonggol@suciati', 'Suciati', NULL, '085641807923', 'Aditirto Rt. 4/1', 'Suciati-jonggol', '-25.378', 0, 'SUSPENDED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-08-08 00:00:00.000', '2026-07-11 06:08:32.767'),
('cmazlnz3w006tvp4s2iwf3qf8', 'jonggol@adelia', 'Warung Ade', NULL, '6285717642262', 'Jonggol', 'Adelia-jonggol', '-19.394', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 05:43:00.496'),
('cmazlnz45006vvp4sofqjnfx9', 'jonggol@widiasih', 'Widiasih', NULL, '6285601860673', 'Jonggol Rt. 02/01', 'Widiasih-jonggol', '-16.948', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-08-03 00:00:00.000', '2026-07-11 05:41:30.629'),
('cmazlnz4f006xvp4s02qj14a8', 'jonggol@harzah', 'Harzah Normansyah', NULL, '6289606639572', 'Aditirto Rt. 001/001', 'Harza-jonggol', '-16.364', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-05-01 00:00:00.000', '2026-07-08 03:41:30.587'),
('cmazlnz4o006zvp4saww2tgtb', 'jonggol@heri', 'Heri Guswanto', NULL, '6282170394550', 'Aditirto Rt. 004/001 Jonggol', 'Heri-jonggol', '-25.380', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2023-04-02 00:00:00.000', '2026-07-08 03:52:57.116'),
('cmazlnz4x0071vp4siixwrgh0', 'karangduwur@juwartini', 'Juwartini', NULL, '62882008796197', 'Karangduwur Rt. 001/001', 'Juwartini-karangduwur', '-19.914', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkbpb2000cvpbgaxiqr92u', NULL, NULL, NULL, '2022-12-13 00:00:00.000', '2025-06-24 04:23:10.838'),
('cmazlnz5g0075vp4s7y0esbuu', 'karangduwur@supriyanto', 'Supriyanto', NULL, '62882008594453', 'Karangduwur', 'Supriyanto-karangduwur', '-22.922', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkbpb2000cvpbgaxiqr92u', NULL, NULL, NULL, '2024-07-18 00:00:00.000', '2026-07-13 02:03:05.239'),
('cmazlnz5q0077vp4s973xbz7a', 'kebulusan@8.abas', 'Abbas Kebulusan', NULL, '6281228966663', 'Kebulusan', 'Abas-kebulusan', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkc5oc000dvpbggt0fbr1n', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-01 16:09:19.269'),
('cmazlnz600079vp4szuaq1ovl', '9.irfanbulusan', 'Irfan Kebulusan', NULL, '6288216480373', 'Kebulusan', 'Irfan-kebulusan', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkc5oc000dvpbggt0fbr1n', NULL, NULL, NULL, '2021-12-14 00:00:00.000', '2026-07-11 05:52:04.772'),
('cmazlnz69007bvp4sagqhvjzd', 'klapagada@21.rudi', 'Rudi Klapagada', NULL, '6285700364692', 'Klapagada', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-20 09:17:18.545'),
('cmazlnz6j007dvp4s9j2tdyl6', 'klapagada@ahmadalwi', 'Ahmad Alwi Mudazir', NULL, '6285879257611', 'Klapagada Rt02/01', 'Ahmadalwi-klapagada', '-19.432', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2024-11-13 00:00:00.000', '2026-07-08 03:29:57.257'),
('cmazlnz6t007fvp4s4nt8rfx3', 'klapagada@anggaandisaputra', 'Angga Andi Saputra', NULL, '6281328184404', 'Sruweng Rt04/Rw01', 'Anggabengkelmobil-klapagada', '-24.318', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2024-01-03 00:00:00.000', '2026-07-20 09:12:50.011'),
('cmazlnz72007hvp4s0fm6ubok', 'klapagada@atiamsyah', 'Ati Amsyah', NULL, '6285729821034', 'Klapagada', 'Atiamsyah-klapagada', '-17.710', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-12-03 00:00:00.000', '2025-07-07 11:11:57.280'),
('cmazlnz7b007jvp4slzrfr6fk', 'klapagada@ekasetyowati', 'Eka Setyowati', NULL, '6281327298243', 'Klapagada Rt. 02/01', 'Ekasetyowati-klapagada', '-21.130', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-08-24 00:00:00.000', '2026-07-11 05:56:15.162'),
('cmazlnz7j007lvp4sjth3xigf', 'klapagada@fenywidiyastuti', 'Feny Widiyastuti', NULL, '6285700037775', 'Klapagada Rt. 4/1', 'Fenywidiyastuti-klapagada', '-20.810', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-07-18 00:00:00.000', '2026-07-04 14:13:15.221'),
('cmazlnz7s007nvp4sy1ojgn3w', 'klapagada@fitriaapriliana', 'Fitria Apriliana', NULL, '6285879309503', 'Klapagada Sruweng', 'Fitriaapriliana-klapagada', '-17.672', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2024-02-12 00:00:00.000', '2026-04-16 09:43:07.681'),
('cmazlnz81007pvp4scodgllzc', 'klapagada@jamiatun', 'Jami[Petik]Atun', NULL, '6281325916043', 'Klapagada Rt. 04/01', 'Jamiatun-klapagada', '-25.220', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-09-07 00:00:00.000', '2026-07-11 06:04:35.432'),
('cmazlnz8b007rvp4sgu95axg2', 'klapagada@nurhadiyanto', 'Muhammad Nurhadiyanto', NULL, '6281317873800', 'Klapagada Rt01 Rw02', 'Mnurhadianto-klapagada', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-12-03 00:00:00.000', '2026-07-13 08:57:04.743'),
('cmazlnz8k007tvp4sxzdt4ydl', 'klapagada@noviatie', 'Noviatie Christina', NULL, '6281328275100', 'Klapagada Rt04/01', 'Noviatie-klapagada', '-21.7300', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2025-02-18 00:00:00.000', '2026-07-04 11:46:21.981'),
('cmazlnz8t007vvp4so5s08rvt', 'klapagada@pratignyo', 'Pratignyo', NULL, '6287715352242', 'Klapagada', 'Pratignyo-klapagada', '-24.942', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-11-13 00:00:00.000', '2026-07-10 03:19:29.910'),
('cmazlnz93007xvp4sfy8k39kn', 'klapagada@probohastadi', 'Probo Hastadi', NULL, '6285875333533', 'Klapagada Rt. 4/1', 'Probohastadi-klapagada', '-22.078', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-08-13 00:00:00.000', '2026-04-25 03:49:38.463'),
('cmazlnz9c007zvp4s3nfcfs1z', 'klapagada@sripamungkas', 'Sri Pamungkas', NULL, '6287837994433', 'Klapagada Rt. 002/001', 'Sripamungkas-klapagada', '-18.762', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-07-08 00:00:00.000', '2026-07-07 06:16:25.521'),
('cmazlnz9k0081vp4sjkcbt13y', 'klapagada@supriyanti2', 'Supriyanti2', NULL, '6285701884070', 'Klapagada', 'Supriyati2-klapagada', '-18.790', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2024-04-01 00:00:00.000', '2026-07-10 03:05:57.073'),
('cmazlnz9u0083vp4s1qv7at71', 'klapagada@supriyati', 'Supriyati Hj. Sobar', NULL, '6289652394049', 'Dk. Klapagada Sruweng Rt. 001/001', 'Kosthenita-klapagada', '-19.320', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-02-08 00:00:00.000', '2026-07-10 03:06:31.464'),
('cmazlnza30085vp4sueee137r', 'klapagada@andi', 'Syahid Effendi', NULL, '+62 823-2336-0361', 'Klapagada Rt. 01/01', 'Andi-klapagada', '-8.090', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-09-08 00:00:00.000', '2026-07-02 04:24:21.068'),
('cmazlnzac0087vp4srua8durx', 'klapagada@tohari', 'Tohari', NULL, '6282134711415', 'Klapagada Rt. 01/01', 'Tohari-klapagada', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2023-08-16 00:00:00.000', '2026-07-11 04:36:02.143'),
('cmazlnzak0089vp4snx6vcqxq', 'klapagada@50.uswatun', 'Uswatun Kalapagada', NULL, '6281227577874', 'Klapagada', 'Uswatun-klapagada', '-21.080', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 03:52:10.681'),
('cmazlnzau008bvp4sjclrq1w9', 'klapagada@noviatie2', 'Noviatie Christina', NULL, '6281328275100', 'Klapagada,Sruweng, Rt04/01', 'Noviatie-klapagada', '-21.7300', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2025-03-06 00:00:00.000', '2026-07-04 11:46:41.996'),
('cmazlnzb2008dvp4sspknsysy', 'pagutan@ahmadislahudin', 'Ahmad Islahudin', NULL, '6281359730421', 'Pagutan Rt0201', '-', '-', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-03-26 00:00:00.000', '2026-04-10 12:40:23.554'),
('cmazlnzbb008fvp4sx7zy48n1', 'pagutan@akbar', 'Akbar Pagutan', NULL, '6281218261273', 'Pagutan', 'Akbar-pagutan', '-17.160', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 16:10:32.159'),
('cmazlnzbk008hvp4scsjfa0bk', 'pagutan@arif', 'Arif Pagutan', NULL, '6287732989275', 'Pagutan', 'Arif-pagutan', '-22.366', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2022-04-22 00:00:00.000', '2026-04-10 12:40:51.235'),
('cmazlnzbu008jvp4su1ap26y0', 'pagutan@asrih', 'Asrih Apriyati', NULL, '6282324504466', 'Paguatan Rt0203', 'HTB', '0.000', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2024-11-14 00:00:00.000', '2025-11-26 14:00:40.332'),
('cmazlnzc2008lvp4shh9hm1k5', 'pagutan@baledesa', 'Balaidesa Pagutan', NULL, '6287715152500', 'Pagutan', 'Baldes-pagutan', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-28 00:00:00.000', '2026-07-10 16:14:34.267'),
('cmazlnzd5008nvp4sguvvbfet', 'pagutan@bambangciptadi', 'Bambang Ciptadi', NULL, '6283891342812', 'Pagutan,Rt01/01', 'Bambangciptadi-pagutan', '-21.8000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-02-08 00:00:00.000', '2026-04-10 12:41:19.663'),
('cmazlnzdm008pvp4st6abtmor', 'pagutan@bayu', 'Bhayu Handoyo Aji', NULL, '6283840433499', 'Pagutan', 'Bayu-pagutan', '-27.952', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2022-08-16 00:00:00.000', '2026-04-10 12:41:32.585'),
('cmazlnze8008tvp4sszhxp4kt', 'pagutan@dika', 'Dika Pagutan', NULL, '6282136120813', 'Pagutan', 'Dika-pagutan', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-10 12:41:43.217'),
('cmazlnzei008vvp4s6sytbnlx', 'pagutan@emiyulianti', 'Emi Yulianti', NULL, '62882008515015', 'Sidomulyo Rt0203 Pagutan', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2024-08-01 00:00:00.000', '2026-04-10 12:41:54.872'),
('cmazlnzeq008xvp4s0hf2thxh', 'pagutan@erimulyani', 'Eri Mulyani', NULL, '6282135938576', 'Pagutanrt0201', 'Erimulyani-pagutan', '-19.2820', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-02-07 00:00:00.000', '2026-04-10 12:42:04.300'),
('cmazlnzez008zvp4sp61dcztr', '145001@bufitribidan', 'Fitri Bidan Pagutan', NULL, '6287737794832', 'Pagutan', 'Bufitri-pagutan', '-18.660', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-10 12:42:14.934'),
('cmazlnzf80091vp4sak3gr2pp', '145008@himatupagutan', 'Himatul Ngaliyah', NULL, '6288216147153', 'Pagutan', 'Himatu-pagutan', '-15.544', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-10 12:42:24.383'),
('cmazlnzfh0093vp4sywp8t2pw', 'pagutan@buimah', 'Imah Pagutan', NULL, '6285727905978', 'Pagutan', 'Buimah-pagutan', '-21.308', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-10 12:42:37.674'),
('cmazlnzfr0095vp4szsnufvkr', 'pagutan@daldil', 'Marwiyah Pagutan', NULL, '6287715274110', 'Pagutan', 'Daldil-pagutan', '-20.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-25 00:00:00.000', '2026-04-10 12:42:48.431'),
('cmazlnzg00097vp4s7nbcf9m8', 'pagutan@miftahudin', 'Miftahul Anfaludin', NULL, '6282323342840', 'Sidomulyo Rt. 001/002', 'Miftahudin-pagutan', '-26.022', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2023-06-25 00:00:00.000', '2026-04-10 12:42:58.873'),
('cmazlnzg80099vp4sql9jhqda', 'pagutan@misyadi', 'Misyadi Pagutan', NULL, '6282134356064', 'Pagutan', 'HTB', '0.000', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-10 12:43:07.518'),
('cmazlnzgj009bvp4sm33v0m2c', 'pagutan@mujiono', 'Mujiono', NULL, '62881010650652', 'Pagutan Rt01/02', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2024-09-04 00:00:00.000', '2026-04-10 12:43:16.791'),
('cmazlnzgs009dvp4sbhsqokr1', 'pagutan@nursinggih', 'Nur Singgih St', NULL, '6287732721543', 'Pagutan Sidomulyo', 'Nursinggih-pagutan', '-21.3620', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-02-21 00:00:00.000', '2026-04-10 12:43:25.497'),
('cmazlnzh1009fvp4s569rz3oy', 'pagutan@kadesrois', 'Pak Kades Pagutan', NULL, '628884013544', 'Pagutan', 'Kadesrois-pagutan', '-26.022', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-10 12:43:34.649'),
('cmazlnzhb009hvp4s3e5zfoom', '145002@pakroismatrial', 'Pak Rois Matrial Pagutan', NULL, '6281327342575', 'Pagutan', 'Pakrois-pagutan', '-18.530', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-10 12:43:43.014'),
('cmazlnzhk009jvp4su02q35tu', 'pagutan@parsimin', 'Parsimin', NULL, '6282111613897', 'Sidomulyo 002/003', 'Parsimin-pagutan', '-20.500', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-01-12 00:00:00.000', '2026-07-09 13:19:15.986'),
('cmazlnzht009lvp4shvy1aq2t', 'pagutan@puji', 'Puji Pagutan', NULL, '6281391690405', 'Pagutan', 'Puji-pagutan', '-20.860', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2022-05-30 00:00:00.000', '2026-04-10 12:43:51.342'),
('cmazlnzi2009nvp4sh7wnugyr', 'pagutan@riki', 'Riki Warung Pagutan', NULL, '6281229671610', 'Pagutan', 'Riki-pagutan', '-19.586', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2022-01-02 00:00:00.000', '2026-04-29 23:35:10.856'),
('cmazlnzib009pvp4s0hva0e6v', 'wajasari@Rolan', 'Rolan Wajasari', NULL, '6281391013718', 'Pagutan', 'Rolan-waja', '-20.862', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-01 10:08:53.412'),
('cmazlnzij009rvp4sckz1dzb8', 'pagutan@saryadi', 'Saryadi', NULL, '6282232772934', 'Pagutan Rt. 001/003', 'Saryadi-pagutan', '-26.778', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2023-03-04 00:00:00.000', '2026-04-10 12:44:08.471'),
('cmazlnzis009tvp4sf6u4waey', 'pagutan@sriusmani', 'Sri Usmani', NULL, '6281336154655', 'Sidomulyo Rt0102', 'Sriusmani-pagutan', '-22.752', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2024-05-03 00:00:00.000', '2026-04-10 12:44:17.103'),
('cmazlnzj1009vvp4skuc6noyp', 'pagutan@supriyanto', 'Supriyanto', NULL, '6283156945303', 'Pagutan', 'Supriyanto-karangduwur', '-22.922', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2022-07-31 00:00:00.000', '2026-04-10 12:44:25.883'),
('cmazlnzjd009xvp4sae1ylqio', 'wajasari@buumi', 'Umi Wajasari', NULL, '6282138547270', 'Pagutan', 'Buumi-waja', '-20.458', 0, 'SUSPENDED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-03 23:03:27.130'),
('cmazlnzjm009zvp4s232uff15', 'pagutan@yani', 'Yani Glombong', NULL, '6281212703503', 'Pagutan', 'HTB', '0.000', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2023-11-13 00:00:00.000', '2026-04-10 12:44:53.344'),
('cmazlnzjv00a1vp4sp1eseh2l', 'pagutan@yulianto', 'Yulianto', NULL, '6288221123262', 'Sidomulyo Rt0201 Pagutan', 'Yulianto-pagutan', '-18.666', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2024-08-02 00:00:00.000', '2026-04-10 12:45:03.092'),
('cmazlnzk500a3vp4sklvzjs6d', 'wajasari@bumurli', 'Ibu Murli Wajasari', NULL, '6285727512001', 'Pagutan', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-10 12:53:55.520');
INSERT INTO `customer` (`id`, `username`, `fullname`, `email`, `phoneNumber`, `address`, `ontName`, `redamanOlt`, `diskon`, `status`, `paketId`, `areaId`, `odpId`, `modemId`, `oltId`, `createdAt`, `updatedAt`) VALUES
('cmazlnzke00a5vp4sditd7e45', 'sidoharjo@deni', 'Deni Sidoharjo', NULL, '62895380044067', 'Sidoharjo', 'Deni-sidoharjo', '-12.932', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 03:26:50.725'),
('cmazlnzkn00a7vp4s64jehqi1', 'sidoharjo@nurwachid2', 'Nur Wachid', NULL, '6281392251444', 'Sidoharjo Depan Sd2', 'Wahidtoko-sidoharjo', '-4.852', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2024-11-13 00:00:00.000', '2025-11-02 10:23:26.440'),
('cmazlnzkw00a9vp4sh4yjeq03', 'sidoharjo@32.supriyo', 'Supriyo Sidoharjo', NULL, '6285328212000', 'Sidoharjo', 'Supriyo-sidoharjo', '-13.812', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 05:24:51.628'),
('cmazlnzl400abvp4s1gmcewkq', 'sidoharjo@bondanyuliono', 'Bondan Yuliono', NULL, '62895423388822', 'Sidoharjo Rt05/01', 'Bondanyuliono-sidoharjo', '-21.670', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2024-03-03 00:00:00.000', '2026-07-10 03:35:48.315'),
('cmazlnzlf00advp4s119xdaev', 'sidoharjo@catur', 'Catur Junianto', NULL, '6288980141369', 'Sidoharjo Rt04/01', 'Catur-sidoharjo', '-12', 15000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2025-05-20 00:00:00.000', '2026-07-08 03:42:11.542'),
('cmazlnzlq00afvp4siyiirz4d', 'sidoharjo@darmanto', 'Darmanto', NULL, '6283813178885', 'Sidoharjosruweng', '-', '-', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2025-04-25 00:00:00.000', '2025-11-26 14:00:51.417'),
('cmazlnzm000ahvp4sh6vc60rh', 'sidoharjo@liliiswahyuni', 'Lili Iswahyuni', NULL, '62895391919608', 'Sidoharjo', 'Liliswahyuni-sidoharjo', '-24.942', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2024-08-03 00:00:00.000', '2026-07-11 05:48:13.325'),
('cmazlnzma00ajvp4s0b6wo7ty', 'sidoharjo@mardiyono', 'Mardiyono', NULL, '62895608850883', 'Sidoharjo', 'Mardiyono-sidoharjo', '-20.458', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2023-09-15 00:00:00.000', '2026-07-08 03:30:46.846'),
('cmazlnzmk00alvp4sa28l0sfv', 'sidoharjo@miharso', 'Miharso Sidoharjo', NULL, '6282322915877', 'Desa Sidoharjo Rt. 006/001', 'Miharso-sidoharjo', '-19.414', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2022-11-08 00:00:00.000', '2026-05-21 16:08:59.836'),
('cmazlnzmu00anvp4svu71uf6t', 'sidoharjo@nafingatun', 'Nafingatun', NULL, '+62 882-1605-0285', 'Soka Kidul Rt. 02/02', 'Nafingatun-sidoharjo', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2023-08-24 00:00:00.000', '2026-05-01 14:44:37.236'),
('cmazlnzn300apvp4s1sb7uyk8', 'sidoharjo@pakasep', 'Pak Asep', NULL, '6281212342824', 'Sidoharjo', 'Pakasep-sidoharjo', '-9', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2023-09-23 00:00:00.000', '2026-04-16 09:53:07.804'),
('cmazlnznc00arvp4s2swko0j8', 'sidoharjo@rengku', 'Rengku Sidoharjo', NULL, '6285943516903', 'Sidoharjo', 'Rengku-sidoharjo', '-20.672', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-16 09:40:59.130'),
('cmazlnznk00atvp4s96ullrdq', 'sidoharjo@rezaajis', 'Reza Aji Saputra', NULL, '62895388490931', 'Kebanaran Rt. 3/1', 'Rezaajiz-sidoharjo', '-10.262', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2023-07-28 00:00:00.000', '2026-07-20 09:09:12.901'),
('cmazlnznt00avvp4s3yh8q0rw', 'sidoharjo@rudiharto', 'Rudi Harto', NULL, '62882007520439', 'Sidoharjo Rt. 002/002', 'Rudiharto-sidoharjo', '-17.970', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2023-07-13 00:00:00.000', '2026-07-04 11:44:58.910'),
('cmazlnzoc00azvp4sitxshb7s', 'sidoharjo@sriwahyuni', 'Sriwahyuni', NULL, '62882008213069', 'Sidoharjo Rt03/01', 'Sriwahyuni-sidoharjo', '-14.3020', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2025-02-07 00:00:00.000', '2026-06-17 11:34:34.330'),
('cmazlnzol00b1vp4sjia3nsz2', 'sidoharjo@turiman', 'Turiman', NULL, '6287732586487', 'Sidoharjo Rt. 003/01', 'Turiman-sidoharjo', '-16.320', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2023-07-22 00:00:00.000', '2026-07-20 09:17:52.959'),
('cmazlnzou00b3vp4sdbdqh4e2', 'sidoharjo@tunggul', 'Tunggul Banaran', NULL, '6283863047161', 'Sidoharjo', 'Tunggul-sidoharjo', '-7.826', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 09:02:24.621'),
('cmazlnzp300b5vp4sm9seywzz', 'sidoharjo@20.wahid', 'Wahid Yulianto', NULL, '6281391536263', 'Sidoharjo', 'Wahid-sidoharjo', '-14.412', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-11 06:38:52.249'),
('cmazlnzpb00b7vp4ssj8onjab', 'sidoharjo@nanang', 'Nanang Sidoharjo', NULL, '+62 882-9573-0118', 'Sidoharjo', 'Nanang-sidoharjo', '-4.580', 25000, 'ACTIVE', 'cmazjsfz40002vpbgwyegkqec', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-14 13:47:51.306'),
('cmazlnzpj00b9vp4shbpszs3v', 'sokalor@34.pakagus', 'Agus Sokalor', NULL, '6289603348593', 'Soka Lor', 'Pakagus-sokalor', '-23.560', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 05:05:50.230'),
('cmazlnzps00bbvp4sbxdwpgsy', 'klapagada@esti', 'Esti Klapagada', NULL, '6282324438332', 'Soka Lor', 'Esti-klapagada', '-24.816', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-11 07:16:55.507'),
('cmazlnzq200bdvp4sos8ox99m', 'sokalor@40.kajiito', 'H. Wasito M', NULL, '6281542957359', 'Soka Lor', 'H.Ito-sokalor', '-11.238', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-04 11:49:36.404'),
('cmazlnzqb00bfvp4s2x70ml6d', 'sokalor@nurhadi', 'Nur Hadi Sokalor', NULL, '62895364201407', 'Soka Lor', 'Nurhadi-sokalor', '-20.362', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 05:36:32.898'),
('cmazlnzqm00bhvp4swlwua1n5', 'sokalor@oki', 'Oki Sokalor', NULL, '6289603348593', 'Soka Lor', 'Oki-sokalor', '-25.852', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 05:07:20.926'),
('cmazlnzqu00bjvp4s7pusi6db', 'sokalor@sihar', 'Sihar Sokalor', NULL, '6285291340727', 'Soka Lor', 'Sihar-sokalor', '-24.560', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-11 07:23:11.495'),
('cmazlnzr300blvp4sf1ygsc5z', 'sokalor@acengkrupuk', 'Aceng Krupuk Sokalor', NULL, '6281914348537', 'Soka Lor', 'Aceng-sokalor', '-25.852', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 05:08:29.672'),
('cmazlnzrb00bnvp4szf350swd', 'sokalor@agustina', 'Agustina Hesti Setyaningsih', NULL, '62895415605364', 'Sokalor Rt02/02', 'Agustina-sokalor', '-23.970', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2024-09-17 00:00:00.000', '2026-07-11 08:20:30.611'),
('cmazlnzrk00bpvp4sybmiv7f1', 'sokalor@45.elisa', 'Elisa Kedai Sokalor', NULL, '6287863562497', 'Soka Lor', 'Elisa-sokalor', '-12.682', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2025-07-11 11:15:35.445'),
('cmazlnzrs00brvp4s0vx9d39r', 'sokalor@nurkhalifah', 'Nur Khafiyah', NULL, '62895382732145', 'Soka Lor', 'Nurkhafiyah-sokalor', '-19.470', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2024-08-15 00:00:00.000', '2026-04-16 09:40:50.393'),
('cmazlnzs100btvp4sfbb51k6f', 'sokalor@sarwono', 'Sarwono', NULL, '6289524601201', 'Sokalor Rt01/02', '-', '-', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2025-04-13 00:00:00.000', '2026-04-16 09:41:06.589'),
('cmazlnzsb00bvvp4su32twtgl', 'sokalor@busisul', 'Sisul/Edi Purwanto', NULL, '6281809095159', 'Soka Lor', 'Busisul-sokalor', '-19.042', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2022-01-13 00:00:00.000', '2026-07-10 03:38:02.565'),
('cmazlnzsk00bxvp4su8dyqfiv', 'sokalor@sitithoimah', 'Siti Thoimah', NULL, '6283120423327', 'Soka Lor', 'Sitithoimah-sokalor', '-23.872', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2023-12-12 00:00:00.000', '2026-07-06 10:15:34.571'),
('cmazlnzss00bzvp4sdq6on6ei', 'sokalor@sumarno', 'Sumarno', NULL, '6282324447183', 'Soka Lor', 'Sumarno-sokalor', '-20.800', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2024-03-09 00:00:00.000', '2026-04-16 09:41:14.359'),
('cmazlnzt200c1vp4suwjlkzd3', 'sokalor@suwarni', 'Suwarni', NULL, '6285900314374', 'Sokalor Rt. 002 / 002', 'Suwarni-sokalor', '-26.778', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2023-04-03 00:00:00.000', '2026-07-11 05:09:22.714'),
('cmazlnztc00c3vp4s29ramlq2', 'skt@anik', 'Anik Ngatoillah', NULL, '6281568388809', 'Soka Tengah', 'Anik-skt', '-22.442', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-13 06:06:34.263'),
('cmazlnztl00c5vp4sqhev7wzs', 'skt@basir', 'Basir', NULL, '6285726490100', 'Soka Tengah', 'Basir-skt', '-18.478', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 03:44:24.385'),
('cmazlnztu00c7vp4s85h2t7u1', 'skt@jirah', 'Jirah Skt', NULL, '+62 851-8264-0294', 'Skt Rt01/03', 'Jirah-skt', '-20.220', 60000, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2024-10-31 00:00:00.000', '2026-07-11 05:16:40.127'),
('cmazlnzu200c9vp4s42jqk61x', 'skt@12.muflih', 'Muflih', NULL, '6285325063411', 'Soka Tengah', 'Muflih-skt', '-17.190', 71500, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 11:59:01.246'),
('cmazlnzub00cbvp4s181i8tja', 'skt@nurwachid', 'Nurwachid', NULL, '6281227682366', 'Soka Tengah', 'Wahid-skt', '-24.560', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2022-04-16 00:00:00.000', '2026-03-18 05:00:44.084'),
('cmazlnzuk00cdvp4s2skccbaz', 'skt@oki', 'Oki Saputra', NULL, '62895410655055', 'Soka Tengah', 'Oki-skt', '-21.806', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2022-05-09 00:00:00.000', '2026-07-07 01:42:35.832'),
('cmazlnzus00cfvp4syiqxcyt4', 'skt@27.seno', 'Sandi Ong', NULL, '6288227534106', 'Soka Tengah', 'Sandi-skt', '-22.926', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 03:43:32.788'),
('cmazlnzv100chvp4sgqpf10wj', 'skt@sugeng', 'Sugeng Yunianto', NULL, '6281382512612', 'Soka Tengah', 'Sugeng-skt', '-18.796', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 03:21:30.800'),
('cmazlnzva00cjvp4sjdg2s4dv', 'skt@tanti', 'Tanti', NULL, '62895610316023', 'Soka Tengah', 'Tanti-skt', '-21.676', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 11:57:36.008'),
('cmazlnzvk00clvp4sl4bwo4bt', 'skt@asngadi', 'Aprilia Rizkiani/Asngadi', NULL, '6285781000960', 'Soka Tengah', 'Asngadi-skt', '-19.432', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2022-10-05 00:00:00.000', '2026-07-13 09:01:38.624'),
('cmazlnzvt00cnvp4sagdhd4jl', 'skt@devina', 'Devina/Sitinuriyah', NULL, '628813981044', 'Sruweng Rt. 002/003', 'Vina-skt', '-17.352', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2023-01-01 00:00:00.000', '2026-07-10 03:09:03.610'),
('cmazlnzw300cpvp4svjdlldhq', 'skt@dwimasriyani', 'Dwi Masriyani', NULL, '+62 851-6974-3790', 'Skt Rt02/3', '-', '-', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-04-20 00:00:00.000', '2026-07-08 03:50:49.111'),
('cmazlnzwf00crvp4sujuvan8p', 'skt@ojan', 'H. Amir Ojan', NULL, '6285327730441', 'Soka Tengah', 'Ojan-skt', '-13.778', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 03:43:00.874'),
('cmazlnzwo00ctvp4sne8xe7kc', 'skt@kajimahfud', 'H. Mahfud', NULL, '6285726597510', 'Soka Tengah', 'HMahfud-skt', '-22.292', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2022-04-16 00:00:00.000', '2026-07-10 03:43:34.085'),
('cmazlnzwx00cvvp4sq6m7pxuz', 'skt@ispriyani', 'Ispriyani', NULL, '6281390864198', 'Skt Rt01/03', 'Ispriyani-skt', '	 -17.1400', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-02-16 00:00:00.000', '2026-07-10 03:45:17.485'),
('cmazlnzx800cxvp4s6xyim19b', 'skt@iwan', 'Iwan Haryanto', NULL, '6285310090100', 'Skt Rt01/01', 'Iwan-skt', '-23.872', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-01-04 00:00:00.000', '2026-06-11 06:29:14.901'),
('cmazlnzxi00czvp4s5hziir2u', 'skt@kartika', 'Kartika Indah Sari', NULL, '6285166483644', 'Rumah', 'Ayu-skt', '-17.420', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2023-09-24 00:00:00.000', '2026-07-11 05:04:19.810'),
('cmazlnzxr00d1vp4sfy3c5kw1', 'skt@pamanhamid', 'Khamid', NULL, '6281804843451', 'Soka Tengah', 'Pamankhamid-skt', '-27.692', 55000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2024-03-01 00:00:00.000', '2026-07-20 08:01:22.342'),
('cmazlnzy100d3vp4szi36grks', 'skt@zaldi', 'Kris Andar', NULL, '6281228795556', 'Soka Tengah', 'Zaldi-skt', '-19.830', 15000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 03:28:29.129'),
('cmazlnzyb00d5vp4swu037mh5', 'skt@aldifarel', 'Kusmiyati', NULL, '6281282137318', 'Soka Tengah', 'Samil-skt', '-14.710', 65000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2022-07-02 00:00:00.000', '2026-06-04 16:01:51.310'),
('cmazlnzyk00d7vp4sypve5spp', 'skt@latif', 'Latif Abdul Jalil', NULL, '6285750198193', 'Skt Rt02/03', 'Latif-skt', '-14.522', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-01-29 00:00:00.000', '2026-07-08 03:36:55.316'),
('cmazlnzyt00d9vp4sdsfpplle', 'mei@skt', 'Meiby Ranni', NULL, '6281292680377', 'Soka Tengah', 'Mei-skt', '-25.688', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2024-09-24 00:00:00.000', '2026-07-10 03:30:11.917'),
('cmazlnzz200dbvp4sa4awux29', 'skt@udin', 'Miftakhudin', NULL, '628979825751', 'Skt Rt01/01', 'Udin-skt', '-24.310', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-01-04 00:00:00.000', '2026-06-30 13:58:12.996'),
('cmazlnzzb00ddvp4s67hzqnfe', 'skt@munasir', 'Mokhamad Munasir', NULL, '6289611141736', 'Soka Tengah', 'Nasir-skt', '-26.380', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2024-05-06 00:00:00.000', '2026-03-13 05:59:52.871'),
('cmazlnzzj00dfvp4sam71hxwr', 'skt@mwcsruweng', 'Mwc Sruweng', NULL, '6281392187177', 'Skt Rt02/03', 'MWC-skt', '0.000', 0, 'SUSPENDED', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2024-11-25 00:00:00.000', '2026-07-20 09:40:49.078'),
('cmazlnzzr00dhvp4sglyedm0a', 'skt@nimah', 'Nihayatun Ni Mah', NULL, '62895363269949', 'Soka Tengah', 'Nimah-skt', '-23.970', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2022-06-03 00:00:00.000', '2026-07-02 05:34:30.141'),
('cmazlnzzz00djvp4sh5ywz1vp', 'skt@nining', 'Nining Skt', NULL, '6289630384142', 'Soka Tengah', 'Nining-skt', '-23.468', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-17 03:27:26.483'),
('cmazlo00800dlvp4stdre4ky8', 'skt@nisa', 'Nisa', NULL, '6288214812132', 'Soka Tengah', 'Nisa-skt', '-14.882', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2022-04-30 00:00:00.000', '2026-07-20 09:16:12.421'),
('cmazlo00i00dnvp4ssi72c9n2', 'skt@ofisetiyawati', 'Ofi Setiyawati', NULL, '6285712604665', 'Skt', 'Ofisetiawati-skt', '-27.696', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2024-01-01 00:00:00.000', '2026-07-03 10:42:56.240'),
('cmazlo00s00dpvp4ssg5yupcg', 'pagutan@parsiti', 'Parsiti', NULL, '6281391846537', 'Pagutan Rt02/03', 'Parsiti-pagutan', '-24.43', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-02-12 00:00:00.000', '2026-04-10 12:45:11.536'),
('cmazlo01200drvp4sbm0sghxp', 'skt@bunaji', 'Salis Husnan', NULL, '62895364102498', 'Soka Tengah', 'Bunaji-skt', '-20.862', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2022-08-04 00:00:00.000', '2026-07-11 05:15:11.881'),
('cmazlo01b00dtvp4siko5zjpi', 'skt@samsun2', 'Samsun2', NULL, '6281327088890', 'Skt Rt0101', '-', '-', 45000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-01-13 00:00:00.000', '2026-06-18 15:32:58.675'),
('cmazlo01k00dvvp4sjtbsblei', 'skt@sitimarwati', 'Siti Marwati Indriyani', NULL, '08817620774', 'Skt Rt02/03', 'Sitimawarti-skt', '-21.542', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-01-04 00:00:00.000', '2026-07-02 04:27:54.270'),
('cmazlo01u00dxvp4s5hl7hnpw', '2.busitinurendah', 'Siti Nurendah', NULL, '+62 813-2733-5733', 'Soka Tengah', 'Buratmin-skt', '-21.612', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-04 11:50:20.407'),
('cmazlo02600dzvp4sm3knlh5u', 'karanggedang@sukowaluyo', 'Suko Waluyo', NULL, '6282220100473', 'Karanggedang Rt02/03', 'Sukowaluyo-karanggedang', '-18.532', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-01-19 00:00:00.000', '2026-07-11 05:31:35.170'),
('cmazlo02f00e1vp4spifezblt', 'skt@mbabeti', 'Wiwit Nurbaeti', NULL, '6281227454966', 'Sokatengah 2/3 Desa Sruweng', 'Beti-skt', '-20.556', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2023-06-16 00:00:00.000', '2025-07-11 11:15:14.515'),
('cmazlo02n00e3vp4s4kc80fe6', 'skt@52.samsulmaarif', 'Samsun Marif', NULL, '6281327088890', 'Soka Tengah', 'Samsun-skt', '-21.806', 0, 'TERMINATED', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-01-25 13:18:31.188'),
('cmazlo02x00e5vp4sh7epv1jd', 'karanggedang@iqbaltawakal', 'Ikbal Tawakal', NULL, '6281380947951', 'Karanggedang Depan Yunani', '-', '-', 0, 'ACTIVE', 'cmazjsfz40003vpbgli3sqfuy', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-02-12 00:00:00.000', '2026-07-08 03:44:24.994'),
('cmazlo03700e7vp4sjg9zf0br', 'sruweng@3.dembong', 'Aan Dembong Sruweng', NULL, '62895360701817', 'Sruweng', 'HTB', '0.000', 10000, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-03-11 13:06:15.670'),
('cmazlo03h00e9vp4suowf8xik', 'sruweng@5.warnet', 'Queen Warnet Sruweng', NULL, '6285291300570', 'Sruweng', 'Warnet-sruweng', '0.000', 10000, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-13 05:30:42.327'),
('cmazlo03r00ebvp4sqqxh4whr', 'sruweng@sulis', 'Sulis Sruweng', NULL, '62895360701817', 'Sruweng', 'HTB', '0.000', 10000, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-13 05:29:19.048'),
('cmazlo04000edvp4sph4onykb', 'sruweng@4.kempling', 'Supri Kempling', NULL, '62895360701817', 'Sruweng', 'HTB', '0.000', 10000, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-04-08 04:57:57.850'),
('cmazlo04a00efvp4szuwkluyc', 'sruweng@baledesa', 'Balaidesa Sruweng', NULL, '6282140527820', 'Jl. Raya Sruweng No. 114 Sruweng', 'Baledesa-sruweng', '-25.850', 35000, 'ACTIVE', 'cmazjsfz40003vpbgli3sqfuy', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2022-07-01 00:00:00.000', '2026-07-06 04:00:48.209'),
('cmazlo04k00ehvp4s83vccuqj', 'karanggedang@andi', 'Andi Kurniawan', NULL, '6289610365036', 'Karanggedang Rt01/02', 'Andi-karanggedang', '-24.310', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2024-11-11 00:00:00.000', '2025-11-26 14:01:13.536'),
('cmazlo04u00ejvp4sx5yfies5', 'sruweng@hayyu', 'Hayyu Khanifudin', NULL, '6289502527744', 'Sruweng Rt01/04', 'Hayyu-sruweng', '-12.120', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2024-07-11 00:00:00.000', '2026-07-07 12:29:04.874'),
('cmazlo05400elvp4sd1rkkmgp', 'karanggedang@iman', 'Iman Santoso', NULL, '085169950165', 'Karanggedang', 'Iman-karanggedang', '-27.214', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2024-10-27 00:00:00.000', '2026-05-06 03:54:47.409'),
('cmazlo05e00envp4s18zhueu2', 'sruweng@inggritperumahan', 'Inggrit', NULL, '6285231287375', 'Sruweng,Perumahan,', '-', '-', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2025-03-13 00:00:00.000', '2026-07-11 06:09:27.331'),
('cmazlo05n00epvp4sj834j1tj', 'sruweng@2.koramil', 'Koramil Sruweng', NULL, '6281339153684', 'Sruweng', 'Koramil-sruweng', '-17.4480', 15000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-04 08:56:46.562'),
('cmazlo05w00ervp4sdtjiynwi', 'sruweng@rahmat', 'Rahmat Feri Yanto', NULL, '6282136477738', 'Karanggedang', 'Rahmatbengkel-karanggedang', '-24.816', 0, 'SUSPENDED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2023-11-03 00:00:00.000', '2026-06-13 06:11:51.050'),
('cmazlo06500etvp4seypx8czr', 'sruweng@ratno', 'Ratno', NULL, '6281328201218', 'Sruweng,Rt03,Rw02', 'Ratno-sokalor', '-19.872', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2024-01-08 00:00:00.000', '2026-05-15 06:11:36.205'),
('cmazlo06f00evvp4soivj5tu1', 'karanggedang@rayung', 'Rayungsasi Ns', NULL, '6285975030447', 'Karanggedang Rm Yunani', '-', '-', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2025-05-02 00:00:00.000', '2026-04-16 09:41:21.432'),
('cmazlo06p00exvp4s656mh2yx', 'sruweng@sopari', 'Sopari', NULL, '6287732911866', 'Sruweng', 'Sopari-karanggedang', '-21.130', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2023-11-03 00:00:00.000', '2026-07-11 05:32:34.881'),
('cmazlo06z00ezvp4svniyf5j9', 'sruweng@6.karsono', 'Karsono', NULL, '6287797994114', 'Sruweng', 'Karsono-sruweng', '-24.942', 45000, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2022-03-01 00:00:00.000', '2026-07-13 09:01:05.444'),
('cmazlo07800f1vp4s6szr2ni7', 'sruweng@sitirinawati', 'Siti Rinawati', NULL, '087876141644', 'Karanggedang', 'Sitirinawati-karanggedang', '-24.682', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2023-11-25 00:00:00.000', '2026-07-20 09:10:55.769'),
('cmazlo07h00f3vp4swpm6151c', 'manggal@gangHK', 'Aam Gang Hk', NULL, '6285612345678', 'Temanggal', 'Aamganghk-manggal', '-20.706', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 23:52:44.532'),
('cmazlo07r00f5vp4s00sg0np4', 'manggal@agus', 'Agus Manggal', NULL, '6285612345678', 'Temanggal', 'Agus-manggal', '-18.010', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:58:58.154'),
('cmazlo08000f7vp4s3p9yvfma', '1430304@jijat', 'Al Mukjizat', NULL, '6287728540500', 'Temanggal', 'Jijat-manggal', '-28.862', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 23:52:13.662'),
('cmazlo08a00f9vp4s2lewlnkf', 'sugran@amad', 'Amad Manggal', NULL, '6285612345678', 'Temanggal', 'Amad-sugran', '-28.540', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:59:26.814'),
('cmazlo08j00fbvp4s9wilk5tn', '16.arifmanggal', 'Arif Manggal', NULL, '6285612345678', 'Temanggal', 'Arif-manggal', '-21.420', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:58:42.153'),
('cmazlo08t00fdvp4slmha53pe', '1430305@aris', 'Aris Manggal', NULL, '6285612345678', 'Temanggal', 'Aris-manggal', '-23.460', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 23:51:33.233'),
('cmazlo09200ffvp4sa0bmgj14', 'manggal@39.kaumboing', 'Boing Nur S Kaum Sugran', NULL, '6285740014661', 'Temanggal', 'Kaumboing-sugran', '-21.550', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-12 04:06:32.214'),
('cmazlo09j00fhvp4syx5imkr7', 'sugran@defri', 'Defri Sugran', NULL, '6285612345678', 'Temanggal', 'Defri-sugran', '-27.692', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:59:14.096'),
('cmazlo09t00fjvp4syr53iooh', '39.handinikaumsugran', 'Handini Kaumsugran', NULL, '6285612345678', 'Temanggal', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-12 04:06:45.439'),
('cmazlo0a200flvp4sd9ter8o5', 'karang@jono', 'Jono Karang', NULL, '6285612345678', 'Temanggal', 'Jono-karang', '-29.202', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 13:47:33.828'),
('cmazlo0ab00fnvp4s7v7abbht', 'manggal@juli', 'Juli Manggal', NULL, '6285612345678', 'Temanggal', 'Juli-manggal', '-24.814', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 23:52:56.832'),
('cmazlo0ak00fpvp4snpbbfpj3', '50016@manggalmudiharso', 'Mudiharso Manggal', NULL, '6285612345678', 'Temanggal', 'Mudiharso-manggal', '-20.000', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-07 01:10:11.286'),
('cmazlo0at00frvp4sietkp6he', 'manggal@8.nasim', 'Nasim Manggal', NULL, '62856123456789', 'Temanggal', 'Nasim-manggal', '-20.000', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-12 04:06:57.783'),
('cmazlo0b200ftvp4slnvtfnpq', 'manggal@nurut', 'Nurut Manggal', NULL, '628512345678', 'Temanggal', 'Nurut-manggal', '-16.758', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-12 04:07:07.347'),
('cmazlo0bb00fvvp4st8974sdb', 'manggal@rasman', 'Rasmanto Manggal', NULL, '6285612345678', 'Temanggal', 'Rasman-manggal', '-23.012', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-01 23:28:07.747'),
('cmazlo0bk00fxvp4s1vst0e7s', '1430303@sarmin', 'Sarmin Manggal', NULL, '6285612345678', 'Temanggal', 'Sarmin-manggal', '-24.090', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-07 12:59:58.481'),
('cmazlo0bu00fzvp4sakez0oel', 'manggal@singgih', 'Singgih Manggal', NULL, '6285612345678', 'Temanggal', 'Singgih-manggal', '-20.706', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 04:11:57.193'),
('cmazlo0c300g1vp4s6vjuegqe', 'manggal@juleha', 'Siti Juleha', NULL, '6285612345678', 'Temanggal', 'Juleha-manggal', '-23.768', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 07:09:25.951'),
('cmazlo0cd00g3vp4slq8nbmam', 'manggal@slamet', 'Slamet Manggal', NULL, '6285612345678', 'Temanggal', 'Slamet-manggal', '-14.896', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 13:27:17.166'),
('cmazlo0cm00g5vp4sci6fpjq7', 'sugran@bakir', 'Subakir Manggal', NULL, '6285612345678', 'Temanggal', 'Bakir-manggal', '-23.810', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-01 11:00:46.294'),
('cmazlo0cu00g7vp4sfn4s6j8t', '4.sugengmanggal', 'Sugeng Manggal', NULL, '62895393533664', 'Temanggal', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 23:50:38.318'),
('cmazlo0d300g9vp4s4gt2p46y', '143005@sumarjo', 'Sumarjo Manggal', NULL, '6281528652169', 'Temanggal', 'Sumarjo-manggal', '-21.550', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-12 04:07:19.147'),
('cmazlo0dc00gbvp4s0p0foyvg', 'karang@31.suprapti', 'Suprapti Manggal', NULL, '6285612345678', 'Temanggal', 'Suprapti-karang', '-19.862', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 23:53:12.717'),
('cmazlo0dk00gdvp4sxjv1iep6', 'manggal@sutris', 'Sutrisno Manggal', NULL, '6285612345678', 'Temanggal', 'Sutris-manggal', '-30.622', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:59:54.330'),
('cmazlo0dt00gfvp4sg0jv8bmy', 'sugran@waljinah', 'Waljinah', NULL, '6285612345678', 'Temanggal', 'Waljinah-sugran', '-23.980', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:59:39.263'),
('cmazlo0e200ghvp4sjl5s3sgc', 'sugran@watini', 'Watini', NULL, '6285612345678', 'Temanggal', 'Watini-sugran', '-27.696', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-06 01:11:59.864'),
('cmazlo0ec00gjvp4st8dgrau4', '30.yanigigih', 'Yani Gigih Manggal', NULL, '6285612345678', 'Temanggal', 'Yani-sugran', '-17.570', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 02:08:26.406'),
('cmazlo0ek00glvp4so2w0jj6r', 'manggal@abdulkhusni', 'Abdul Khusni', NULL, '6281228110827', 'Temanggal', 'Abdulkhusni-manggal', '-18.448', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-12-11 00:00:00.000', '2026-07-09 05:01:37.523'),
('cmazlo0eu00gnvp4sh8f2pubo', 'manggal@achmadnurkhozin', 'Achmad Nur Khozin', NULL, '6281390888820', 'Temanggal Rt.', 'Achmadnurkhozin-manggal', '-30.000', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-08-02 00:00:00.000', '2026-07-09 23:55:57.447'),
('cmazlo0f200gpvp4sgwfd5msv', 'manggal@hari', 'Agus Hariadi', NULL, '6285799653242', 'Temanggal', 'Hari-manggal', '-16.056', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-06-20 00:00:00.000', '2026-07-09 23:54:03.030'),
('cmazlo0fb00grvp4syyvmvp9j', 'karang@agussyarifudin', 'Agus Syarifudin', NULL, '62895342760776', 'Temanggal', 'Agussyarifudin-karang', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-01-15 00:00:00.000', '2026-07-07 05:44:52.373'),
('cmazlo0fl00gtvp4su89dbzl8', 'manggal@ahmadnurokhman', 'Ahmad Nurokhman', NULL, '6283861581594', 'Temanggal', 'Ahmadnurokhman-manggal', '-24.318', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-06-01 00:00:00.000', '2026-07-09 13:26:35.206'),
('cmazlo0fu00gvvp4sx1tfqq9m', 'manggal@ahmadzaenul', 'Ahmad Zaenul Muttaqin', NULL, '6283836560787', 'Temanggal, Rt02/02', 'Ahmadzaenul-manggal', '-24.682', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-04-01 00:00:00.000', '2026-07-07 13:01:21.405'),
('cmazlo0g300gxvp4siyfebv4j', 'joho@akhmadmustakim', 'Akhmad Mustakim', NULL, '628978142890', 'Joho, Rt01/01', 'Akhmadmustakim-joho', '-23.092', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-04-13 00:00:00.000', '2026-07-12 04:07:34.273'),
('cmazlo0gc00gzvp4s54puwopc', 'manggal@alfianferigitya', 'Alfian Ferigitya Damara', NULL, '6285327100947', 'Temanggal Rt04/01', 'Alfianferigitya-manggal', '-26.990', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-02-04 00:00:00.000', '2026-07-09 23:58:46.952'),
('cmazlo0gk00h1vp4sy2022081', 'wajasari@anggisasmitadewi', 'Anggi Sasmita Dewi', NULL, '6281227744435', 'Wajasari,Rt01/03', 'Anggi-wajasari', '-20.364', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-12-22 00:00:00.000', '2026-07-09 02:58:15.470'),
('cmazlo0gu00h3vp4s2dm5tp4z', '32.anggit', 'Anggit Manggal', NULL, '6281222823000', 'Temanggal', 'Anggit-manggal', '-25.088', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-01 04:49:22.311'),
('cmazlo0h300h5vp4s8ws075vu', 'manggal@aridwiyama', 'Ari Dwi Yama', NULL, '122331125553', 'Temanggal', 'Arif-sugran', '-18.762', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-07-05 00:00:00.000', '2026-07-11 13:45:59.833'),
('cmazlo0hc00h7vp4sm6nsx1cp', 'karang@arifpambudi', 'Arif Pambudi', NULL, '6285212678016', 'Karang', 'Arifpambudi-karang', '-21.420', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-07-07 00:00:00.000', '2026-07-11 13:44:50.609'),
('cmazlo0hl00h9vp4swzwfuwf7', 'skt@liktika', 'Atika Ulfah', NULL, '6285880843740', 'Sruweng,Skt', 'Liktika-skt', '-22.926', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-03-11 00:00:00.000', '2026-07-10 07:44:36.569'),
('cmazlo0ht00hbvp4sarhqp025', 'manggal@sutanto', 'Awaludinsutanto', NULL, '6281296869528', 'Temanggal Timur Rt0102', 'Sutanto-manggal', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-12-06 00:00:00.000', '2026-07-09 09:27:43.728'),
('cmazlo0i300hdvp4sa9i88uie', 'manggal@budiariyanto', 'Budi Ariyanto', NULL, '6283151688312', 'Temanggal Ry. 04/01', 'Budiariyanto-manggal', '-22.872', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-11-13 00:00:00.000', '2026-07-01 11:02:15.785'),
('cmazlo0ib00hfvp4s2dl5fcyl', '35.dedesugran', 'Dede Sugran', NULL, '6285612345678', 'Temanggal', 'Dede-sugran', '-20.316', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-12 04:07:50.130'),
('cmazlo0ik00hhvp4s6hmv78c5', 'manggal@devi', 'Devi Riyani Anggaita', NULL, '6285713912826', 'Manggal Rt0402Modem Gm220-S', 'Devi-manggal', '-20.550', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-10-06 00:00:00.000', '2026-07-08 11:54:22.451'),
('cmazlo0j100hlvp4svaflp88d', 'manggal@ekalina', 'Eka Lina Lianasari', NULL, '6281210614696', 'Temanggal', 'Ekalina-karang', '-25.220', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-06-02 00:00:00.000', '2026-07-11 13:44:30.796'),
('cmazlo0jb00hnvp4st62azb1k', 'karang@endra', 'Endra Nirwaningsih', NULL, '6285643438322', 'Temanggal Rt. 001/001', 'Endra-karang', '-29.580', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-05-08 00:00:00.000', '2026-07-05 13:56:29.773'),
('cmazlo0jk00hpvp4sno6twgh5', 'manggal@fiofebrianto', 'Fio Febrianto Counter', NULL, '6281329341762', 'Temanggal', 'Fiofebrianto-manggal', '-29.102', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-10-07 00:00:00.000', '2026-07-05 11:50:16.447'),
('cmazlo0ju00hrvp4swgb392d4', 'manggal@gitacahyaningrosiana', 'Gita Cahyaning Rosiana', NULL, '6281215898716', 'Temanggal', 'Gitacahya-manggal', '-15.244', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-03-10 00:00:00.000', '2026-07-12 07:36:25.146'),
('cmazlo0k400htvp4sedwzokbl', 'sugran@gunawan', 'Gunawan Manggal', NULL, '6285612345678', 'Temanggal', 'Gunawan-sugran', '-25.230', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2025-07-03 23:32:13.122'),
('cmazlo0kd00hvvp4s4khziop1', 'manggal@hendro', 'Hendro Dwi Herm', NULL, '6285643133891', 'Temanggal', 'Hendro-manggal', '-26.570', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-06-10 00:00:00.000', '2026-07-09 23:53:25.224'),
('cmazlo0km00hxvp4srerxaozf', 'manggal@hibatinwafiroh', 'Hibatul Wafiroh', NULL, '6281936675403', 'Temanggal 2/3', 'Hibatinwafiroh-manggal', '0.000', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-07-01 00:00:00.000', '2026-07-12 07:12:21.504'),
('cmazlo0kx00hzvp4s8295jus4', 'manggal@irfanlorkali', 'Irfangi Lor Kali', NULL, '6287715162956', 'Temanggal', 'Irfanlorkali-manggal', '-12.440', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-07-19 00:00:00.000', '2026-07-10 00:27:47.464'),
('cmazlo0l700i1vp4snqibydvi', 'sugran@fuad', 'Irma / Kuat Sugran', NULL, '628561234567', 'Temanggal', 'Fuad-sugran', '-17.472', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-08 11:58:27.202'),
('cmazlo0lf00i3vp4s7oz81xt0', '37.jalumanggal', 'Jalu Karang', NULL, '6285612345678', 'Temanggal', 'Jalu-karang', '-16.576', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-05 11:26:12.117'),
('cmazlo0lo00i5vp4sk7h5tmla', 'manggal@jemingun', 'Jemingun Manggal', NULL, '6282125419722', 'Temanggal', 'Jemingun-manggal', '-15.004', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-05-06 00:00:00.000', '2026-07-06 10:58:09.412'),
('cmazlo0lw00i7vp4sqvkidhv1', 'karang@kasono', 'Kasono Karang /Rosida', NULL, '6285612345678', 'Temanggal', 'Kasono-karang', '-20.656', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 12:00:28.031'),
('cmazlo0mq00i9vp4smzt3ixb1', 'karang@khanafi', 'Khanafi Manggal', NULL, '6285612345678', 'Temanggal', 'Khanafi-karang', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-05 11:52:14.528'),
('cmazlo0n700ibvp4scqk9c388', 'karang@khusnulkhotimah', 'Khusnul Khotimah', NULL, '6283863175707', 'Temanggal Rt. 01/01 Karqng', 'Khusnulkhotimah-karang', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-06-05 00:00:00.000', '2026-07-05 11:26:34.632'),
('cmazlo0nh00idvp4sgt7c7vmn', 'manggal@masirun', 'Masirun', NULL, '6285772219489', 'Temanggal', 'Masirun-manggal', '-14.632', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-09-19 00:00:00.000', '2026-07-06 10:58:57.568'),
('cmazlo0nq00ifvp4snyt1xge9', 'manggal@nasihudin', 'Moh. Nasihudin', NULL, '6287832730802', 'Temanggal', 'Nasihudin-manggal', '-12.256', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-08-03 00:00:00.000', '2026-07-09 05:44:37.348'),
('cmazlo0o000ihvp4snc2xtjo6', 'manggal@nurhidayati', 'Nur Hidayati', NULL, '6281228352456', 'Temanggal Rt. 3/2', 'Nurhidayati-manggal', '-16.440', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-08-02 00:00:00.000', '2026-07-04 14:45:13.812'),
('cmazlo0oa00ijvp4slrg25ome', 'manggal@runtiyah', 'Runtiyah', NULL, '6285226965654', 'Temanggalrt0402', 'Runtiyah-manggal', '24.080', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-02-04 00:00:00.000', '2026-07-06 10:57:50.968'),
('cmazlo0ok00ilvp4s9cl7viqm', 'manggal@nuryanti', 'Nuryanti', NULL, '6285328367908', 'Sugran Rt01Rw01', 'Nuryanti-manggal', '-20.672', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-10-04 00:00:00.000', '2026-07-08 12:00:10.568'),
('cmazlo0ou00invp4sanur4h4k', 'manggal@pawittriyani', 'Pawit Triyani', NULL, '628888501469', 'Temanggal, Rt04/Rw01', 'Pawittriyani-manggal', '-19.666', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-10-11 00:00:00.000', '2026-07-12 04:08:02.297'),
('cmazlo0p300ipvp4snuuukrhh', 'manggal@putra', 'Putra Karang', NULL, '6281315556957', 'Temanggal Duaun Karang', 'Putra-karang', '-20.916', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-09-20 00:00:00.000', '2026-07-06 14:04:47.861'),
('cmazlo0pd00irvp4saku9711r', 'manggal@restiyaningsih', 'Restya Ningsih', NULL, '6289603313123', 'Temanggal Rt04/01', 'Restiyaningsih-manggal', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-02-02 00:00:00.000', '2026-07-10 01:26:28.707'),
('cmazlo0pn00itvp4sn4yq6778', 'manggal@risna', 'Risna Eka Nurjanah', NULL, '6285643030254', 'Manggal', 'Risna-manggal', '-27.692', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-07-08 00:00:00.000', '2026-07-07 22:50:23.218'),
('cmazlo0pv00ivvp4s9dgu0gwq', 'manggal@rohmahmunawaroh', 'Rohmah Munawaroh', NULL, '6283806667506', 'Manggal Rt0401', 'HTB', '0.000', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-12-14 00:00:00.000', '2026-07-09 15:21:15.254'),
('cmazlo0q400ixvp4s0s54tfea', 'manggal@saban', 'Saban Manggal', NULL, '6285612345678', 'Temanggal', 'Saban-manggal', '-11.696', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-04 14:11:38.080'),
('cmazlo0qe00izvp4ss7zq2o48', 'manggal@samsul', 'Samsul Maarif', NULL, '6285227310806', 'Temanggal Timur, Rt02/02', 'Samsun2-skt', '-23.970', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-01-07 00:00:00.000', '2026-07-11 13:29:42.458'),
('cmazlo0qm00j1vp4syou6hbwj', 'manggal@wawan', 'Setiyawan', NULL, '6287737683826', 'Temanggal Rt01/02', 'Wawan-manggal', '-30.000', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-04-03 00:00:00.000', '2026-07-06 01:47:35.086'),
('cmazlo0qv00j3vp4san91pjnu', 'karang@ngarepejono', 'Sikhos Karang', NULL, '6285612345678', 'Temanggal', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-02 09:09:11.498'),
('cmazlo0r500j5vp4s8v1spj0v', 'manggal@siswadi', 'Siswadi', NULL, '6288225249161', 'Manggal Karang', 'Siswadi-karang', '-20.428', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-11-06 00:00:00.000', '2026-07-08 11:55:31.882'),
('cmazlo0re00j7vp4s8wb70o0c', 'manggal@soim', 'Soimun Manggal', NULL, '628816725263', 'Temanggal', 'Soim-manggal', '-12.910', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-08-06 00:00:00.000', '2026-07-12 04:08:31.965'),
('cmazlo0rm00j9vp4sr4naqsv7', 'manggal@sribudiasih', 'Sri Budiasih', NULL, '62857679226781', 'Temanggal', 'Sribudiasih-manggal', '-21.008', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-11-10 00:00:00.000', '2026-07-06 13:33:24.338'),
('cmazlo0ru00jbvp4s0wn4vsuy', 'manggal@sripamuji', 'Sri Pamuji', NULL, '6287878722263', 'Temanggal, Rt01/02', 'Sripamuji-manggal', '-27.448', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-03-01 00:00:00.000', '2026-07-11 13:41:38.710'),
('cmazlo0s300jdvp4sbpi420ac', 'manggal@supriyatun', 'Supriyatun Spd', NULL, '6281329885330', 'Manggal Rt0401', 'Supriyatun-manggal', '-22.922', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-12-12 00:00:00.000', '2026-07-02 13:26:28.202'),
('cmazlo0sc00jfvp4skygdbgpk', 'manggal@suswati', 'Suswati', NULL, '6285770287475', 'Manggal Rt0302', '-', '-', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-01-06 00:00:00.000', '2026-07-02 12:25:26.618'),
('cmazlo0sm00jhvp4saijuzlvf', 'manggal@sutinah', 'Sutinah', NULL, '6281903775525', 'Temanggal', 'Sutinah-manggal', '-24.430', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-08-13 00:00:00.000', '2026-07-10 04:11:35.535'),
('cmazlo0su00jjvp4sh6ointrm', 'manggal@jebulsarifhidayat', 'Syarif Hidayat', NULL, '6288225083520', 'Temanggal Rt. 001 Rw. 002', 'Jebul-manggal', '-25.220', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-12-20 00:00:00.000', '2026-07-08 04:49:12.286'),
('cmazlo0t300jlvp4s1vjfs3fq', 'manggal@tarikhun', 'Tarikhun', NULL, '6281398963134', 'Manggal Rt. 04/02', 'Tarikhun-manggal', '0.000', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-09-03 00:00:00.000', '2026-07-09 23:56:52.396'),
('cmazlo0tc00jnvp4s17fhxn5p', 'manggal@tazudin', 'Tazudin Husni', NULL, '62882006148867', 'Temanggal, Rt01/02, Adimulyo', 'Tazudin-manggal', '0.000', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-12-21 00:00:00.000', '2026-07-08 04:49:24.900'),
('cmazlo0tm00jpvp4sgmsdi4vh', 'karang@trirahayu', 'Tri Rahayu', NULL, '6288221338237', 'Temanggal Karang', 'Trirahayu-karang', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-06-05 00:00:00.000', '2026-07-05 11:27:33.737'),
('cmazlo0tv00jrvp4seqo9giko', '143008@tursinomanggal', 'Tursino Manggal', NULL, '6285747568002', 'Temanggal', 'Tursino-manggal', '-30.856', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 23:50:10.052'),
('cmazlo0u400jtvp4so62p2jo2', 'karang@untung', 'Untung Manggal', NULL, '6283866106619', 'Temanggal', 'Untung-karang', '-20.130', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-02 10:55:00.219'),
('cmazlo0uc00jvvp4s0hczqo35', 'jabres@wachid', 'Wachid Fatchurahman', NULL, '6287837642434', 'Sruweng, Jabres Rt01/01', 'Wachid-jabres', '-21.300', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2024-04-03 00:00:00.000', '2026-07-13 08:53:11.233'),
('cmazlo0ul00jxvp4s05of8n3f', '143006@wahid', 'Wahid Manggal', NULL, '6285612345678', 'Temanggal', 'Wahid-manggal', '-20.132', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-06 10:59:10.127'),
('cmazlo0uu00jzvp4sv0f9oomp', 'manggal@wasimin', 'Wasimin', NULL, '6282331239826', 'Temanggal', 'Wasimin-manggal', '-25.080', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-11-13 00:00:00.000', '2025-06-14 09:46:13.291'),
('cmazlo0v300k1vp4s50fvp1ib', 'manggal@wasingun', 'Wasingun Manggal', NULL, '6287832057562', 'Temanggal', 'Wasingun-manggal', '-9.590', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-05-12 00:00:00.000', '2026-07-06 10:58:24.415'),
('cmazlo0vc00k3vp4skq0r953c', 'sugran@wiwit', 'Wiwit Tresno Prihatiningsih', NULL, '6289604172559', 'Dk. Srugran 01/03 Adiluhur', 'Wiwit-sugran', '-23.280', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-08-01 00:00:00.000', '2025-06-03 11:36:25.749'),
('cmazlo0vn00k5vp4sdwv3m1ym', '7.yulimanggal', 'Yuli Manggal', NULL, '628512345678', 'Temanggal', 'Yuli-manggal', '-23.012', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-03 02:42:52.075'),
('cmazlo0vw00k7vp4sk5uqtebf', 'manggal@yumna', 'Yumna Manggal', NULL, '6285876240936', 'Temanggal', 'Yumna-manggal', '-17.056', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-05-10 00:00:00.000', '2025-11-26 14:04:47.749');
INSERT INTO `customer` (`id`, `username`, `fullname`, `email`, `phoneNumber`, `address`, `ontName`, `redamanOlt`, `diskon`, `status`, `paketId`, `areaId`, `odpId`, `modemId`, `oltId`, `createdAt`, `updatedAt`) VALUES
('cmazlo0w500k9vp4spxlgwbtt', 'manggal@yunihartati', 'Yuni Hartati', NULL, '6281237141119', 'Temanggam', 'Yunihartati-manggal', '-25.220', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-01-03 00:00:00.000', '2026-07-10 12:43:52.767'),
('cmazlo0wf00kbvp4s6l3mhx6l', 'karang@yunipuputwidiarsih', 'Yuni Puput Widiarsih', NULL, '6282326514518', 'Temanggal Rt0101', 'Yunipuputwidiarsih-karang', '-30.064', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2024-03-03 00:00:00.000', '2026-07-01 04:49:40.736'),
('cmazlo0wn00kdvp4sdkltayww', 'manggal@zumizahro', 'Zumi Zahro', NULL, '6289619454129', 'Temanggal Timur,Rt01/02, Adimulyo', 'Zumizahro-manggal', '-25.220', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-01-01 00:00:00.000', '2026-07-11 13:42:07.915'),
('cmazlo0ww00kfvp4srjep2kty', 'manggal@tusbagio', 'Tus Bagio Manggal', NULL, '6281225215225', 'Temanggal', 'Tusbagio-manggal', '-16.460', 27500, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2022-05-13 00:00:00.000', '2026-07-09 23:56:09.820'),
('cmazlo0x500khvp4ssta17mqm', '1430301@wawan', 'Wawan Manggal', NULL, '6285612345678', 'Temanggal', 'Wawan-manggal', '-30.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-06 01:47:21.039'),
('cmazlo0xf00kjvp4s6sfrircr', 'manggal@farikoh', 'Farikoh', NULL, '6281315184625', 'Temanggal Rt. 002/002', 'Farikoh-manggal', '-23.872', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-01-03 00:00:00.000', '2026-07-01 23:28:27.491'),
('cmazlo0xo00klvp4s7zvq2kza', 'manggal@baledesa', 'Pemerintah Desa Temanggal', NULL, '6281229535895', 'Desa Temanggal Rt. 002/004', 'Baledesa-manggal', '-21.480', 25000, 'ACTIVE', 'cmazjsfz40002vpbgwyegkqec', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2023-01-11 00:00:00.000', '2026-07-08 12:11:23.680'),
('cmazlo0xw00knvp4shgmezc9q', 'pakyang@dayat', 'Dayat Pakyang/ Hidayah', NULL, '6281227989826', 'Tepakyang', 'Dayat-pakyang', '-19.432', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-29 00:00:00.000', '2026-07-13 00:41:18.141'),
('cmazlo0y600kpvp4s7es981he', 'pakyang@pakmugi', 'Mugi Pakyang', NULL, '62856123456', 'Tepakyang', 'Pakmugi-pakyang', '-15.288', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-04-04 00:00:00.000', '2026-07-13 00:42:03.069'),
('cmazlo0yo00ktvp4s7vd5l35f', 'pakyang@kato', 'Supriyanto/Kato Pakyang', NULL, '6285612345678', 'Tepakyang', 'Kato-pakyang', '-23.768', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 00:45:04.248'),
('cmazlo0z600kxvp4sly1xmfpd', 'pakyang@agussalim', 'Agus Salim', NULL, '6282225998783', 'Tepakyang', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-28 00:00:00.000', '2026-07-13 00:45:30.578'),
('cmazlo0zf00kzvp4s1j3gjpgd', 'pakyang@anang', 'Anang Tri Guntoro', NULL, '628559866888', 'Tepakyang Rt0102', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2024-12-16 00:00:00.000', '2026-07-10 11:00:02.346'),
('cmazlo10h00l1vp4swtjvwowy', 'kebon@arissupriyanto', 'Aris Supriyanto', NULL, '6288806820704', 'Tepakyang, Kebon', 'Arissupriyanto-kebon', '-30.000', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2024-02-11 00:00:00.000', '2026-04-16 09:41:29.215'),
('cmazlo10v00l3vp4s48b9w66p', 'pakyang@cariklukman', 'Carik Salukman Pakyang', NULL, '6287837696292', 'Tepakyang', 'Pakcarik-pakyang', '-10.270', 15000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 22:42:57.805'),
('cmazlo11600l5vp4sbydlrwvj', 'pakyang@novikebon', 'Cita Ades Kebon', NULL, '6285612345678', 'Tepakyang, Kebon', 'Novi-kebon', '-23.188', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-01-01 05:08:48.092'),
('cmazlo11f00l7vp4s1qz6gtbh', 'tugu@dewi', 'Dewi Utami/3305156103010002', NULL, '6285878397369', 'Sugih Waras Dsn Tugu Rt. 001/003 Adimulyo', 'Dewi-tugu', '-20.130', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-10-17 00:00:00.000', '2025-09-11 10:43:44.982'),
('cmazlo11n00l9vp4s3sbf1mrd', 'pakyang@esa', 'Esa Pakyang', NULL, '6283863472206', 'Tepakyang', 'Esa-pakyang', '-24.310', 0, 'SUSPENDED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 13:49:28.406'),
('cmazlo11w00lbvp4spkgp57oi', 'pakyang@warijul', 'Farikoh Tepakyang', NULL, '628579988667', 'Tepakyang', 'Warijul-pakyang', '-17.546', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-07-06 00:00:00.000', '2026-07-13 00:46:27.220'),
('cmazlo12400ldvp4sl4jt6pim', 'pakyang@ferilugiyanto', 'Feri Lugiyanto', NULL, '6287837813274', 'Dk. Kaum Rt. 002/002 Tepakyang', 'HTB', '0.000', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-03-01 00:00:00.000', '2025-05-29 06:09:31.868'),
('cmazlo12e00lfvp4swjbkkdzg', 'tugu@ratih', 'Ibu Ratih Tugu Pakyang', NULL, '6287715162956', 'Tepakyang', 'Ratih-tugu', '-14.582', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-25 00:00:00.000', '2025-10-31 16:42:57.708'),
('cmazlo12o00lhvp4s6bfp0w3b', 'pakyang@indahmelani', 'Indah Melani', NULL, '62881010615347', 'Tepakyang', 'HTB', '0.000', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2024-09-16 00:00:00.000', '2026-04-16 09:41:38.886'),
('cmazlo12x00ljvp4sq5fwgwqg', 'pakyang@indahyuniati', 'Indah Yuniati', NULL, '6281935177209', 'Tepakyang', 'Indahyuniati-pakyang', '-23.468', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-05-26 00:00:00.000', '2025-11-26 14:01:46.672'),
('cmazlo13700llvp4s5k5giy8a', 'pakyang@kasidin', 'Kasidin', NULL, '6282322154740', 'Tepakyang', 'Kasidin-pakyang', '-25.530', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-09-19 00:00:00.000', '2026-07-13 01:59:41.247'),
('cmazlo13g00lnvp4s1mrd88k0', '52.pakyangkasmin', 'Kasmin Pakyang', NULL, '6285214143623', 'Tepakyang', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-02-07 00:00:00.000', '2026-07-13 01:51:03.860'),
('cmazlo13p00lpvp4spkw4z7bp', 'pakyang@melyyunita', 'Mely Yunita Rahmawati', NULL, '6281390364729', 'Tepakyang Rt. 001/002', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-08-25 00:00:00.000', '2026-07-13 01:58:06.899'),
('cmazlo13z00lrvp4stvkqgojd', 'tugu@nova', 'Nofi Rahayu/3305156611930001', NULL, '62859144704370', 'Sugih Waras Rt. 001/003 Adimulyo', 'Nova-tugu', '-14.772', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-10-17 00:00:00.000', '2026-07-04 13:43:23.108'),
('cmazlo14a00ltvp4sf0yisz09', 'pakyang@nuhiqbal', 'Nuh Iqbal', NULL, '6285848371624', 'Pakyang Rt02Rw02', 'Nuhiqbal-pakyang', '-18.328', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2024-06-22 00:00:00.000', '2025-05-29 07:52:25.597'),
('cmazlo14k00lvvp4s9lzxdva9', 'pakyang@nurdaiman', 'Nur Daiman', NULL, '6285612345678', 'Tepakyang', 'Nurdaiman-pakyang', '-21.612', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-04 23:04:40.079'),
('cmazlo14w00lxvp4smm402b9e', 'pakyang@nurkhasanah', 'Nur Khasanah', NULL, '6288232125908', 'Karangduwur, Tepakyang, Rt 01/02', 'Nurkhasanah-pakyang', '-22.598', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2024-02-11 00:00:00.000', '2026-04-16 09:41:46.287'),
('cmazlo15500lzvp4szlgl4b4f', '3011@aryakebon', 'Pak Handoyo Kebon', NULL, '6285612345678', 'Tepakyang', 'Ndoyo-kebon', '-21.740', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-12 04:22:20.780'),
('cmazlo15e00m1vp4shaiix6x5', 'pakyang@nanim', 'Pak Nanim Pakyang', NULL, '6285612345678', 'Tepakyang', 'Nanim-pakyang', '-16.842', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 01:51:50.449'),
('cmazlo15n00m3vp4s3cpoarwe', 'pakyangrasimun', 'Pak Rasimun Pakyang', NULL, '628561234567', 'Tepakyang', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 01:52:33.390'),
('cmazlo15w00m5vp4syhb7jy50', 'pakyang@51.sugi', 'Pak Sugi Pakyang', NULL, '62895393533664', 'Tepakyang', 'Sugi-pakyang', '-24.686', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-02-07 00:00:00.000', '2026-07-08 05:23:00.144'),
('cmazlo16400m7vp4svst8xx9r', 'pakyang@sugiyanto', 'Pak Sugiyanto Pakyang', NULL, '628561234567', 'Tepakyang', 'Sugiyanto-pakyang', '-17.400', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 01:53:26.699'),
('cmazlo16d00m9vp4s28747idn', 'pakyang@yusro', 'Pak Yusro Pakyang', NULL, '6285612345678', 'Tepakyang', 'Yusro-pakyang', '-18.862', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 01:54:14.938'),
('cmazlo16n00mbvp4satt7l24c', 'pagkyang@poskamling', 'Poskamling Pakyang', NULL, '6285612345678', 'Tepakyang', 'Poskamling-pakyang', '-13.346', 65000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-09 05:40:40.460'),
('cmazlo16w00mdvp4sd0yhwtoa', 'pakyang@sarjuni', 'Sarjuni Pakyang', NULL, '6282225998783', 'Tepakyang', 'Sarjuni-pakyang', '-20.178', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-03-27 00:00:00.000', '2026-07-13 01:55:00.808'),
('cmazlo17600mfvp4so9aanc20', 'pakyang@sitikhotimah', 'Siti Khotimah', NULL, '6288237216042', 'Tepakyang', 'Sitikhotimah-pakyang', '-24.432', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-09-20 00:00:00.000', '2026-07-10 10:53:54.418'),
('cmazlo17e00mhvp4spopimz7v', 'pakyang@slametharjatito', 'Slamet Harjatito', NULL, '6281327337595', 'Tepakyang Rt. 02/01', 'HTB', '0.000', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-11-12 00:00:00.000', '2026-07-13 02:00:26.859'),
('cmazlo17n00mjvp4s00w54slg', 'pakyang@teguh', 'Teguh Pambudi', NULL, '6281218115779', 'Tepakyang, Kebon Wetan Rt. 001/003', 'Teguh-kebon', '-22.140', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-04-11 00:00:00.000', '2026-07-13 01:57:19.600'),
('cmazlo17w00mlvp4sgvle6qcg', 'pakyang@tinamarlinawati', 'Tina Marlinawati', NULL, '6282137219434', 'Tepakyang', 'Tinamarlina-pakyang', '-26.778', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-12-21 00:00:00.000', '2026-07-13 02:01:41.278'),
('cmazlo18600mnvp4snc2j9lkr', 'pakyang@trisuyatmi', 'Tri Suyatmi', NULL, '6288980065661', 'Tepakyang', 'Trisuyatmi-pakyang', '-22.070', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-12-18 00:00:00.000', '2026-07-13 02:01:06.097'),
('cmazlo18g00mpvp4sy7ww61tr', 'pakyang@tsalisnurfarhan', 'Tsalis Nur Farhan', NULL, '62882005771828', 'Tepakyang Rt. 01/03', 'Tsalisnurfarhan-pakyang', '-17.372', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-09-18 00:00:00.000', '2026-07-13 01:58:55.340'),
('cmazlo18o00mrvp4svep09pyq', 'tugu@wahyuningsih', 'Wahyuningsih', NULL, '62895410350634', 'Tepakyang', 'Wahyuningsih-tugu', '-22.37', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-07-20 00:00:00.000', '2026-03-12 11:55:45.156'),
('cmazlo18y00mtvp4shgdtn2gf', 'pakyang@winoto', 'Winoto', NULL, '6282136385072', 'Tepakyang Wates Rt.01/01', 'Winoto-pakyang', '-14.318', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-05-20 00:00:00.000', '2026-07-14 12:55:29.337'),
('cmazlo19900mvvp4s4vhuwzlc', 'pakyang@buyani', 'Yani Pakyang', NULL, '62812345678', 'Tepakyang', 'Buyani-pakyang', '-18.320', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2022-01-14 00:00:00.000', '2026-07-13 01:55:54.978'),
('cmazlo19i00mxvp4sm0axnb4o', 'pakyang@ambarwati', 'Ambarwati', NULL, '628129970694', 'Tepakyang Rt01/01', 'Ambarwati-pakyang', '-19.060', 0, 'SUSPENDED', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2024-04-02 00:00:00.000', '2026-07-12 00:30:39.795'),
('cmazlo19s00mzvp4sh1xuievz', 'pakyang@ariswahyudi', 'Aris Wahyudi', NULL, '6287715356081', 'Tambaharjo Rt. 01/01', 'Ariswahyudi-tambaharjo', '-22.210', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2023-08-26 00:00:00.000', '2026-07-11 23:33:08.544'),
('cmazlo1a000n1vp4sjghxngp0', 'pakyang@baledesa', 'Balai Desa Pakyang', NULL, '6282112087818', 'Tepakyang', 'Baledesa-pakyang', '-21.800', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 04:14:52.409'),
('cmazlo1a800n3vp4s8avyiae5', 'pakyang@lorgerdu', 'Lala Lor Gardu Pakyang', NULL, '6285679211111', 'Tepakyang', 'Lala-pakyang', '-24.318', 27500, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-10 23:40:00.615'),
('cmazlo1al00n5vp4sgr5oxpb4', 'pakyang@mujiasih', 'Ibu Mujiasih Pakyang', NULL, '6281391620034', 'Tepakyang', 'Mujiasih-pakyang', '-17.496', 0, 'TERMINATED', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2025-07-11 11:14:49.946'),
('cmazlo1av00n7vp4s9rtajdk7', 'pakyang@izal', 'Izal Pakyang', NULL, '6281357479159', 'Tepakyang', 'Izal-pakyang', '-23.374', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 01:56:35.248'),
('cmazlo1b400n9vp4sogrcy0o1', '2014@pakyangwahid', 'Mas Wahid Pakyang', NULL, '62819674415', 'Tepakyang', 'Wahid-pakyang', '-12.442', 75000, 'ACTIVE', 'cmazjsfz40002vpbgwyegkqec', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-03 13:24:39.227'),
('cmazlo1bf00nbvp4sty4qpj1e', 'pakyang@syahidin', 'Pak Syahidin Pakyang', NULL, '6281215649434', 'Tepakyang', 'Syahidin-pakyang', '-26.990', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-03 14:24:09.992'),
('cmazlo1bo00ndvp4swgxnptyd', 'wajasari@agisaulia', 'Agis Aulia Rahma Sari', NULL, '6282150904798', 'Wajasari Rt. 2/02', 'Agisaulia-wajasari', '-20.364', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkkr7h000mvpbgsexiubsl', NULL, NULL, NULL, '2023-12-06 00:00:00.000', '2026-07-02 08:14:12.372'),
('cmazlo1by00nfvp4sv98ynlog', 'waja@farokah', 'Farokah', NULL, '6283195496465', 'Wajasari Rt003', 'Farokah-wajasari', '-21.670', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkkr7h000mvpbgsexiubsl', NULL, NULL, NULL, '2024-07-08 00:00:00.000', '2026-03-31 09:34:31.432'),
('cmazlo1c600nhvp4sbe0it2gn', 'wajasari@tatiwidiarti', 'Tati Widiarti', NULL, '6282325620875', 'Wajasari, Rt01/03', 'HTB', '0.000', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkkr7h000mvpbgsexiubsl', NULL, NULL, NULL, '2024-04-20 00:00:00.000', '2025-06-15 13:07:05.996'),
('cmazlo1cf00njvp4svvxydxqq', 'wareng@15.muna', 'H. Ahmad Burhanudin', NULL, '6285225352705', 'Wareng', 'HAmad-wareng', '-17.696', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 05:14:18.559'),
('cmazlo1co00nlvp4s4injjm9v', 'wareng@h.Ali', 'H. Ali Munir', NULL, '6285735639007', 'Wareng', 'Hali-wareng', '-8.310', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2022-07-03 00:00:00.000', '2026-07-13 11:53:01.251'),
('cmazlo1cx00nnvp4sh9v309b8', 'wareng@sitingaisah', 'Siti Ngaisah Wareng', NULL, '6287832833801', 'Wareng', 'Sitingaisah-wareng', '-16.820', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-11 06:06:44.497'),
('cmazlo1d600npvp4s4mq05f4d', 'wareng@tyszar', 'Tyszar Noer Iskandar Ilyas', NULL, '62895378146794', 'Wareng Rt0402', 'Tyszar-wareng', '-12.292', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2024-12-15 00:00:00.000', '2026-07-10 03:40:02.716'),
('cmazlo1df00nrvp4s0wrx7e62', 'wareng@41.pawitwareng', 'Pawit Wareng', NULL, '62895359550167', 'Wareng', 'Pawit-wareng', '-21.938', 27500, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-06-15 09:55:30.494'),
('cmazlo1do00ntvp4sr0n3xpym', 'wareng@pakmuji', 'Sri Lestariyati', NULL, '+62 822-2594-0108', 'Wareng Rt. 04/02', 'Pakmuji-wareng', '-22.678', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2023-09-01 00:00:00.000', '2026-07-11 05:26:57.842'),
('cmb92yae70003m67qks99blny', 'ingas@mujiati', 'Mujiati', NULL, '6289509105460', 'Sruweng Rt.01/05 Kec. Sruweng', 'Mujiati-ingas', '-24', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2025-05-29 07:56:10.399', '2026-07-11 05:30:56.536'),
('cmbf0gjqo0012m67qclzub6p9', 'mangunharjo@bambangmustiko', 'Bambang Mustiko Prabowo', NULL, '+6283862212009', 'Mangunharjo  R.t01/02, Adimulyo', 'Bambang-mangunharjo', '-7,30', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-06-02 11:33:00.528', '2026-07-07 12:59:09.684'),
('cmbhiy7la001tm67q2p5iyire', 'pagutan@dwiumiasih', 'DWI UMIASIH', NULL, '082324835004', 'Sidomulyo,pagutan,rt01/03', 'CMCDC10C884A1', '-17.56', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-06-04 05:46:10.030', '2026-04-10 12:45:21.522'),
('cmbj8rzux002gm67qn73zqak5', 'karanggedang@turino', 'Turino', NULL, '088216055472', 'Karanggedang rt04/01', 'Turino-karanggedang', '-20', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-06-05 10:36:56.265', '2026-06-18 15:23:36.370'),
('cmbxhc09500dhm67qneyrhull', 'joho@sartini', 'SARTINI', NULL, '083838414334', 'Desa joho rt02/02', 'Sartini-joho', '-24.81', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-06-15 09:45:13.289', '2026-07-04 09:59:42.729'),
('cmc0lydtc00dnm67qcvdiihbb', 'joho@salamun', 'Salamun', NULL, '082135916400', 'Johort02/02', 'Salamun-joho', '-26/-27', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-06-17 14:17:54.288', '2026-07-01 11:02:44.183'),
('cmc4gkjwl00dpm67qbhz7ahcd', 'jabres@sitingaisah', 'Siti ngaisah jabres', NULL, '083186613011', 'Jabres depok rt03/01', 'Sitingaisah-jabres', '-16', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2025-06-20 06:58:15.621', '2026-07-13 11:43:24.455'),
('cmc60ipji00e1m67qpwhiw8jk', 'ingas@poedjiwaluyo', 'Poedjiwaluyo', NULL, '085849486264', 'Ingas rt01/05', 'Poedjiwaluyo-ingas', '-20', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2025-06-21 09:04:28.110', '2026-07-08 03:42:50.600'),
('cmcligpza00f7m67qy7rdv2jx', 'joho@ikanofi', 'Ika Nofi Andriyani', NULL, '089888956758', 'Kesongging Rt. 001/001 Candiwulan', 'Ikanofi-candiwulan', '-15', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2025-07-02 05:23:21.094', '2026-07-09 08:52:29.704'),
('cmcsv38r50004m6wje9ya1biv', 'jabres@puput', 'Puput dewi lestari', NULL, '+62 878-7068-1604', 'Jabres rt02/02', 'Puput-jabres', '-10.2920', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2025-07-07 08:51:10.481', '2026-07-13 11:45:18.134'),
('cmcvql2jo002dm6wjxtxljneu', 'candiwulan@muhamadrifqi', 'Muhamad Rifqi Zidan', NULL, '0895410638600', 'Candiwulan Srepeng Rt. 01/02', 'Muhamadrifqi-candiwulan', '-25', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2025-07-09 09:08:22.692', '2026-07-09 13:13:22.798'),
('cmda2p00b000bm6crdl4znlbi', 'karanggedang@neneng', 'Neneng sugiarti', NULL, '083160739225', 'Karanggedang rt04/01', 'Neneng sugiarti', '-23', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2025-07-19 09:56:07.883', '2026-05-09 03:04:35.096'),
('cmdcn3lrk000qm6creu93npes', 'klapagada@desirizkiyani', 'Desi rizkiyani', NULL, '085870017146', 'Klapagada rt01/01', 'Desi rizkiyani', '-16', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2025-07-21 05:02:53.936', '2026-06-11 06:31:04.493'),
('cmdk0vi42000um6crrwgleqzi', 'adimulyo@madarjo', 'MADARJO', NULL, '085946064176', 'Adimulyo', 'MADARJO', '-15', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-07-26 09:02:53.810', '2026-06-18 15:22:01.511'),
('cmdol1ehm0001m6tpkbunnuwe', 'klapagada@dedysetiawan', 'Dedy setiawan ', NULL, '087715352391', 'Klapagada rt01/01', 'Dedy-klapagada', '-16', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2025-07-29 13:38:26.073', '2026-01-22 14:55:04.200'),
('cmdrdeh830007m6tptlb653gu', 'pagutan@nanung', 'Nanung', NULL, '081389886424', 'Pagutan', 'Nanung-pagutan', '-22', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-07-31 12:27:57.746', '2026-04-10 12:45:32.744'),
('cmdskklgz0017m6tpd30sa11g', 'joho@suryanti', 'Suryanti', NULL, '085177952891', 'Joho,rt01rw01', 'Suryanti-joho', '-21', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-08-01 08:36:26.675', '2026-07-08 00:59:40.020'),
('cmdsrd3a5001em6tp794f3ez8', 'klapagada@heni', 'Heni rahmawati/h.sobar', NULL, '089652394049', 'Klapagada rt01/01', 'Heni-klapgada', '-10', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2025-08-01 11:46:33.821', '2026-07-10 03:05:12.210'),
('cmduawrbq0008m6ozm29yfsga', 'joho@subandi', 'Subandi', NULL, '081228352671', 'Joho,rt03,rw01', 'Subandi-joho', '-26', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-08-02 13:41:30.326', '2026-07-11 03:14:11.469'),
('cmdxr1f6o0001m6cb12kzc7dm', 'joho@eka', 'Eka Sutrami Ningsih', NULL, '6288983751969', 'Joho Rt. 004/002', 'Eka-joho', '-25.3780', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-08-04 23:36:20.255', '2026-07-01 10:59:58.523'),
('cmdxr6c3m0003m6cb8rj2lx8e', 'manggal@halim', 'Halim Santri', NULL, '6282323884733', 'Manggal Barat Rt. 004/002', 'Halim-manggal', '-15.3780', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-08-04 23:40:09.538', '2026-07-09 13:12:05.563'),
('cmdxraa9u0005m6cbv2tzno01', 'sokalor@nurawaliah', 'Nur Awaliah', NULL, '6285213560040', 'Sokalor Rt 001/002', 'Nurawaliyah-sokalor', '-21.080', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2025-08-04 23:43:13.794', '2026-07-11 06:00:19.142'),
('cmdznko3a0015m6cbchtdqhdy', 'karanggedang@liliyani', 'Liliyani', NULL, '087848447111', 'Karanggedang warung dees', 'Liliyani-karanggedang', '-20', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2025-08-06 07:34:52.150', '2026-07-11 05:34:37.749'),
('cmdzvyuia0018m6cb0r77ohq3', 'jonggol@nurularifin', 'Nurul arifin paimuna', NULL, '085328907358', 'Jonggol rt05/02', 'Nurul arifin paimuna', '-20', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2025-08-06 11:29:50.578', '2026-07-11 05:40:12.188'),
('cme7597no00bem6cbjt9oiy8w', 'joho@meilani', 'Meilani dwi herawati', NULL, '0895379163278', 'Joho rt03/01', 'Meilanidwiherawati-joho', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-08-11 13:24:13.956', '2026-07-06 22:43:49.543'),
('cme8fndma00ddm6cbqsoovl62', 'adimulyo@erfinpuji', 'ERFIN PUJI ASTUTI ', NULL, '083862532780', 'Adimulyo', 'Erfinpujiastuti-adimulyo', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2025-08-12 11:02:57.202', '2026-07-13 11:48:08.498'),
('cme8pg2m500djm6cbceoyg8am', 'skt@ibnu', 'IBNU BASAR SAEFUDIN', NULL, '+62 812-2714-8165', 'skt rt02/03', 'IBNU BASAR SAEFUDIN', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-08-12 15:37:12.509', '2026-07-10 03:46:52.885'),
('cme9u2ax400dmm6cbhoigz244', 'jabres@sadiyatun', 'SADIYATUN BADIYAH', NULL, '083838952811', 'Jabres rt02/02', 'SADIYATUN BADIYAH', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2025-08-13 10:34:14.344', '2026-07-10 03:31:12.107'),
('cmeb6743700drm6cb7e8dxt8w', 'klapagada@ali', 'ALI HENDRYANTO', NULL, '082220253443', 'Klapagada kulon', 'Alihendro-klapagada', '-23', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2025-08-14 09:01:40.339', '2026-04-16 09:41:53.096'),
('cmeft1def00dxm6cb8tz4p3dt', 'skt@khikmah', 'KHIKMAH', NULL, '089623867000', 'skt rt02/03', 'KHIKMAH', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-08-17 14:52:08.342', '2026-07-13 12:00:32.408'),
('cmex0n0hy0002m673mx56ibsz', 'manggal@mochamadmiftahudin', 'Mochamad Miftahudin', NULL, '628220622142', 'Temanggal Rt. 001/002', 'Mochamadmiftahudin-manggal', '-23.3740', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-08-29 15:57:00.358', '2026-07-09 22:52:29.413'),
('cmezbn5ey0006m65hbsgrv3sw', 'jabres@vitaannisa', 'VITA ANNISA NOOR', NULL, '087756657771', 'Sruweng,jabres,pasar tengok', 'Vitaannisa-jabres', '-9.45', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2025-08-31 06:40:34.858', '2026-04-16 09:41:59.974'),
('cmf29bria0007m6reb1qhcyho', 'manggal@khoerulanam', 'KHOERUL ANAM', NULL, '+62 852-3289-7346', 'Temanggal,rt03/02,Adimulyo', 'Khoerulanam-manggal', '-19,75', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-09-02 07:59:02.913', '2026-07-02 13:22:11.153'),
('cmf2dyuep000rm6reo6xxjh2l', 'jonggol@jefrisaputra', 'JEFRI SAPUTRA', NULL, '087737766510', 'Jonggol rt01/01', 'Jefrisaputra-jinggol', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2025-09-02 10:08:58.225', '2026-07-08 03:49:38.640'),
('cmf2g8u93000wm6remkf8h323', 'sruweng@susanto', 'SUSANTO', NULL, '087835363869', 'Sruweng depan yoncell', 'Susanto-sruweng', '-25', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2025-09-02 11:12:43.815', '2026-07-13 12:02:35.506'),
('cmf3lvo970010m6reafmr9fgi', 'pakyang@jariyah', 'JARIYAH', NULL, '082135869375', 'tepakyang,rt02/01', 'Jariyah-pakyang', '-20.45', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2025-09-03 06:38:13.387', '2026-07-13 02:03:38.771'),
('cmf3wlt2e001dm6rew4zf23ui', 'pagutan@ajisakiran', 'AJI SAKIRAN', NULL, '082138190640', 'Pagutan Rt01/03', 'AJI SAKIRAN', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-09-03 11:38:28.838', '2026-04-10 12:45:41.991'),
('cmfanxsub0003m6wzgixd71ke', 'candiwulan@sitisusanrati', 'Siti susaniati', NULL, '081215417932', 'Candiwulan,rt01/02,adimulyo', 'Sitisusanrati-candiwulan', '-12,86', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2025-09-08 05:10:15.107', '2026-07-05 11:27:47.037'),
('cmfhvph7t00afm685i4oodoll', 'sugran@waliyah', 'WALIYAH', NULL, '085228177798', 'sugran,adiluhur,rt01/rw01', 'Waliyah-sugran', '-24,64', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-09-13 06:22:06.953', '2026-07-08 13:31:29.561'),
('cmfj7m7tq00b2m685q39lc3fp', 'joho@ekapurwanti', 'EKA PURWANTI', NULL, '089625806550', 'joho,rt01/rw01', 'Ekapurwanti-joho', '-23,10', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-09-14 04:43:16.382', '2026-07-11 13:41:04.622'),
('cmfnz518q00bem685tc5k8y58', 'skt@imamwahyudi', 'IMAM WAHYUDI', NULL, '0895384245851', 'skt rt01/03', 'Imamwahyudi-skt', '-20', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-09-17 12:44:48.650', '2026-07-08 03:32:54.889'),
('cmfrvhfey00bkm685wsnyr2fm', 'karang@sukijo', 'SUKIJO', NULL, '081542957659', 'Temanggal,dk.karang,rt01/rw02', 'Sukijo-karang', '-22.62', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-09-20 06:13:33.130', '2026-07-01 11:01:07.803'),
('cmfunlrni00bnm685x24tpybo', 'sruweng@enisusanti', 'ENI SUSANTI', NULL, '+6283132058340', 'Sruweng', 'sruweng@enisusanti', '-20,78', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2025-09-22 04:56:17.214', '2026-05-25 02:43:15.484'),
('cmg7nacpw00c0m685oaezpo7q', 'jabres@dedi', 'DEDI SETYO NUGROHO ', NULL, '082322910005', 'Jabres rt04/04', 'DEDI SETYO NUGROHO', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2025-10-01 07:08:24.932', '2026-01-23 02:23:11.928'),
('cmg94x9f300cnm685yir4j062', 'adimulyo@satimin', 'SATIMIN', NULL, '088232867335', 'Adimulyo/turus rt01/02', 'SATIMIN', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-10-02 08:09:53.391', '2026-06-08 04:48:09.807'),
('cmgaqudkp00d2m685yz07vaev', 'klapagada@jenpitar', 'JENPITAR SILALAHI', NULL, '081229155331', 'Klapagada rt03/01 toko vw depan pku', 'JENPITAR SILALAHI', '-20', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2025-10-03 11:11:16.537', '2026-01-31 04:43:01.257'),
('cmgbttssb00dkm6856u4ponxk', 'joho@sitifatonah', 'Siti fatonah', NULL, '085701898602', 'joho,rt01,rw01', 'Sitifatonah-joho', '-12-74', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-10-04 05:22:34.619', '2026-07-11 13:41:18.591'),
('cmgx92ule0001m6wzm1245zqe', 'sidoharjo@wibowo', 'BAHTIAR ADI WIBOWO', NULL, '085694018976', 'sidoharjo rt0/01', 'BAHTIAR ADI WIBOWO', '-23', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk34xa0005vpbg170umf3a', NULL, NULL, NULL, '2025-10-19 05:12:40.802', '2026-07-13 11:45:49.406'),
('cmh35594q0003m6wz2jv9nfgc', 'jonggol@yusufkarim', 'YUSUF KARIM', NULL, '081226382904', 'Jonggol rt03/01', 'Yusufkarim-jonggol', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2025-10-23 08:09:11.546', '2026-07-10 03:15:58.770'),
('cmhfyxg8r000rm6wzw6a6jxu5', 'karang@endahsari', 'ENDAH SARI', NULL, '081383446640', 'Temanggal,dk.karang,rt02/01', 'Endahsari-karang', '-17.57', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-11-01 07:36:10.102', '2026-07-06 02:14:18.914'),
('cmhg3bst7000tm6wzqi5hfyk6', 'joho@silvanurfadilah', 'SILVA NURFADILAH', NULL, '085799436723', 'Joho,rt01/02', 'Silvanurfadilah-joho', '-18,68', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-11-01 09:39:18.044', '2026-07-09 23:56:39.961'),
('cmhlvbv0l003bm6wz597nm9n0', 'kebulusan@himawan', 'HIMAWAN EKA PRARAJA', NULL, '081806821842', 'Kebulusan rt03/01', 'Himawan-kebulusan', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkc5oc000dvpbggt0fbr1n', NULL, NULL, NULL, '2025-11-05 10:42:01.029', '2026-06-25 11:03:47.333'),
('cmhr9u7wb000nm68remncynar', 'karanggedang@suharyanto', 'Suharyanto', NULL, '087875850848', 'Karanggedang', 'Suharyanto-karanggedang', '-19.4320', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2025-11-09 05:27:03.035', '2026-07-10 03:27:38.369'),
('cmhra2crt0013m68r3nfl6nnk', 'jonggol@sriwahyuni', 'Sri Wahyuni', NULL, '087771835445', 'Jonggol Rt. 004/001', 'Sriwahyuni-jonggol', '-19', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2025-11-09 05:33:22.601', '2026-07-13 08:59:14.099'),
('cmhrfj5gs0001m6o6ui9ds7hj', 'klapagada@noviatie3', 'Noviatie Lik titin', NULL, '082140527820', 'Klapagada Rt. 003/001 Kost 2', 'Noviatie3-klapagada', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2025-11-09 08:06:24.363', '2026-03-12 12:12:13.007'),
('cmhrlqyzu000em6o6bzp1z08b', 'jonggol@runjiyatun', 'RUNJIYATUN', NULL, '087815681151', 'jonggol rt02/01', 'Runjiyatun-jonggol', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2025-11-09 11:00:26.922', '2026-07-11 06:02:18.032'),
('cmi1klt9n009qm6o609prbtkd', 'jonggol@ahmadwarisin', 'AHMAD WARISIN', NULL, '087736918551', 'Jonggol rt02/01', 'AHMAD WARISIN', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2025-11-16 10:26:08.363', '2026-06-22 02:11:34.165'),
('cmikcewn10004m64dbr7t88sx', 'sidoharjo@trisetyowati', 'Tri setyowati', NULL, '08895878049', 'sidoharjo ', 'Tri setyowati ', '-23', 0, 'TERMINATED', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2025-11-29 13:44:26.556', '2026-04-16 09:42:06.507'),
('cmimnuzuf000em64dsdtg7t0p', 'manggal@mohnurulhuda', 'MOH NURUL HUDA', NULL, '085227542556', 'temanggal,rt01,02', 'Mohnurulhuda-manggal', '-13.24', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-12-01 04:40:25.335', '2026-07-06 00:12:47.190'),
('cmin9i7wo000ym64dqcoogdkw', 'karang@akhmadmasduki', 'AKHMAD MASDUKI', NULL, '089513335763', 'temanggal,rt02,rw02', 'akhmadmasduki-karang', '-25,56', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-12-01 14:46:20.808', '2026-07-11 13:42:24.892'),
('cmiq3xjc6001ym64d2l2bsubb', 'adiluhur@sutati', 'SUTATI', NULL, '0881022849670', 'Adiluhur, rt01, rw02', 'Sutati-adiluhur', '-27, 47', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2025-12-03 14:33:36.294', '2026-07-01 04:50:36.543'),
('cmiu2ei22003lm64dcj43yv0t', 'pagutan@adeliyani', 'ADE LIYANI', NULL, '081229024662', 'sidomulyo,pagutan,rt01,rw02', 'Adeliyani-pagutan', '-23,56', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2025-12-06 09:01:53.258', '2026-04-10 12:45:51.741'),
('cmix3hfzg0016m6zpa94a6h78', 'wareng@apriyaningsih', 'Apriyaningsih', NULL, '08886830534', 'Wareng', 'Apriyaningsih', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2025-12-08 11:55:28.684', '2026-07-10 03:29:26.337'),
('cmj11otg3008tm6zp77613ba2', 'candiwulan@warisah', 'Warisah', NULL, '0895400748180', 'Srepeng candiwulan', 'Warisah-candiwulan', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2025-12-11 06:16:18.195', '2026-07-09 05:43:30.865'),
('cmj78e4am00bim6zpoecfbvs5', 'jonggol@rimayuliatin', 'Rima yuliatin', NULL, '6285716306493', 'jonggol rt02/01', 'Rimayuliatin-jonggol', '-15', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2025-12-10 04:40:25.335', '2026-07-11 05:11:02.296'),
('cmjcn0u0r00brm6zpsxzu0hxl', 'joho@amrihwidodo', 'AMRIH WIDODO', NULL, '082220148158', 'joho,rt03,rw01', 'Amrihwidodo-joho', '-15,64', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-12-19 08:58:58.683', '2026-07-12 23:46:21.883'),
('cmjpc0qjh00c9m6zpmmr3u4da', 'skt@dayat', 'Kang dayat', NULL, '+62 812-2935-8127', 'skt rt02/03', 'Kang dayat', '-23', 115000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2025-12-28 06:11:58.685', '2026-07-10 03:48:43.085'),
('cmjy3cuew001lm6wrc01q69n4', 'candiwulan@novenarosaria', 'NOVENA ROSARIA KUSWIDIARTI', NULL, '081575706095', 'Kesingging,rt01,rw01,candiwulan', 'Novenarosaria-candiwulan', '-24,48', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2026-01-03 09:19:22.616', '2026-07-10 01:34:17.716'),
('cmjy4iihh001nm6wr32u3lmwi', 'klapagada@umihajarotun', 'Umi hajarotun s.ip', NULL, '082134416146', 'Klapagada rt01/01', 'Umihajarotun-klapagada', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2026-01-03 09:51:46.709', '2026-07-08 11:14:30.679'),
('cmk3t744v0047m6wr841xyqqp', 'jonggol@muhamadmuhlasin', 'Muhamad muhlasin s.pd.l', NULL, '083863968636', 'Jonggol rt05/01 mi aditirto', 'Muhamadmuhlasin-jonggol', '-23', 35000, 'ACTIVE', 'cmazjsfz40003vpbgli3sqfuy', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2026-01-07 09:21:36.175', '2026-07-11 05:49:55.699'),
('cmk578gki0000m65v5imxfb75', 'joho@wartinik', 'Wartinik', NULL, '6288299025392', 'Joho Rt. 04/02', 'Wartinik-joho', '-20', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2025-12-16 04:40:25.335', '2026-07-08 11:58:11.054'),
('cmk57ei8i0001m65vl047wefh', 'manggal@bumijo', 'Hj. Tasmiyati', NULL, '085701306675', 'Manggal Rt. 01/02', 'Bumijo-manggal', '-17.02', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2025-12-25 04:40:25.335', '2026-07-08 13:36:31.948'),
('cmk5kl5pe0002m65v8zqul0ja', 'klapagada@tkharapan', 'TK HARAPAN', NULL, '+6288233847254', 'Klapagada Rt. 002/001', 'Tkharapan', '-14', 0, 'ACTIVE', 'cmazjsfz40004vpbge4i9ji7e', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2025-12-13 00:00:00.000', '2026-05-05 06:55:22.280'),
('cmkpeuehy0031m6h0pdsfvfik', 'pakyang@fitrianaapriliani', 'Fitriana Aprilia', NULL, '083199210694', 'Tepakyang Rt. 001/001', 'Fitrianaaprilia-pakyang', '-26.02', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2026-01-22 12:10:44.326', '2026-07-12 11:00:28.023'),
('cml3m5brz0043m6h0hvaj1b4i', 'kebon@bagusnurshabri', 'BAGUS NUR SHABRI', NULL, '0895355580304', 'tepakyang,kebon,adimulyo', 'bagusnurshabri-kebon', '-22,48', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2026-02-01 10:43:57.791', '2026-07-12 00:28:10.135'),
('cml3tz4540048m6h0trskzkx3', 'adiluhur@sudipriyoko', 'SUDI PRIYOKO', NULL, '085725328779', 'adiluhur,rt01/rw02,adimulyo', 'sudipriyoko-adiluhur', '-22,56', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4a3p0006vpbgt2ekltrj', NULL, NULL, NULL, '2026-02-01 14:23:04.888', '2026-07-08 00:59:19.158'),
('cml53jdk5004sm6h0urqnuq9l', 'ingas@saniadevi', 'SANIA DEVI KHUSNUL KHOTIMAH', NULL, '0895383487719', 'ingas,sruweng,rt01/rw05', 'Saniadevi-ingas', '-20,70', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2026-02-02 11:38:32.933', '2026-07-08 03:47:32.976'),
('cmlccv0za0000m6xqwosk1hoq', 'pakyang@paklurah', 'Pak Lurah Pakyang', NULL, '6287867783718', 'Tepakyang Depan Baledesa', 'Paklurah-pakyang', '-20', 55000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2021-12-13 00:00:00.000', '2026-07-13 00:43:29.111'),
('cmlcd3vrp0001m6xq2uqyoo1i', 'joho@ulfahrosidah', 'Ulfah Rosidah', NULL, '6288888', 'Joho', 'Ufahrosidah-joho', '-20', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-01-31 00:00:00.000', '2026-07-07 05:06:03.074'),
('cmldibq670079m6h0xl8cshif', 'manggal@samirin', 'SAMIRIN', NULL, '083899921925', 'Temanggal,rt04/rw02,adimulyo', 'samirin-manggal', '-20,67', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-02-08 08:54:39.679', '2026-07-08 12:00:25.529'),
('cmlevgva9007mm6h0rh59gl6s', 'mangunharjo@husnulepriliyanto', 'HUSNUL EPRILIYANTO', NULL, '082137029212', 'mangunharjo,rt03,rw02,adimulyo', 'husnulepriliyanto-mangunharjo', '-11,45', 65000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-02-09 07:50:20.769', '2026-07-03 13:24:02.819'),
('cmlqbcgft00j2m6h0rwusndrx', 'jabres@yudistira', 'YUDISTIRA WAHYU LUDHIAWAN', NULL, '085727176073', 'jabres,rt03,rw01', 'yudistira-jabres', '-21,65', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2026-02-17 08:00:16.697', '2026-03-08 03:28:54.169'),
('cmlrn8l5i00j8m6h05wwzu2az', 'ingas@suroto', 'Suroto', NULL, '089513335677', 'Ingas rt01/05', 'Suroto-ingas', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2026-02-18 06:20:57.750', '2026-07-10 03:18:15.761'),
('cmm0e7jxm00jxm6h0dhcifcy0', 'adimulyo@dewinustiowati', 'DEWI NUSTIO WATI', NULL, '082324460216', 'adimulyo,turus,rt01/rw02', 'dewinustiowati-adimulyo', '-22,44', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-02-24 09:18:08.554', '2026-04-30 02:24:04.885'),
('cmm0grfap00k0m6h09gkhaws3', 'sidoharjo@sitiharyatun', 'Siti haryatun', NULL, '+62 857-2981-6960', 'sidoharjo rt3/02', 'Sitiharyatun-sidoharjo', '', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2026-02-24 10:29:34.897', '2026-07-20 09:16:43.101'),
('cmm24uany00k6m6h05m1m9b77', 'jabres@mustofa', 'Mustofa', NULL, '+6288211485396', 'Jabres Lor Pondok', 'Mustofa-jabres', '-25.4', 65000, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk6h4t0009vpbgt1pmw986', NULL, NULL, NULL, '2026-02-25 14:31:25.822', '2026-07-10 03:01:40.848'),
('cmm7wkp5y00kxm6h0ibgv5w7n', 'manggal@roismunaji', 'ROIS MUNAJI', NULL, '082223357611', 'Temanggal,rt01/rw02', 'roismunaji-manggal', '-27', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-03-01 15:26:38.182', '2026-07-09 22:52:13.107'),
('cmm8tjzav00l3m6h0peeyrev8', 'joho@vikifaturrahman', 'VIKI FATUR RAHMAN', NULL, '085832267305', 'Joho,rt04/rw02', 'vikifaturrahman-joho', '-25', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-03-02 06:49:51.991', '2026-07-04 03:51:18.669'),
('cmm949nuw00lbm6h0076syfd0', 'karanggedang@aricahyaningtyas', 'ARI CAHYANING TYAS', NULL, '088232198947', 'karanggedang,rt04/rw01', 'aricahyaningtyas-karanggedang', '-20,67', 0, 'ACTIVE', 'cmazjsfz40001vpbgiekv6d6f', 'cmazk5jf80008vpbg0z4rwud1', NULL, NULL, NULL, '2026-03-02 11:49:46.376', '2026-06-03 04:07:06.053'),
('cmmdaafiu000am6wilg8drf60', 'pakyang@martiningsih', 'Martiningsih', NULL, '085725729045', 'Tf pakyang rt02/03', 'Martiningsih-pakyang', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2026-03-05 09:49:24.630', '2026-07-14 13:04:10.613'),
('cmmi20xkm0001m6flmp4faoam', 'manggal@santianaindrayani', 'Santi Ana Indrayani', NULL, '6283805046616', 'Temanggal Rt. 01/002', 'Santiana-manggal', '-17.160', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-02-08 17:56:55.413', '2026-07-12 03:57:13.391'),
('cmmi2580z0003m6flu0m70rqz', 'manggal@srisupadmin', 'Sri Supadmi', NULL, '62895411798119', 'Songging Candiwulan Rt. 01/01', 'Srisupadmi-manggal', '-12', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2026-02-08 18:00:15.587', '2026-07-11 12:41:24.148'),
('cmmlt6p82000em60jhw6qctj4', 'pagutan@darmawan', 'Darmawan', NULL, '6285612345678', 'Pagutan', 'Darmawan-pagutan', '-12', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2026-03-11 09:00:32.690', '2026-04-10 12:46:09.509'),
('cmmnrkj28004nm60jr55ixe8x', 'skt@nurdianto', 'Nurdianto', NULL, '+62 857-2750-6349', 'soka tengah rt01/03', 'Nurdianto skt', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-03-12 17:50:51.008', '2026-07-13 11:58:15.626'),
('cmmom4oez005rm60jq9zgdlq3', 'pagutan@darsono', 'Darsono', NULL, '6287834971936', 'Sidomulyo 002/003', 'Darsono-pagutan', '-12', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkd4ss000fvpbgil3pkilv', NULL, NULL, NULL, '2026-03-13 08:06:19.547', '2026-04-10 12:51:57.595'),
('cmmt9negl007zm60j8mydvd81', 'skt@yusril', 'Yusril mahendra djamil', NULL, '085932160184', 'soka tengah rt02/03', 'Yusril-skt', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-03-16 14:15:48.981', '2026-07-13 09:00:38.171'),
('cmmugrrq80089m60j90ssevff', 'karang@sukiyem', 'SUKIYEM', NULL, '087840436698', 'karang,temanggal,Rt02,rw01', 'sukiyem-karang', '-25,67', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-03-17 10:22:56.288', '2026-07-03 12:28:35.767'),
('cmmuub1g6008bm60jg029wvy7', 'skt@azizrosidin', 'Aziz rosidin', NULL, '087737790495', 'skt rt02/03', 'Azizrosidin-skt', '-23', 30000, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-03-17 16:41:50.358', '2026-07-20 10:05:32.194'),
('cmne4bsdo0097m60jhyixosm5', 'skt@titikrahayu', 'Titik rahayu', NULL, '085895853231', 'skt rt02/03', 'Titik rahayu-skt', '-23', 40000, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-03-31 04:29:58.764', '2026-07-10 03:42:09.455'),
('cmnfqio01009tm60j875m41rn', 'joho@niveraevenkaresta', 'NIVERA EVEN KARESTA', NULL, '082225251127', 'joho,Rt04/Rw02,adimulyo', 'niveraevenkaresta-joho', '-22,56', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-04-01 07:38:57.409', '2026-07-01 11:08:16.044'),
('cmnfxk5q9009ym60jqhzld7gq', 'karang@fiqihsugesti', 'FIQIH SUGESTI', NULL, '081392781138', 'karang,Rt01/Rw01,temanggal', 'fiqihsugesti-karang', '-23,67', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-04-01 10:56:04.353', '2026-07-06 03:34:16.646'),
('cmnijhei700atm60jza9abgfr', 'jonggol@mukhamadmuflikhudin', 'MUKHAMAD MUFLIKHUDIN', NULL, '087881717268', 'jonggol,Rt004/Rw001,Aditirto', 'mukhamadmuflikhudin-jonggol', '-22,76', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2026-04-03 06:45:19.663', '2026-07-10 03:20:26.093'),
('cmnoi6aah00c7m60jjvhdg9m4', 'karanggedang@imamfauzi', 'Imam fauzi', NULL, '087718090690', 'Karanggedang kulon yunani', 'Imam fauzi-karanggedang', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2026-04-07 10:55:18.425', '2026-06-08 06:35:35.624'),
('cmocpcjj4000km6ch6ii8te9z', 'joho@suratman', 'SURATMAN', NULL, '082135879252', 'Joho,Rt03/rw01', 'suratman-joho', '-27.96', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-04-24 09:22:35.871', '2026-07-11 23:09:47.515'),
('cmoi9bmmi000zm6chjp7ju4zb', 'sruweng@yoncell2', 'MULYO KARSONO2', NULL, '0895364201095', 'Sruweng,rt01/rw04,ingas', 'yoncell2-sruweng', '-26,67', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2026-04-28 06:40:36.426', '2026-06-13 06:08:48.508'),
('cmos1tp7h003mm6chc3eg4zs3', 'skt@ahmadsofiyuddin', 'Ahmad sofiyuddin', NULL, '085198604312', 'skt rt01/03', 'Ahmad sofiyuddin-skt', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-05-05 03:08:24.413', '2026-07-10 03:48:03.611'),
('cmosnozfx0049m6ch05529ah5', 'manggal@mustolih', 'AMIN MUSTOLIH', NULL, '083184706004', 'Temanggal,rt01/rw02,Adimulyo', 'mustolih-manggal', '-25,64', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-05-05 13:20:35.949', '2026-07-04 00:04:42.360'),
('cmotljaxw004nm6chhn0uj912', 'manggal@catri', 'CATRI', NULL, '081901997503', 'Temanggal,rt04,rw02', 'catri-manggal', '-18,56', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-05-06 05:07:57.860', '2026-07-04 23:21:13.954'),
('cmov9e1tl005am6chdjj8j0og', 'jonggol@syabani', 'Syabani', NULL, '085180980750', 'Jonggol rt03/01', 'Syabani-jonggol', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2026-05-07 09:03:29.721', '2026-07-10 03:33:57.270'),
('cmozkbq6o0093m6chry979qj4', 'jonggol@nurjanah', 'NURJANAH', NULL, '085842545830', 'jonggol,rt01/rw02,Aditirto', 'nurjanah-jonggol', '-13,67', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2026-05-10 09:20:41.808', '2026-07-08 03:35:06.314'),
('cmpcm5mvs00fpm6ch076gew8a', 'joho@arifsusanto', 'ARIF SUSANTO', NULL, '082221941355', 'Joho,Rt04/Rw02', 'arifsusanto-joho', '-22.56', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-05-19 12:32:57.112', '2026-07-09 13:10:05.478'),
('cmpdx65od00gqm6ch98rebx9r', 'wareng@refa', 'Refa martha gunawan', NULL, '0895422864428', 'Wareng rt04/02', 'Refa-wareng', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2026-05-20 10:29:03.421', '2026-07-08 03:51:28.140');
INSERT INTO `customer` (`id`, `username`, `fullname`, `email`, `phoneNumber`, `address`, `ontName`, `redamanOlt`, `diskon`, `status`, `paketId`, `areaId`, `odpId`, `modemId`, `oltId`, `createdAt`, `updatedAt`) VALUES
('cmptlyfrq00hmm6chf0cynmdi', 'sidoharjo@trimurniati', 'TRI MURNIATI', NULL, '081392841921', 'sidoharjo,sruweng,Rt001/002', 'trimurniati-sidoharjo', '-14', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2026-05-31 09:59:26.294', '2026-07-11 05:42:14.362'),
('cmptrbjvd00hom6chwgmmigi9', 'skt@kasminah', 'Kasminah', NULL, '082322144391', 'Soka tengah rt01/03', 'Kasminah-sokatengah', '23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-05-31 12:29:36.217', '2026-05-31 12:29:36.217'),
('cmpupaccz00hzm6chdksdzegw', 'pakyang@sugengpranoto', 'SUGENG PRANOTO', NULL, '088980647706', 'pakyang,Rt01/Rw01', 'sugengpranoto-pakyang', '-22,65', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2026-06-01 04:20:26.771', '2026-07-14 12:55:17.788'),
('cmpuy5kg200i7m6chv6fdo2zg', 'joho@suyanti', 'SUYANTI', NULL, '08882599669', 'joho,Rt03/Rw01', 'suyanti-joho', '-24,54', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-06-01 08:28:40.514', '2026-07-04 13:45:34.393'),
('cmpv8b2fc00idm6chghbbpjse', 'skt@novita', 'Novita rahmayanti', NULL, '085776049856', 'Soka tengah rt02/03', 'Novita rahmayanti-skt', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-06-01 13:12:53.256', '2026-07-10 03:39:37.976'),
('cmpwd2ba600inm6chwk3a4anv', 'candiwulan@agustriyono', 'AGUS TRIYONO', NULL, '082136854090', 'candiwulan,Rt001/Rw002', 'agustriyono-candiwulan', '-26,67', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2026-06-02 08:13:49.086', '2026-07-11 13:28:44.075'),
('cmpwqahx000ium6ch9nq7fw5j', 'karang@supriyatno', 'SUPRIYATNO', NULL, '089603313123', 'Dk.karang,Temanggal', 'supriyatno-karang', '-23,65', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-06-02 14:24:05.940', '2026-07-10 01:36:15.964'),
('cmq51e44q00n7m6chyzecc3dr', 'mbahcokro@purwodeso', 'Mbah Cokro', NULL, '6281617240277', 'Pandansari', 'Cokro-purwodeso', '-12', 0, 'ACTIVE', 'cmq5bferl00nem6chfie4et4l', 'cmazkipb1000jvpbgc66jsz75', NULL, NULL, NULL, '2026-06-08 09:56:59.882', '2026-06-08 15:13:52.836'),
('cmq6pc62400obm6chh9m4pne5', 'pakyang@hastuti', 'HASTUTI', NULL, '085292710826', 'pakyang, Rt01/Rw02', 'hastuti-pakyang', '-24, 56', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2026-06-09 13:55:06.028', '2026-07-13 02:04:20.770'),
('cmqdk1o7s006um6xsuzqyyrer', 'joho@mulyadi', 'MULYADI', NULL, '081380496362', 'joho,Adimulyo', 'mulyadi-joho', '-24, 67', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-06-14 09:01:21.496', '2026-07-05 16:01:25.619'),
('cmr20cnm30017m6wnn09myfz4', 'skt@akamadtakhrir', 'Akamad takhrir', NULL, '082135517982', 'Soka tengah rt02/03', 'Akamad-skt', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-07-01 11:44:16.011', '2026-07-01 11:44:16.011'),
('cmr330tyw001hm6wnuhgpemsw', 'pakyang@suripno', 'SURIPNO', NULL, '08999257578', 'Tepakyang, Rt002/02', 'suripno-pakyang', '-24', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkk9a6000lvpbgwpca6hjz', NULL, NULL, NULL, '2026-07-02 05:46:49.400', '2026-07-02 06:51:09.982'),
('cmr36vqfb001nm6wnt7hcuxwi', 'joho@nelimartyaningsih', 'NELI MARTYANINGSIH', NULL, '082112324471', 'Joho,songging, rt01/01', 'nelimartyaningsih-joho', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-07-02 07:34:49.991', '2026-07-02 07:39:52.522'),
('cmr3io0o3001vm6wnrqihiyyk', 'klapagada@wiwittuniyah', 'Wiwit tuniyah', NULL, '089727350235', 'Klapagada samping pom', 'Wiwit tuniyah-klapagada', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkcjx0000evpbgwye73rlh', NULL, NULL, NULL, '2026-07-02 13:04:45.411', '2026-07-02 13:04:45.411'),
('cmr7f88sq000fm6xn7klstqc4', 'candiwulan@lujiyanto', 'LUJIYANTO', NULL, '085740014076', 'Candiwulan, songging, Rt01/01', 'lujiyanto-candiwulan', '-25', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2026-07-05 06:39:35.306', '2026-07-05 06:39:35.306'),
('cmr7ioyrl000hm6xnvyyfyo9p', 'candiwulan@rajimin', 'Rajimin', NULL, '082139383854', 'Candiwulan dk bak rt01/01', 'Rajimin-candiwulan', '-23', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2026-07-05 08:16:34.305', '2026-07-05 08:16:34.305'),
('cmr7o9w3q000jm6xn81qkab2q', 'jonggol@fredyaruniariza', 'FREDY ARUNIAREZA', NULL, '089635511524', 'Jonggol, Rt01/Rw01', 'fredyaruniariza-jonggol', '-21', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk9kw6000bvpbgk9mivko9', NULL, NULL, NULL, '2026-07-05 10:52:48.710', '2026-07-05 10:52:48.710'),
('cmr9b72fq0019m6xn5yhanvc7', 'manggal@ahmadfatoni', 'Ahmad fatoni', NULL, '087779144565', 'Temanggal rt02/02', 'Ahmad fatoni - manggal', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-07-06 14:22:14.294', '2026-07-06 14:22:14.294'),
('cmraif4660002m65jkttsxux6', 'candiwulan@sutarman', 'SUTARMAN', NULL, '085735637039', 'Candiwulan,Rt02/02', 'sutarman-candiwulan', '-21', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2026-07-07 10:32:13.278', '2026-07-07 10:32:13.278'),
('cmrbz464g0021m65jqhkos3gj', 'wareng@davy', 'Maulana asfa davy byansyah', NULL, '082155877130', 'Wareng rt04/02', 'Davy - wareng', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkl8fx000nvpbgj232l6wo', NULL, NULL, NULL, '2026-07-08 11:07:22.240', '2026-07-08 11:07:22.240'),
('cmrdpm8em0039m65joyrtassn', 'skt@uli', 'Laela uli latihfah', NULL, '081392187177', 'Soka tengah rt01/03', 'Laela uli lathifah', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-07-09 16:17:01.198', '2026-07-09 16:17:01.198'),
('cmrhlm7ys0001m6uco8olcelb', 'skt@istiyanti', 'Istiyanti', NULL, '0895380219117', 'Soka tengah rt01/03', 'Istiyanti-skt', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-07-12 09:36:06.868', '2026-07-12 09:36:06.868'),
('cmrhmukkb0003m6ucsswbrxn0', 'candiwulan@suroto', 'SUROTO', NULL, '081327014392', 'candiwulan,Rt01/01', 'suroto-candiwulan', '-21', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazk4yri0007vpbg8makbide', NULL, NULL, NULL, '2026-07-12 10:10:36.059', '2026-07-12 10:10:36.059'),
('cmriy43bq001cm6ucauyknhzi', 'sugran@yazidalamin', 'YAZID AL AMIN', NULL, '089654128750', 'Temanggal, Sugran, rt01/01', 'yazidalamin-sugran', '-21', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-07-13 08:13:42.230', '2026-07-13 08:13:42.230'),
('cmrj3teuc001lm6ucv59bc0bt', 'sokalor@elsaelawati', 'Elsa elawati', NULL, '+62 851-4771-4317', 'Soka lor', 'Elsa elawati - sokalor', '-23', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazke7f8000hvpbg36j0h97g', NULL, NULL, NULL, '2026-07-13 10:53:21.636', '2026-07-13 10:53:21.636'),
('cmrkhx15m0025m6ucpas7u8xx', 'manggal@wahidun', 'WAHIDUN', NULL, '085199611393', 'temanggal', 'wahidun-manggal', '-15', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkjdbh000kvpbg7cf3tl0x', NULL, NULL, NULL, '2026-07-14 10:15:51.322', '2026-07-14 10:15:51.322'),
('cmrltit8n002qm6ucjdw5v15c', 'sidoharjo@khoirizaenul', 'Khoiri zainul muttaqin', NULL, '085743797676', 'Sidoharjo olix', 'Khoiri zainul muttaqin-sidoharjo', '', 0, 'ACTIVE', 'cmazjsfz40000vpbgy9wu9hmc', 'cmazkdr8t000gvpbgjbdde0wf', NULL, NULL, NULL, '2026-07-15 08:28:29.446', '2026-07-15 08:28:29.446'),
('cmron0wzb0002m6kwcm7yecxt', 'joho@pariyem', 'PARIYEM', NULL, '081394808190', 'joho, rt01/01', 'pariyem-joho', '-22', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazk8p11000avpbgnwlwt9j4', NULL, NULL, NULL, '2026-07-17 07:49:55.319', '2026-07-17 07:49:55.319'),
('cmrp0otd90004m6kwwt7x6ylx', 'skt@raflipamungkas', 'RAFLI PAMUNGKAS', NULL, '089604591146', 'skt, Rt02/Rw03', 'raflipamungkas-skt', '-13', 0, 'ACTIVE', 'cmbeop7p20000m6m59bddn3mz', 'cmazkenuk000ivpbgtu4ejhsn', NULL, NULL, NULL, '2026-07-17 14:12:25.389', '2026-07-17 14:12:25.389');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customerpassword`
--

CREATE TABLE `customerpassword` (
  `id` varchar(191) NOT NULL,
  `hash` varchar(191) NOT NULL,
  `customerId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customerpassword`
--

INSERT INTO `customerpassword` (`id`, `hash`, `customerId`) VALUES
('cms417hwo0000bsj03rpjazy1', '$argon2id$v=19$m=19456,t=2,p=1$wNypdm5RYZknlkyozI1CsQ$BQI8Zu4B7Q91GnzXc2BSGwDscBdI/+Ic5ynZ6zny6bM', 'cmazlo07h00f3vp4swpm6151c'),
('cms417hyv0001bsj0thynonbk', '$argon2id$v=19$m=19456,t=2,p=1$mFo5gn3h2eJJeY6EM+snsQ$WYVhhCt1hB2gzzFNYGSaaBFJ4+dYHb0G06sEddoLiMs', 'cmazlo03700e7vp4sjg9zf0br'),
('cms417i080002bsj08je29vwd', '$argon2id$v=19$m=19456,t=2,p=1$GFWSbcgHfYCUGTMbShmJSQ$EHt43XcVyde3vfA1PaPZYIw9Lw0Sz+Uy4WIoNSS4KYA', 'cmazlnz5q0077vp4s973xbz7a'),
('cms417i1c0003bsj0tq6iti2l', '$argon2id$v=19$m=19456,t=2,p=1$5V6GmjFa89tMh2R3S1DIow$mx8Y8FOjUXldb2Mg2Oa0UI+9iZJX40gFzb1fJ+SHIyI', 'cmazlnyn7003jvp4sixlw9cwb'),
('cms417i2i0004bsj0apri4yg7', '$argon2id$v=19$m=19456,t=2,p=1$t+Yr7R+G9wkF9L9kPal4PQ$CzEq0OG8EpX4ExYw1WpeVbRQ5PlnVOTzLh8DppI7srY', 'cmazlo0ek00glvp4so2w0jj6r'),
('cms417i3w0005bsj0s70wjxdj', '$argon2id$v=19$m=19456,t=2,p=1$7usupFRoCfrI3ltp2jxa0w$y5qypUC7hBJ9KBMaL+sbjivLp6mph3VTKL+7XZWCTtc', 'cmazlnzr300blvp4sf1ygsc5z'),
('cms417i4v0006bsj08lmwsmq8', '$argon2id$v=19$m=19456,t=2,p=1$fbDwkwfVMSLr4XEEDSRUkg$e8HN80Bk7CyxHVefe5kkVIb8IFaYYiYDReJ2r8dNeWw', 'cmazlo0eu00gnvp4sh8f2pubo'),
('cms417i5w0007bsj0e36trhcw', '$argon2id$v=19$m=19456,t=2,p=1$Rq8qu12aCVcL8FpmjUuNkw$8aypfJ38DzVtIQmrgEx9mzz/CNpkewb+A8B/fjCLhEQ', 'cmazlnybw0017vp4suncxtzdv'),
('cms417i710008bsj0dtjke1f3', '$argon2id$v=19$m=19456,t=2,p=1$bmgALvSZtYekV/EYiaGmAQ$IzgO5vR6zY35+Ktty35yTWXX1jKJF13+dNNqWnOKpKc', 'cmiu2ei22003lm64dcj43yv0t'),
('cms417i890009bsj01r3xbjsa', '$argon2id$v=19$m=19456,t=2,p=1$Qtdx4IWaFcLOadQLxpVfmA$pFUrWGzhjn3Beiq803TpvEu8cSuc9JR/klw2q3M1lEI', 'cmazlnyww005jvp4sii01rb7j'),
('cms417i9h000absj0rvb2xrdq', '$argon2id$v=19$m=19456,t=2,p=1$+5jvJr9wuJTa/Jj4xI8q5g$P4vy8GGbbYVE5r2SF/OUtolqpS92klh142bunynNbPE', 'cmazlny7x000dvp4sfl5q67zx'),
('cms417iah000bbsj020gxoc5g', '$argon2id$v=19$m=19456,t=2,p=1$S69R4wsdjHc6i2PKNqip0w$ph/lH+ic6kwE0FREIwjOgY3sOfegN1cW0FKmXneIO7s', 'cmazlo1bo00ndvp4swgxnptyd'),
('cms417ibh000cbsj0y9ca252g', '$argon2id$v=19$m=19456,t=2,p=1$oQn5btE2ocE4A9ZlGk66Ug$E8axzxQ3O7JuDkdJpkF6r2P4l9XlZrQg2tUMQHCCHO4', 'cmazlnyni003lvp4sdnfl09um'),
('cms417ich000dbsj06pmf26e0', '$argon2id$v=19$m=19456,t=2,p=1$GbeWDB1QF2JjrH/19tm6pQ$591wKFNkUtj/FSYfbWZO/m1Ibrn5ijdB9b4MdB8CCUU', 'cmazlo0f200gpvp4sgwfd5msv'),
('cms417idn000ebsj09w9w9thg', '$argon2id$v=19$m=19456,t=2,p=1$9RySgvlYNIq8O+ic7b4gEA$B6aXz3RlENBmOAATTvl0PTogPYAq/Xk/Qqg0Pl552oM', 'cmazlo07r00f5vp4s00sg0np4'),
('cms417iet000fbsj0v891p72x', '$argon2id$v=19$m=19456,t=2,p=1$/VbRTPQ3eNMitFHbUzGZjQ$8zt/rmWleED9qy6vbkg1JmrFcUh11tschaxj2qXzQms', 'cmazlny87000fvp4sajtjpt3u'),
('cms417ifx000gbsj0g4rctd6p', '$argon2id$v=19$m=19456,t=2,p=1$UXJ8hg1sCzZOvgYTtKWEsA$U3+7cAcqTkrgFvDgbWLiddx7iZrdKDWAzU2vl2JOoQc', 'cmazlo0z600kxvp4sly1xmfpd'),
('cms417igu000hbsj0do1i2ujz', '$argon2id$v=19$m=19456,t=2,p=1$JBQBPqy53S+RSDAm/aymCQ$8dSIfzXYt4Jank5mnKLxFUrdWfqlD6Ej62etTcdNUv0', 'cmazlny8h000hvp4sw0fxo8pz'),
('cms417iht000ibsj03wogkb1d', '$argon2id$v=19$m=19456,t=2,p=1$d1/JG0RskVJao9hFG/7PIg$yTXX8QzBBn5+ju4Ijm0Xk9bHbyto0ssxQckKK9hM+Z8', 'cmazlnzpj00b9vp4shbpszs3v'),
('cms417iit000jbsj0vgik39cu', '$argon2id$v=19$m=19456,t=2,p=1$7FsCwSv6QrWDwFIiI2a+Bw$xqJ0o7LRuBNJG89tqXg13Z/uHpNEhVw5EO9Kp+gp4A4', 'cmazlo0fb00grvp4syyvmvp9j'),
('cms417ik0000kbsj0frzsur01', '$argon2id$v=19$m=19456,t=2,p=1$/Qtp44GWRLGMdVDZlmpeKQ$i+MHQ+dDox2NJnhtZp08RkdAw1yxr/ylUDwg+J1y2NA', 'cmpwd2ba600inm6chwk3a4anv'),
('cms417ikz000lbsj0k8gvyeuk', '$argon2id$v=19$m=19456,t=2,p=1$SoYpEio1iEf7ZDojIye9vA$ESlXxoKuZjNOw9UONyGtwgJjhn0xa38Lx/vMM1k4IHI', 'cmazlnzrb00bnvp4szf350swd'),
('cms417ily000mbsj0aycpv2hy', '$argon2id$v=19$m=19456,t=2,p=1$tnS980U0JfN/HpBoGeb5sg$wquAs2FAQJz4NwSP87n0n0eOeFjkZfpGmgKj3WFbMQ4', 'cmazlnz6j007dvp4s9j2tdyl6'),
('cms417in4000nbsj05vj0ymcc', '$argon2id$v=19$m=19456,t=2,p=1$oXayyS2r67IGrtC+k6vkuA$uBOjebTyjnHXfoYAVkbNOZU5kuwFlpgMaOKXNbUg4Es', 'cmr9b72fq0019m6xn5yhanvc7'),
('cms417ioj000obsj0r23ae09g', '$argon2id$v=19$m=19456,t=2,p=1$TaHrbA9SHO6xdCwifvYkVA$fNRlufLEiOOSwhCQqRzY2hgCzJ7wvh5XjjSlHk5Ksog', 'cmazlnzb2008dvp4sspknsysy'),
('cms417ipo000pbsj0ti4ko0tc', '$argon2id$v=19$m=19456,t=2,p=1$r4MlHQpDAY9tVVBFQHEh5A$YtS9z9fLPPaZZDp5jz9gVPHy7KjOaDPe8U6uFC3Mte4', 'cmazlnz0q0065vp4sc9cb39jn'),
('cms417iqr000qbsj023kqw3al', '$argon2id$v=19$m=19456,t=2,p=1$3xQymXdpZ/SGIoffZdbDwg$Js1uujpNi5rOV+amnb6E4E5REqQ3mkyk8g8/njYikTg', 'cmazlo0fl00gtvp4su89dbzl8'),
('cms417is8000rbsj04ohk0j2m', '$argon2id$v=19$m=19456,t=2,p=1$i30czMOK4JvDwMxM7o2gkA$GSmloku+5DklcNEOwxtBIs8K/AJqf5286EmxdP7pYUs', 'cmos1tp7h003mm6chc3eg4zs3'),
('cms417itf000sbsj0j9wlxh55', '$argon2id$v=19$m=19456,t=2,p=1$sbj0skdW5NQKbZ7HJ54qFg$QXSLFIx7Ssj4A5mN8G4c22OJfUVNzBwIlntD/PtQbpU', 'cmi1klt9n009qm6o609prbtkd'),
('cms417iuk000tbsj0hl5eooli', '$argon2id$v=19$m=19456,t=2,p=1$bxgsgBGrUMB3tIEGSaxWbw$qZl519T2riGW8PHzGCtbreZy3cP4swAKLu/jdLHtmHs', 'cmazlo0fu00gvvp4sx1tfqq9m'),
('cms417ivu000ubsj0olygyep4', '$argon2id$v=19$m=19456,t=2,p=1$yIYKce2KacnQLt4YPQxEUA$JmVPHLPZkrKCeroqDaCPyU/Dmcm3Nt0l++jf85B/SjA', 'cmazlnyxr005pvp4sgzcmbgfh'),
('cms417iwu000vbsj0m1ght9x5', '$argon2id$v=19$m=19456,t=2,p=1$uEyL9l4wJfJvj0KHFzKfvg$xLVPffgju7h+syrBTI8l1vCRVT3p2aqPsmDKkQqltm0', 'cmazlnyh60029vp4sx377xtjy'),
('cms417ixu000wbsj07lh4lb0x', '$argon2id$v=19$m=19456,t=2,p=1$JohbutbRjZm7e7sMdiXwyw$ScrV4SWqKEFIM+t2/zfN8isEKVdzJAh44/PYYwbXAaI', 'cmf3wlt2e001dm6rew4zf23ui'),
('cms417iyu000xbsj0kmiil1m2', '$argon2id$v=19$m=19456,t=2,p=1$w1OtioB35MVCpwRr5/G7Pg$3WmbHoXA04avLzAIFaqyZlA47Tkz797cPAgpwA+T864', 'cmr20cnm30017m6wnn09myfz4'),
('cms417j00000ybsj0agp9lp8t', '$argon2id$v=19$m=19456,t=2,p=1$mFCSIMVC6xP12ttu+s6leg$B0qadzeytJ21/XPak0tyKglPReULrwuJg7j5+bk7/vA', 'cmazlnzbb008fvp4sx7zy48n1'),
('cms417j19000zbsj0l69npdmy', '$argon2id$v=19$m=19456,t=2,p=1$vx21SUSJIVMAwrfZTH0zPg$BynuAmE/AMwIokztK3xv1deM0np5q4dGUzygyWS4FjM', 'cmin9i7wo000ym64dqcoogdkw'),
('cms417j260010bsj0uj1p4mpv', '$argon2id$v=19$m=19456,t=2,p=1$oZJ574pIorOG7w6GM4XFFQ$ZTGoC5WQ98AzvuImhbqUFWVcbYCKadQsBW1LM4aT410', 'cmazlo0g300gxvp4siyfebv4j'),
('cms417j330011bsj0znibv965', '$argon2id$v=19$m=19456,t=2,p=1$kvR4Q8vuUDghqr1WgVSPCw$AxO0w4GEZiJKWY2LYWu23jP+W3et5BHtLlzklDnbSUY', 'cmazlo08000f7vp4s3p9yvfma'),
('cms417j420012bsj0d24ck8nx', '$argon2id$v=19$m=19456,t=2,p=1$FddwT3dxg95/Pidtc1wzqw$9MxWJ1hglnldjLifJA2cr2Eilixs+kOTSsctCVUuaZ4', 'cmazlo0gc00gzvp4s54puwopc'),
('cms417j500013bsj084y20wz1', '$argon2id$v=19$m=19456,t=2,p=1$E6TGtx9Q7mxVGdHHLFxGfw$tvIdnXRoHNGDtXmioxuyzOJ912rw1WSs+qIOmUlXDHc', 'cmeb6743700drm6cb7e8dxt8w'),
('cms417j600014bsj02a40qlj0', '$argon2id$v=19$m=19456,t=2,p=1$8yq4jaAvqhYYmRgyFGSIJg$R1LBqso0Z4sTOOGsOy/HtRSXXmuMjCgGDTU0Ev+jMvs', 'cmazlnyy6005rvp4sli2cqng8'),
('cms417j780015bsj0ym5dgqkb', '$argon2id$v=19$m=19456,t=2,p=1$KptpMz80futDjw2kW4WVHg$gsSoHhTx3b0Aw0MkH8cto06Awo5ar+0LHmibA1Y7iHc', 'cmazlo08a00f9vp4s2lewlnkf'),
('cms417j8a0016bsj0kmhn9ahw', '$argon2id$v=19$m=19456,t=2,p=1$kUryoJyHT6DGDL4IMuna+A$s7bc+h4XrnyeLI8fo2sF2MGeTvNcPND1SUJlTd/gGWY', 'cmazlo19i00mxvp4sm0axnb4o'),
('cms417j980017bsj0wbkcxgjc', '$argon2id$v=19$m=19456,t=2,p=1$IfY2ixjNXe6ikZNNR9cslw$qOmqjdiZ8YRT5Vtxh9t3eNbNVOsUyt6WQHsNi1TQIOE', 'cmosnozfx0049m6ch05529ah5'),
('cms417ja60018bsj03fcij2mn', '$argon2id$v=19$m=19456,t=2,p=1$563GuZnyqogB7g97zWpJnw$/Gr6zUtsW72RSO3SQCXidIFR79mNSAEHLPkPQmojJyY', 'cmjcn0u0r00brm6zpsxzu0hxl'),
('cms417jbb0019bsj0ihhted3k', '$argon2id$v=19$m=19456,t=2,p=1$NRJpv2AF79AuXSbxYOHbBA$pl4Vo+LXP3Xq80V7m8GKYiqNSUgZcN4J8UFArdKDHxk', 'cmazlo0zf00kzvp4s1j3gjpgd'),
('cms417jce001absj0jrh6onyg', '$argon2id$v=19$m=19456,t=2,p=1$FVuvbpImVfq/u4y6+gCnEQ$fjwMReBTJkuaAAD8R3icZuSYwNKl/KaePoe19VpfLKc', 'cmazlo04k00ehvp4s83vccuqj'),
('cms417jdg001bbsj0d1jplyid', '$argon2id$v=19$m=19456,t=2,p=1$m3eF2JTqPHaMoCFEYStY3g$zRn4Xyt6SGAkK+IouFSCYTP9OHhKdOsgIH5GUU3RkYg', 'cmazlnz6t007fvp4s4nt8rfx3'),
('cms417jee001cbsj01xn1ilwi', '$argon2id$v=19$m=19456,t=2,p=1$RO11Dwr6ZmuXxKZMgx5daw$RL+BAr4nqInuz3aB1x1fVnw7OfEd8EqmuXV6W3pk8vE', 'cmazlo0gk00h1vp4sy2022081'),
('cms417jie001dbsj0nqhhcf9o', '$argon2id$v=19$m=19456,t=2,p=1$Pc6WGdX21Dmuxp+L6NfGJA$ufu7QkY5kYd1KXbBWQlLJpnml9EGoVOzoDhyzSpNkKI', 'cmazlo0gu00h3vp4s2dm5tp4z'),
('cms417jk8001ebsj0n95qzdx7', '$argon2id$v=19$m=19456,t=2,p=1$0q5DlWNhPhNNHZkKfjJYcg$VvGjkGU8ofXDW3kecGdoypawspVixbcsm3LtSyuLPkw', 'cmazlny5d0001vp4sxzwcszgp'),
('cms417jle001fbsj0f2z31hdt', '$argon2id$v=19$m=19456,t=2,p=1$fISvTtsOJXWiXELvaqHiug$kYEb18X+3treieW6VV6reUnSvOy2yDp5f4939OtJnIY', 'cmazlnztc00c3vp4s29ramlq2'),
('cms417jmc001gbsj0643wwiw5', '$argon2id$v=19$m=19456,t=2,p=1$OrJ6Xgmf3sQ6g8ovvQo3NA$43JrlVzRSehUUbOkiFwRVq98IeJjTwUoI55K0qHa0l0', 'cmazlnyk0002vvp4snj3kq57k'),
('cms417jnb001hbsj0qttpywo3', '$argon2id$v=19$m=19456,t=2,p=1$B2kpv5t8EC3rqmLZyrkHxw$vnDZMimUO7Rb8yo/z5rtqc3KUtY70xT/3bsiRg8BVfE', 'cmazlnygl0025vp4s5tt9ptec'),
('cms417jod001ibsj0llyl261b', '$argon2id$v=19$m=19456,t=2,p=1$TdSL2cW2Vs0VFkpujM0UGw$oKilnDR/s4UtfI5r2b1GPPDwws/TQmdbVds1g40rHuw', 'cmazlnzvk00clvp4sl4bwo4bt'),
('cms417jpf001jbsj035beu0x2', '$argon2id$v=19$m=19456,t=2,p=1$JTYhf73LdRgXRdXoDZjtYQ$JmLYfpdtdSp7B9l7yXQ9Mb0uIKAwcdpUqA+ZDtkl1mA', 'cmix3hfzg0016m6zpa94a6h78'),
('cms417jqm001kbsj05tnvaljq', '$argon2id$v=19$m=19456,t=2,p=1$m44KHYrSxB2N/xkfAN7Rdg$6tVWpsUtdnlAJiXPR6Z3P2YXI/76HE5kYDGKeCQmvO0', 'cmm949nuw00lbm6h0076syfd0'),
('cms417jrp001lbsj0p8foup83', '$argon2id$v=19$m=19456,t=2,p=1$uzL/SPNM/cxvDQPghxVBMg$X/O5ULDUOo4E4j/j0OeaL9m50f5BCSwpRs8wUHNucG4', 'cmazlo0h300h5vp4s8ws075vu'),
('cms417jso001mbsj06oe13oke', '$argon2id$v=19$m=19456,t=2,p=1$/OoHds4nXlnbYdqVvQo4kA$oCsK+TpBaVts65TGgNWAveqSQaiQjahQc2x6uTDllX4', 'cmazlnyns003nvp4s0ytj62rc'),
('cms417jto001nbsj07sy50rce', '$argon2id$v=19$m=19456,t=2,p=1$2iNyhOUwJd6gMNMLKBRVbg$kofDGGVs4XIMIiQrML4/Tl7jxC0+Y30Ax1SllK/MvRU', 'cmazlo08j00fbvp4s9wilk5tn'),
('cms417juo001obsj01fhb6olq', '$argon2id$v=19$m=19456,t=2,p=1$UbfJUblTCag5pPFJIBR6CA$YySuOUa8gQePhGlP5w8XRWNA2MY/uV7fEpIAFIks0J8', 'cmazlnzbk008hvp4scsjfa0bk'),
('cms417jw2001pbsj0vgm7byu3', '$argon2id$v=19$m=19456,t=2,p=1$zR8koWe0JxoDak2QHri1rA$kSNEMAzhSUD9k71hT7VOiBdwH9jpAFq4dDLcjNTjmmE', 'cmazlo0hc00h7vp4sm6nsx1cp'),
('cms417jwz001qbsj0dcho7yrx', '$argon2id$v=19$m=19456,t=2,p=1$wCaCFWawxJHECjWH6asOew$ibx793krborxxEUE064+DsbYbts5NbwsjRFnyCNQ1no', 'cmpcm5mvs00fpm6ch076gew8a'),
('cms417jxz001rbsj09jsvi7z1', '$argon2id$v=19$m=19456,t=2,p=1$g4BJyPJWX6elPFA6jxVvyg$NJmV01Yd50odr+NQmnCOW1xVC5kW5jE7K7Y47z5tcSI', 'cmazlo08t00fdvp4slmha53pe'),
('cms417jz1001sbsj00yoo7nwb', '$argon2id$v=19$m=19456,t=2,p=1$hnq9Ca52GIc5We8v39l0Dg$PoEQMbpAamhp750lxV4rXBwy1s9ounhznUceG1aTtVg', 'cmazlo10h00l1vp4swtjvwowy'),
('cms417k02001tbsj0gbxqget2', '$argon2id$v=19$m=19456,t=2,p=1$D/LgdrsZQ0K1M2LQ4W6fhQ$SHSMc6B9hfvkNtODjzOWUnerewaKGBWNwQ2UMiVHtt0', 'cmazlo19s00mzvp4sh1xuievz'),
('cms417k1c001ubsj0xw1tme8o', '$argon2id$v=19$m=19456,t=2,p=1$bQx8Gm30Fs5hakYj7Bp70A$J9hiOp7mFqI0+Xin3jr4s7goIzg93OS8pTnv76lKazA', 'cmazlnzbu008jvp4su1ap26y0'),
('cms417k2b001vbsj0r1rx39qn', '$argon2id$v=19$m=19456,t=2,p=1$MfhPSQL6ea07kge4ozGDvg$gMpUP/dLc0oYK4sDB470qdwDfwdCtvRt1jy30zqABcs', 'cmazlnz72007hvp4s0fm6ubok'),
('cms417k3b001wbsj0m0tntnml', '$argon2id$v=19$m=19456,t=2,p=1$Nl7KbA4Gg8BSPOUIq+AsTw$32pkeOyxDRg1Z7ywyeo+gR6X8sXO9sUdwsZ/kutcrlc', 'cmazlo0hl00h9vp4swzwfuwf7'),
('cms417k4b001xbsj0o90ivb61', '$argon2id$v=19$m=19456,t=2,p=1$44RnK4FcI0ZxNpGxGYhjqA$8CHnA72CrrNQva2zDry3p/7gRy0FOKElzAsCPAYKN64', 'cmazlo0ht00hbvp4sarhqp025'),
('cms417k5c001ybsj09jphcufu', '$argon2id$v=19$m=19456,t=2,p=1$XnDtu4PXMb1le00anGMT+g$vjNoVLsMyHqbffBPAsnLS3UmLwu8yAvCSpvtvNGbmIY', 'cmmuub1g6008bm60jg029wvy7'),
('cms417k6j001zbsj07ircgfux', '$argon2id$v=19$m=19456,t=2,p=1$Ad3/USKy9iUbEJcleNr19A$DZMxa39H8yIgFXTUCB0uUqaTP7WOwa3N1MZFmUMYtT8', 'cmazlnz0z0067vp4s9e64l2vn'),
('cms417k7i0020bsj0vzfk6qls', '$argon2id$v=19$m=19456,t=2,p=1$cwIrOSusf+vIG7pyzCcGpQ$B5YPlzNZ2n6z5OL/JVBoxJmLlOyxvFotxt7zTzunF0U', 'cml3m5brz0043m6h0hvaj1b4i'),
('cms417k8j0021bsj0mqqp396k', '$argon2id$v=19$m=19456,t=2,p=1$Tdny2x/D6I4XokVHHjhaxA$tcIdYDkPZryKna49sBs31bGWL8B5IYODiaiajzXxn8Y', 'cmgx92ule0001m6wzm1245zqe'),
('cms417k9i0022bsj0y0jxv026', '$argon2id$v=19$m=19456,t=2,p=1$mGDBf+CzmTZPqTwGuibLZg$k2i1dkLEyKk+4PZYTRyDqLpqholLMHrOekA9s2rI2/o', 'cmazlo1a000n1vp4sjghxngp0'),
('cms417kam0023bsj0j2oru9q8', '$argon2id$v=19$m=19456,t=2,p=1$RMgRb5PNrszGZpuCcMhtOQ$hS8iML1jUhI30sfhEgCaUX0FVVpWq+AG8eNCkwGj+fQ', 'cmazlnzc2008lvp4shh9hm1k5'),
('cms417kbu0024bsj0xro9s2po', '$argon2id$v=19$m=19456,t=2,p=1$QOsO5ASJ9RTMHQhWWXvbOw$DHMLYBTkhqCZjs5JC4/ZmJCu4bOVskpyWrZ0lVfMgAE', 'cmazlo04a00efvp4szuwkluyc'),
('cms417kcv0025bsj0ibbl8a82', '$argon2id$v=19$m=19456,t=2,p=1$pivFFt4/W7wpiUrwiFGSvw$VLfnO2+kzEc4NCMtji5LddCpatl2dDcWDBsSeyYVXNE', 'cmazlnybo0015vp4s0l1i9a6w'),
('cms417kdu0026bsj0sym5a4jn', '$argon2id$v=19$m=19456,t=2,p=1$E4L8HADOFdrkwxGuAkx7uA$sYip8l9tW14UwwlnzGe4pwte+pcgz72eOT3bD84W3oI', 'cmazlnyo2003pvp4sjaj0s9s8'),
('cms417kev0027bsj0r19ec6i4', '$argon2id$v=19$m=19456,t=2,p=1$uRVqAhdN7Q8heSd4jTn+kg$TdQfJC8mAcXWu+aCsBj5WZ5AIz9WQn2UVQON6y/XsL8', 'cmazlnzd5008nvp4sguvvbfet'),
('cms417kfv0028bsj0wym0iitx', '$argon2id$v=19$m=19456,t=2,p=1$745UWS8pLZO6pqoAW3Qx7Q$VBV53CbNuOV4EGIOSPF2KxsetaQM1sCNOlbGdP2YYyM', 'cmbf0gjqo0012m67qclzub6p9'),
('cms417kh00029bsj0h1oncx6b', '$argon2id$v=19$m=19456,t=2,p=1$ilz4t0DFUP+Xo4esm+KU6g$Pa7ZsY5/RFrSpmiphLhnXR7VTTRj/RP8YckuzaoZmzk', 'cmazlnyob003rvp4so3kyz68k'),
('cms417ki0002absj09j3vgd4d', '$argon2id$v=19$m=19456,t=2,p=1$hRKOp2q95mhDwhGQSfw0Ww$DuUCX/3XmkxkXVKRnj2gyRZ61MMM6T9MtbShaCZjC0E', 'cmazlnztl00c5vp4sqhev7wzs'),
('cms417kj0002bbsj0awmhmcih', '$argon2id$v=19$m=19456,t=2,p=1$hBii2suNHQVhfax9B8dKeg$UwGJMTmhkPaGPb24RJVZIjaQMu5nHoRccpz/YAI0xgU', 'cmazlnzdm008pvp4st6abtmor'),
('cms417kjz002cbsj0px2ikhft', '$argon2id$v=19$m=19456,t=2,p=1$ZChkJlbmt4jKt6pemRv9UQ$VfDCgmSPGxUzvUsPEiCr2oKr6smIuH02Cla2LbW6nkg', 'cmazlo09200ffvp4sa0bmgj14'),
('cms417kky002dbsj0wyisi8zz', '$argon2id$v=19$m=19456,t=2,p=1$Y/EuZ/h6bL40oPCvj6qu7g$C+m+Z7ul+jQln/VukjjcsBaOuPXfqhOk/SaKn/8FT4c', 'cmazlnzl400abvp4s1gmcewkq'),
('cms417km5002ebsj0yn4odmwq', '$argon2id$v=19$m=19456,t=2,p=1$gn3PYKN3m8F2FP9lhba0ow$ooT8jJZJIthxGVSWZ+h68YNRHRyitAimenux3ofHANQ', 'cmazlo0i300hdvp4sa9i88uie'),
('cms417kn4002fbsj0idd2jp31', '$argon2id$v=19$m=19456,t=2,p=1$KMWM3Dpgf0rf/Nt1V7RqJg$ZYymi2/0x8uiH9UFcHTpjxjTW22A3nV4qfKuFj+mP+8', 'cmazlnyc70019vp4szdbacckx'),
('cms417ko2002gbsj0wvvex4yk', '$argon2id$v=19$m=19456,t=2,p=1$NqpuePwvdq67l9Befy5YhA$uT5oEST7VMS5n1TxOLqN7P41WEYSK7qLfBWNVMb6BZ8', 'cmazlny8q000jvp4s8cntpzo3'),
('cms417kp0002hbsj0zkqenwls', '$argon2id$v=19$m=19456,t=2,p=1$zNZ1pmIKzxcixxXVu6FzBA$OT9DRf7qVVHRXL/jGPaNgcX2uGhZcHSm9eYQKGyjB1I', 'cmazlo10v00l3vp4s48b9w66p'),
('cms417kq1002ibsj0vhv8syzv', '$argon2id$v=19$m=19456,t=2,p=1$ZiJqGT5Pcg6GmSg4hAET1Q$rx7YSsxC49GJ2tcaJZJmoLGG2O/cFGEla5Wjx2uEpoQ', 'cmotljaxw004nm6chhn0uj912'),
('cms417kr9002jbsj0djpkuxe5', '$argon2id$v=19$m=19456,t=2,p=1$pCRX3zQSfctq8eVyZvD9Kw$4y1mwTCV7Tvh9a6/YN7xqiEdD897MQq2EiP8Tfqn39w', 'cmazlnzlf00advp4s119xdaev'),
('cms417ksb002kbsj06291v0wm', '$argon2id$v=19$m=19456,t=2,p=1$1RGYxF28kqV1Cs+/WnLp9A$3we6eZhDYKtRhZ9M4sVev7Fy4DRROIvkpO2tPHBXcGM', 'cmazlnyfu001zvp4shnkeqfnn'),
('cms417ktf002lbsj0xy30z06b', '$argon2id$v=19$m=19456,t=2,p=1$2qgb2U90GPTvjugAzSKLXQ$d4kXaX9iGkU4Ke1QdpY4CjJmt2KC+ADFpLi5JSDQMlk', 'cmazlo11600l5vp4sbydlrwvj'),
('cms417kup002mbsj0a2nlt18n', '$argon2id$v=19$m=19456,t=2,p=1$dvH56qAXQdTIXu72ypBL+Q$cLiSTMGBSQ7lbNyV1w8MkT6+DljbEfLsX+dtt4rMhZU', 'cmazlnzlq00afvp4siyiirz4d'),
('cms417kvy002nbsj0bq8uifmi', '$argon2id$v=19$m=19456,t=2,p=1$+28oxpX6b21kTJBE2Z31uA$aVLufie5+MQpb95cZ16BGfJv3YBrUu/lYEslixSJWT4', 'cmmlt6p82000em60jhw6qctj4'),
('cms417kx9002obsj0iwg312nv', '$argon2id$v=19$m=19456,t=2,p=1$TqrMRjNiqX+GNoEgUb8MBQ$VGeD+3KbswKdISu1WycrOSx75Y0lc8h4wJDe/cdNgZw', 'cmmom4oez005rm60jq9zgdlq3'),
('cms417kye002pbsj0ze7ezvlm', '$argon2id$v=19$m=19456,t=2,p=1$z5zFM+Kd8BZi35x5YU1Qbw$313QTr0kzg1kYp4q6Dy2jo2V9pbId/z1QTs16C+NCPo', 'cmazlo0xw00knvp4shgmezc9q'),
('cms417kzf002qbsj0s3tc7t84', '$argon2id$v=19$m=19456,t=2,p=1$+GCnzymeveD/6rjKd+9ALA$CRH9mS8plHBEr+g4UMwVLh+kfp/XXfofjP7XR4XkYbY', 'cmazlo0ib00hfvp4s2dl5fcyl'),
('cms417l0e002rbsj0dcyb7asf', '$argon2id$v=19$m=19456,t=2,p=1$97y0+AKHXlPBi5lwJODz5w$6TtjxyRow1WnCAabPdEAiZZBXcuo/HLjhmkco9TLLbg', 'cmazlnych001bvp4stdlwx2br'),
('cms417l1g002sbsj0qtyfspui', '$argon2id$v=19$m=19456,t=2,p=1$fv/AlF2VN5vRqnNCB3QDqw$oNyr8jyHJYXHTA2m3h/1y2kl6YSsTWzz8jau746GuaE', 'cmg7nacpw00c0m685oaezpo7q'),
('cms417l2m002tbsj0wkvdonga', '$argon2id$v=19$m=19456,t=2,p=1$1S60yTUDrb5wGdNuEcek7w$wtLffSC48UJmd0V74pbIt05zDBljtugDBcsfZkt0nIc', 'cmdol1ehm0001m6tpkbunnuwe'),
('cms417l3o002ubsj0ppa3iaz7', '$argon2id$v=19$m=19456,t=2,p=1$K5OrbbYJQvxTDBZOctwKPw$k02PSY2g8RLQqdVxEfi6RbhlaB2OMWZMVSLSodR3iyo', 'cmazlo09j00fhvp4syx5imkr7'),
('cms417l4t002vbsj0m80nt4nv', '$argon2id$v=19$m=19456,t=2,p=1$8k/3BoO1jai0qoZVD2YeuQ$xwtZFo1tk2hQ+EXmTxZ1KCNBIm+x13cLiYPsRfcnUmc', 'cmazlnzke00a5vp4sditd7e45'),
('cms417l5q002wbsj0ibn1gfqh', '$argon2id$v=19$m=19456,t=2,p=1$A5FSVgkWGRBdn5RnKU2Qig$ggalLtnd2v8Gg8DwA+xVxTqubwBM9XwZ+1xYDEnJ8v8', 'cmdcn3lrk000qm6creu93npes'),
('cms417l6p002xbsj0vuresewp', '$argon2id$v=19$m=19456,t=2,p=1$xluD/yKzH62LwBkgn5GC7A$X0RypsHvKJ4577VUHW7UqqeHWwrmrkBo5Q22ngnBpLo', 'cmazlo0ik00hhvp4s6hmv78c5'),
('cms417l7t002ybsj0vs8um8de', '$argon2id$v=19$m=19456,t=2,p=1$YmjUUwlQOKgYihruqyuTOQ$x6/QayQAAGuxocj7jfOaiXQN5eMUxE2ZaAfLRZBzoSY', 'cmazlnzvt00cnvp4sagdhd4jl'),
('cms417l8w002zbsj0pinjoggt', '$argon2id$v=19$m=19456,t=2,p=1$FCJ3ek7xXq+lmpdmbY1yJA$Hn3PFUl5p3Bil6L74RyB641jjEfBA33SGTMMF4HYbz8', 'cmm0e7jxm00jxm6h0dhcifcy0'),
('cms417l9v0030bsj0g2si912d', '$argon2id$v=19$m=19456,t=2,p=1$L79lxQHH8BbM71VXwJlaag$uM2teLmrYP7Eh7u1y5BVJ5HZGDWEChtSlK2rKPB5oio', 'cmazlo11f00l7vp4s1qz6gtbh'),
('cms417lau0031bsj0c8vy2kb8', '$argon2id$v=19$m=19456,t=2,p=1$eFGO0YlTtJ1aSW+fp+RF8g$zMw5ykXj2DAvbgEXkvAQTiU7Tqa/1DDx/3cZ+CMB8uc', 'cmazlnze8008tvp4sszhxp4kt'),
('cms417lbt0032bsj0liz5aeft', '$argon2id$v=19$m=19456,t=2,p=1$p7IUtpdIsjhqa20ZPcwjsw$jquy3nGtA71PzrYltzmyWcPfDwVoSJcXHzWXG+iXOtk', 'cmazlnz1a0069vp4sgiclb1ef'),
('cms417ld20033bsj0csb8v5w6', '$argon2id$v=19$m=19456,t=2,p=1$2pq7imE3BS0WlsvhBs2UUQ$3o6aiSMVT0yLBeLI3cF3IMg5bZJqLvP+xdxrIdZXFzI', 'cmazlnzw300cpvp4svjdlldhq'),
('cms417ldy0034bsj06j7qmu1v', '$argon2id$v=19$m=19456,t=2,p=1$IpqTwtNYBIWXtHtdfxK5ew$2hAzQzJfKNlwc5bf4xKnrixjNOP/NU2w9YopUrr57cY', 'cmbhiy7la001tm67q2p5iyire'),
('cms417lex0035bsj0akn57bdg', '$argon2id$v=19$m=19456,t=2,p=1$n0IAZF9fwt43X+Zquz9iig$exRFZDwT90LUJ3ap/SJxqbvy3uZS4PkMYPeXBg4f/wo', 'cmazlnyok003tvp4scstonn0g'),
('cms417lfw0036bsj0af3hmg5r', '$argon2id$v=19$m=19456,t=2,p=1$p3q47aDPsm4O84Uc/paYtQ$UGZgVEnLRIyUao6mjApSq0KT5kFkxtQqgt64ZgLsZUI', 'cmazlo0j100hlvp4svaflp88d'),
('cms417lgx0037bsj0xk3gg33b', '$argon2id$v=19$m=19456,t=2,p=1$xhhx5MvhVBVD/0HCdXRw2w$B1n3kwQC9xCM0YbcyjXpx1D8d5F2U/UEqw/kPlsKtNI', 'cmfj7m7tq00b2m685q39lc3fp'),
('cms417li50038bsj0ntjuge66', '$argon2id$v=19$m=19456,t=2,p=1$soK01bZo+t8wZP3XtXxMCQ$X+9HacO5Gx//G1JLWy21hwZ4Hse7sex36oLez/YjNCA', 'cmazlnz7b007jvp4slzrfr6fk'),
('cms417lj20039bsj0v3kjlc74', '$argon2id$v=19$m=19456,t=2,p=1$TxKXdCEuLL0D7LxTjV15Fw$9LeJPfWVQZNWaGojuPhIpqavRnAOg/Ofani4ohXWe7s', 'cmdxr1f6o0001m6cb12kzc7dm'),
('cms417lk1003absj0ayhlbne1', '$argon2id$v=19$m=19456,t=2,p=1$rN1V0uLOGImZKZvrWhzGTQ$mzs8HCozklr7RuAS3aXs6i5a9zWYP8+gIXZtFMVAuWc', 'cmazlnzrk00bpvp4sybmiv7f1'),
('cms417lkz003bbsj0jh5m8aqj', '$argon2id$v=19$m=19456,t=2,p=1$ZzHGJ6QTGbsxwFhBp4vUpQ$y3WhtjIski0/Dv9D3oa1Tl7YhSunahaFAIzwP5a7S4g', 'cmrj3teuc001lm6ucv59bc0bt'),
('cms417lly003cbsj09spe4ov1', '$argon2id$v=19$m=19456,t=2,p=1$nVJuPjr5h1TmlcyV6JGJBQ$nUPn0wDbhXD6QdfW06qLDmRmoTwC7ImW7VwPaHNCYaA', 'cmazlnyot003vvp4ssz60jvdd'),
('cms417lmy003dbsj02gzcjfrk', '$argon2id$v=19$m=19456,t=2,p=1$BfILSqI65YKhZou8olbyKQ$eIBos/kMu1i9153P5EXOhgEUpk7Sx6bN6FKSryO3B0k', 'cmazlnzei008vvp4s6sytbnlx'),
('cms417lo1003ebsj0elvhp59k', '$argon2id$v=19$m=19456,t=2,p=1$Ety4IyKFMIFLwlNqDexM7g$qpDSJx9A/+OdfonKqYv+iQTtCLe/Ztp/ZbNt6z3quWM', 'cmhfyxg8r000rm6wzw6a6jxu5'),
('cms417loz003fbsj086pgmoh9', '$argon2id$v=19$m=19456,t=2,p=1$6WD8Knft2WNEGLiD91RboQ$jsDihrt1S0U4K8Q/ZSZO9DoPWJlghqke6v3uyCKc7s0', 'cmazlnyhf002bvp4sjhi2yd5x'),
('cms417lq4003gbsj09kdzgi2v', '$argon2id$v=19$m=19456,t=2,p=1$Nxv2MEYZ3fB6tZETckR0gQ$Kbo5xeJnKEdv4g3HTKYlBLAsHjQ47r21n8UWj1uBDf0', 'cmazlo0jb00hnvp4st62azb1k'),
('cms417lr9003hbsj0jaatdf9r', '$argon2id$v=19$m=19456,t=2,p=1$cwWFEChQUyPckJZHiK0qeA$iiCUpGvY07NU9NwP+MrrCDNffyu5FH46ojEbaM+BJ98', 'cmfunlrni00bnm685x24tpybo'),
('cms417ls8003ibsj04dtr11yg', '$argon2id$v=19$m=19456,t=2,p=1$sqTkeahds0GqluZyD6rfwA$Hp/kjWvNyVbJ0lX1FYC/YPvt3SsjxR2HM4leb99K1IY', 'cme8fndma00ddm6cbqsoovl62'),
('cms417ltg003jbsj093952a6f', '$argon2id$v=19$m=19456,t=2,p=1$y35uKoh9W9FSHuLyw/rFJg$AZot/lwKtsgQ2lMFp2Nd4q8AP1Fa3FBJwkQRSXJ5M6k', 'cmazlnzeq008xvp4s0hf2thxh'),
('cms417lue003kbsj091m493lv', '$argon2id$v=19$m=19456,t=2,p=1$Xcq682J/Ykt6JUfdzvFXbw$f5fEZxI6xatkFjB99XvsrUgKbLprujvnx4VkqmwdXIU', 'cmazlnyk9002xvp4sqdf9cnkr'),
('cms417lvh003lbsj0oxlicisn', '$argon2id$v=19$m=19456,t=2,p=1$8dbMPent4rlwUemoUT8kzQ$ZJEcRKPA3QO8DeIR8nP4+ifl5UNUQs2XiOKcNSpEpPQ', 'cmazlo11n00l9vp4s3sbf1mrd'),
('cms417lwh003mbsj0m73wg28a', '$argon2id$v=19$m=19456,t=2,p=1$APp7/DrWW1dhUGNm9Dsz+g$6bMwoIb5clXz6RBfC2AwK/I72bh5TAxboiFdS+Gw78Q', 'cmazlnzps00bbvp4sbxdwpgsy'),
('cms417lxi003nbsj0k3q1pyoo', '$argon2id$v=19$m=19456,t=2,p=1$zp52y7oBEWzLyzRJ63QK6w$WSYC87/2V2pbIGAykg53lbDF1bPMAOg2iPED5DqLEFM', 'cmazlnz1k006bvp4s4b7vbmzi'),
('cms417lyp003obsj0awscyfe1', '$argon2id$v=19$m=19456,t=2,p=1$LNswX26lchefIOTdLSkXWA$M1YOqZAYbMSERqKWHf8qpf+FZBP8jKWLMQFVNYs/Kvc', 'cmazlo0xf00kjvp4s6sfrircr'),
('cms417lzn003pbsj0ew5rpm6o', '$argon2id$v=19$m=19456,t=2,p=1$+5I9hkhmxg4RdTtuxHVXJg$FmA7N3SP9pe18XJV6Hcw0Lf6a212YnMBNX5he80Y3jI', 'cmazlo11w00lbvp4spkgp57oi'),
('cms417m0n003qbsj0ka2un5bi', '$argon2id$v=19$m=19456,t=2,p=1$FzmK4OyvQJJ7tmOQkejX3w$7JKZngAOT+oT+n+O3UeVDo1oNK6aQjGMFBfb7+MLy94', 'cmazlo1by00nfvp4sv98ynlog'),
('cms417m1q003rbsj06mxl8qup', '$argon2id$v=19$m=19456,t=2,p=1$CGy5yw6EMHESHYsRWEf49Q$ruoS5aQRaled/snIM8qHf2yD6XyCx/uZkKV2V78k3LM', 'cmazlnz1u006dvp4sbtyq8hi3'),
('cms417m2r003sbsj0xvybf0h5', '$argon2id$v=19$m=19456,t=2,p=1$pFDTh6mm0Cuw7px8eAABrA$YqbWDybK5udWY3o8Np31WwN9CexnyUndvnUF5XU1Y8g', 'cmazlnz7j007lvp4sjth3xigf'),
('cms417m41003tbsj0wio1bgnv', '$argon2id$v=19$m=19456,t=2,p=1$EF5p1ZW+VnRtcL31Xuu8jw$YXm9WzqVY3JFpdtze/fiHJRYX90CBRArLO+4YGiTD8M', 'cmazlo12400ldvp4sl4jt6pim'),
('cms417m4y003ubsj0ma6hmt3r', '$argon2id$v=19$m=19456,t=2,p=1$Oe1jUf+swy00oLycmV8JCw$LvcLkSSupoNcGawQ4HJQuM1Ey2SQzpx/RU3JuJelwow', 'cmazlo0jk00hpvp4sno6twgh5'),
('cms417m5w003vbsj0upd7bghe', '$argon2id$v=19$m=19456,t=2,p=1$utVy73yRyM6nbXG9PUaRiA$K4YiOamRgqxFsfmlZkyp4cqnDP20t1JOWXi5nSZFsmo', 'cmnfxk5q9009ym60jqhzld7gq'),
('cms417m6u003wbsj07dr0oyon', '$argon2id$v=19$m=19456,t=2,p=1$2VjTW7bllYjIYPAWG+1aQg$PtVkMwm0GLFpF4naR5N0weTR20ytr3os0QP9713KPoU', 'cmazlnzez008zvp4sp61dcztr'),
('cms417m7t003xbsj05japd5ql', '$argon2id$v=19$m=19456,t=2,p=1$lqEixosin0wegSIkDw8JNQ$2TgKqTSwkNnjU+YSfWqXfVRTLi7WzyZVyItv7TdJnn4', 'cmazlnz7s007nvp4sy1ojgn3w'),
('cms417m8r003ybsj077jive4z', '$argon2id$v=19$m=19456,t=2,p=1$jMcluX3VJ7l+cG/slQvwvQ$qotVEtfCbdhrapNpxwh/SDVRViSbkVPK6OQEIcYbwiM', 'cmkpeuehy0031m6h0pdsfvfik'),
('cms417m9x003zbsj0qe1zuvdv', '$argon2id$v=19$m=19456,t=2,p=1$/N5aL3ePyUXIqCH0oU3tAQ$/z1yL4FR2p1fvqhUarD8VQ0p55OH6wF5JpE85/zlSro', 'cmr7o9w3q000jm6xn81qkab2q'),
('cms417mav0040bsj08iji9swt', '$argon2id$v=19$m=19456,t=2,p=1$sWyCnlFzRTnJIsZwt050Jg$Gp06frpaCcHHCnsyqBKmU7Vjb8/xdUlHm2rw+aaxSp4', 'cmazlo0ju00hrvp4swgb392d4'),
('cms417mbu0041bsj0yft0vcvv', '$argon2id$v=19$m=19456,t=2,p=1$3tBZvFSSE+LXFvBUyDhSQQ$FOZ5kdd1E2WZqnk2SITJIC6KeitpifcrBKrUnFU3l+4', 'cmazlnyp3003xvp4sxu9exa2b'),
('cms417mct0042bsj0s2yck749', '$argon2id$v=19$m=19456,t=2,p=1$UOfi7TLsxyovvl6D2zBOPQ$aKrsiZgQtFbN6DuPCQvnGVloHR2tQCDjFbC5F4ygBrA', 'cmazlo0k400htvp4sedwzokbl'),
('cms417mdq0043bsj0s1k2p5i5', '$argon2id$v=19$m=19456,t=2,p=1$pjNpGCybPmJ1FZW7+iymxA$wKYPdDMumjjvEmmLTnlxXEoMqCNzaWXaztN3fKsSiEA', 'cmazlo1cf00njvp4svvxydxqq'),
('cms417meq0044bsj0whvxce60', '$argon2id$v=19$m=19456,t=2,p=1$WwWIJV+pVZodK2wKwwthbw$vDGpPALxBHTGotb6hbiWtYSE1rSjTZ8zeNQltEC7G5Y', 'cmazlo1co00nlvp4s4injjm9v'),
('cms417mft0045bsj0s9k6h74c', '$argon2id$v=19$m=19456,t=2,p=1$mopn+L5J6PcEBzIlqXaoew$r6iNHj56vT566um0qMBV++ZjlRko/oCyu890iycZQc4', 'cmazlnzwf00crvp4sujuvan8p'),
('cms417mgr0046bsj09mddf2aq', '$argon2id$v=19$m=19456,t=2,p=1$k4P3/kqG71+a3vQwB6ebwA$xmwSsK9F0emc2/C5SJ1ygiYtD90vaHaYcYZyAHwNnOo', 'cmazlnzwo00ctvp4sne8xe7kc'),
('cms417mhp0047bsj0ly38ha4g', '$argon2id$v=19$m=19456,t=2,p=1$aME/E3yXaUS3UKyNVc0fHA$jFsV1obyHWlnFYpa2UVj2MRFif661iIBrCL1sLXJ6/s', 'cmazlnzq200bdvp4sos8ox99m'),
('cms417miq0048bsj0vwayea3q', '$argon2id$v=19$m=19456,t=2,p=1$X/uiiwYC6pgis5E73xgcKw$gqE/wniWLoDOT03LJZ0BeNJtCEsvIF6tj5fC4DGwAGo', 'cmdxr6c3m0003m6cb8rj2lx8e'),
('cms417mjq0049bsj05y6fmn1v', '$argon2id$v=19$m=19456,t=2,p=1$SYnaEZqnANJpZlXu6Iy6ig$pF5O/PFVXaQTBImpyDnHp6lz5QLzyVl3I5NwTQc6IAk', 'cmazlo09t00fjvp4syr53iooh'),
('cms417mkr004absj08pukxut9', '$argon2id$v=19$m=19456,t=2,p=1$5BiLoYOZqC1cPvxGArU64A$EfwxM48j+gyMo9gbQza/KUvTwawlREpDk6pCKvmHm48', 'cmazlnyho002dvp4s2qsse1e5'),
('cms417mlw004bbsj0xh3yvktm', '$argon2id$v=19$m=19456,t=2,p=1$xruRbtracWlFafBjKi0ifA$dU54C0smegu4tdAKW59tmkhB1nmSEM0W0Y7dcr4tC2c', 'cmazlnz4f006xvp4s02qj14a8'),
('cms417mmz004cbsj0zuxa18cc', '$argon2id$v=19$m=19456,t=2,p=1$BrzDoB2gBEJOKhsu5mRedw$XfRrS2Dz3xMoLZ07n3HyQ+dc42YIPBRghNY5BO1AHS8', 'cmq6pc62400obm6chh9m4pne5'),
('cms417mny004dbsj0bp4s5otr', '$argon2id$v=19$m=19456,t=2,p=1$7QG7s7n6X0pJUexoXMe7eA$GlMParBAfR0px1LOea9BzmQrfxq+6GyV4jImKj0k5xM', 'cmazlo04u00ejvp4sx5yfies5'),
('cms417mox004ebsj0jgv3nei7', '$argon2id$v=19$m=19456,t=2,p=1$JvA2qfzSmoXpDNJ6l9+eNw$iZlgYJ76XpX/H7/uDx3KimQeRONLT/l0brRJmBkXjBs', 'cmazlo0kd00hvvp4s4khziop1'),
('cms417mpy004fbsj00scnh0dy', '$argon2id$v=19$m=19456,t=2,p=1$VMkwaEqpnMHiZiCl+fr1Xw$q51GGk8tPbU9+rONOHd28p2ALLVwuqjSymOMKQ1nOYg', 'cmdsrd3a5001em6tp794f3ez8'),
('cms417mt9004gbsj029wn2a6k', '$argon2id$v=19$m=19456,t=2,p=1$tzxAsIs84WRYOzTkXtCVVQ$m+G93Vt1s19lNqMGH/3MIw8f5n5sydrEqEhHAYMn3F8', 'cmazlnz4o006zvp4saww2tgtb'),
('cms417muy004hbsj00gpzdq02', '$argon2id$v=19$m=19456,t=2,p=1$1eY5FBnngrCicSaq/eA3HA$y8jTftxDgJDLiSIpxAWua7DFCmLiRsvASDJoYGSKAQ0', 'cmazlo0km00hxvp4srerxaozf'),
('cms417mwc004ibsj0x2txrl49', '$argon2id$v=19$m=19456,t=2,p=1$hs2dqp1yY1+Ul9dPiIbCLg$LoztzRQD+Kk19hx3R2g655irvPSYeAZbhfLcXch1nUo', 'cmazlnzf80091vp4sak3gr2pp'),
('cms417mxs004jbsj0tsnpjfoi', '$argon2id$v=19$m=19456,t=2,p=1$F4sztQ1zfA0kc2EVB1yIUQ$iXCNBAQV0XxOxHVwPlA3M2izy/do9639SqX+WfXTiYM', 'cmhlvbv0l003bm6wz597nm9n0'),
('cms417mz2004kbsj0zl5na5t3', '$argon2id$v=19$m=19456,t=2,p=1$lHta4riIe9wpezO8XvzAhQ$W6wjZ9UAxlJ7OZHgscf45UYQ/e24sgtZLwIdl4voZnA', 'cmk57ei8i0001m65vl047wefh'),
('cms417n02004lbsj034vlrf5o', '$argon2id$v=19$m=19456,t=2,p=1$BW93j69Yf6VhzwPplZ8Yew$9cGnRAUW9ogOqePL3YDs9GbWgRq3GJCLl30x5kVv3RM', 'cmlevgva9007mm6h0rh59gl6s'),
('cms417n11004mbsj08692592q', '$argon2id$v=19$m=19456,t=2,p=1$XxGK19cAX1ANznaFuelJnA$rAqsKjZVGkXvW65G7me6U+Pc4lhDUI7S8dfXtMuRMqs', 'cme8pg2m500djm6cbceoyg8am'),
('cms417n1z004nbsj0i3916ueo', '$argon2id$v=19$m=19456,t=2,p=1$1N2AHPcqONr9xECq1t1TOw$yfUAst9ymoGyG0/ibzEZ2lStEkuOYwsNcjgmTOR9Yck', 'cmazlo1al00n5vp4sgr5oxpb4'),
('cms417n36004obsj0kjcpgii5', '$argon2id$v=19$m=19456,t=2,p=1$SwZuq5EZburbw8sbdNcs0w$jREfCS5v1FkELZaXkxt0USgiZYL70Pjmn1keFmmaFI8', 'cmazlnzk500a3vp4sklvzjs6d'),
('cms417n42004pbsj0g5dev1m9', '$argon2id$v=19$m=19456,t=2,p=1$yT+9XKEolj619zHeqbbV0w$Nsi6yhIH6G17O3Y8pbXETATU7qhFi5xZz71cEx+aajo', 'cmazlo12e00lfvp4swjbkkdzg'),
('cms417n51004qbsj0elo7pdke', '$argon2id$v=19$m=19456,t=2,p=1$X5VPNTXQCMi7Naft2mU9Zg$P3Vqrwhu859k8//2V20obPhQ8sOOplIiA4QUdOrrgks', 'cmazlnygc0023vp4s16vkriqb'),
('cms417n5z004rbsj0iyqpk8xu', '$argon2id$v=19$m=19456,t=2,p=1$+SEmLuH6tFzI71ncuk2K/g$nFu9m7BTuDzOj92sDeMfMrmMBnkkM2R4ieFHqMW9/9M', 'cmcligpza00f7m67qy7rdv2jx'),
('cms417n6y004sbsj0usoiakhs', '$argon2id$v=19$m=19456,t=2,p=1$C7P873CUIsjlhtoKCFafkw$ZM6t9izxLOWGoTjQEI2wccUStxv+raNU38JqX5CBYUE', 'cmazlo02x00e5vp4sh7epv1jd'),
('cms417n7w004tbsj03gvfnzth', '$argon2id$v=19$m=19456,t=2,p=1$aSZF+KJ7NwqbZdUkpM40+w$BTXg74nTKq7DxjhAKjSwYblkFZNL07TC7V4+gAL+9QI', 'cmazlnzfh0093vp4sywp8t2pw'),
('cms417n8z004ubsj0f4xs33nc', '$argon2id$v=19$m=19456,t=2,p=1$ycpADTnSs+ucY+3T0HxPaQ$sivjR6n7pmKVs6NdH70rCl67iAO9ViUECPmeMQJgbrY', 'cmnoi6aah00c7m60jjvhdg9m4'),
('cms417n9x004vbsj0pewb5502', '$argon2id$v=19$m=19456,t=2,p=1$ACc8rNvTzdCphTWvNJjzPQ$+OuLoBHfweo7DAomFistYd/Qa7JPsY7z0lo1t4q8Uv0', 'cmfnz518q00bem685tc5k8y58'),
('cms417naw004wbsj0hyrjv0xu', '$argon2id$v=19$m=19456,t=2,p=1$HrkYlxcDa1HYPPoWGeYngQ$VJ/uDkf0dCZAWEC4doCtk0//gzqDWjKks/vWIKzJW2E', 'cmazlo05400elvp4sd1rkkmgp'),
('cms417nbu004xbsj00xog91vp', '$argon2id$v=19$m=19456,t=2,p=1$pBpV0WHffpd4HQ4g6+X7VA$BsvOd0Xb0BdjIp8v/ixQsoblzCb2ZXcZBc02uFM5QOY', 'cmazlnyyi005tvp4sol97g55r'),
('cms417ncu004ybsj0asow42g0', '$argon2id$v=19$m=19456,t=2,p=1$X4i3CBByfnkQ05xgJgxPmw$pb5EnwyGy8lKxCjTifUi+Jcsq6I0rKX5rWXmH/0UuDo', 'cmazlo12o00lhvp4s6bfp0w3b'),
('cms417nds004zbsj0r4rbp5oq', '$argon2id$v=19$m=19456,t=2,p=1$07tRnHMvqBmnnoN/aIKpNA$u9mRSEh/DdHwk4scD29HuJDeWKYN2/UPxU+gT8inMD0', 'cmazlo12x00ljvp4sq5fwgwqg'),
('cms417nex0050bsj0lhceawml', '$argon2id$v=19$m=19456,t=2,p=1$KgFMZSVrd4YZglq+Vv4FpQ$ktFU3AswEDDeHzFETVolIlf3MpVqm81u1X9R1jObfHg', 'cmazlnypf003zvp4sjdro17gu'),
('cms417ng00051bsj01i78ujlx', '$argon2id$v=19$m=19456,t=2,p=1$EmgZg0bTPub+sBtM1s0KCg$nRJcPj+d8lDDsj1cKA2rOxqiRrnEtNHHslmaKF0gNmo', 'cmazlo05e00envp4s18zhueu2'),
('cms417ngw0052bsj0xwc9r6b3', '$argon2id$v=19$m=19456,t=2,p=1$pmh2JWK6/jDEKeeS4z8dew$BsRe+nr2UxTfnJk5ZWP99+AM894VSxlHtJTTEV5Jp0s', 'cmazlnz600079vp4szuaq1ovl'),
('cms417nhs0053bsj0z36xi90b', '$argon2id$v=19$m=19456,t=2,p=1$DlEN2xR0Vj+cOp3k06kgDA$LmUEKdbUtJZppaQbj6p6jy/X7YkTz8nVRKtVSbkrvZQ', 'cmazlnz24006fvp4so74exksk'),
('cms417nir0054bsj04v2mq4sz', '$argon2id$v=19$m=19456,t=2,p=1$x/pCtMopm/phGTx6o/HcIw$qIIGB9NBR1utQCD2Fnt8q0eXuxE5XW7mrruK+dpQI8o', 'cmazlo0kx00hzvp4s8295jus4'),
('cms417njq0055bsj07qoxzbpx', '$argon2id$v=19$m=19456,t=2,p=1$SqZm961BssdMph6wgid/kw$I0NNkDg9XVVusxdep7TU+prpVJUCJM0YUIVKHAOfQNs', 'cmazlo0l700i1vp4snqibydvi'),
('cms417nkx0056bsj0yr4q2czy', '$argon2id$v=19$m=19456,t=2,p=1$coU5wROVcPvrygsEiIJK5A$ztDWZ7AEasidoMu6T2MNcq63v6+6QWa8bFDPI1lUPHA', 'cmazlnzwx00cvvp4sq6m7pxuz'),
('cms417nlv0057bsj0ecje18il', '$argon2id$v=19$m=19456,t=2,p=1$uhteJp6UpdKcz8WhfVwKPA$YkLheKi7d9uHY9lYPZSLhEnqshuz73BVg4/9jKF3FRY', 'cmrhlm7ys0001m6uco8olcelb'),
('cms417nmt0058bsj0m1010fj8', '$argon2id$v=19$m=19456,t=2,p=1$o0KBN9vUCIwEGlfPgUXuLA$459MTJhwF+LdQJA6RQnDhy5o1uy9/5HIaox8tgarsZM', 'cmazlnzx800cxvp4s6xyim19b'),
('cms417nns0059bsj0tx103lbd', '$argon2id$v=19$m=19456,t=2,p=1$g6t+YTIWCYEeOnmbOSOzQg$IdmqdQD0+6sddymdw4MPaEweIcvhxqRIktJuVS0j9gs', 'cmazlo1av00n7vp4s9rtajdk7'),
('cms417nos005absj0i2bdu62k', '$argon2id$v=19$m=19456,t=2,p=1$PwJ5mDWYSPi15Qi3t7bPZQ$gbE5grYG/ROWcBGY9a5HgPVx9TqeE6c5RPadncw9qME', 'cmazlo0lf00i3vp4s7oz81xt0'),
('cms417npr005bbsj0lopip4ns', '$argon2id$v=19$m=19456,t=2,p=1$L319i0Mb9z9kEZouL0Zdeg$HyJ/qZhfvHLTxfqdL1RqScrn5x9U1MvHvWHb2rCns7Q', 'cmazlnz81007pvp4scodgllzc'),
('cms417nqy005cbsj0fqvd1pyj', '$argon2id$v=19$m=19456,t=2,p=1$NVgQ9ASzn+LA+kAZAPQ/FQ$/4d5KQYk9SZmqxZbWKEoxjyNhlfLyA3uaUqK+oRJiT4', 'cmf3lvo970010m6reafmr9fgi'),
('cms417nrv005dbsj0lgoovfym', '$argon2id$v=19$m=19456,t=2,p=1$Uq5U0JQx0ubh/SZisc13fg$rSGBI+Md7xu3E0+T70aCtatcw7KtjHvM9rLKoJsxZOg', 'cmf2dyuep000rm6reo6xxjh2l'),
('cms417nsv005ebsj0iy6ro64q', '$argon2id$v=19$m=19456,t=2,p=1$SU39vwAIVLIH0W52PRcj3A$PtA78HQIOkB0OqGXmVUzN2Hfcc9NoRiQDmwl6G37TBk', 'cmazlo0lo00i5vp4sk7h5tmla'),
('cms417nts005fbsj0nc0adf9l', '$argon2id$v=19$m=19456,t=2,p=1$lQg4amFiv9YHsVCBw4XC2g$96OyPF6FXMkJ5HqZSi+yGRkUjfsLAw7SuZ80bqW8LdI', 'cmgaqudkp00d2m685yz07vaev'),
('cms417nuq005gbsj0to54f8j7', '$argon2id$v=19$m=19456,t=2,p=1$c3nxEeTcSSPjZMSHSVJe6A$c+Dbc5BZk3MXgL+guGjBzQ8Tr3i2s9jmXD1LqoX2wDo', 'cmazlnztu00c7vp4s85h2t7u1'),
('cms417nvq005hbsj0wruwk5o8', '$argon2id$v=19$m=19456,t=2,p=1$c7w8RBAX2cN4AH2AlqFHVQ$droOcgLM88DjQEfe3L2PU/FmS7LUfn/cUV1wdxVrd5s', 'cmazlnykj002zvp4s3qiy0v7l'),
('cms417nwv005ibsj0fm9v8fcw', '$argon2id$v=19$m=19456,t=2,p=1$O7j/XGnkgNtlArh2Y/1Fog$Z02x5jKxsab8VA/gNoomkjm67Poj4C6EAeud1a0knN0', 'cmazlo0a200flvp4sd9ter8o5'),
('cms417nxy005jbsj0kme5vrd3', '$argon2id$v=19$m=19456,t=2,p=1$/OhVSVG6qE5hlQYGHIaVFg$AJnJiOHg0irC+QKx2uHggfVSMffIFcIX3ABFD/jeAz8', 'cmazlo0ab00fnvp4s7v7abbht'),
('cms417nyx005kbsj00ahezmn4', '$argon2id$v=19$m=19456,t=2,p=1$uYeTPtlKQCVVE7OsZrbHQg$Pfqk6+bxt9A2oT1OCKpBXzuj8PAvaIhO6BU2I+UHEF4', 'cmazlnz4x0071vp4siixwrgh0'),
('cms417nzu005lbsj0ciqplzm5', '$argon2id$v=19$m=19456,t=2,p=1$/OHSDsNJfHz1ZlzPVbqcQg$WcdhJF4x9gUSiz/JZJIAFWx+/s9dUrhng12gaE7HTdY', 'cmjpc0qjh00c9m6zpmmr3u4da'),
('cms417o0t005mbsj0jaaq78sj', '$argon2id$v=19$m=19456,t=2,p=1$oW1FsoKUlHER+4r52isVAQ$TZBTh2w4YAJ/hfxNun9u+udxXguKkm8ofw4DAFKyFTo', 'cmazlo06z00ezvp4svniyf5j9'),
('cms417o1z005nbsj0vlya0dn8', '$argon2id$v=19$m=19456,t=2,p=1$SN46O0kX6tvzdmEif/3Xpg$yd/UI2RVoARzmLzEo2mEHeO7+iBZ1mgbBXCct5PJMTE', 'cmazlnzxi00czvp4s5hziir2u'),
('cms417o2y005obsj07c6tb5ul', '$argon2id$v=19$m=19456,t=2,p=1$mGgS3/1hVXKWbzAQbIm7+g$kvP9ttOKP6zDeJaXQn9riXtS0COCVxbeBYBCOF9wHYc', 'cmazlo13700llvp4s5k5giy8a'),
('cms417o3w005pbsj09aw8hnc5', '$argon2id$v=19$m=19456,t=2,p=1$78P6TSQavNzi/5sovpKHOw$W4RkYCdhPYQztGwMfQNAuTLRX/VUsO10oYWFKg2joWQ', 'cmazlo13g00lnvp4s1mrd88k0'),
('cms417o4s005qbsj0ck9l8k1x', '$argon2id$v=19$m=19456,t=2,p=1$fbSds24IYSiM4g0Ue82Kpw$0D5jfOX/3Zb7rq0LVaDSTnw9kJ3B4NZXBR4frCEsum8', 'cmptrbjvd00hom6chwgmmigi9'),
('cms417o5p005rbsj0o4inh8d1', '$argon2id$v=19$m=19456,t=2,p=1$vgIfhxd4jvltYpV11HIGEQ$JHwqo4JuJlcvBOUoN3M5UPcRP0T2KOTgu2Mj7ie29E4', 'cmazlo0lw00i7vp4sqvkidhv1'),
('cms417o6u005sbsj0xuxnyauk', '$argon2id$v=19$m=19456,t=2,p=1$/ch02SvlL3N3/FxtSXeUFA$qkuYIDozkrVTMPAcB4D81O76CqMJG88o0MV59sxCOg8', 'cmazlnzxr00d1vp4sfy3c5kw1'),
('cms417o7y005tbsj0670qtnb0', '$argon2id$v=19$m=19456,t=2,p=1$Xj2lzKyM9EBl4YnZNppWPQ$qHhgGBDXwMNzxd8k+etCYvRk+yXP++TvYrJl/h7/tLU', 'cmazlo0mq00i9vp4smzt3ixb1'),
('cms417o8w005ubsj05561d53l', '$argon2id$v=19$m=19456,t=2,p=1$RlmLbW0sZSNaIgOwiJBCRA$nuZvSYaLaRHcLCJEI/0jE9Myei+JL7+EivEt9Grsxe4', 'cmeft1def00dxm6cb8tz4p3dt'),
('cms417o9v005vbsj0k2rs6ulo', '$argon2id$v=19$m=19456,t=2,p=1$pFNnd6vUgqFWyUBSj+v2vQ$kOYZWJICf101cf1xpFeKpTHca2QSZjRyvHfMH3qIE30', 'cmf29bria0007m6reb1qhcyho'),
('cms417oat005wbsj07rnv2r66', '$argon2id$v=19$m=19456,t=2,p=1$T8tCMSLqa5EFY9KGKLrhMg$GJ4BE5iKy8ngHDmJes0C+8ccCU5iGQB5o3TEjkQNdAs', 'cmrltit8n002qm6ucjdw5v15c'),
('cms417obq005xbsj0p7iptphu', '$argon2id$v=19$m=19456,t=2,p=1$CNFJJLiBDzuo18Jnl25/ow$K/LCSGIcfEPUEha6tbbiRs4opFRjnrIenyXE9dCt820', 'cmazlny91000lvp4s2z0cyi3o'),
('cms417ocr005ybsj0bo0jh3d8', '$argon2id$v=19$m=19456,t=2,p=1$F3DaECzRmyNgubpgiSm6pA$0PTM7zzvcMX+R8I5oiEjxCOyIoFwZcchgYyqLcut01k', 'cmazlo0n700ibvp4scqk9c388'),
('cms417odx005zbsj0qwlbibtl', '$argon2id$v=19$m=19456,t=2,p=1$55cUVt/Te0bh7B0XgSw4Dg$TgxiqFll6Sm1npZn4l1OErSbyuN5kqsoPOEzRx92xUM', 'cmazlo05n00epvp4sj834j1tj'),
('cms417oev0060bsj0j4pnn777', '$argon2id$v=19$m=19456,t=2,p=1$hlWHO1bYqJ7Oqtl5Fg0SJA$xVLZMOcXhi8Yy6r4RurSl+TAdf9wisA89seTnyNV8wY', 'cmazlnzy100d3vp4szi36grks'),
('cms417oft0061bsj0lkubmfu3', '$argon2id$v=19$m=19456,t=2,p=1$+kPSRukNZuVH95m6xFe+yQ$SMjVzVOG216jooenJYtkxKfiwN+40VdgsPmxnR/RNsM', 'cmazlnzyb00d5vp4swu037mh5'),
('cms417ogw0062bsj0wp3yjztp', '$argon2id$v=19$m=19456,t=2,p=1$qJ2rMKmFsmNm6DPU6zr2vw$U7tcDV/J6hGObc5wXjDtyvgUB63oFlNklEtTAeES3QM', 'cmazlnypp0041vp4shd4p8k67'),
('cms417oht0063bsj0e7beu2d9', '$argon2id$v=19$m=19456,t=2,p=1$CUecTGe7FtenhCBzMflJXw$rVU6MsWZbzIWR88HZHSuW6td4IEVCYitMG/lWdxEqbk', 'cmrdpm8em0039m65joyrtassn'),
('cms417oix0064bsj0yciyftav', '$argon2id$v=19$m=19456,t=2,p=1$pV+0FAaHMgqCSrCrokcQXQ$8XfOVItK5jMTd5io+JvuhqnDNLGVf86Ycq7HL5DslVA', 'cmazlo1a800n3vp4s8avyiae5'),
('cms417ojv0065bsj0ua8hw5nk', '$argon2id$v=19$m=19456,t=2,p=1$gSfG/wcjCDQaLFs4vI9apQ$gmzuHHookpBxROt3wsnBAYlYZhD6W4+d9Hdz8OD4Z7o', 'cmazlnzyk00d7vp4sypve5spp'),
('cms417okw0066bsj0xieravlz', '$argon2id$v=19$m=19456,t=2,p=1$NFK3Wy4jwd5xWFCqLP4K/g$PLKs1UKy8CdpiQ3Z0vAI9JT0euYOTe3m4K+C7ZIT1A8', 'cmazlnzm000ahvp4sh6vc60rh'),
('cms417olu0067bsj0lgl2ld1j', '$argon2id$v=19$m=19456,t=2,p=1$1U4T2SH8NukQWswu565HDw$YB0RaDxEpvV4PLGEDL8Ym3KaGbgDj7w2Ks6P4Ev4y3Q', 'cmazlnycr001dvp4swr7wdnf3'),
('cms417oms0068bsj0ydflb96x', '$argon2id$v=19$m=19456,t=2,p=1$YcQmg0f5ksPsyuPyDkS1qg$MrTSgXUxlu8lX0loCssMgK3LYBQXwN7gYelQrw4Eozw', 'cmdznko3a0015m6cbchtdqhdy'),
('cms417onr0069bsj0z3v181l4', '$argon2id$v=19$m=19456,t=2,p=1$392yl0gi5H3UXJdpHxF/nw$lB+bcRstfmHB7FclsntlvyAG3sXo6S2iLpc48vrANlE', 'cmazlnz2c006hvp4s5logr3gp'),
('cms417oow006absj0esv3y2pg', '$argon2id$v=19$m=19456,t=2,p=1$XzDSY6Tv93aUW1GcFUizGw$7a/8rF3LaoSxEfWrZLhf4GAE+FkndoEXaxmio5eKePE', 'cmr7f88sq000fm6xn7klstqc4'),
('cms417opt006bbsj0kyqthm7n', '$argon2id$v=19$m=19456,t=2,p=1$m1cXBCL3Jq0ZmbREcVEApw$YE6nf44PGUcOTKo9lVsLq394O5/O0sL08tEQtjnDylA', 'cmazlnypz0043vp4sd6m1gz1t'),
('cms417oqr006cbsj0uft6hye1', '$argon2id$v=19$m=19456,t=2,p=1$HlLMkgIISUgabJ6vJ3tttg$RTmJ2bAlb+3VQXt6rLPNXVd6mHNnw2OzWbi5kZvFLjw', 'cmdk0vi42000um6crrwgleqzi'),
('cms417orp006dbsj0c4t7s9fb', '$argon2id$v=19$m=19456,t=2,p=1$nHVSOR2jAldrGAa4/Mhlug$eRlAvOugZUKuO+xjDRRn1BxQXmb8HDfpvX8GwfDJ4Fs', 'cmazlny9a000nvp4sjgrbszzn'),
('cms417osn006ebsj0ugamo0z1', '$argon2id$v=19$m=19456,t=2,p=1$CJy3Q9NL6ZQbabVKGxWWCg$3DZ1ssFjk2vd0tOcKsTe6+26+qWSfr9LQGp1ytu5/xE', 'cmazlnyhx002fvp4ssk96t363'),
('cms417otm006fbsj0kvjezhin', '$argon2id$v=19$m=19456,t=2,p=1$HQNcRIBiIbNFW0JjXYzDsw$ZY+4oUTAnWyrmBPo6EjQlfH8eEsACwbFJl0ntZd7TLc', 'cmazlnzma00ajvp4s0b6wo7ty'),
('cms417ouv006gbsj0j0krkoe7', '$argon2id$v=19$m=19456,t=2,p=1$YINECZeh+s3NAeglIG2Kcg$CeX/CBLbAlFJ+NWZFY63Ws/GhVqNMpsa1lLAvrOBXm0', 'cmmdaafiu000am6wilg8drf60'),
('cms417ovt006hbsj0tatyjyej', '$argon2id$v=19$m=19456,t=2,p=1$Fzj+BR84DysZgDXErlPBRw$9Ar24yXDHcaDRVfjrbBnnv+HGvc5j3FD9Nn3H+mIVQc', 'cmazlnzfr0095vp4szsnufvkr'),
('cms417owp006ibsj0gpj4imcw', '$argon2id$v=19$m=19456,t=2,p=1$UqXy88YlMtEy19QtKfBW2g$6KGewp42JS/2fgIgZjhx4unsjGMkjAfrMaw2U81nYzc', 'cmazlo1b400n9vp4sogrcy0o1'),
('cms417oxn006jbsj08830tm0g', '$argon2id$v=19$m=19456,t=2,p=1$p/Hz/IghwSpEiGhjayWUjQ$MRp7Bn3Vlh43KxxVmjjWbBqYsquF9k/UP405Wo8Qrzc', 'cmazlo0nh00idvp4sgt7c7vmn'),
('cms417oyo006kbsj0ed26kf1o', '$argon2id$v=19$m=19456,t=2,p=1$5+cdj92kbNbXeogIV3HfqQ$mN6ACpUN0mF/uqk4MHv9xtBStkprmbYBTsZFD+ngaEg', 'cmazlnyd0001fvp4sklseqyze'),
('cms417p6l006lbsj0qoecw8vn', '$argon2id$v=19$m=19456,t=2,p=1$N4XYznYE/9MNE4rg143wZw$AgLn3LauxCXCafx3udpcNHlkYRdzbUaRtrl66Jaaoiw', 'cmrbz464g0021m65jqhkos3gj'),
('cms417pa0006mbsj01p9bsmcj', '$argon2id$v=19$m=19456,t=2,p=1$Thdh4eo53KTBcZbYr3F0JQ$T+vUWvNRsFSMfrFRAFnQm0yj2lVfmwoWlQmNR15kJTY', 'cmq51e44q00n7m6chyzecc3dr'),
('cms417pax006nbsj0cbk49put', '$argon2id$v=19$m=19456,t=2,p=1$edGuBEGLsN5oDOm+hXYedA$eXZTnhBCOWGE8FN8EG8VHJs4kAYhLLy6LOoqLPoNi+8', 'cmazlnyq70045vp4s8bpv22zf'),
('cms417pbu006obsj0i5rrgszc', '$argon2id$v=19$m=19456,t=2,p=1$270c/+73xCIp9FfHpJ/kAQ$RjLXvyINiUqGp4jJK4xC/y8ksEjTC/xPddYclC69rqM', 'cmazlnzyt00d9vp4sdsfpplle'),
('cms417pcs006pbsj0jotbr7ip', '$argon2id$v=19$m=19456,t=2,p=1$W+mRtaVG9YNb3Hir+v7fLg$+xbFyaYstUFC/a2o8bZ9yeYz+inKoopNemOKx+UeAAM', 'cme7597no00bem6cbjt9oiy8w'),
('cms417pdp006qbsj0vv60d3z6', '$argon2id$v=19$m=19456,t=2,p=1$OQ7hChgDxqw4AuM9gjOskg$ZWsjeE87ZFz8YLypywDdobbC/es38yrRW2iryjwwEc0', 'cmazlny9j000pvp4sj7ybkp2o'),
('cms417pep006rbsj03jp8s532', '$argon2id$v=19$m=19456,t=2,p=1$QzUNCGUk6InHFUUEcoSy1Q$QAB0vdhj+CNu9EsJ79unIdp1whaq6hQdj/UQzbcnYhU', 'cmazlo13p00lpvp4spkw4z7bp'),
('cms417pfs006sbsj0mwmwjysp', '$argon2id$v=19$m=19456,t=2,p=1$T/zyQEzbKJfLkvaPM29wAQ$cB43UpycE4tJmNo3tNRbnKx37cd8lM0jmPxUTk1dvrY', 'cmazlnyyv005vvp4slj744llj'),
('cms417pgr006tbsj02e2bun7x', '$argon2id$v=19$m=19456,t=2,p=1$uzoV5C9sAmH5xutpbnk7uw$X4gMNrZLgi7VqHt3jzSp04Kwu228U3he8JGYNwRZ6QM', 'cmazlnzg00097vp4s7nbcf9m8'),
('cms417phr006ubsj0lahgzro4', '$argon2id$v=19$m=19456,t=2,p=1$DvVxPGYqYq7Zm9uIs2nU9A$ERRS+YJ3fSB9tLP1v2jRxZBINJlwxzEc4RktLk1TLQI', 'cmazlnzz200dbvp4sa4awux29'),
('cms417piq006vbsj0uydwmkhv', '$argon2id$v=19$m=19456,t=2,p=1$+MmRNupB5asMpqYCZ3SEEw$MP1V5lY9wTktoyRqeDx0b6iK0WceYg2at5PSfv1SNJI', 'cmazlnzmk00alvp4sa28l0sfv'),
('cms417pjq006wbsj0nti9pnxk', '$argon2id$v=19$m=19456,t=2,p=1$rIRslkEndGqCT3NOTPfVvQ$Fmqhb13+g4tC9HluXZ3FVznhjq11TRxHe640TwwzvMA', 'cmazlnzg80099vp4sql9jhqda'),
('cms417pku006xbsj04mydmb2c', '$argon2id$v=19$m=19456,t=2,p=1$cPvwByQMpey/uvVXNqYtPA$/E9OLfNTNLhgnNwrBaGDLYRqVL6owVx2/EidQSQYiKQ', 'cmex0n0hy0002m673mx56ibsz'),
('cms417plr006ybsj0f22059pp', '$argon2id$v=19$m=19456,t=2,p=1$TRmATEIoDz94ZGRhVQsdmg$DKrgl1j1rtKcnSY+CVgkm5+kbX9OQctKuEot/kPfmFE', 'cmimnuzuf000em64dsdtg7t0p'),
('cms417pmo006zbsj0rwlivi9n', '$argon2id$v=19$m=19456,t=2,p=1$sbxWu9GoEX7rkE7+5VqlTw$1nFAHJKzaNvvcMBwO7KsbnMSh7sYDWgOZPZqapRtOlI', 'cmazlo0nq00ifvp4snyt1xge9'),
('cms417pnm0070bsj09yuszcdx', '$argon2id$v=19$m=19456,t=2,p=1$fff1HA7ZH6BKxso8UUYUAw$0L6vqRqLCd8l4DV2/TWe/Db4bpVPLRkJTE4hHXDWoSA', 'cmazlnzzb00ddvp4s67hzqnfe'),
('cms417poj0071bsj0gm5ra4kd', '$argon2id$v=19$m=19456,t=2,p=1$lvf2FOkEyuGHfFT8hYvIwg$uRm7yec9zhT6rD8AuJegq9XkEtV/fjpWpjQ9imuP5HM', 'cmazlo0ak00fpvp4snpbbfpj3'),
('cms417pph0072bsj0rawgr7il', '$argon2id$v=19$m=19456,t=2,p=1$7zHQjXoC7SKNZCns/ghwyg$Bz3wkJd00fGrc3EzWfWpEm1WCu8Jdbafwz3fWl674Uk', 'cmazlnzu200c9vp4s42jqk61x'),
('cms417pqr0073bsj096n9d83c', '$argon2id$v=19$m=19456,t=2,p=1$1ejp6AXkYX42O15nQxYSJA$JUgRR9qlzZeeNjp0ghjk30yYG8TYBpVsqMnxlKKysgk', 'cmazlo0y600kpvp4s7es981he'),
('cms417pro0074bsj0ppkwovj1', '$argon2id$v=19$m=19456,t=2,p=1$3vTNgKXGBsj4mUcRHbxlhQ$LDDgbJC+WErJANbniRwaLlQS+/HEKlH62EQV/yZrcYc', 'cmk3t744v0047m6wr841xyqqp'),
('cms417psn0075bsj0odjthsqj', '$argon2id$v=19$m=19456,t=2,p=1$NDeFdB739xbFPssvJqrWGg$+XKyCH2wa4GO6POC9tKpulCBf5vrggv2nDlhr+PqthM', 'cmcvql2jo002dm6wjxtxljneu'),
('cms417ptl0076bsj0saw693xb', '$argon2id$v=19$m=19456,t=2,p=1$mp3Eu8dLI2MH6+HdbxBvLg$Hf3MzE2TuHutm3IS8LkpZtzgasjbPLn1bZvB0F7g94A', 'cmazlnz8b007rvp4sgu95axg2'),
('cms417pui0077bsj05feelzhk', '$argon2id$v=19$m=19456,t=2,p=1$2EVV6ehUY0e7sfW0fwg7pA$vntt1uL5VJn6w4QiNdIgcT3r16kf/q8y1shVfzJxFDY', 'cmb92yae70003m67qks99blny'),
('cms417pvi0078bsj0sqmhxeg2', '$argon2id$v=19$m=19456,t=2,p=1$shjqC5yIz41k9LkNaeBkxQ$qz+cw+1dI6EEx8KeEhGNx0OoSkt/VCN1fNBqYlJY+5c', 'cmazlnzgj009bvp4sm33v0m2c'),
('cms417pwm0079bsj0mw22y4ql', '$argon2id$v=19$m=19456,t=2,p=1$8St1w4yxnKXgrvZldd3ngg$360qp5eYW2w9e2k2r9qTLOFet2dUP6Kvo6y+NKhnmgA', 'cmnijhei700atm60jza9abgfr'),
('cms417pxl007absj006ho3w0a', '$argon2id$v=19$m=19456,t=2,p=1$9W6RKHQWP/LkHdCq3Zp/Mw$ToP7/i7vn1cfhMPdIw8wiBpi1lgK4ehakmkP5zhPXwk', 'cmqdk1o7s006um6xsuzqyyrer'),
('cms417pyl007bbsj0f9lq8y60', '$argon2id$v=19$m=19456,t=2,p=1$jflmnvJOQRXnDOpB1qyrUw$aEcjqoTcK5jAYJgdOGjm1cWeO8O2WTPr4Gtwg92BMW4', 'cmazlnyi8002hvp4s0qwr4tt5'),
('cms417pzi007cbsj0zr5ru51d', '$argon2id$v=19$m=19456,t=2,p=1$5H/qTgxSv1QMCc6OmCtObQ$dGzlwq+QJYCBfeMUIj0ENSRv43ySeVw+7ETbT45SWoc', 'cmoi9bmmi000zm6chjp7ju4zb'),
('cms417q0i007dbsj0wvabes1z', '$argon2id$v=19$m=19456,t=2,p=1$TP0DWZd51VCn+JIZdLTNKA$UKX7QIM1vuBhISBv8OMrr/o+/zxOKGKF09AzpZPCRTs', 'cmazlnydb001hvp4sn41pxsvp'),
('cms417q1q007ebsj0tgfsrk9a', '$argon2id$v=19$m=19456,t=2,p=1$vs/RMXPAhp4wsuspu18srw$U84TttLdSGjvAYrH47TOtPkDWraFhk78zGG41l5Arok', 'cmm24uany00k6m6h05m1m9b77'),
('cms417q2p007fbsj0wp3ccxcr', '$argon2id$v=19$m=19456,t=2,p=1$zRmVQGhUtKIqDFaqfV71PA$9yCPh855NZ3tx52LJ4OyHyeaa/CU7H/s9EYHTs8fB8Y', 'cmazlnzzj00dfvp4sam71hxwr'),
('cms417q3n007gbsj0tj6wnzq1', '$argon2id$v=19$m=19456,t=2,p=1$1oQGYJ1/7H/PYjBPMDq50Q$Js/75SQSqVAtU6cq6EB6P8eDB4h/UCJ+7sG5oM0QYNs', 'cmazlnzmu00anvp4svu71uf6t'),
('cms417q4n007hbsj07vob5mo1', '$argon2id$v=19$m=19456,t=2,p=1$pkA3/0FtIgiW8C13p8VDLw$avK6SFaUVI9XCTDk7DauuE78u4mlZ7GpEKjl5Clr0Fc', 'cmazlnzpb00b7vp4ssj8onjab'),
('cms417q5m007ibsj0yex86445', '$argon2id$v=19$m=19456,t=2,p=1$nYV/bhtVhHLZe0f6P7TyYw$LpYLqUzvT0OoChYlMBCA5ljLVpmb89MBFpeRdXNCOvw', 'cmazlnyqg0047vp4sp2taslh5'),
('cms417q6p007jbsj06pk87g6t', '$argon2id$v=19$m=19456,t=2,p=1$rYHKsRvJh3H1GhUxiFyCBA$wHqyjmmM79/MT9IPZjML3XNkJ91BBRXlPp5MJ3hZJU0', 'cmazlnyqp0049vp4s6q82mfdl'),
('cms417q7o007kbsj0layu0ygy', '$argon2id$v=19$m=19456,t=2,p=1$T+DOB4Uk6egNCwBVY8JfSA$1P13qCYuUj6oIls2+6mB7Q0Vz64Msz6woLA2pnHpOkA', 'cmdrdeh830007m6tptlb653gu'),
('cms417q8p007lbsj0dz9g9jf1', '$argon2id$v=19$m=19456,t=2,p=1$mUuobhC/bZqYtMQaYMT+lw$Cd+x2rWiTO7khV9OaR0KbQcr+daLWy4nboH08PXSNTU', 'cmazlnyqy004bvp4s2pn9yhdx'),
('cms417q9s007mbsj0i5hrk641', '$argon2id$v=19$m=19456,t=2,p=1$yk3qJRmuA8a3o+1p3Vgv5w$haOSZkHNaPUwgo0BzNDDMlser1B+bChXaAsvCIIpUFU', 'cmazlo0at00frvp4sietkp6he'),
('cms417qar007nbsj0injyid4z', '$argon2id$v=19$m=19456,t=2,p=1$DQSHuqe94/aUvOGJdGTrrQ$Ey/AXt2/0bKE1NR8vlOvOvJFuwFMV0lOtWRvVkWYFlo', 'cmazlnyr8004dvp4syang1lza'),
('cms417qbw007obsj0z23xvpku', '$argon2id$v=19$m=19456,t=2,p=1$hQ/q08xKfDfrdWJFGvseuw$lNIGIlXz6zjtrKsbA7Ch1VeIV7X6xZLAl2lEOC+nQMY', 'cmr36vqfb001nm6wnt7hcuxwi'),
('cms417qcw007pbsj099a4mmeg', '$argon2id$v=19$m=19456,t=2,p=1$mTs0RIBxjwXGM+GIjySWEw$yF9Hi49zxxBZmti7MalFyXxhDqnDoYZitKNU5B9bZ00', 'cmda2p00b000bm6crdl4znlbi'),
('cms417qdv007qbsj08l5y3iud', '$argon2id$v=19$m=19456,t=2,p=1$E7JG6Ij8so1cREEFXUFJqQ$pswFPpY/FrOi/ssrOUUf4GiH663ImobX2dkuRddcEWg', 'cmazlnzzr00dhvp4sglyedm0a'),
('cms417qev007rbsj09nuo92vz', '$argon2id$v=19$m=19456,t=2,p=1$IJgf41jGBS+K/NCCDT9KQg$q0iROERoiWG38K+PG5FrMxsQddluimZruHPAaF6SjJA', 'cmazlnzzz00djvp4sh5ywz1vp'),
('cms417qfw007sbsj0qwekx5lx', '$argon2id$v=19$m=19456,t=2,p=1$vswScujiW93yf2qeGHzaeg$eVZk4Txqrfx1+1DR05bCpBycpuoqZ6QxbVbFmJO0BIM', 'cmazlo00800dlvp4stdre4ky8'),
('cms417qhe007tbsj0s26rliz2', '$argon2id$v=19$m=19456,t=2,p=1$EEWKcEtLBEGx2ctpy89Tdg$vknax6e+g7u2xhWhBIIEfYwTVkMksjRzlvc2qgtGbWQ', 'cmnfqio01009tm60j875m41rn'),
('cms417qih007ubsj0pr7sw81d', '$argon2id$v=19$m=19456,t=2,p=1$FKoBRL/+733rftgfmCuibA$5MmDnyRn2t19UQUj2XQOqDQyHCkdIKPOKXUAfM3OI6M', 'cmazlo13z00lrvp4stvkqgojd'),
('cms417qjg007vbsj03dbiswhm', '$argon2id$v=19$m=19456,t=2,p=1$CMiEBCNkzH62IaqzeyVD0Q$u38V29xkB/AtKQ7O1hhwj4OWDCmGmn8YqbaUgXLwSnc', 'cmjy3cuew001lm6wrc01q69n4'),
('cms417qkh007wbsj0j9hog172', '$argon2id$v=19$m=19456,t=2,p=1$K7sxt1sqmDJ/zF/7iYGKJA$vWelKanSytmhwkPcczleU3B6PLTnWdZpSUgqQNlc+io', 'cmazlnz8k007tvp4sxzdt4ydl'),
('cms417qli007xbsj0tesvriz0', '$argon2id$v=19$m=19456,t=2,p=1$B8y4Q/8Frzc1oavYVlvZ7A$bY5tQfffhAWhUVnz/bUzWWlH8xZU2WK9v/eCdnu80yk', 'cmazlnzau008bvp4sjclrq1w9'),
('cms417qmo007ybsj07lu1vqt2', '$argon2id$v=19$m=19456,t=2,p=1$FrEsYqf5flZO7HXca9m0Vw$ZXXXzSMXtiJoJIB6Cv+lgYSX17pehrmGd+C+uJ0d2+I', 'cmhrfj5gs0001m6o6ui9ds7hj'),
('cms417qnl007zbsj0yjqm1uao', '$argon2id$v=19$m=19456,t=2,p=1$rIZQG0EH2SO0eFG0QB6VIQ$LNWSLoF7hkCwbaAx7WVexLNDCHW9glOc2qOp0ipUW/g', 'cmpv8b2fc00idm6chghbbpjse'),
('cms417qoi0080bsj0upvnw6rp', '$argon2id$v=19$m=19456,t=2,p=1$z0pWZaHYmO24pSYx3SNGZA$PO8e2iTF/zbY+DcwrxdHELf3atxbrDSijEZpX+oXkDA', 'cmazlo14a00ltvp4sf0yisz09'),
('cms417qpg0081bsj00sf7vcp1', '$argon2id$v=19$m=19456,t=2,p=1$jPcyNsFNWSCdfnL6XWZHaw$6jINdMjAekqbwMyM9mEr4RedJlVZhWRduIJudC4kh4M', 'cmazlny9s000rvp4s58swhyf4'),
('cms417qqd0082bsj0367xx7v2', '$argon2id$v=19$m=19456,t=2,p=1$n3JSrwtTOkFxBZKpFEMTLw$WcK2nTlXz4iToYiOXzJ0GyraGjwfHTpypoUHevi4Cxw', 'cmdxraa9u0005m6cbv2tzno01'),
('cms417qrc0083bsj0rqxv2et5', '$argon2id$v=19$m=19456,t=2,p=1$eVZ9W9qZOmpvtdnF75URVw$W3PtFFs0anpD3o8uKHBzazwgsEHaXdUgRlM72vUrvqw', 'cmazlo14k00lvvp4s9lzxdva9'),
('cms417qsh0084bsj0m9jod9ls', '$argon2id$v=19$m=19456,t=2,p=1$KZoFs441oK4l1Ie1wMZYtw$fpNXm5dcqM1Q4Twd9BK97SSlcmyyqgH+C244jxDEQX0', 'cmazlnzqb00bfvp4s2x70ml6d'),
('cms417qti0085bsj0go5niuq0', '$argon2id$v=19$m=19456,t=2,p=1$NQ7AlvYgpU+8rz3qYR7Mjg$0mWhInhWTD9xVe+3aJtzsvtpPLDt4CQoMW4H6RCNTlU', 'cmazlnz2m006jvp4saxvl6qpb'),
('cms417qun0086bsj0ytffzk9q', '$argon2id$v=19$m=19456,t=2,p=1$dzoTPsMfcn684urs0PUcSw$ROxKdYAV9Hc6U66rxHWZRncqjrq7edJFOUqIaMoony8', 'cmazlo0o000ihvp4snc2xtjo6'),
('cms417qvj0087bsj0gji0vnbj', '$argon2id$v=19$m=19456,t=2,p=1$w0serQpvSPeCdlqoOO2q9w$FMMHPR6S/lY/IlsyInI302X4A+H51qO/egU6QN1XQ8A', 'cmazlnzrs00brvp4s0vx9d39r'),
('cms417qwj0088bsj0yqt4lyfd', '$argon2id$v=19$m=19456,t=2,p=1$qJZ1exrk29R47x8WSUXPfg$lna66UZNolOGx4Y/9AZE9hon8yTfXOT2HV/kgd0H1Jk', 'cmazlo14w00lxvp4smm402b9e'),
('cms417qxl0089bsj0609xqthw', '$argon2id$v=19$m=19456,t=2,p=1$Lb3ObB5lmsdx2mez0+Uuiw$ceEK1T1QRFZyfpboGkDuOcnW+cVMJDg0LrCPbQE0LZs', 'cmazlnzgs009dvp4sbhsqokr1'),
('cms417qyj008absj0g9vv1bh5', '$argon2id$v=19$m=19456,t=2,p=1$A68MgK+nqC5S5Qq5jOL1Ng$I+UQgReeL8ppJHx3RiO0c+VJxgTxP15gGXEvxHzWkqM', 'cmazlnzkn00a7vp4s64jehqi1'),
('cms417qzj008bbsj0qsrmf5at', '$argon2id$v=19$m=19456,t=2,p=1$vDvHKhUU6xYmQylXpCl8LA$XxT0ZKUwQ9pN/mK7YbN2PUnscZlmdmB6ZtPnUX1DuSA', 'cmazlnyig002jvp4snrzgj87c'),
('cms417r0h008cbsj0ety8w315', '$argon2id$v=19$m=19456,t=2,p=1$52cFtwYWkSHdjdjSjfL4Cg$TL8RGhX2pMX264ik4zLcxjmTtAk1xLRXoTQt3/LQHmw', 'cmmnrkj28004nm60jr55ixe8x'),
('cms417r1g008dbsj0876fxlg9', '$argon2id$v=19$m=19456,t=2,p=1$vto6fD1kMegWGhu1NbfFsg$LDMlSYVHFr52GU+tIEZsSonFLIkM7vjTaPgMptwgw9g', 'cmozkbq6o0093m6chry979qj4'),
('cms417r2j008ebsj0j7y885or', '$argon2id$v=19$m=19456,t=2,p=1$woDbZs+gWbW3boDx0t9+bA$m2VVH2fu8s/0AjC8JufkGoYMtbvNYlXeu8G+wupxhxY', 'cmazlnyri004fvp4s3ayt6gsg'),
('cms417r3l008fbsj0wzbf46kg', '$argon2id$v=19$m=19456,t=2,p=1$5oTJzr/W4DC20QiW/RArfg$ee9DnfrxDiCyePgorG+jHqoaOVfkeyijuiONBATWKXo', 'cmazlnz2v006lvp4s0x28i0pg'),
('cms417r4k008gbsj0donh83u6', '$argon2id$v=19$m=19456,t=2,p=1$CIuwVbRXYQ8P5DKym+allw$Tmve82p7hOww5nbywWXDgLGuXtRovHHANI3VGNV2tc8', 'cmazlnyrs004hvp4s8xdh27ci'),
('cms417r5l008hbsj02pfanh75', '$argon2id$v=19$m=19456,t=2,p=1$4Q/8tPOaDvt36xo2j4yvAA$R8eK6HrFAFVDGNmQ3dPoA6Pn6FstWbtEMruxHxGdOyM', 'cmdzvyuia0018m6cb0r77ohq3'),
('cms417r6l008ibsj00502r5t5', '$argon2id$v=19$m=19456,t=2,p=1$A6PhNdl15a5g8vJPx7CTzw$YWr6EEO+2Qlw9duH6FMDhK3ML/Lz70Rp3OP9Po+A8RQ', 'cmazlo0b200ftvp4slnvtfnpq'),
('cms417r7l008jbsj05hy0cq5b', '$argon2id$v=19$m=19456,t=2,p=1$g5w5qgZ6m+26WTtip385yQ$AsGuTOtYCitL0Gx8RQ/nfE6UlABiBZix4JsTCkEktDI', 'cmazlnzub00cbvp4s181i8tja'),
('cms417r8o008kbsj0fg5emt1k', '$argon2id$v=19$m=19456,t=2,p=1$iNVe9DKPV28skFOqTasXFg$JnWsrwXQVAkDIjE/IMdVqNAjOzY4OdxQZPfpORzIwjo', 'cmazlo0ok00ilvp4s9cl7viqm'),
('cms417r9m008lbsj0zl1tcf1n', '$argon2id$v=19$m=19456,t=2,p=1$aoFFcv2wSkhBj8TyBr/O8Q$OT6ZMOZfad5zBGm1ehjsn2hbfxnFwC6fpl8N7y8pf6g', 'cmazlo00i00dnvp4ssi72c9n2'),
('cms417rar008mbsj0vzcuwncn', '$argon2id$v=19$m=19456,t=2,p=1$cpQ6EoK+y82swG4+s0A60Q$95Qe3/ubJyfVDD26gfar5P5VAKYelRb59poedMRCAJE', 'cmazlnzuk00cdvp4s2skccbaz'),
('cms417rbp008nbsj0w6uuyws4', '$argon2id$v=19$m=19456,t=2,p=1$er3efB4JGsz/CqAzhrTCgQ$n1Xdw34b0EO4lpUtwSS22HO8UGrP5iVTD7KVlpSVq+I', 'cmazlnzqm00bhvp4swlwua1n5'),
('cms417rcr008obsj0pqoyxqbe', '$argon2id$v=19$m=19456,t=2,p=1$m4gzGcyu2yCyjJbrU+7HWA$rEOtic3nNhUmPfuplOY8/PpFRAOulCcFDu7RH+Odto4', 'cmazlnzn300apvp4s1sb7uyk8'),
('cms417rdy008pbsj0fv4aynnj', '$argon2id$v=19$m=19456,t=2,p=1$Tft3471ZQiU/FE4Pao3Z6w$R5kHSQSZ35SRoUnHHVX7yRqO3im97wzRbdIy8K7axAg', 'cmazlo15500lzvp4szlgl4b4f');
INSERT INTO `customerpassword` (`id`, `hash`, `customerId`) VALUES
('cms417rew008qbsj0lsob1ztu', '$argon2id$v=19$m=19456,t=2,p=1$irjKl68S1rD/vf9hMTc6ZQ$yP+oaDGTEkpxBL3+iPc04QibuoeLJiQq3u+UufthUG8', 'cmazlnzh1009fvp4s569rz3oy'),
('cms417rft008rbsj058rzs1vx', '$argon2id$v=19$m=19456,t=2,p=1$LeOC8NGfYKefMcuSxKtYSA$Qy/VStRf8FOqmlqCfa0bZrxFi5VGjO6CotbhED7RwFM', 'cmlccv0za0000m6xqwosk1hoq'),
('cms417rgr008sbsj081cw6cmk', '$argon2id$v=19$m=19456,t=2,p=1$GGmrEzFom35ckI3GjMjZTg$2DvpuR6Jqav4+jXCPSQg6DBbKiox+gFvdFuO28I5hJQ', 'cmazlo15e00m1vp4shaiix6x5'),
('cms417rhq008tbsj0ejhdxo16', '$argon2id$v=19$m=19456,t=2,p=1$ITv+Ky08pBOxq69e3bQ4PQ$7wiudWINNaazMSLEtPFgh6dgGz+yOQY3In/XZlF+OB4', 'cmazlo15n00m3vp4s3cpoarwe'),
('cms417rio008ubsj0jimvengn', '$argon2id$v=19$m=19456,t=2,p=1$jNsGIykqhr4Pm2AWOV50FA$7YjlNtvXwEElcMVhGQ06Mb/rCyaNPq3YnAf6sfQE0Ic', 'cmazlnzhb009hvp4s3e5zfoom'),
('cms417rjs008vbsj00tfr081u', '$argon2id$v=19$m=19456,t=2,p=1$VfuCch/lsV9JUpScoj0TYA$wd2e/EQ7vUjoCZ6PNHzI8YOBj6WpLsdfLJBrxKPu944', 'cmazlo15w00m5vp4syhb7jy50'),
('cms417rkq008wbsj0uohqyjla', '$argon2id$v=19$m=19456,t=2,p=1$HkfJCQsk0tjgIR5MdnC3VQ$PeIfD8/aXiuXnXNDaXYq2OzunxFrZ97IpEpmcjEgVL4', 'cmazlo16400m7vp4svst8xx9r'),
('cms417rlt008xbsj09shlrerk', '$argon2id$v=19$m=19456,t=2,p=1$yGAYIy/bsRI/LOf5Ont+0Q$frIRoZ30yXUtIAXkR4t21rSbEMOps1MAF3vOEpRg6U8', 'cmazlo1bf00nbvp4sty4qpj1e'),
('cms417rmr008ybsj0vyujvwz8', '$argon2id$v=19$m=19456,t=2,p=1$cBmPJq4KiAzd83c6v+a6Kg$DRrVJ8yH3MCFrKA2Se8AJ1cNZ0Oqu5GwPM0UTkh3qmY', 'cmazlo16d00m9vp4s28747idn'),
('cms417rnr008zbsj01kg8td9y', '$argon2id$v=19$m=19456,t=2,p=1$KIprg7D+T/djaymB87cuVQ$eMJVIpglJGWFdDz4mpAZzpc8WbfcoswXYqV8DllPcHE', 'cmron0wzb0002m6kwcm7yecxt'),
('cms417rou0090bsj0bv9o1f0u', '$argon2id$v=19$m=19456,t=2,p=1$TwXM1Ba7NEt+ao2LS9g8KQ$QL1da6I575vMc3lFWY1+2mAKS/h9OxpyXVDKrtqTThA', 'cmazlnzhk009jvp4su02q35tu'),
('cms417rps0091bsj0zbxdd1no', '$argon2id$v=19$m=19456,t=2,p=1$xp6z1NeKzlxDLceQVk+eSw$14mFrVKAbAO7r3O+08Vme5IvX4zpCdBhczKtwpfap7E', 'cmazlo00s00dpvp4ssg5yupcg'),
('cms417rqq0092bsj0mlbdpzfb', '$argon2id$v=19$m=19456,t=2,p=1$w7EFLTgVHg4pKq+5tHWJng$bqnsTe9Flqsk+pwVFvTqPAWS69/PjyDo98LEJu9h41w', 'cmazlnys2004jvp4sdtwyc9kl'),
('cms417rrn0093bsj0ukbin0bk', '$argon2id$v=19$m=19456,t=2,p=1$tDBwvwcTfOv6UgQZyOzTPg$IDaAsY2pljjKYPcF8HAk84dloSBMQeVQIwHUikB/asE', 'cmazlnysc004lvp4s4cfuug7x'),
('cms417rsk0094bsj05jbt95q8', '$argon2id$v=19$m=19456,t=2,p=1$zN6e9Qoz1j+WkTBOg/Abdw$d6PNjOpQnjw1ZpxAR5FrOpmrfvBFmxoiLfvUORPIppM', 'cmazlo0ou00invp4sanur4h4k'),
('cms417rtj0095bsj03cf9sp44', '$argon2id$v=19$m=19456,t=2,p=1$88n+q0J6HOMqiBZomsAyXw$YZrdCSClwMo/kFla9ahb4Dc3iNIawMzy5v4+ADCA1kc', 'cmazlo1df00nrvp4s0wrx7e62'),
('cms417run0096bsj00b3f731w', '$argon2id$v=19$m=19456,t=2,p=1$BR9irB8XDgizK55vyFlQTA$sdDIvgjnBN9hB9xb8shO4J4goaK/IN+xZDESweCRVmk', 'cmazlo0xo00klvp4s7zvq2kza'),
('cms417rvm0097bsj0ldursuq4', '$argon2id$v=19$m=19456,t=2,p=1$mw/B1Wt5WzncoVwutvqhGw$w/ACVnzMkp/GVUpqZL2TleG2m4PqawWGEG1sUhEi0Wc', 'cmc60ipji00e1m67qpwhiw8jk'),
('cms417rwk0098bsj0f8l4224g', '$argon2id$v=19$m=19456,t=2,p=1$d2vCJiISNb9CK3rFkbX5Ug$Tnrb3Ew1wHwsuGBvkabVQ0h1ujqpMQGzdcaFym1HEOs', 'cmazlo16n00mbvp4satt7l24c'),
('cms417rxh0099bsj05a7m6svl', '$argon2id$v=19$m=19456,t=2,p=1$mzz4umg03Oe9EE7gKWskrw$fYLGO2aBnUz3rXZ9mhxfMIdBQy7EA8L8ynjRrbHhgDo', 'cmazlnz8t007vvp4so5s08rvt'),
('cms417ryf009absj08t2kxvc3', '$argon2id$v=19$m=19456,t=2,p=1$oj8FNI28x6E8rYmsvO5jUA$MFtXeTPCnuC9b9i4KDerjeTi0l/Y3ATeqw8FEZY0w8Q', 'cmazlnykt0031vp4st3cihvsc'),
('cms417rzf009bbsj0ly1gae6z', '$argon2id$v=19$m=19456,t=2,p=1$LpUlNVjQkCR89rGuOb1vpg$iuYk7dPs6SfOlwrfqb0fBlhDWnFXs9af0MIVT5Ttv9A', 'cmazlnz93007xvp4sfy8k39kn'),
('cms417s0j009cbsj0wqikmagn', '$argon2id$v=19$m=19456,t=2,p=1$UeMQZOSpuwolr/W4qOR1DQ$8AmwEHQWsImvaNLGo8OI8/yfv4+FLsNJq4gw3KOmmOM', 'cmazlnydl001jvp4siqq93lqg'),
('cms417s1j009dbsj0xuhh91h3', '$argon2id$v=19$m=19456,t=2,p=1$n32JTI4hlqDONIrcmkyIOg$4E/6vE9wWDv2LY0Mdq2KlU7RoM/PcdzimXDmf4aGe20', 'cmazlnysk004nvp4s0hem01o4'),
('cms417s2m009ebsj09eix87du', '$argon2id$v=19$m=19456,t=2,p=1$lH7qVND/FPnhJBcsuCO/+g$SLUkQGyfvM1xkAfvpgIQ3qmQkiivMOWR1JCPyTJVJ60', 'cmazlnzht009lvp4shvy1aq2t'),
('cms417s3k009fbsj0vlug646v', '$argon2id$v=19$m=19456,t=2,p=1$0dxF/qLBUoPea+yj/9YvCA$n6bvEilonK/BQ/sr4KsIZVb25CJacKiJU9UFduEB89A', 'cmcsv38r50004m6wje9ya1biv'),
('cms417s4j009gbsj0cobt5h91', '$argon2id$v=19$m=19456,t=2,p=1$rKUhsGoEDAGzJdyXg82M6g$o8tQQ9IOt9PzwmR9abm0kaMZwc8lbZ1SDQbwHF3ceDI', 'cmazlo0p300ipvp4snuuukrhh'),
('cms417s5s009hbsj0hktb8xrq', '$argon2id$v=19$m=19456,t=2,p=1$DmSqpLP71QrzScpfaH1xdg$41UgTS+F34WBESvG+WKAUpDmMUOCYmRuK1yWwsS1ftQ', 'cmazlo03h00e9vp4suowf8xik'),
('cms417s6r009ibsj09uodiyuu', '$argon2id$v=19$m=19456,t=2,p=1$si/Njbfi6vjaFq+j9n8JqA$kr00kgJ+9U21hcXkcfvL9es75IX1Fn9Jv8dTCT8eBsU', 'cmazlnydw001lvp4sgxwa4jv9'),
('cms417s7o009jbsj0rybt8zn7', '$argon2id$v=19$m=19456,t=2,p=1$S82Zki0dyFYoG8cOwVf6AA$uvfXdo6NYyQ2AbthvKX/Yx3HC9SMUQrW6frRgHfg7zQ', 'cmrp0otd90004m6kwwt7x6ylx'),
('cms417s8o009kbsj00unglphd', '$argon2id$v=19$m=19456,t=2,p=1$ZsfjIHh6hTZEbCggmNIyGg$B81v8+rEW+itR2Inacc6T2uYdcNDfA6wdjfMHnKzW5E', 'cmazlnysu004pvp4s8kl383w6'),
('cms417s9p009lbsj0pus6rl8d', '$argon2id$v=19$m=19456,t=2,p=1$AbqaCBjrjjJhCL4QEaazyA$kRlxnF/YGY8gN1GzjwWV+xlmwfmTFPgGw4XIev+A5kY', 'cmazlo05w00ervp4sdtjiynwi'),
('cms417say009mbsj0dbxk17b1', '$argon2id$v=19$m=19456,t=2,p=1$tKSdwiMQq54nIlWCf4D1mg$hRfC87+NzWnvlEPs+W5s0Uh/OfBtJ0gHWuLIAg6k6+k', 'cmazlnyt5004rvp4srhzfdg38'),
('cms417sbu009nbsj0lkrghoi9', '$argon2id$v=19$m=19456,t=2,p=1$4I/GqtL+3NQZulNvy2PoYg$CBY+cbfBxTm89iWXoTRPOmPYZ5QbIBYdXW8LMJOEB2w', 'cmr7ioyrl000hm6xnvyyfyo9p'),
('cms417scr009obsj0guzpgmui', '$argon2id$v=19$m=19456,t=2,p=1$doVbZ0Zc+HpV7CoTJV4OXA$p4C5JgSPEFySfE1ZxlvYhN1462igX5D/NYvnnRSeYvM', 'cmazlnytf004tvp4sxiqlmtti'),
('cms417sdp009pbsj0u6e1wuxj', '$argon2id$v=19$m=19456,t=2,p=1$wTDTlu9w3OnHej79FMxqLA$x0vFqQfx+CculLgp3Kq8XlRE/azcDJ2MXRWSQr4Dc3E', 'cmazlo0bb00fvvp4st8974sdb'),
('cms417sen009qbsj0ejcmwvif', '$argon2id$v=19$m=19456,t=2,p=1$C0Np3rsO73vxHTUGBHcPmQ$OlF6ZVe5UHvKx3sG6WzOmQRAnNEbXcCT6Ca2RiQga5w', 'cmazlnyg30021vp4srf3ls27b'),
('cms417sfn009rbsj0iueyydyz', '$argon2id$v=19$m=19456,t=2,p=1$qIk1btEZklKTWYWjNxJV0Q$EBe3zqQ2DvyXi07IwEZB4XVZeFFHS8fu4NI1C8F+5qI', 'cmazlo06500etvp4seypx8czr'),
('cms417sgq009sbsj0605io3bh', '$argon2id$v=19$m=19456,t=2,p=1$kZux/7ULqo7qyDIxfrDhHA$9PiiBK9/zkeU3ctIlY7rGr7jfkq56MoWl//w1d4k5J0', 'cmazlo06f00evvp4soivj5tu1'),
('cms417shm009tbsj0le2y4u86', '$argon2id$v=19$m=19456,t=2,p=1$Gw9q+bWQ5GCrFaJW8SsHaQ$p8d02er5KF/ywgnx67VCjQaS6Tkp54cuwoE9IM9IEtc', 'cmpdx65od00gqm6ch98rebx9r'),
('cms417sij009ubsj07sq9acvx', '$argon2id$v=19$m=19456,t=2,p=1$xe0hWmGA4ISUGjfjL4OEPw$Zv1y1EOSsb8FGTscKu02VXK3vZmJF2Ylj07XnB05YVE', 'cmazlnznc00arvp4s2swko0j8'),
('cms417sjh009vbsj0zktbos1e', '$argon2id$v=19$m=19456,t=2,p=1$3o2mknWiwaMf2TW7xNlr2g$cv2TmYsmNBJSN3CkDJ14Jx0h+3I3Ezm73MjzL02vcX8', 'cmazlo0pd00irvp4saku9711r'),
('cms417ske009wbsj0a22be5c9', '$argon2id$v=19$m=19456,t=2,p=1$u1qY0PJJpevz26KKQRp/MQ$L3ZaJhDKMyq3JNsB4c+vjUPZxekKmO5K0eMyTjMauHg', 'cmazlnyz9005xvp4sm7k732f9'),
('cms417sld009xbsj0w1c7ox4i', '$argon2id$v=19$m=19456,t=2,p=1$N288FDGbwyrXaYrwT9U/8A$Im9p1lS+/uiwiQjJHbnGfsTRDn731okE98CdFvSdr1o', 'cmazlnznk00atvp4s96ullrdq'),
('cms417smi009ybsj0109srwag', '$argon2id$v=19$m=19456,t=2,p=1$armaOYQHYFIC/4tCjWwWOw$RlyJbF2ua51yu395omm4e6o6cRiB9ke+WzPsLxElDWY', 'cmazlnzi2009nvp4sh7wnugyr'),
('cms417sng009zbsj0altgmki3', '$argon2id$v=19$m=19456,t=2,p=1$YPM/m51o6UsfTX6vrn9XvA$8fKpkku/De7Zh/KDegeNv9M0ApwOYelrNHA/XBeIiGM', 'cmj78e4am00bim6zpoecfbvs5'),
('cms417sod00a0bsj0mxc6e6ht', '$argon2id$v=19$m=19456,t=2,p=1$5+wfJnCTkxyYBUHU+7kmeg$dJliUJo5KU4u7xFyzrblJWYL0H1/eLF9nnlx5d4UHiw', 'cmazlo0pn00itvp4sn4yq6778'),
('cms417spb00a1bsj0zen0gy8e', '$argon2id$v=19$m=19456,t=2,p=1$+WP2HmzZ5IdEr2BLIXBn6g$EC/LbtE3G16BxwEotmG5ajfIWr/UUJepEfYndpfb+QE', 'cmazlnytp004vvp4savcusn7u'),
('cms417sqa00a2bsj0nmoxywcv', '$argon2id$v=19$m=19456,t=2,p=1$xgGVr4uZY+BKIl+9LQDVuQ$nNWCxx6xMkx4Zinte5zAp3o3kjPhlQlWsFHGuBBuR48', 'cmazlo0pv00ivvp4s9dgu0gwq'),
('cms417srb00a3bsj0nmj3rkae', '$argon2id$v=19$m=19456,t=2,p=1$506QswH4FKMLoxMNrtOkVA$3Zdm7+td2tFxEnA8UreA2yuc34BmmYG9CJVhIWG9rdo', 'cmm7wkp5y00kxm6h0ibgv5w7n'),
('cms417ssg00a4bsj0jwwjadjg', '$argon2id$v=19$m=19456,t=2,p=1$muOkeISLISDCBHxcvY8lkw$RB2G9gI32ZTD8AlLlGbpML6Tc2awMTKxdkC75wusTaU', 'cmazlnzib009pvp4s0hva0e6v'),
('cms417stg00a5bsj068i3rwdn', '$argon2id$v=19$m=19456,t=2,p=1$nSg1hB5YnN8PPivJpvLQ0g$QblcPmTCPB/xzu2wmylek+YR16vdZ4Kh4srEQxkbwqI', 'cmazlnyir002lvp4szjcgims8'),
('cms417sug00a6bsj0u6vfethz', '$argon2id$v=19$m=19456,t=2,p=1$IPolopaAdd1O+welpJ2I2g$87Ww5PtIiP8HaMBrhi9Gs0CWKtnwBqU/QcACk4WXU6o', 'cmazlnznt00avvp4s3yh8q0rw'),
('cms417svg00a7bsj0c3fk9m2p', '$argon2id$v=19$m=19456,t=2,p=1$LO65DuaN6LSYmfDNTIrY1Q$pxwavqkDxdrMzyON28o5b9gE9tD51cq3VG7RUnTrnFM', 'cmazlnz69007bvp4sagqhvjzd'),
('cms417swh00a8bsj00oe7nind', '$argon2id$v=19$m=19456,t=2,p=1$1rQAk/2P10TQuw0lC/OShA$b70iRs3b8scy10hyrxbjianhHq+nMC2apmjHKrt4yRM', 'cmazlnyzr005zvp4s1k8lfcrv'),
('cms417sxv00a9bsj0ht8ra107', '$argon2id$v=19$m=19456,t=2,p=1$RKOZNbbG9OtD5rKJeyM2vw$pBtWqHjxp/uJIzn8TixRuz5lOHoglDZ6XkikNn4zhYM', 'cmhrlqyzu000em6o6bzp1z08b'),
('cms417sz600aabsj0dju4z6m1', '$argon2id$v=19$m=19456,t=2,p=1$0Xi/9w+5bxbSmiiVMgLQxA$vryJ/Qj2NHtykQaEiOcvaMTeP2dhlIwwX8SaWzB6Av0', 'cmazlo0oa00ijvp4slrg25ome'),
('cms417t0200abbsj0fekug8nk', '$argon2id$v=19$m=19456,t=2,p=1$9TWaIrMEIk6M+w0j+vyYqQ$t647BZ0HJr49FRhSUkuVj2y7fUuJLkarEYhqVWP1OYE', 'cmazlnyfj001xvp4sll9gjoxc'),
('cms417t1000acbsj0t8d8vmoq', '$argon2id$v=19$m=19456,t=2,p=1$LlCZZys2O9zxVBLwyptGcQ$3S0U8W0H1fuWbt7TUWWHswrRm2nKqwCO5Q+AOIeqe+U', 'cmazlo0q400ixvp4s0s54tfea'),
('cms417t2100adbsj0d0s5viv2', '$argon2id$v=19$m=19456,t=2,p=1$/2D1bIvfFH9bLcf4Qz1NwQ$4ibrs1URny88S/an8sQ0o6wW1d+YWbCEwZjOwh1OMmw', 'cmazlnyiz002nvp4suvnqnc2o'),
('cms417t3600aebsj0ev3apdu5', '$argon2id$v=19$m=19456,t=2,p=1$/Y/SPHU3p1fRF6fMHyQc5Q$2Ll5lRel0LCxPjVIgz2t0sw7EzrmEKbfGu2+O1k2Olc', 'cme9u2ax400dmm6cbhoigz244'),
('cms417t4400afbsj0319hwr2g', '$argon2id$v=19$m=19456,t=2,p=1$/yRNo25EsI0lIla+a/zwng$qJB9v3LhL73LCu1f08bEhWrGocmf8DLDoI8r+mWwS58', 'cmazlnya1000tvp4sj7sj6xhs'),
('cms417t5300agbsj0jlt27524', '$argon2id$v=19$m=19456,t=2,p=1$Oo0cRyR6Qzi2veOHVaGfjA$8JzVEZj5H9IvB4tWXPrsHhhnx0Fz1surXnSLhttRViE', 'cmazlnyl20033vp4sqjeaf2cx'),
('cms417t6000ahbsj01bcp4v1h', '$argon2id$v=19$m=19456,t=2,p=1$JI4K8LraeW7jzKAcnqXH0Q$7Gt4b+wqaY6tYiu952WE1KHWszLzIibsnzklpB0Igj8', 'cmc0lydtc00dnm67qcvdiihbb'),
('cms417t6y00aibsj0qig0esps', '$argon2id$v=19$m=19456,t=2,p=1$9okoBeT8djQZlChmH39opw$PX+vkxbjO9b+ijbN7bpdk6ea9ni43sUeQiCw2rUbQbM', 'cmazlnytz004xvp4s83u13lhw'),
('cms417t7z00ajbsj0y736mb2n', '$argon2id$v=19$m=19456,t=2,p=1$L84A1N+WjvBHV9w9yOGw3Q$NgB5cydKC8AIr+kMQSZ1RO1QgYcCfFhwZUkIcZuzj5Y', 'cmazlo01200drvp4sbm0sghxp'),
('cms417t9900akbsj0mybmezz3', '$argon2id$v=19$m=19456,t=2,p=1$bnIVyohtYa1cyVJ74SsUJQ$Q7nJ6f8NtNkHTFaz6uzRkYaGin+i27r5gC7dfYCsjVU', 'cmldibq670079m6h0xl8cshif'),
('cms417ta600albsj0l01euacd', '$argon2id$v=19$m=19456,t=2,p=1$0hIu5ZdhfZi1fUFnAhK1Cg$1/ns1KcZopyN1JBd9WruNPIPHH7SptoQr66xfoHzEPU', 'cmazlo0qe00izvp4ss7zq2o48'),
('cms417tb300ambsj0kzwfxnzu', '$argon2id$v=19$m=19456,t=2,p=1$sMknqTkhouExrKaWFY3bSg$x9gIb8B9Ifcrmy0P7pu1koVXUhkZc+47md/v0vflQH8', 'cmazlo02n00e3vp4s4kc80fe6'),
('cms417tc200anbsj03fpj83xt', '$argon2id$v=19$m=19456,t=2,p=1$kuaiWZYE5VR/LyPS8useMA$FoQPhJgEtrieZU6jHOEGjWCVUGUSjLfA4L/5B5Lxotk', 'cmazlo01b00dtvp4siko5zjpi'),
('cms417tcx00aobsj0ten35i12', '$argon2id$v=19$m=19456,t=2,p=1$PyPK+4/zb0xl8OkIVajg+w$1GKP4Q7j1UbWALTrnEWYdtb0tKaTh2x/1JLiCeM3xWs', 'cmazlnzus00cfvp4syiqxcyt4'),
('cms417tdw00apbsj0lam5vtom', '$argon2id$v=19$m=19456,t=2,p=1$brPcrF/LvhvHxGi6k7i+hA$YHEzU58ZtISbUeHhTNYIPgM9vXHsvj06M7D6BHZMztQ', 'cml53jdk5004sm6h0urqnuq9l'),
('cms417tey00aqbsj09ya86y6j', '$argon2id$v=19$m=19456,t=2,p=1$/NG4qBOqhCKqxiSrFGRHAg$naI/N3qes3v+pqfMmbfu1KeBMEgUwFseLPPSAx2cSGE', 'cmazlnye6001nvp4ss71b36oo'),
('cms417tfx00arbsj0ee4a7jbc', '$argon2id$v=19$m=19456,t=2,p=1$CcY7wQyfcVBSdJ+npRPryQ$6pkZ5evuHAogTOG2FmtoZaM/iwdfABFYKNoweMuK+As', 'cmmi20xkm0001m6flmp4faoam'),
('cms417th300asbsj0tedz2vfo', '$argon2id$v=19$m=19456,t=2,p=1$O6kzjHb1MJjbCRQoET22Jw$xnTJHyuZw1aLHFn2Bd8yB261mhKFpNnrQuR0MLHKKx4', 'cmazlo16w00mdvp4sd0yhwtoa'),
('cms417ti100atbsj0kun2takt', '$argon2id$v=19$m=19456,t=2,p=1$KC36NTCDEvBK3Sizcw27kg$0A2d/PGAKjv/pX1c0Hb+X5R0W7WnfXSPRH/2A0WpOFA', 'cmazlo0bk00fxvp4s1vst0e7s'),
('cms417tj100aubsj02l9w672k', '$argon2id$v=19$m=19456,t=2,p=1$CmJW80Mu4TK5oTTI5aQ+Yg$WWF464V8EkvJB+Ppi7w24uXjbOStJZGPgvBlhkJ2RnQ', 'cmbxhc09500dhm67qneyrhull'),
('cms417tk700avbsj090i0o7sj', '$argon2id$v=19$m=19456,t=2,p=1$ugexRKGGiI1HTid3h/RtBQ$zCaHKVJFUMAPV47axcxE6zTwqPvLHUmAHlD7/MnOj28', 'cmazlnzs100btvp4sfbb51k6f'),
('cms417tl600awbsj0zp70bg4n', '$argon2id$v=19$m=19456,t=2,p=1$VtuD0KbV9vdcEEs6WtJYXg$itfZpv90eMaPQCqFctpNCA3RcxaTJaKyE0QDYvoMA4I', 'cmazlnzij009rvp4sckz1dzb8'),
('cms417tm700axbsj07am545xw', '$argon2id$v=19$m=19456,t=2,p=1$opPG+p2ktQLaMYPeWjGALA$0FtsQxbby7HhMSzY56N7X+zP4EY4rfK3jL9Xb18Skp0', 'cmg94x9f300cnm685yir4j062'),
('cms417tn500aybsj0b3c2gdoo', '$argon2id$v=19$m=19456,t=2,p=1$WKkO1NeuPGgDUQNDXV5EMw$F2Sk2DdJ0sNcwjYpZzo1bW/ZULdGQMvI1Gg9mtUvP2Y', 'cmazlnyua004zvp4s7t735kyg'),
('cms417to400azbsj0iyq6m4d2', '$argon2id$v=19$m=19456,t=2,p=1$2bSNlqg3nJhw0xpzOGoxLA$rL5QnGesqMscYQ2t1kRw2ITbpzT7ZQm3YSt1vjMRaKY', 'cmazlo0qm00j1vp4syou6hbwj'),
('cms417tpc00b0bsj098chq6ku', '$argon2id$v=19$m=19456,t=2,p=1$14HC0nkDkJMa5dMolj6pIQ$brKTzYqWWCENNE6xfSO+iCiOi72HdEYqVJ6yBEZzSWU', 'cmazlnyxg005nvp4sigfmytme'),
('cms417tqb00b1bsj070tpw9h1', '$argon2id$v=19$m=19456,t=2,p=1$GmninodSVPHCZdTVkN/vZw$JlfexlIHdgsYkZrLO8baLRo9niAFru4yTiDBzVc2O6E', 'cmazlnzqu00bjvp4s7pusi6db'),
('cms417tra00b2bsj0t0mzrwhn', '$argon2id$v=19$m=19456,t=2,p=1$53e8UWZsBmYlbD8rzhwqiw$81oa5XS1UQKvMvV5bjj+jzgfUg71h91Y9Uu2xoEXoL8', 'cmazlo0qv00j3vp4san91pjnu'),
('cms417ts700b3bsj0xhsclqvb', '$argon2id$v=19$m=19456,t=2,p=1$4h1z0jJcAhDi0tpUnPUcSg$adhTHktVjeLEiW76ZBWOWu7j66UvnoR3Nl7ueWV2pdY', 'cmhg3bst7000tm6wzqi5hfyk6'),
('cms417tt500b4bsj0gasht9tp', '$argon2id$v=19$m=19456,t=2,p=1$pmgFvAsqEYtaSnE0Wsz16Q$sbwYWndroEcndAcyvZV7ys4fLCJVKl3oRp7uDnJiuGE', 'cmazlo0bu00fzvp4sakez0oel'),
('cms417tu200b5bsj0w0pnhcsa', '$argon2id$v=19$m=19456,t=2,p=1$oMrxs19r2wnDBsVtzBhjTA$tNm4BiYXizsS5x+y0JWSRKQ8TKhGKAZinOjfwl0SlKk', 'cmazlnzsb00bvvp4su32twtgl'),
('cms417tv600b6bsj097tdw7cx', '$argon2id$v=19$m=19456,t=2,p=1$aXBfI2Y1a16vdHLLwuyH5w$un2PUlUH3wkkIrWBFG6xPvwvGSfCVQoPme8BaLn+XaY', 'cmazlo0r500j5vp4s8v1spj0v'),
('cms417tw500b7bsj0afsvw3aa', '$argon2id$v=19$m=19456,t=2,p=1$dt1cBuN+oc1eIo3KHPsOIA$Wj5/69EGlHaD9lnRHOJ+Dkpgw5dIR/Hp5vAohcK6N28', 'cmgbttssb00dkm6856u4ponxk'),
('cms417tx900b8bsj0y9rhoox5', '$argon2id$v=19$m=19456,t=2,p=1$BYsSj593oEM4Gjl2R24jyQ$aNVW+HuMkeW/TkpDGXCVFTQ9R3boKkTT9qTHJtmVKvM', 'cmm0grfap00k0m6h09gkhaws3'),
('cms417ty800b9bsj0bfzld37r', '$argon2id$v=19$m=19456,t=2,p=1$2cikzwEKUePywtR/Y82a+Q$M+OwfG7RvZsNLe0XMwi1tEvy19F8OkFJ0cTU/wgWcBw', 'cmazlo0c300g1vp4s6vjuegqe'),
('cms417tza00babsj088bhimgr', '$argon2id$v=19$m=19456,t=2,p=1$3z6aDLoify/1j47W00sYYw$INfvnGJzgSOM5aTpxsBoG5dsduijdDLxjmnFZ01URxc', 'cmazlo17600mfvp4so9aanc20'),
('cms417u0d00bbbsj0hq3muib8', '$argon2id$v=19$m=19456,t=2,p=1$PmdulRTFep9R8Q1Lg880Ow$aaUynrcSQAPomL1F1NrcOX78Jf4AuSW+clpoMhY1804', 'cmazlnz35006nvp4sqow1914k'),
('cms417u1d00bcbsj0yu70bawi', '$argon2id$v=19$m=19456,t=2,p=1$C+DTyL8zOAMJSsVeb611ug$pnB3oRaorpGvhUgiuEwE7gX0qOSuHrio6xSDwGny/Jw', 'cmazlo01k00dvvp4sjtbsblei'),
('cms417u2c00bdbsj01u1qic05', '$argon2id$v=19$m=19456,t=2,p=1$0wKR9SO1MPRfApCgSWxeag$f3k6lN5+hwTPU6ERKpjekIdCNzgkgULeuZ9v+3FGboA', 'cmc4gkjwl00dpm67qbhz7ahcd'),
('cms417u3a00bebsj0adm09imh', '$argon2id$v=19$m=19456,t=2,p=1$sSSviyMtfLPpxPwyT80ZRg$TI13sAxzHG2vZjJYTM3Bh9lS7Rpmk5G42uJM5w8RKRc', 'cmazlo1cx00nnvp4sh9v309b8'),
('cms417u4800bfbsj0lhw3aad8', '$argon2id$v=19$m=19456,t=2,p=1$hv6jGRjsa4DGyePy/r3OKA$driB8IJ0HHYo1bbSsrgkCb+are6n7vQEWetTF6rL8Z0', 'cmazlo01u00dxvp4s5hl7hnpw'),
('cms417u5700bgbsj0mh4hrksd', '$argon2id$v=19$m=19456,t=2,p=1$bZ7dbo8vYHrw/AoaW7zekg$H4bUqyqIs4XMTltN6OTkTOy5dASRoj2qGOJevyDbbxY', 'cmazlnyuj0051vp4sx6j9ak49'),
('cms417u6a00bhbsj06veq2xs0', '$argon2id$v=19$m=19456,t=2,p=1$GuzFFIje3dPgwPuEvrKkxg$zAfvoNmp4n8zlTrPBZhezGEpryYvXXz3o/SjwkXDarw', 'cmazlo07800f1vp4s6szr2ni7'),
('cms417u7700bibsj04rjnuqyx', '$argon2id$v=19$m=19456,t=2,p=1$gUNf4fJNi42I+LtScsMXww$vhkAndQfYSNci5qA7hkvwrfJrwID2W4GBmgq1liFz8U', 'cmfanxsub0003m6wzgixd71ke'),
('cms417u8400bjbsj02orh9vrh', '$argon2id$v=19$m=19456,t=2,p=1$UpVHI9duKNdQNc2UHiF04Q$mmNXGwNrXqGTI5CM/lobWcGG0evN5afEXrLgVfg+eYM', 'cmazlnzsk00bxvp4su8dyqfiv'),
('cms417u9300bkbsj0ee03uaol', '$argon2id$v=19$m=19456,t=2,p=1$RiqRStd0nQ+ZwiZs6c3hQg$YJ2leYDGdeKiGkeIobYFYfnVRjIy735lhuemZFD8rLU', 'cmazlo17e00mhvp4spopimz7v'),
('cms417u9z00blbsj0u6euao91', '$argon2id$v=19$m=19456,t=2,p=1$UYpEoPjrS0nzoTi3P9jIgA$Ga2d3AkrhGlA00fAYBLFBg3d8AynV52timqE284Yypo', 'cmazlnyuu0053vp4s3yo5qojd'),
('cms417ub000bmbsj0lrvqiikf', '$argon2id$v=19$m=19456,t=2,p=1$gFN5TFJuRj9HcZZO3UsSNQ$yOJmdXxg2ljz/pe/5jjqQ4AyF7rhZBFb2PPIKDgfHgE', 'cmazlo0cd00g3vp4slq8nbmam'),
('cms417uc700bnbsj0c5dh6aps', '$argon2id$v=19$m=19456,t=2,p=1$UKEgiteefz65e1SQnThqbA$sSrHagJH2VkhLTycAiNE7LzP8YtzhuUyklfzuolJbQ4', 'cmazlnygv0027vp4sm21fxopp'),
('cms417ud500bobsj0pekqvtmj', '$argon2id$v=19$m=19456,t=2,p=1$WTj4qSAID+mIIuDBuLXvWw$hYKN+SMBlvBOnsch/v9de8E70I5Zz1gTOhlTlp607RI', 'cmazlnyj9002pvp4sctfirmjh'),
('cms417ue500bpbsj0csroj9xl', '$argon2id$v=19$m=19456,t=2,p=1$0xcggzKYgz0aVMUjvaQdjQ$tJMjQjTdrSMdtjkAEVU9Aq4KbbaLl7K+Q8IpOmE/2I4', 'cmazlnyv40055vp4sw0cvtetx'),
('cms417uf100bqbsj0j03k4oo5', '$argon2id$v=19$m=19456,t=2,p=1$h9ZkZ0XDu7c0Kb4rlz2uMg$yZimE3AeIJlEknDMbuFNgCV+MgdAAL532dgjbAR84Mk', 'cmazlnz3e006pvp4so0hf8m99'),
('cms417ufy00brbsj01c71kylp', '$argon2id$v=19$m=19456,t=2,p=1$uppYU6SbrJXBrrwKJkpEJg$fMs9x0rw/FevFRTQqfyStCgT+k8m0tSSVkQtVZk4jTM', 'cmazlo0re00j7vp4s8wb70o0c'),
('cms417ugz00bsbsj08349jzyg', '$argon2id$v=19$m=19456,t=2,p=1$URNs/wCd3uG0NdFIouwbEQ$SywVZrIxqZE8xYDfmsk3iPqbKCN+hsIQgVLma74poMY', 'cmazlnyeg001pvp4se9wnx94s'),
('cms417ui500btbsj06ne8xze3', '$argon2id$v=19$m=19456,t=2,p=1$WaUG3/YpR4hYjukYN3fu2A$STbBnBOTY/2xl7nSUGUnKvp+0I1xzIuGJN60lmGFF8g', 'cmazlo06p00exvp4s656mh2yx'),
('cms417uj300bubsj045hx80xi', '$argon2id$v=19$m=19456,t=2,p=1$EMpRlCjr/AKub+y8sAIcPQ$CHlDYQJFdMoqQ9CqNzIme3RyWqPvFqIAjEPUOliXM24', 'cmazlo0rm00j9vp4sr4naqsv7'),
('cms417uk000bvbsj0rtj1et51', '$argon2id$v=19$m=19456,t=2,p=1$4rTNzHiz2O9/MCO2YyxQcA$6yv1gkH6L4d4FzwmiBwEede/1Blf8lvsUXwvNcbFSqw', 'cmazlo1do00ntvp4sr0n3xpym'),
('cms417ukx00bwbsj0bpirutk0', '$argon2id$v=19$m=19456,t=2,p=1$z1yYu8ATem9qqx7Uw9y/Dw$sVc3rmue6IawknNAZ31nbLAg8HOf1dVM2Iu2SpoA8Q8', 'cmazlnyvd0057vp4svxnra672'),
('cms417ulw00bxbsj05xvqwe23', '$argon2id$v=19$m=19456,t=2,p=1$CE43XAk7jHXBrJhTUqRCuA$pFgTI6JyyoMzl9MaXf9VJkY6VS1FdDl+d+eEd7BafIU', 'cmazlo0ru00jbvp4s0wn4vsuy'),
('cms417umu00bybsj0quqwhay6', '$argon2id$v=19$m=19456,t=2,p=1$6Jf2Mv5VgfneU+00yrHQ0w$ZHxVlOnkaUJxEyv/y0zhbB56n+tVeJjVcujGPFz12EQ', 'cmazlnz9c007zvp4s3nfcfs1z'),
('cms417uny00bzbsj0z8ic43n6', '$argon2id$v=19$m=19456,t=2,p=1$iU/W+HVP+fywdUbCLHojsA$ZgKQg0oRXv9ARRLb3+f04u3k22nv0QWOT50mMKkBI+8', 'cmazlnyab000vvp4saue3egxm'),
('cms417uox00c0bsj0a0pr1xz1', '$argon2id$v=19$m=19456,t=2,p=1$ct0zPP2db8f893h6Vvw/8w$0dyjcxZJeVzuU3AMimROpGBmKZdAEcdqQSVxnUqbJJk', 'cmmi2580z0003m6flu0m70rqz'),
('cms417upy00c1bsj0m19n9lfb', '$argon2id$v=19$m=19456,t=2,p=1$RuXyE3Qf7T4Q0bcBFVxJog$AtJ5UIxTq3mQRH+e+PtOYfKZyHylBovtIb6i0n9wjLw', 'cmazlnzis009tvp4sf6u4waey'),
('cms417uqw00c2bsj03y2e8dkh', '$argon2id$v=19$m=19456,t=2,p=1$PgA+N8gtA3UO0TvhWhPeEQ$LBLAlr8zATLdAG3Ma9ZBLTd4TRG3sG5tLCDpSyb67s0', 'cmazlnyji002rvp4sx595i37p'),
('cms417urw00c3bsj0ys17c1jd', '$argon2id$v=19$m=19456,t=2,p=1$dKQvSIl5jbqa+H9SV22xnw$miUsu8Ofle0n/WzNBYFZJQYh34VxvCjXjLYnvR5D3oU', 'cmhra2crt0013m68r3nfl6nnk'),
('cms417usz00c4bsj0rkn1q418', '$argon2id$v=19$m=19456,t=2,p=1$UNPpB7and080qHeEke6Faw$fwzmQ6CJMVU99RiJXbHzbaakiYeh3iQqcjwALEnPUtQ', 'cmazlnzoc00azvp4sitxshb7s'),
('cms417utv00c5bsj0683ttvcn', '$argon2id$v=19$m=19456,t=2,p=1$A9yNRWKiFq24siOAzVZa8Q$6X/XdY3zg9XC8gDnpIvQ+c6OmxZuwrbOj93bqdCt8W8', 'cmazlo0cm00g5vp4sci6fpjq7'),
('cms417uuu00c6bsj0b45n4kt3', '$argon2id$v=19$m=19456,t=2,p=1$0N2kKKBpYCDEGvsPMXKyhg$L+9y196yr/Kb7QW1z6rWGAwd9xG7gwz4ykYx5gP/LWc', 'cmduawrbq0008m6ozm29yfsga'),
('cms417uvu00c7bsj00mwv8g0z', '$argon2id$v=19$m=19456,t=2,p=1$QpdgeuLqszmTHBMFSLjHDQ$JfBnXrYp8M/s/jI7IlH7vM5D7c5bEWyVejeyltbuxSc', 'cmazlnz3n006rvp4szhk7m5k7'),
('cms417uwt00c8bsj0j4tbeg7g', '$argon2id$v=19$m=19456,t=2,p=1$eGL7B3vkeryXG/DITOymAw$gnzmpB0IUzMxRW2fCsC5FvGzkwOsOndusHqLsNdgoSM', 'cml3tz4540048m6h0trskzkx3'),
('cms417uxx00c9bsj0ymxn9556', '$argon2id$v=19$m=19456,t=2,p=1$/N8kPX8j/boELv0KaeVsXg$sIX9mMWz9Tvag5QJU44A22eOdO+BwqM3IvgnzjoQi2A', 'cmazlo0cu00g7vp4sfn4s6j8t'),
('cms417uyz00cabsj0nn52yfqq', '$argon2id$v=19$m=19456,t=2,p=1$9ldYBPUSfvIxFgaDXu8ULg$RGghaZ45eWs+qH0eBZRDE9WPq8pMpGS2lJdv9yzfcyI', 'cmpupaccz00hzm6chdksdzegw'),
('cms417uzw00cbbsj0cujs8y3g', '$argon2id$v=19$m=19456,t=2,p=1$Qn/FYxqidIfnpRjIpPVZXA$rP5ZJcZj4avcl/jYnWPWRfmVmi5q8grN2JjS73e5vm4', 'cmazlnyak000xvp4sc6sq8mtw'),
('cms417v0v00ccbsj04g72ht4k', '$argon2id$v=19$m=19456,t=2,p=1$HPFgj9Qs5EDvZ17Cnuvj0w$kRTrSUnp2UYz5Q1sLXLRq4tA1JAPU4YwcrEUgRvbZss', 'cmazlnzv100chvp4sgqpf10wj'),
('cms417v1t00cdbsj0qu4zmhcu', '$argon2id$v=19$m=19456,t=2,p=1$mZ0V9pFuRWtwckUdI8PNCg$RpWsVb9tXx21pRTAcUFj6XnDvzGDJw9iYCC2ywrU7mk', 'cmazlnyjr002tvp4scysdpv1k'),
('cms417v2q00cebsj0dnku012q', '$argon2id$v=19$m=19456,t=2,p=1$tDD6ouBca/63EFJBrBlgyw$Iyaz5E7hF4BcMfeuUV3F2mNoNl1eUn7s9pPlT5AtMQ0', 'cmhr9u7wb000nm68remncynar'),
('cms417v3t00cfbsj0n89nl175', '$argon2id$v=19$m=19456,t=2,p=1$EFqvy8L5JvTOmR3IiClhtw$Sgc1BnuWSUan2l2toGu/NdY6t5eFdbv0O7VjaSTJV+s', 'cmazlnyvn0059vp4smjh2fczj'),
('cms417v4x00cgbsj0c8z0fci0', '$argon2id$v=19$m=19456,t=2,p=1$miG/r3jHEn08LgkGIyvd7Q$dmBSo2akSFd49QknMywwHKYMhEHVfZ1Uhj0f0AWpSWM', 'cmazlny6i0003vp4s3btih3z9'),
('cms417v5x00chbsj0eahi7gyx', '$argon2id$v=19$m=19456,t=2,p=1$B4a6FDiYDPH3pRHLsZrs/A$QvV7h8qGJifycl+8BmikESI4QzLrPUEYFq4NtyxnIsc', 'cmfrvhfey00bkm685wsnyr2fm'),
('cms417v6v00cibsj013ds0ql5', '$argon2id$v=19$m=19456,t=2,p=1$hkICC0VgUoKbGixSDy/bMg$asiaaUj2TkBjtXwkbLf39q4Uh+GfV4lmJwJy4Bfjk+M', 'cmmugrrq80089m60j90ssevff'),
('cms417v7s00cjbsj04qj7hd3r', '$argon2id$v=19$m=19456,t=2,p=1$DCD+TeulkgyeemDWXZc3jQ$eNKUvWF+g867FUa7Zwpa3D5M6vhYPbW+GAOxNAIw2QQ', 'cmazlo02600dzvp4sm3knlh5u'),
('cms417v8r00ckbsj0t1t7c4yo', '$argon2id$v=19$m=19456,t=2,p=1$A7bmmN5ljgDAAY0ojsebng$PTPNMGEVqA4vnJPkwzRJfH7lv695JsNkmET8CHHtU7o', 'cmazlo03r00ebvp4sqqxh4whr'),
('cms417v9q00clbsj0pcfz4tzn', '$argon2id$v=19$m=19456,t=2,p=1$NDPiLeMkS2E8WfsL1xtXpQ$csSC9s+5dPV+PxUHPi8vf8IK4mOR/fq6152pFiUQ0dw', 'cmazlnyez001tvp4sj0ex9ph3'),
('cms417vav00cmbsj09h8265s2', '$argon2id$v=19$m=19456,t=2,p=1$oyHNzUOsVjXf5E9bjeitDw$Xu/xt0aWH7y7Lp05jEZZukux1HGd4Sj0GnttNGTp9k0', 'cmazlo0d300g9vp4s4gt2p46y'),
('cms417vbt00cnbsj0dykjhkdf', '$argon2id$v=19$m=19456,t=2,p=1$lLxuc5M8zA9iV4Y1wOg01w$yCdoNbwb66X71AqSTSEfxhj+EiAmU3xLx0u3mbGsEF4', 'cmazlnzss00bzvp4sdq6on6ei'),
('cms417vcq00cobsj0ftgf6r8u', '$argon2id$v=19$m=19456,t=2,p=1$RTjjMoF4UGQOaXk3AukJhw$XTOPJqLJyHf4F9dQrUCcBL+s1rjcmXNjjvQdlYSGIF8', 'cmazlny6s0005vp4s9mog73e8'),
('cms417vdo00cpbsj0aynd95o7', '$argon2id$v=19$m=19456,t=2,p=1$eiw7xZOjwQuXnlCMfhQFLQ$J8+hpxgGCX0U2q4CPAfqiZc72dZDCXj9pKBOJZGPhpI', 'cmazlnz050061vp4sn89klswv'),
('cms417vel00cqbsj03trwswy0', '$argon2id$v=19$m=19456,t=2,p=1$/iwd4WEfifbKcqNV+AVvFg$y4ZFTWUzdbtH2JGPz6Ael5ZxE+U6lZzaWT8ARDIPBD8', 'cmazlo0dc00gbvp4s0p0foyvg'),
('cms417vfl00crbsj0w7fwq3rn', '$argon2id$v=19$m=19456,t=2,p=1$QNEOzhjFi3gRnuq/I9i9yA$eHvAf9dJJYw/3WzhBuzveaJ2gnwdvznThzxYJFJQ79I', 'cmazlo04000edvp4sph4onykb'),
('cms417vgo00csbsj0x712driq', '$argon2id$v=19$m=19456,t=2,p=1$QiK7mC0i5x2pr+ahvYQpzA$WN5aqLsJ/UZ3VCk/VG6vp7oWWpcfHltd1+LfnahKPa8', 'cmazlnz9k0081vp4sjkcbt13y'),
('cms417vhn00ctbsj0t8qw2z5b', '$argon2id$v=19$m=19456,t=2,p=1$A+yzwJBcdIXmETo8xxnGuA$3VJnwiGb37w5gPhkPw85FZDSOqYtIbVlZ6WbfpahKCg', 'cmazlnz5g0075vp4s7y0esbuu'),
('cms417vio00cubsj0izjymq8o', '$argon2id$v=19$m=19456,t=2,p=1$u1H28/B41eAil63aFK3h/A$tWcS22gaBEWg2IeBgsPlelw9KxaPLbLrshacFCrQWLA', 'cmazlnzj1009vvp4skuc6noyp'),
('cms417vjm00cvbsj0h2udnp0q', '$argon2id$v=19$m=19456,t=2,p=1$mteS/qawKMsAD84iMWzRsQ$ctsQZIEu6yEK8dEODTqoK/88nBZVurE/nknaxP7ZRFM', 'cmazlo0yo00ktvp4s7vd5l35f'),
('cms417vkk00cwbsj0pxjwohax', '$argon2id$v=19$m=19456,t=2,p=1$tFFu+M15twCK1kS6fioIiA$PQCdVfqR/GSiyA2v/IYLO+Mgb5tFMijfOUaP5y75fGQ', 'cmazlnz9u0083vp4s1qv7at71'),
('cms417vlj00cxbsj0mthsgo2p', '$argon2id$v=19$m=19456,t=2,p=1$VdgEF+MAqHvT2NFGcEy9/Q$02r8lTuEtdg7rvmBfYfQ+a6amsHYBBgJPAdKdf/AaOs', 'cmpwqahx000ium6ch9nq7fw5j'),
('cms417vmm00cybsj08akp6bgw', '$argon2id$v=19$m=19456,t=2,p=1$rvDWFaXsQfBOEUVVv6JZGg$5Ty+eHyLAItIcNyY4409asYjSvju1NHA98kIIKwv7jI', 'cmazlo0s300jdvp4sbpi420ac'),
('cms417vnk00czbsj0r5qg6fuz', '$argon2id$v=19$m=19456,t=2,p=1$LEquRwWbEi5XNufNjawxnQ$pxC7qfX7I9ynnESV0dgb3c4l22zmvtgeIn7wiTLy4VA', 'cmazlnzkw00a9vp4sh4yjeq03'),
('cms417voh00d0bsj0pq54sy51', '$argon2id$v=19$m=19456,t=2,p=1$movUnus4M+JK5DKc7qYWSw$fIPK/Agv73nyMVxqk0Ab2T3NfT0Svc6ErKoCOMsizkI', 'cmocpcjj4000km6ch6ii8te9z'),
('cms417vpe00d1bsj0q7i4ya1m', '$argon2id$v=19$m=19456,t=2,p=1$oQMuSkC1sDXAcA+rILi2qQ$1F+eUxpEE0dlCFHy6N0KZaaW9mf0+1pJsAqKs+EqF54', 'cmazlnyau000zvp4s9vhw9qez'),
('cms417vqc00d2bsj0c4tvxlyl', '$argon2id$v=19$m=19456,t=2,p=1$+i32QQAa7misvSIo1jnc0g$kTb6KJNezMR2j+5kz5+8oDiCv5+Lrofcy0y1NnCoEOc', 'cmr330tyw001hm6wnuhgpemsw'),
('cms417vra00d3bsj0entiu59m', '$argon2id$v=19$m=19456,t=2,p=1$QYuDXjhrGBwPwDiCxFvUxw$MX/zxXHE1fzX9DbXI4QE2ZiJJoVV/m3SVskTWRFgG0s', 'cmazlnyvv005bvp4s8emwi62c'),
('cms417vse00d4bsj0w6mk99bt', '$argon2id$v=19$m=19456,t=2,p=1$thjfpq/enk1MYx9mfIitdQ$vxzE26Msp9qyuvU9vhwZzm68xUYY69qVmyJmRhULPu4', 'cmlrn8l5i00j8m6h05wwzu2az'),
('cms417vtd00d5bsj09sva76yh', '$argon2id$v=19$m=19456,t=2,p=1$XX5iS3T1U7EEMfHDbl0Wew$8Saq81s3Ou0cKy6B5dwT+sdW4Dd8ab/ucFagnBU55/k', 'cmrhmukkb0003m6ucsswbrxn0'),
('cms417vub00d6bsj0mklb3rn4', '$argon2id$v=19$m=19456,t=2,p=1$6HrlhcBe/3aEW2Nor9lIJA$j6DEF3iTReE13+JHss8pV9jcSUYdlfccT2lCY1gIpKo', 'cmdskklgz0017m6tpd30sa11g'),
('cms417vva00d7bsj08jrogn64', '$argon2id$v=19$m=19456,t=2,p=1$5P6FQ8chgYhcinaEex2WeA$hGF8GQVcOHYtf1yR4c7kIad2UZbPp94pO499PyDiTO0', 'cmf2g8u93000wm6remkf8h323'),
('cms417vw800d8bsj0r66z8fvb', '$argon2id$v=19$m=19456,t=2,p=1$XRpmbdytU+vn089NYzsykA$9GhcRUzhYNRdC4iMXHfERZCwsoCkYwzeT+3NOI05Q0Y', 'cmazlo0sc00jfvp4skygdbgpk'),
('cms417vx500d9bsj0txpfkkqe', '$argon2id$v=19$m=19456,t=2,p=1$V55g2NUGB4Mqesswh3QC2Q$rUB9aHl/D+pXHihw/2XsHeqoWcVZYA8VvdkTONUkmxg', 'cmraif4660002m65jkttsxux6'),
('cms417vyb00dabsj0gdzu9ugq', '$argon2id$v=19$m=19456,t=2,p=1$0OT4eHRr+z9aGRSq3Z+J2w$lAjyOPHlW/vjSKGBy1uyHEk//uyaUbnxVB2jd7lxxnU', 'cmiq3xjc6001ym64d2l2bsubb'),
('cms417vzb00dbbsj0srzdeqyy', '$argon2id$v=19$m=19456,t=2,p=1$TfPbp03jQ4spzVXZQTLP8w$T85wKyKpb56VkUxP0lYkL81sVSJI6Ds7/VICgM5uiXY', 'cmazlo0sm00jhvp4saijuzlvf'),
('cms417w0a00dcbsj083f3r8s8', '$argon2id$v=19$m=19456,t=2,p=1$J8yTTeEdFNm/9nD8s22BEw$lZC9ZFW90oAR/QQ2AyhcofWHxf6jG6qdSm+HfBYiBIs', 'cmazlny730007vp4swrdys70m'),
('cms417w1b00ddbsj0pe0x2jc5', '$argon2id$v=19$m=19456,t=2,p=1$15VQCwKjvqum8kRwSOYnHQ$GnEoazNtR3Wja+d9z/7Tj9fZOBiNcE4FwKAj2ohxv30', 'cmazlnyw4005dvp4sn5o1abjh'),
('cms417w2900debsj07uj5mgmi', '$argon2id$v=19$m=19456,t=2,p=1$L6VU9BEKEJDWXqBdM1UKuA$6nTE0pruRlietQ1k+tzd0g7y2wm24yKh9Bz2olWqEDw', 'cmazlo0dk00gdvp4sxjv1iep6'),
('cms417w3c00dfbsj0rxexpufl', '$argon2id$v=19$m=19456,t=2,p=1$rsjgnXJUsWs23RJ/kcDRiw$uo8Gf73mdfRfiTlAtC7bR+GZlBQ8/oKLLurTmTMpuWg', 'cmazlnzt200c1vp4suwjlkzd3'),
('cms417w4b00dgbsj0k09qxatb', '$argon2id$v=19$m=19456,t=2,p=1$klMckIvQWsLX3XcxiC6VNw$6OyJ9GBR9rbNBTbaovL2ZS80UkwTMQgMFwV6ZcuEY8I', 'cmpuy5kg200i7m6chv6fdo2zg'),
('cms417w5800dhbsj0ozgso55k', '$argon2id$v=19$m=19456,t=2,p=1$L3uyEWCAlvf1Wtx+gq2HCw$+hgPgstwVphSS+Cb7/K+8ECCaqjGj/tj7s05JtA6+Rs', 'cmov9e1tl005am6chdjj8j0og'),
('cms417w6500dibsj0ipyu3ip6', '$argon2id$v=19$m=19456,t=2,p=1$ss/pFLbuNNqErwdRmT0teg$skfcQndJpnrGQEPE3b+pdYl7SVznWoRBTdS25jZnykQ', 'cmazlnza30085vp4sueee137r'),
('cms417w7200djbsj0idg8gng0', '$argon2id$v=19$m=19456,t=2,p=1$ayc2lR5KVbPdGrzvF7BBsQ$zxHNObuoN+diTIhxs/aNgLGyDI9J0ocXsgU5e7p2QYo', 'cmazlo0su00jjvp4sh6ointrm'),
('cms417w8100dkbsj0bkty27st', '$argon2id$v=19$m=19456,t=2,p=1$K69AWpm9dSjXBi8U7X//gA$cxiPCGCto8+RXwBIJ5Mp8eSD8+IgrNQ30OyNvFOLovQ', 'cmazlnzva00cjvp4sjdg2s4dv'),
('cms417w9700dlbsj0bcgdcooy', '$argon2id$v=19$m=19456,t=2,p=1$uK+LkYfGga5n7Bc3JsAbaA$kjHtSiywn9b+URIn5yIs9j9UiSFf8v+rTT8QdYI1PIo', 'cmazlo0t300jlvp4s1vjfs3fq'),
('cms417wa300dmbsj0jka0o23q', '$argon2id$v=19$m=19456,t=2,p=1$KI2iBu8EwSBdYzilDSVniQ$ot0yRBGXOCzH07YFlm/4QIhmXKpc4WegHvA947RDLNg', 'cmazlnyb40011vp4spkhub97k'),
('cms417wb300dnbsj02z7nrmi5', '$argon2id$v=19$m=19456,t=2,p=1$Yn3KXIgh5iKYoMJDjAVceQ$/JweJEBhmdf/EwVG9Ca59jW1NLC2mk/7VMkUoekvIxg', 'cmazlo1c600nhvp4sbe0it2gn'),
('cms417wc000dobsj0sdif1uq9', '$argon2id$v=19$m=19456,t=2,p=1$FsVCN5DYyDtUMYzh3It2QA$IfeIRT9Hk5/+zhRYzAtjXPi0LTpu2vbnH2RH3x9L88E', 'cmazlo0tc00jnvp4s17fhxn5p'),
('cms417wcw00dpbsj06ql1f05v', '$argon2id$v=19$m=19456,t=2,p=1$RTBhzXCnoqgchzQ8SdAU1w$bzRNY3OggMknGcppf2/gLcs6Yt+fp8I+pPkb5p5Z5bs', 'cmazlo17n00mjvp4s00w54slg'),
('cms417wdu00dqbsj04txccij2', '$argon2id$v=19$m=19456,t=2,p=1$sHFOq3xNTPp6cDTs99r/KQ$MT3o5jJKaxZGgsSFvd7hSTGSS3JVqI4mNVgkASQRz94', 'cmazlo17w00mlvp4sgvle6qcg'),
('cms417wey00drbsj0y2a68oan', '$argon2id$v=19$m=19456,t=2,p=1$sLjeF6Fz0MLwgdvC60X3Og$XUhG6YB5fnfZ8GtuFqh/m7hXFgxAv53k5JPJHzV0nIE', 'cmne4bsdo0097m60jhyixosm5'),
('cms417wfw00dsbsj09civytja', '$argon2id$v=19$m=19456,t=2,p=1$0vaNZjzIFJh0+ZDSxU5Kzw$ZtvRy9PqLT1h2Qj09O278HES79br/QotSDSC2MOr93s', 'cmk5kl5pe0002m65v8zqul0ja'),
('cms417wh200dtbsj0ojjckjxk', '$argon2id$v=19$m=19456,t=2,p=1$REaqMFzXy/jTtcH9+LEEeA$cC9a0M9Fg7Ohz4A6J9wHTLWLE0Ym6+qXGQcByKNiL1I', 'cmazlnzac0087vp4srua8durx'),
('cms417wi700dubsj0n9tka89c', '$argon2id$v=19$m=19456,t=2,p=1$OU5y6e+z9bo6yIZz7Xqr+g$+uDrfkqJxWw3uVqYhxeSuLxWjN5FlUjFRZjrIv7xZwc', 'cmazlny7c0009vp4svqhixj0j'),
('cms417wjd00dvbsj0nrj0n2zz', '$argon2id$v=19$m=19456,t=2,p=1$z2QWapO7olPVR9KZ8uG54Q$Yb2OQxru17b0RSAhaNxCXYsoFrwGsnR8v3Oy08N+KmY', 'cmptlyfrq00hmm6chf0cynmdi'),
('cms417wkz00dwbsj0xzzmumts', '$argon2id$v=19$m=19456,t=2,p=1$eEcX88hXi1LnhWj6fdm84A$JjuXzfhlmgjZwK1+fRoYlR+xBXudPh+7Xg1/9cSm/Ek', 'cmazlnylc0035vp4s9hnfxep6'),
('cms417wly00dxbsj0st28x3wn', '$argon2id$v=19$m=19456,t=2,p=1$EzW1SwBCmjO56uT+Ml2QjA$iph9yv9XPHJYD6V+7E5TCxTCmWvugaon0YdlqJKrDhA', 'cmazlo0tm00jpvp4sgmsdi4vh'),
('cms417wmw00dybsj0w8mohmg7', '$argon2id$v=19$m=19456,t=2,p=1$XXtM5iDtWxUVfTUMXtraFw$apOyJXLpVRE4k83M6nahMzXyzMQA7LdoVURSNkSI3Ps', 'cmikcewn10004m64dbr7t88sx'),
('cms417wo600dzbsj0rprxc15v', '$argon2id$v=19$m=19456,t=2,p=1$PbKI8gyb4kD4iNgEkcJ8ng$UjkjNYs63OJxvT7syL7xdXTQ5D5h71dClIRJpNCgU50', 'cmazlo18600mnvp4snc2j9lkr'),
('cms417wpp00e0bsj0g5potwem', '$argon2id$v=19$m=19456,t=2,p=1$fo/QJdYKsbdZtGXL7maNTw$hKeuhqkRwR2IRfh07aTRNaXMB2ezT2tGVMDeOGRFrzc', 'cmazlnymy003hvp4slrp0vr69'),
('cms417wqv00e1bsj05m6mkj0m', '$argon2id$v=19$m=19456,t=2,p=1$F7mY3Kj6bpzedOrR7B6wNg$9PU6VN8BhEk4C56GA0MwXbDfNttMcnT/7V9AMqzHbSQ', 'cmazlnyln0037vp4s61z60ija'),
('cms417wrs00e2bsj0qrz3gmtb', '$argon2id$v=19$m=19456,t=2,p=1$R921HJAz3Z8JJOCDfGmDow$dNNfBuUZ0zMVnmJ0hg/4ox4AZCQq+H90M8CMueVt0Xs', 'cmazlo18g00mpvp4sy7ww61tr'),
('cms417wsq00e3bsj0hltugm4g', '$argon2id$v=19$m=19456,t=2,p=1$w+xz/7782VJ6LyJbqlV0MQ$u3ORS/wIB3tj+nrsL9WA3RFtKo8IONVYn9BM/r+gYvE', 'cmazlnzou00b3vp4sdbdqh4e2'),
('cms417wtp00e4bsj0vrecjzbp', '$argon2id$v=19$m=19456,t=2,p=1$gql/BMLEc59rolj63f9TGQ$/Vo5UU+xsq3Osl+QAnhjf3ScUund7EeB7V8QRKs3BMY', 'cmazlnzol00b1vp4sjia3nsz2'),
('cms417wuu00e5bsj03a6vry36', '$argon2id$v=19$m=19456,t=2,p=1$TDJ+a0gq/Dm3Mpk8HnUsXg$eUsSaQS8sFGHtHyhzcm7J0wV4YOoJKPvOmugMrY849w', 'cmbj8rzux002gm67qn73zqak5'),
('cms417wvs00e6bsj0x7ptje3t', '$argon2id$v=19$m=19456,t=2,p=1$YOPV0oa780ug87fLrcZAzQ$rXo9WbazZtqBcGW8QvG+BQREv6PHk46iYLqFdZp9J5g', 'cmazlo0tv00jrvp4seqo9giko'),
('cms417wwu00e7bsj0r1qlvtdz', '$argon2id$v=19$m=19456,t=2,p=1$Rj43wN1VVzdKXCb0ovWwUg$NzQXOzHlNhxGydu2pj1XpanvXEYBOhlFZDa6KHgzaq8', 'cmazlo0ww00kfvp4srjep2kty'),
('cms417wxs00e8bsj0v202m0lq', '$argon2id$v=19$m=19456,t=2,p=1$CqSCh44S9r1vN1DV3/Ol6A$9boZz9srkklC2vkx/P2iX4zHBrPDW5kTcm+Z/ZjegPM', 'cmazlo1d600npvp4s4mq05f4d'),
('cms417wyq00e9bsj03maedgy8', '$argon2id$v=19$m=19456,t=2,p=1$VpVBYY7wP+0Dar9p73/3nA$jF5nklUFlsZMwHuFUYJzVJq4Owj0jcNFUTgNfVF/G14', 'cmazlnylx0039vp4snyr3dvlk'),
('cms417wzu00eabsj00t96kkbe', '$argon2id$v=19$m=19456,t=2,p=1$k8RvwBPSHRzeyqaGYGObrw$ny0miyup2uKC/YihK+5a6ACWLIWHIne+0RJEdTPu5VE', 'cmazlnym7003bvp4ss7eqvjt9'),
('cms417x0s00ebbsj0dqz271rj', '$argon2id$v=19$m=19456,t=2,p=1$163XuH22IFt9XHF5/dIIlg$5zDt3pfh9pIpVRJKUbC2RY4PH6yIfx+zM3f3JrhkUqw', 'cmlcd3vrp0001m6xq2uqyoo1i'),
('cms417x1q00ecbsj0zdoxmsta', '$argon2id$v=19$m=19456,t=2,p=1$LZcPOhAcacC7dJtGyiCq7Q$QvsyUUEc3cACX5O6Lq+h4ZHTLSLlmGCrRo0g6kOOMIQ', 'cmjy4iihh001nm6wr32u3lmwi'),
('cms417x2r00edbsj011kjnf61', '$argon2id$v=19$m=19456,t=2,p=1$njWKR9Q8j2l6oqqBPvUTBw$pq++2C4X97Kp8Kakxa0Zk+yDzte2viQixH9XLnvqRWM', 'cmazlnzjd009xvp4sae1ylqio'),
('cms417x3p00eebsj08t6eg01m', '$argon2id$v=19$m=19456,t=2,p=1$Dnx1WrAjW73a/GlbMgcVng$EzeCPMbEHhoaN/c2qGBlxMkKDLaQdiPnuoh6Up4HzuI', 'cmazlnywd005fvp4s2wgstub2'),
('cms417x4o00efbsj0k2m6vwd4', '$argon2id$v=19$m=19456,t=2,p=1$v3tTm+0YCJICF3yeX8sksg$DCYSqKfPaYrisP/wYXP5dMwsy0JoTSUihMrX+R3Ufxg', 'cmazlnymg003dvp4s6nl6wy76'),
('cms417x5s00egbsj0ae4y29y3', '$argon2id$v=19$m=19456,t=2,p=1$pNRwi5SU9zgnAJ2GtoEXUA$62V0bIyAzT52vlHPOhgBNlA/L89RMXLvzoeBaEAo9AA', 'cmazlo0u400jtvp4so62p2jo2'),
('cms417x6p00ehbsj0l23ch8my', '$argon2id$v=19$m=19456,t=2,p=1$oHuLwt0mYEDHbWJuBfveag$KrkVUbHNY4nP5d8h4ua3EzDT0KI/HSCHte85vvCSHyQ', 'cmazlnzak0089vp4snx6vcqxq'),
('cms417x7m00eibsj018my01qb', '$argon2id$v=19$m=19456,t=2,p=1$542gfh3EfWmz71OQ0RkvQQ$ZHkLrk1Y/h/PhjTM/Kxdlx26u2XGBz61tKNWACdV/VQ', 'cmm8tjzav00l3m6h0peeyrev8'),
('cms417x8k00ejbsj0hkkkntl6', '$argon2id$v=19$m=19456,t=2,p=1$E5BqykgjNDl+RtO3k4U8FQ$YM3upWPjcm1ISAIqExnYehiBFZifC28hfcSrkQNtQmg', 'cmezbn5ey0006m65hbsgrv3sw'),
('cms417x9i00ekbsj0yxat466m', '$argon2id$v=19$m=19456,t=2,p=1$6rONJ2MHvHJ587A8CAVS9Q$w07Fnykd/sElpasWkAG+q10yUTHINr1fevbza4JlTks', 'cmazlo0uc00jvvp4s0hczqo35'),
('cms417xag00elbsj0bldwoifz', '$argon2id$v=19$m=19456,t=2,p=1$474NNxE7akEpvkUUxQq4kA$1KBQZ8UxvXqzaFWtAEn8JP67SMTMPUpzcsgCVrzHPTI', 'cmazlo0ul00jxvp4s05of8n3f'),
('cms417xbl00embsj0vcb33333', '$argon2id$v=19$m=19456,t=2,p=1$9SpAFaUMe7U5dq/Xk6KWUw$zTe9QMPGwE8RAAyjIhZ+y6HZ+5ngOip9AQdDvqlFzRA', 'cmazlnzp300b5vp4sm9seywzz'),
('cms417xci00enbsj0v08g0y1l', '$argon2id$v=19$m=19456,t=2,p=1$4T1sefjX/JnV8nEjX8D1RA$tnwdFZH7qCbLMl92t/wnU6O8mkYMARQ6zb71XrYqn8Q', 'cmrkhx15m0025m6ucpas7u8xx'),
('cms417xdg00eobsj0l782zw5v', '$argon2id$v=19$m=19456,t=2,p=1$mXDUzS0MAvDZOzPWkzgPjA$JNOlcK3CvMWSN+v4SEkMt9OtAD68IYps+x2xq855nlg', 'cmazlo18o00mrvp4svep09pyq'),
('cms417xeh00epbsj067kpkr3t', '$argon2id$v=19$m=19456,t=2,p=1$XCwqSN6YpsTAt4MG3sSW6A$YncsPdL5DX1YvEefFVjEdntGrbzMn2W2IUaNU7Ydg+g', 'cmfhvph7t00afm685i4oodoll'),
('cms417xfe00eqbsj0u3kmu9of', '$argon2id$v=19$m=19456,t=2,p=1$1BJSZaye7ahRSUElrTu/jA$X9zryVdhHXzD4knTiZivgXX+bfj5PpaF7T2OOZADNEU', 'cmazlo0dt00gfvp4sg0jv8bmy'),
('cms417xgi00erbsj02lsfk83w', '$argon2id$v=19$m=19456,t=2,p=1$IIiBtyRnJuGruyUb4AGDzQ$iyf2cFWrHARHNNkWF2NgEHKj3oCgSF4HsXAqPlydOKc', 'cmj11otg3008tm6zp77613ba2'),
('cms417xhq00esbsj0g3tiyqon', '$argon2id$v=19$m=19456,t=2,p=1$BoQy/dJMzC3k+jkKHOpGTg$XQEMhlfm4C4NSF/gJkROc/wo2NOSD8QdMnTv+DhGtzc', 'cmk578gki0000m65v5imxfb75'),
('cms417xip00etbsj0r762wqn9', '$argon2id$v=19$m=19456,t=2,p=1$kBULZtHqcqFVg8AEmRaA+A$vbiFJOk9vrqKUtoVmP+E5XMzEmgPlmP2kopkzCwm2Q8', 'cmazlnz3w006tvp4s2iwf3qf8'),
('cms417xjm00eubsj030hxsq5h', '$argon2id$v=19$m=19456,t=2,p=1$8och3yaezK2YZrmCFhfJ1Q$+kRQa64bt1uBau8W/cqKdDo1B5/9sjGnAc7GzWe7Cxk', 'cmazlo0uu00jzvp4sv0f9oomp'),
('cms417xkl00evbsj0wqse9d0b', '$argon2id$v=19$m=19456,t=2,p=1$WxEe/0MxFSvTZcakx1IL6Q$Z+4EL8fy1VRGl9hayVHhcpW83dIWivGPYAwVpCBrOu0', 'cmazlo0v300k1vp4s50fvp1ib'),
('cms417xlm00ewbsj0xxg1l319', '$argon2id$v=19$m=19456,t=2,p=1$pIH8sgGDt2ywT1owNm3tHw$7T5U1j2VAQfDH3UB5JbZQl6BDvp85iuFbamRl24B6VA', 'cmazlo0e200ghvp4sjl5s3sgc'),
('cms417xmt00exbsj0c1jpisu1', '$argon2id$v=19$m=19456,t=2,p=1$keDauIAZm2K7EsTZJ7+F6A$8gK26myai2LRDNuSRukgccOfndieipXpdju8rfeR17I', 'cmazlo0x500khvp4ssta17mqm'),
('cms417xnq00eybsj00ogypz1p', '$argon2id$v=19$m=19456,t=2,p=1$+Am/+a3zLmxrfNByNYMN9g$iEJ1IgE9YaFdd8NPTIBu1oEgmgAad+Faa/k/M2eQMdw', 'cmazlnz0f0063vp4sn5yrltxp'),
('cms417xop00ezbsj0psn8lo2f', '$argon2id$v=19$m=19456,t=2,p=1$enZs124HnSmYlRsQR47aZA$PLlxVcpx9M8zGj9FguQNWN/SBY6uapZsFygHcnkmK0g', 'cmazlnz45006vvp4sofqjnfx9'),
('cms417xpm00f0bsj0k0am3e4c', '$argon2id$v=19$m=19456,t=2,p=1$yC7O9nHeiED7RAvUnTboLw$hfXJ9iFmDMV+P/b1xcesj91qH5Zwxp9sqcY8HAs845o', 'cmazlny7m000bvp4sa5bofpk3'),
('cms417xqj00f1bsj0glnticju', '$argon2id$v=19$m=19456,t=2,p=1$aSvbHxKm4uoahe+ncABaug$xioR74xZ5wGPBLUyFF2MNW8sZcCyXhSekU2ryTmJzPU', 'cmazlo18y00mtvp4shgdtn2gf'),
('cms417xri00f2bsj0vbg1rskn', '$argon2id$v=19$m=19456,t=2,p=1$1ualh1UAjM6sWJKieFKcnA$MvUU8aDZdAIWWa/QZreJ0gbU/3Ge7GccAlvhtsRr4zk', 'cmazlo02f00e1vp4spifezblt'),
('cms417xso00f3bsj0ie7cbbjq', '$argon2id$v=19$m=19456,t=2,p=1$n5dJz+r7mJFEdyWBIE8pdg$p4lw1jGVJaBxpxB75yTSQuiNovJFJKVt9d7oW3qxtVQ', 'cmazlo0vc00k3vp4skq0r953c'),
('cms417xtn00f4bsj0sb1sw6tj', '$argon2id$v=19$m=19456,t=2,p=1$AAeQBoXON+6Nmn0TM69RnA$oonxbf8fOHKMU73H0WUQnfvpiGTvGRFu+Iu0ooOtHlY', 'cmr3io0o3001vm6wnrqihiyyk'),
('cms417xun00f5bsj0t3ya9nh2', '$argon2id$v=19$m=19456,t=2,p=1$0MMzgC6BarHUmH2o2Xxm3w$JdQr3xxSO7llOHBlrzffKgGC5njbiTN1zmTUeGsHhVU', 'cmazlo0ec00gjvp4st8dgrau4'),
('cms417xvl00f6bsj06b1cn3p2', '$argon2id$v=19$m=19456,t=2,p=1$7Lqv12QT1l2D2Z+BoS1+ag$YkWYRtnifq1tAFvnBgU7q1z5BOJw5Y5+lnshmTKuLTE', 'cmazlnzjm009zvp4s232uff15'),
('cms417xwh00f7bsj0bmm4483d', '$argon2id$v=19$m=19456,t=2,p=1$QAPwg77onwRo5r0B6pGkcA$twGhnGMSwfF8DsDqgk/1EqF/RtLMOHuw74uxEGB0Hy4', 'cmazlo19900mvvp4s4vhuwzlc'),
('cms417xxg00f8bsj0ifc2tq44', '$argon2id$v=19$m=19456,t=2,p=1$4zSmkDPss5gre9qVhkbPWQ$R7KFg9OitT9+I8Vevyx/3V4XOtpMM4lKFDXdoEeiqpA', 'cmriy43bq001cm6ucauyknhzi'),
('cms417xyi00f9bsj0lra3tkkl', '$argon2id$v=19$m=19456,t=2,p=1$slbl2683r5lh8RmJ/C2zwA$PMbh7pT9xUxr7ErGQwlXwoQES5CKYnzDOlXeutpfeAI', 'cmlqbcgft00j2m6h0rwusndrx'),
('cms417xzg00fabsj0yzn3v6a8', '$argon2id$v=19$m=19456,t=2,p=1$MOPWRL6+sKEqiOIzpXgxrQ$XL/NKqn0LcoowfsPpQf0OQxCVmMQ8gRRC7BDLKuAook', 'cmazlnybe0013vp4sccldw0ih'),
('cms417y0d00fbbsj0ldw53oc4', '$argon2id$v=19$m=19456,t=2,p=1$vSSrfxf/jnchouoffiDN6Q$zFmBj4MYLZmBZ2paXoQsTiGGFef1aSqYSw42Dr/yrg0', 'cmazlo0vn00k5vp4sdwv3m1ym'),
('cms417y1b00fcbsj0uusnuy1g', '$argon2id$v=19$m=19456,t=2,p=1$AHow73bq5BjlNMwy0nM1DQ$VDZTqDLATe6n9WEnnr1a49qK1qR6tSHBOeOmxsFeAw4', 'cmazlnzjv00a1vp4sp1eseh2l'),
('cms417y2800fdbsj0jspey31t', '$argon2id$v=19$m=19456,t=2,p=1$niOawmQn8ezNisbNwQOqqQ$+XdrtBZ7N7KGVPxY//gh1vwbcmPIx3eYiiSlgo41vKY', 'cmazlo0vw00k7vp4sk5uqtebf'),
('cms417y3a00febsj05ywz9e3h', '$argon2id$v=19$m=19456,t=2,p=1$yWRaDbNmmEXR9o8lS7TVtA$6xzNM/FjxgJVGyjKNHzto+cI8apSqpx0yByayueEgCQ', 'cmazlo0w500k9vp4spxlgwbtt'),
('cms417y4i00ffbsj04i36t80q', '$argon2id$v=19$m=19456,t=2,p=1$au4CYCCdX7172ywmzbJGqA$IRhwAGUujeo46UkYBmJDuDB0LiiZZNnhG6H7OP6US0s', 'cmazlo0wf00kbvp4s6l3mhx6l'),
('cms417y5j00fgbsj06nk8geim', '$argon2id$v=19$m=19456,t=2,p=1$RcF5O39wWSGxN6THvSQu3Q$i7a+vm2QmxkO8CXI5oU6lUHoBJhJh+cbiMNgNnuzJ/A', 'cmmt9negl007zm60j8mydvd81'),
('cms417y6i00fhbsj0q6qb8bgv', '$argon2id$v=19$m=19456,t=2,p=1$MrVi5D8k+M3xdaY4c4kgMg$TydtxEpN6aTDMFiFa1P/zKGqO+tX0Vn36nLmCgG6oI4', 'cmh35594q0003m6wz2jv9nfgc'),
('cms417y7g00fibsj0bedeajwz', '$argon2id$v=19$m=19456,t=2,p=1$nfOcIX5NNr33FtNrx7PPMg$4+zygfCxRx4glnhShTxl1fN/+v9jAYugDvrJshDiYxo', 'cmazlnywn005hvp4s3he19lt7'),
('cms417y8j00fjbsj0g953au67', '$argon2id$v=19$m=19456,t=2,p=1$dCtt2VdV9VNaNLIxNY6QeA$zAWS6UBgtPtRs7X2ZaKmJo53usbSEtufmKyF68jYvRg', 'cmazlnymq003fvp4se871gkrq'),
('cms417y9p00fkbsj0oqdd1534', '$argon2id$v=19$m=19456,t=2,p=1$TYjf3lFubaajySoBc6N2ZA$unsqddS8UzqNYdr3v3uoKN3gSvyLwNKj+kCVAx407hU', 'cmazlnyf9001vvp4son13ec01'),
('cms417yap00flbsj02jjsj5ma', '$argon2id$v=19$m=19456,t=2,p=1$GZT8yUz3liiTqjJz76rn0w$NQvY1Ce8c4f6U6XM22yUlTWHkPwIptR6wYMY0n890pE', 'cmazlo0wn00kdvp4sdkltayww');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `id` varchar(191) NOT NULL,
  `invoiceNumber` varchar(191) NOT NULL,
  `customerId` varchar(191) NOT NULL,
  `periode` datetime(3) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `diskon` double NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 0,
  `total` double NOT NULL,
  `status` enum('UNPAID','PARTIAL','PAID','EXPIRED','CANCELLED') NOT NULL DEFAULT 'UNPAID',
  `dueDate` datetime(3) NOT NULL,
  `paidAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `invoice`
--

INSERT INTO `invoice` (`id`, `invoiceNumber`, `customerId`, `periode`, `bulan`, `tahun`, `subtotal`, `diskon`, `pajak`, `total`, `status`, `dueDate`, `paidAt`, `createdAt`, `updatedAt`) VALUES
('cms2p2wlc0000jsj0yqmfetng', 'INV-202607-00001', 'cmazlnypp0041vp4shd4p8k67', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.824', '2026-07-27 03:56:13.824'),
('cms2p2wlq0001jsj0q7eckuk0', 'INV-202607-00002', 'cmazlnyri004fvp4s3ayt6gsg', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.839', '2026-07-27 03:56:13.839'),
('cms2p2wm80002jsj00vujvc5y', 'INV-202607-00003', 'cmazlnys2004jvp4sdtwyc9kl', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.856', '2026-07-27 03:56:13.856'),
('cms2p2wmi0003jsj0yue15j4c', 'INV-202607-00004', 'cmazlnyv40055vp4sw0cvtetx', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.866', '2026-07-27 03:56:13.866'),
('cms2p2wmu0004jsj0fsbjsl5t', 'INV-202607-00005', 'cmazlnyw4005dvp4sn5o1abjh', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.878', '2026-07-27 03:56:13.878'),
('cms2p2wn50005jsj0mqoixi5t', 'INV-202607-00006', 'cmazlnz5q0077vp4s973xbz7a', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.889', '2026-07-27 03:56:13.889'),
('cms2p2wnf0006jsj0pz6pboxp', 'INV-202607-00007', 'cmazlnz600079vp4szuaq1ovl', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.899', '2026-07-27 03:56:13.899'),
('cms2p2wnq0007jsj0km0cgidm', 'INV-202607-00008', 'cmazlnz69007bvp4sagqhvjzd', '2026-06-30 17:00:00.000', 7, 2026, 110000, 0, 0, 110000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.910', '2026-07-27 03:56:13.910'),
('cms2p2wnz0008jsj09zmxbvrx', 'INV-202607-00009', 'cmazlnzau008bvp4sjclrq1w9', '2026-06-30 17:00:00.000', 7, 2026, 220000, 0, 0, 220000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.919', '2026-07-27 03:56:13.919'),
('cms2p2woa0009jsj03lnvleqg', 'INV-202607-00010', 'cmazlnzb2008dvp4sspknsysy', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.930', '2026-07-27 03:56:13.930'),
('cms2p2wol000ajsj02ht6mhdw', 'INV-202607-00011', 'cmazlnzei008vvp4s6sytbnlx', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.941', '2026-07-27 03:56:13.941'),
('cms2p2woz000bjsj0d6v4yu7h', 'INV-202607-00012', 'cmazlnzg80099vp4sql9jhqda', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.955', '2026-07-27 03:56:13.955'),
('cms2p2wpa000cjsj0qr28a285', 'INV-202607-00013', 'cmazlnzgj009bvp4sm33v0m2c', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.966', '2026-07-27 03:56:13.966'),
('cms2p2wpo000djsj0xnjwirvg', 'INV-202607-00014', 'cmazlnzj1009vvp4skuc6noyp', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.980', '2026-07-27 03:56:13.980'),
('cms2p2wpy000ejsj0kn3ac3qw', 'INV-202607-00015', 'cmazlnzjm009zvp4s232uff15', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:13.990', '2026-07-27 03:56:13.990'),
('cms2p2wqa000fjsj02dwfcoz6', 'INV-202607-00016', 'cmazlnzk500a3vp4sklvzjs6d', '2026-06-30 17:00:00.000', 7, 2026, 220000, 0, 0, 220000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.002', '2026-07-27 03:56:14.002'),
('cms2p2wqi000gjsj0tex106md', 'INV-202607-00017', 'cmazlnzr300blvp4sf1ygsc5z', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.010', '2026-07-27 03:56:14.010'),
('cms2p2wqs000hjsj0crf4bbgp', 'INV-202607-00018', 'cmazlnzw300cpvp4svjdlldhq', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.020', '2026-07-27 03:56:14.020'),
('cms2p2wr3000ijsj01zv9nxhn', 'INV-202607-00019', 'cmazlnzxr00d1vp4sfy3c5kw1', '2026-06-30 17:00:00.000', 7, 2026, 110000, 55000, 0, 110000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.031', '2026-07-27 03:56:14.031'),
('cms2p2wrg000jjsj03t4cp3le', 'INV-202607-00020', 'cmazlo01b00dtvp4siko5zjpi', '2026-06-30 17:00:00.000', 7, 2026, 120000, 45000, 0, 120000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.044', '2026-07-27 03:56:14.044'),
('cms2p2wro000kjsj0kunyutk7', 'INV-202607-00021', 'cmazlo02x00e5vp4sh7epv1jd', '2026-06-30 17:00:00.000', 7, 2026, 385000, 0, 0, 385000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.052', '2026-07-27 03:56:14.052'),
('cms2p2wrw000ljsj0ygxigbjo', 'INV-202607-00022', 'cmazlo03700e7vp4sjg9zf0br', '2026-06-30 17:00:00.000', 7, 2026, 100000, 10000, 0, 100000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.060', '2026-07-27 03:56:14.060'),
('cms2p2ws3000mjsj0e5hnifvn', 'INV-202607-00023', 'cmazlo03h00e9vp4suowf8xik', '2026-06-30 17:00:00.000', 7, 2026, 100000, 10000, 0, 100000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.067', '2026-07-27 03:56:14.067'),
('cms2p2wsc000njsj02ibcztyv', 'INV-202607-00024', 'cmazlo03r00ebvp4sqqxh4whr', '2026-06-30 17:00:00.000', 7, 2026, 100000, 10000, 0, 100000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.076', '2026-07-27 03:56:14.076'),
('cms2p2wsj000ojsj0og9gb8vv', 'INV-202607-00025', 'cmazlo04000edvp4sph4onykb', '2026-06-30 17:00:00.000', 7, 2026, 100000, 10000, 0, 100000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.083', '2026-07-27 03:56:14.083'),
('cms2p2wst000pjsj0nehnrit6', 'INV-202607-00026', 'cmazlo05e00envp4s18zhueu2', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.093', '2026-07-27 03:56:14.093'),
('cms2p2wt0000qjsj00gf48st9', 'INV-202607-00027', 'cmazlo09t00fjvp4syr53iooh', '2026-06-30 17:00:00.000', 7, 2026, 110000, 0, 0, 110000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.101', '2026-07-27 03:56:14.101'),
('cms2p2wt9000rjsj0xufvjqdf', 'INV-202607-00028', 'cmazlo0bu00fzvp4sakez0oel', '2026-06-30 17:00:00.000', 7, 2026, 110000, 0, 0, 110000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.109', '2026-07-27 03:56:14.109'),
('cms2p2wtf000sjsj0uosirvsx', 'INV-202607-00029', 'cmazlo0cu00g7vp4sfn4s6j8t', '2026-06-30 17:00:00.000', 7, 2026, 110000, 0, 0, 110000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.115', '2026-07-27 03:56:14.115'),
('cms2p2wtp000tjsj0jb4t0ny6', 'INV-202607-00030', 'cmazlo0hc00h7vp4sm6nsx1cp', '2026-06-30 17:00:00.000', 7, 2026, 220000, 0, 0, 220000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.125', '2026-07-27 03:56:14.125'),
('cms2p2wtw000ujsj08014kky5', 'INV-202607-00031', 'cmazlo0ht00hbvp4sarhqp025', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.132', '2026-07-27 03:56:14.132'),
('cms2p2wu5000vjsj0zd8rv54s', 'INV-202607-00032', 'cmazlo0km00hxvp4srerxaozf', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.141', '2026-07-27 03:56:14.141'),
('cms2p2wuj000wjsj0hoircg3e', 'INV-202607-00033', 'cmazlo0n700ibvp4scqk9c388', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.155', '2026-07-27 03:56:14.155'),
('cms2p2wut000xjsj07zir426b', 'INV-202607-00034', 'cmazlo0o000ihvp4snc2xtjo6', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.165', '2026-07-27 03:56:14.165'),
('cms2p2wv3000yjsj0ux3de3p0', 'INV-202607-00035', 'cmazlo0oa00ijvp4slrg25ome', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.175', '2026-07-27 03:56:14.175'),
('cms2p2wva000zjsj09t3fwpci', 'INV-202607-00036', 'cmazlo0pv00ivvp4s9dgu0gwq', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.182', '2026-07-27 03:56:14.182'),
('cms2p2wvk0010jsj0bgc0k4r1', 'INV-202607-00037', 'cmazlo0qv00j3vp4san91pjnu', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.192', '2026-07-27 03:56:14.192'),
('cms2p2wvs0011jsj0h5jdwhar', 'INV-202607-00038', 'cmazlo0sc00jfvp4skygdbgpk', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.200', '2026-07-27 03:56:14.200'),
('cms2p2ww40012jsj0rhl66dzv', 'INV-202607-00039', 'cmazlo0t300jlvp4s1vjfs3fq', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.212', '2026-07-27 03:56:14.212'),
('cms2p2wwf0013jsj0opsual0z', 'INV-202607-00040', 'cmazlo0tc00jnvp4s17fhxn5p', '2026-06-30 17:00:00.000', 7, 2026, 140000, 0, 0, 140000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.223', '2026-07-27 03:56:14.223'),
('cms2p2wwl0014jsj0gsds0mo9', 'INV-202607-00041', 'cmazlo0xw00knvp4shgmezc9q', '2026-06-30 17:00:00.000', 7, 2026, 110000, 0, 0, 110000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.229', '2026-07-27 03:56:14.229'),
('cms2p2wwt0015jsj0zqy63586', 'INV-202607-00042', 'cmazlo0z600kxvp4sly1xmfpd', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.237', '2026-07-27 03:56:14.237'),
('cms2p2wx10016jsj00n7naf4b', 'INV-202607-00043', 'cmazlo0zf00kzvp4s1j3gjpgd', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.245', '2026-07-27 03:56:14.245'),
('cms2p2wxa0017jsj042sfmbu4', 'INV-202607-00044', 'cmazlo13g00lnvp4s1mrd88k0', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.254', '2026-07-27 03:56:14.254'),
('cms2p2wxi0018jsj0hkd2n89k', 'INV-202607-00045', 'cmazlo13p00lpvp4spkw4z7bp', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'UNPAID', '2026-08-20 00:00:00.000', NULL, '2026-07-27 03:56:14.262', '2026-07-27 03:56:14.262'),
('cms2p2wxs0019jsj0mr9q6guo', 'INV-202607-00046', 'cmazlo15n00m3vp4s3cpoarwe', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'PAID', '2026-08-20 00:00:00.000', '2026-07-27 05:25:55.294', '2026-07-27 03:56:14.272', '2026-07-27 05:25:55.296'),
('cms2p2wxy001ajsj0t6su2eia', 'INV-202607-00047', 'cmazlo17e00mhvp4spopimz7v', '2026-06-30 17:00:00.000', 7, 2026, 165000, 0, 0, 165000, 'PAID', '2026-08-20 00:00:00.000', '2026-07-27 05:12:52.333', '2026-07-27 03:56:14.278', '2026-07-27 05:12:52.367');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modem`
--

CREATE TABLE `modem` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `serial` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `odp`
--

CREATE TABLE `odp` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `rasio` varchar(191) DEFAULT NULL,
  `passiveSpliter` varchar(191) DEFAULT NULL,
  `areaId` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `odp`
--

INSERT INTO `odp` (`id`, `name`, `rasio`, `passiveSpliter`, `areaId`, `createdAt`, `updatedAt`) VALUES
('cms2lux6000035kj0w6u8nzay', 'Adikarto', NULL, NULL, NULL, '2026-07-27 02:26:02.472', '2026-07-27 02:26:02.472');

-- --------------------------------------------------------

--
-- Struktur dari tabel `olt`
--

CREATE TABLE `olt` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `location` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `serial` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `harga` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id`, `name`, `harga`, `createdAt`, `updatedAt`) VALUES
('cmazjsfz40000vpbgy9wu9hmc', 'Unlimited1-30Mbps', 165000, '2026-07-27 03:20:32.029', '2026-07-27 03:20:32.029'),
('cmazjsfz40001vpbgiekv6d6f', 'Unlimited2-35Mbps', 220000, '2026-07-27 03:20:32.029', '2026-07-27 03:20:32.029'),
('cmazjsfz40002vpbgwyegkqec', 'Unlimited3-40Mbps', 275000, '2026-07-27 03:20:32.029', '2026-07-27 03:20:32.029'),
('cmazjsfz40003vpbgli3sqfuy', 'Unlimited4-60Mbps', 385000, '2026-07-27 03:20:32.029', '2026-07-27 03:20:32.029'),
('cmazjsfz40004vpbge4i9ji7e', 'Paket Lama', 110000, '2026-07-27 03:20:32.029', '2026-07-27 03:20:32.029'),
('cmbeop7p20000m6m59bddn3mz', 'Promo140-15Mbps', 140000, '2026-07-27 03:20:32.029', '2026-07-27 03:20:32.029'),
('cmbthpcqq0000m6nhgjwxyahb', 'Promo175-25Mbps', 175000, '2026-07-27 03:20:32.029', '2026-07-27 03:20:32.029'),
('cmq5bferl00nem6chfie4et4l', 'bisnis2', 825000, '2026-07-27 03:20:32.029', '2026-07-27 03:20:32.029');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password`
--

CREATE TABLE `password` (
  `id` varchar(191) NOT NULL,
  `hash` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password`
--

INSERT INTO `password` (`id`, `hash`, `userId`) VALUES
('cms2ltaj600015kj00w0cywx2', '$argon2id$v=19$m=19456,t=2,p=1$/KjZJku8PhuTpt+N+ruGBw$nXm/l96GWXKfrbUqc2OlT3KyB2pjsQG4HG6U2O2yfN8', 'cms2ltais00005kj0nal7jqwf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `id` varchar(191) NOT NULL,
  `invoiceId` varchar(191) NOT NULL,
  `customerId` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `method` enum('CASH','BANK_TRANSFER','QRIS','VIRTUAL_ACCOUNT','E_WALLET') NOT NULL,
  `gateway` enum('MANUAL','MIDTRANS','XENDIT','TRIPAY','DUITKU') NOT NULL DEFAULT 'MANUAL',
  `status` enum('PENDING','WAITING_VERIFICATION','SUCCESS','FAILED','EXPIRED','REJECTED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `gatewayTransactionId` varchar(191) DEFAULT NULL,
  `paymentCode` varchar(191) DEFAULT NULL,
  `paymentUrl` varchar(191) DEFAULT NULL,
  `snapToken` varchar(191) DEFAULT NULL,
  `bankName` varchar(191) DEFAULT NULL,
  `accountName` varchar(191) DEFAULT NULL,
  `accountNumber` varchar(191) DEFAULT NULL,
  `transferAt` datetime(3) DEFAULT NULL,
  `paidAt` datetime(3) DEFAULT NULL,
  `expiredAt` datetime(3) DEFAULT NULL,
  `createdById` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`id`, `invoiceId`, `customerId`, `amount`, `method`, `gateway`, `status`, `gatewayTransactionId`, `paymentCode`, `paymentUrl`, `snapToken`, `bankName`, `accountName`, `accountNumber`, `transferAt`, `paidAt`, `expiredAt`, `createdById`, `createdAt`, `updatedAt`) VALUES
('cms2rtgu70000csj0ky3z0x2d', 'cms2p2wxy001ajsj0t6su2eia', 'cmazlo17e00mhvp4spopimz7v', 165000, 'CASH', 'MANUAL', 'SUCCESS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-27 05:12:52.333', NULL, 'cms2ltais00005kj0nal7jqwf', '2026-07-27 05:12:52.352', '2026-07-27 05:12:52.352'),
('cms2ryofp0003csj0xcnird7b', 'cms2p2wxs0019jsj0mr9q6guo', 'cmazlo15n00m3vp4s3cpoarwe', 165000, 'BANK_TRANSFER', 'MANUAL', 'SUCCESS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-27 05:17:51.851', '2026-07-27 05:25:55.281', NULL, 'cms2ltais00005kj0nal7jqwf', '2026-07-27 05:16:55.477', '2026-07-27 05:25:55.287');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paymentattachment`
--

CREATE TABLE `paymentattachment` (
  `id` varchar(191) NOT NULL,
  `paymentId` varchar(191) NOT NULL,
  `originalName` varchar(191) NOT NULL,
  `fileName` varchar(191) NOT NULL,
  `mimeType` varchar(191) NOT NULL,
  `extension` varchar(191) NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `uploadedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `paymentattachment`
--

INSERT INTO `paymentattachment` (`id`, `paymentId`, `originalName`, `fileName`, `mimeType`, `extension`, `size`, `path`, `url`, `uploadedAt`) VALUES
('cms2rzvxf0004csj0829ef7bu', 'cms2ryofp0003csj0xcnird7b', 'WhatsApp Image 2024-06-11 at 08.48.56.jpeg', '88d1ea32-957d-45c5-a79c-95044fdf3059-1785129471819.jpeg', 'image/jpeg', 'jpeg', 53106, 'uploads/payment/88d1ea32-957d-45c5-a79c-95044fdf3059-1785129471819.jpeg', '/uploads/payment/88d1ea32-957d-45c5-a79c-95044fdf3059-1785129471819.jpeg', '2026-07-27 05:17:51.844');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paymentmethodaccount`
--

CREATE TABLE `paymentmethodaccount` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `method` enum('CASH','BANK_TRANSFER','QRIS','VIRTUAL_ACCOUNT','E_WALLET') NOT NULL,
  `bankName` varchar(191) DEFAULT NULL,
  `accountName` varchar(191) DEFAULT NULL,
  `accountNumber` varchar(191) DEFAULT NULL,
  `qrImage` varchar(191) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paymentverification`
--

CREATE TABLE `paymentverification` (
  `id` varchar(191) NOT NULL,
  `paymentId` varchar(191) NOT NULL,
  `verifiedById` varchar(191) NOT NULL,
  `status` enum('APPROVED','REJECTED') NOT NULL,
  `note` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `paymentverification`
--

INSERT INTO `paymentverification` (`id`, `paymentId`, `verifiedById`, `status`, `note`, `createdAt`) VALUES
('cms2sa8y50005csj0a3ssxw1y', 'cms2ryofp0003csj0xcnird7b', 'cms2ltais00005kj0nal7jqwf', 'APPROVED', NULL, '2026-07-27 05:25:55.277');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paymentwebhook`
--

CREATE TABLE `paymentwebhook` (
  `id` varchar(191) NOT NULL,
  `gateway` enum('MANUAL','MIDTRANS','XENDIT','TRIPAY','DUITKU') NOT NULL,
  `transactionId` varchar(191) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendapatan`
--

CREATE TABLE `pendapatan` (
  `id` varchar(191) NOT NULL,
  `paymentId` varchar(191) DEFAULT NULL,
  `userId` varchar(191) DEFAULT NULL,
  `total` double NOT NULL,
  `deskripsi` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pendapatan`
--

INSERT INTO `pendapatan` (`id`, `paymentId`, `userId`, `total`, `deskripsi`, `createdAt`, `updatedAt`) VALUES
('cms2rtgv20001csj0wxx6z9r8', 'cms2rtgu70000csj0ky3z0x2d', 'cms2ltais00005kj0nal7jqwf', 165000, 'Pembayaran Cash Invoice #INV-202607-00047 - Slamet Harjatito', '2026-07-27 05:12:52.382', '2026-07-27 05:12:52.382'),
('cms2sa8yw0006csj004mai3qg', 'cms2ryofp0003csj0xcnird7b', 'cms2ltais00005kj0nal7jqwf', 165000, NULL, '2026-07-27 05:25:55.304', '2026-07-27 05:25:55.304'),
('cms2swea10000ogj0yfbia0e9', NULL, 'cms2ltais00005kj0nal7jqwf', 250000, 'Biaya Registrasi & Pemasangan Baru Router - Perum Griya A1', '2026-07-27 05:43:08.617', '2026-07-27 05:43:08.617');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `totalKeluar` double NOT NULL,
  `deskripsi` varchar(191) DEFAULT NULL,
  `kategori` varchar(191) NOT NULL,
  `tanggal` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `bukuKasId` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `fullname` varchar(191) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `phoneNumber` varchar(191) DEFAULT NULL,
  `level` enum('SUPER_ADMIN','ADMIN','STAFF') NOT NULL DEFAULT 'ADMIN',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `address`, `phoneNumber`, `level`, `createdAt`, `updatedAt`) VALUES
('cms2ltais00005kj0nal7jqwf', 'sidiqcahyono', 'Cahyono Muslim Sidiq', NULL, NULL, 'ADMIN', '2026-07-27 02:24:46.469', '2026-07-27 02:24:46.469');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_areatouser`
--

CREATE TABLE `_areatouser` (
  `A` varchar(191) NOT NULL,
  `B` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `_pendapatanbukukas`
--

CREATE TABLE `_pendapatanbukukas` (
  `A` varchar(191) NOT NULL,
  `B` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `_pendapatanbukukas`
--

INSERT INTO `_pendapatanbukukas` (`A`, `B`) VALUES
('cms2rtgvs0002csj02xqy6j58', 'cms2rtgv20001csj0wxx6z9r8'),
('cms2rtgvs0002csj02xqy6j58', 'cms2swea10000ogj0yfbia0e9'),
('cms2sa8zb0007csj0zqbevayq', 'cms2sa8yw0006csj004mai3qg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('98635f5e-79bd-46e9-a652-c1ab7eeb1faf', 'b2839a55b4fea430e6a344407822d3f115cae16e4c3b38415d529c6c2f7f30db', '2026-07-27 05:40:55.351', '20260727054055_make_payment_id_optional', NULL, NULL, '2026-07-27 05:40:55.289', 1),
('9cf5e183-141e-4be9-8c06-69ad953e162e', 'ae50343f1327b2297ccb87613d24273d9ffe189c00f28d9a6464ca6604121820', '2026-07-27 01:57:35.154', '20260722050950_init', NULL, NULL, '2026-07-27 01:57:33.487', 1),
('d7d5771b-dacb-439b-9ac8-e1d77126db66', '99ab8da21a996f3ac034f1b13f40159efda20d4565a84c5afde76782e07efb7e', '2026-07-27 01:57:35.169', '20260722162048_add_pending_status', NULL, NULL, '2026-07-27 01:57:35.156', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bukukas`
--
ALTER TABLE `bukukas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BukuKas_tanggal_idx` (`tanggal`),
  ADD KEY `BukuKas_userId_fkey` (`userId`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Customer_username_key` (`username`),
  ADD UNIQUE KEY `Customer_email_key` (`email`),
  ADD KEY `Customer_status_idx` (`status`),
  ADD KEY `Customer_areaId_idx` (`areaId`),
  ADD KEY `Customer_paketId_fkey` (`paketId`),
  ADD KEY `Customer_odpId_fkey` (`odpId`),
  ADD KEY `Customer_modemId_fkey` (`modemId`),
  ADD KEY `Customer_oltId_fkey` (`oltId`);

--
-- Indeks untuk tabel `customerpassword`
--
ALTER TABLE `customerpassword`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CustomerPassword_customerId_key` (`customerId`);

--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Invoice_invoiceNumber_key` (`invoiceNumber`),
  ADD UNIQUE KEY `Invoice_customerId_bulan_tahun_key` (`customerId`,`bulan`,`tahun`),
  ADD KEY `Invoice_status_idx` (`status`),
  ADD KEY `Invoice_bulan_tahun_idx` (`bulan`,`tahun`);

--
-- Indeks untuk tabel `modem`
--
ALTER TABLE `modem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Modem_serial_key` (`serial`);

--
-- Indeks untuk tabel `odp`
--
ALTER TABLE `odp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Odp_areaId_fkey` (`areaId`);

--
-- Indeks untuk tabel `olt`
--
ALTER TABLE `olt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Olt_serial_key` (`serial`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password`
--
ALTER TABLE `password`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Password_userId_key` (`userId`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Payment_gatewayTransactionId_key` (`gatewayTransactionId`),
  ADD KEY `Payment_status_idx` (`status`),
  ADD KEY `Payment_customerId_idx` (`customerId`),
  ADD KEY `Payment_invoiceId_idx` (`invoiceId`),
  ADD KEY `Payment_createdAt_idx` (`createdAt`),
  ADD KEY `Payment_createdById_fkey` (`createdById`);

--
-- Indeks untuk tabel `paymentattachment`
--
ALTER TABLE `paymentattachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PaymentAttachment_paymentId_idx` (`paymentId`);

--
-- Indeks untuk tabel `paymentmethodaccount`
--
ALTER TABLE `paymentmethodaccount`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paymentverification`
--
ALTER TABLE `paymentverification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PaymentVerification_paymentId_key` (`paymentId`),
  ADD KEY `PaymentVerification_verifiedById_idx` (`verifiedById`);

--
-- Indeks untuk tabel `paymentwebhook`
--
ALTER TABLE `paymentwebhook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PaymentWebhook_gateway_transactionId_idx` (`gateway`,`transactionId`);

--
-- Indeks untuk tabel `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Pendapatan_paymentId_key` (`paymentId`),
  ADD KEY `Pendapatan_userId_fkey` (`userId`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Pengeluaran_userId_fkey` (`userId`),
  ADD KEY `Pengeluaran_bukuKasId_fkey` (`bukuKasId`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_username_key` (`username`);

--
-- Indeks untuk tabel `_areatouser`
--
ALTER TABLE `_areatouser`
  ADD UNIQUE KEY `_AreaToUser_AB_unique` (`A`,`B`),
  ADD KEY `_AreaToUser_B_index` (`B`);

--
-- Indeks untuk tabel `_pendapatanbukukas`
--
ALTER TABLE `_pendapatanbukukas`
  ADD UNIQUE KEY `_PendapatanBukuKas_AB_unique` (`A`,`B`),
  ADD KEY `_PendapatanBukuKas_B_index` (`B`);

--
-- Indeks untuk tabel `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bukukas`
--
ALTER TABLE `bukukas`
  ADD CONSTRAINT `BukuKas_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `Customer_areaId_fkey` FOREIGN KEY (`areaId`) REFERENCES `area` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Customer_modemId_fkey` FOREIGN KEY (`modemId`) REFERENCES `modem` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Customer_odpId_fkey` FOREIGN KEY (`odpId`) REFERENCES `odp` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Customer_oltId_fkey` FOREIGN KEY (`oltId`) REFERENCES `olt` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Customer_paketId_fkey` FOREIGN KEY (`paketId`) REFERENCES `paket` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customerpassword`
--
ALTER TABLE `customerpassword`
  ADD CONSTRAINT `CustomerPassword_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `Invoice_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `odp`
--
ALTER TABLE `odp`
  ADD CONSTRAINT `Odp_areaId_fkey` FOREIGN KEY (`areaId`) REFERENCES `area` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `password`
--
ALTER TABLE `password`
  ADD CONSTRAINT `Password_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `Payment_createdById_fkey` FOREIGN KEY (`createdById`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Payment_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Payment_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `paymentattachment`
--
ALTER TABLE `paymentattachment`
  ADD CONSTRAINT `PaymentAttachment_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `paymentverification`
--
ALTER TABLE `paymentverification`
  ADD CONSTRAINT `PaymentVerification_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PaymentVerification_verifiedById_fkey` FOREIGN KEY (`verifiedById`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD CONSTRAINT `Pendapatan_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Pendapatan_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `Pengeluaran_bukuKasId_fkey` FOREIGN KEY (`bukuKasId`) REFERENCES `bukukas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Pengeluaran_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `_areatouser`
--
ALTER TABLE `_areatouser`
  ADD CONSTRAINT `_AreaToUser_A_fkey` FOREIGN KEY (`A`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_AreaToUser_B_fkey` FOREIGN KEY (`B`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `_pendapatanbukukas`
--
ALTER TABLE `_pendapatanbukukas`
  ADD CONSTRAINT `_PendapatanBukuKas_A_fkey` FOREIGN KEY (`A`) REFERENCES `bukukas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_PendapatanBukuKas_B_fkey` FOREIGN KEY (`B`) REFERENCES `pendapatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
