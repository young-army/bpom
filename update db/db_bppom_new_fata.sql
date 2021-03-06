-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 11, 2015 at 11:44 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_bppom`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_analisa`
--

CREATE TABLE IF NOT EXISTS `tbl_analisa` (
  `id_analisa` int(11) NOT NULL AUTO_INCREMENT,
  `kd_keluhan` varchar(100) NOT NULL,
  `kd_racun` varchar(11) NOT NULL,
  `jml_row` int(11) NOT NULL,
  `jml_identifikasi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_analisa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tbl_analisa`
--

INSERT INTO `tbl_analisa` (`id_analisa`, `kd_keluhan`, `kd_racun`, `jml_row`, `jml_identifikasi`) VALUES
(13, 'PPL-2015-MTR-01-1', 'RC-002', 4, 1),
(14, 'PPL-2015-MTR-01-1', 'RC-001', 3, 3),
(15, 'PPL-2015-MTR-01-1', 'RC-003', 3, 2),
(16, 'PPL-2015-MTR-01-1', 'RC-004', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gejala`
--

CREATE TABLE IF NOT EXISTS `tbl_gejala` (
  `id_gejala` int(11) NOT NULL AUTO_INCREMENT,
  `kd_gejala` varchar(50) NOT NULL,
  `gejala` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kd_gejala`),
  KEY `id_gejala` (`id_gejala`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tbl_gejala`
--

INSERT INTO `tbl_gejala` (`id_gejala`, `kd_gejala`, `gejala`) VALUES
(1, 'GJ-01', 'Mual'),
(2, 'Gj-02', 'Diare'),
(3, 'GJ-03', 'Demam'),
(4, 'GJ-04', 'Pusing'),
(5, 'GJ-05', 'Muntah'),
(6, 'GL-1', 'Batuk'),
(8, 'GL-3', 'Mencret'),
(9, 'GL-4', 'Panas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jabatan`
--

CREATE TABLE IF NOT EXISTS `tbl_jabatan` (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `jabatan` varchar(100) NOT NULL,
  `lembaga_id` int(11) NOT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_jabatan`
--

INSERT INTO `tbl_jabatan` (`id_jabatan`, `jabatan`, `lembaga_id`) VALUES
(1, 'Superadmin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kabupaten`
--

CREATE TABLE IF NOT EXISTS `tbl_kabupaten` (
  `id_kabupaten` int(11) NOT NULL AUTO_INCREMENT,
  `kabupaten_kota` varchar(100) DEFAULT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kabupaten`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_kabupaten`
--

INSERT INTO `tbl_kabupaten` (`id_kabupaten`, `kabupaten_kota`, `provinsi_id`) VALUES
(1, 'Jakarta Timur', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_karyawan`
--

CREATE TABLE IF NOT EXISTS `tbl_karyawan` (
  `id_kary` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `jabatan_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 = aktif , 0 = tidak',
  `pictures` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nik`),
  KEY `id_kary` (`id_kary`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_karyawan`
--

INSERT INTO `tbl_karyawan` (`id_kary`, `nik`, `nama`, `alamat`, `hp`, `email`, `jabatan_id`, `status`, `pictures`) VALUES
(1, '201110225043', 'danu', 'matraman', '+6287781042439', 'danum246@gmail.com', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kecamatan`
--

CREATE TABLE IF NOT EXISTS `tbl_kecamatan` (
  `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kabupaten_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kecamatan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_kecamatan`
--

INSERT INTO `tbl_kecamatan` (`id_kecamatan`, `kecamatan`, `kabupaten_id`) VALUES
(1, 'Matraman', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_keluhan_pasien`
--

CREATE TABLE IF NOT EXISTS `tbl_keluhan_pasien` (
  `id_keluhan` int(11) NOT NULL AUTO_INCREMENT,
  `kd_keluhan` varchar(100) NOT NULL,
  `pelapor` varchar(100) NOT NULL,
  `pasien_sakit` varchar(100) NOT NULL,
  `pasien_meninggal` varchar(100) DEFAULT NULL,
  `tgl_laporan` datetime NOT NULL,
  `waktu_awal` datetime NOT NULL,
  `waktu_terjadi` datetime DEFAULT NULL,
  `kd_gejala` varchar(100) NOT NULL COMMENT 'isian ny array . ex: 1,2,3,4',
  `dugaan_pangan` varchar(200) DEFAULT NULL,
  `alamat` text,
  `lokasi` varchar(100) DEFAULT NULL,
  `id_kelurahan` int(11) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_kabupaten` int(11) DEFAULT NULL,
  `id_provinsi` int(11) DEFAULT NULL,
  `lembaga_id` int(11) NOT NULL,
  PRIMARY KEY (`kd_keluhan`),
  KEY `id_keluhan` (`id_keluhan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_keluhan_pasien`
--

INSERT INTO `tbl_keluhan_pasien` (`id_keluhan`, `kd_keluhan`, `pelapor`, `pasien_sakit`, `pasien_meninggal`, `tgl_laporan`, `waktu_awal`, `waktu_terjadi`, `kd_gejala`, `dugaan_pangan`, `alamat`, `lokasi`, `id_kelurahan`, `id_kecamatan`, `id_kabupaten`, `id_provinsi`, `lembaga_id`) VALUES
(7, 'PPL-2015-MTR-01-1', 'Fata Aisy Salim', '23', '0', '2015-01-11 11:40:09', '2015-01-01 00:00:00', '2015-01-11 11:40:09', 'GJ-01, Gj-02, GJ-04, GJ-05', 'Roti', 'Tytyan Kencana Bekasi', 'Bekasi Utara', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelurahan`
--

CREATE TABLE IF NOT EXISTS `tbl_kelurahan` (
  `id_kelurahan` int(11) NOT NULL AUTO_INCREMENT,
  `kelurahan` varchar(100) NOT NULL,
  `kecamatan_id` int(11) NOT NULL,
  PRIMARY KEY (`id_kelurahan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_kelurahan`
--

INSERT INTO `tbl_kelurahan` (`id_kelurahan`, `kelurahan`, `kecamatan_id`) VALUES
(1, 'Palmeriam', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lembaga`
--

CREATE TABLE IF NOT EXISTS `tbl_lembaga` (
  `id_lembaga` int(11) NOT NULL AUTO_INCREMENT,
  `kode_lembaga` varchar(50) NOT NULL,
  `lembaga` varchar(100) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 = pusat, 2 = dinas kesehatan kabupaten , 3 = puskesmas',
  `kelurahan_id` int(11) DEFAULT NULL,
  `kabupaten_id` int(11) DEFAULT NULL,
  `pusat` int(11) NOT NULL COMMENT '1 = yes , 0 = no',
  PRIMARY KEY (`kode_lembaga`),
  KEY `id_lembaga` (`id_lembaga`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_lembaga`
--

INSERT INTO `tbl_lembaga` (`id_lembaga`, `kode_lembaga`, `lembaga`, `level`, `kelurahan_id`, `kabupaten_id`, `pusat`) VALUES
(1, 'BPOM-Super', 'Badan Pengawas Obat Dan Makanan', 1, NULL, NULL, 1),
(3, 'Puskesmas', 'Puskesmas', 3, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE IF NOT EXISTS `tbl_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `parent_menu` int(11) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `menu`, `url`, `parent_menu`, `icon`) VALUES
(1, 'Dashboard', 'dashboard', 0, 'icon-home '),
(2, 'Form', '-', 0, 'icon-th-list '),
(3, 'Setting', '-', 0, 'icon-cogs '),
(4, 'User Apps', 'setting/user', 3, NULL),
(5, 'Role Menu', 'setting/role', 3, NULL),
(6, 'Jabatan', 'setting/jabatan', 3, NULL),
(7, 'Data', '-', 0, 'icon-folder-open '),
(8, 'Karyawan', 'data/karyawan', 7, NULL),
(9, 'Report', 'report', 0, 'icon-list-alt'),
(10, 'Menu', 'setting/menu', 3, NULL),
(11, 'Form 1', 'form/form01', 2, NULL),
(12, 'Form 2', '#', 2, NULL),
(13, 'Region', '-', 3, NULL),
(20, 'Gejala', 'data/gejala', 7, NULL),
(19, 'Racun', 'data/racun', 7, NULL),
(18, 'Lembaga', 'data/lembaga', 7, NULL),
(24, 'apapapapa', '', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_provinsi`
--

CREATE TABLE IF NOT EXISTS `tbl_provinsi` (
  `id_provinsi` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_provinsi`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_provinsi`
--

INSERT INTO `tbl_provinsi` (`id_provinsi`, `provinsi`) VALUES
(1, 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_racun`
--

CREATE TABLE IF NOT EXISTS `tbl_racun` (
  `id_racun` int(11) NOT NULL AUTO_INCREMENT,
  `kd_racun` varchar(50) NOT NULL,
  `racun` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `inkubasi_rata` int(11) DEFAULT NULL,
  `inkubasi_pendek` int(11) DEFAULT NULL,
  `inkubasi_tinggi` int(11) DEFAULT NULL,
  PRIMARY KEY (`kd_racun`),
  KEY `id_racun` (`id_racun`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_racun`
--

INSERT INTO `tbl_racun` (`id_racun`, `kd_racun`, `racun`, `keterangan`, `inkubasi_rata`, `inkubasi_pendek`, `inkubasi_tinggi`) VALUES
(6, 'RC-002', 'Sianida', '-', 30, 10, 20),
(5, 'RC-001', 'Arsenic', '-', 10, 5, 20),
(7, 'RC-003', 'Klorin', '-', 20, 10, 40),
(8, 'RC-004', 'Hidrogen SIanida', '-', 20, 10, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_racun_gejala`
--

CREATE TABLE IF NOT EXISTS `tbl_racun_gejala` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `kd_racun` varchar(50) DEFAULT NULL,
  `kd_gejala` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tbl_racun_gejala`
--

INSERT INTO `tbl_racun_gejala` (`no`, `kd_racun`, `kd_gejala`) VALUES
(14, 'RC-002', 'GL-1'),
(13, 'RC-002', 'GJ-03'),
(12, 'RC-002', 'GJ-01'),
(11, 'RC-001', 'GJ-05'),
(10, 'RC-001', 'GJ-04'),
(9, 'RC-001', 'GJ-01'),
(15, 'RC-002', 'GL-4'),
(16, 'RC-003', 'GJ-04'),
(17, 'RC-003', 'GJ-05'),
(18, 'RC-003', 'GL-3'),
(19, 'RC-004', 'GJ-01'),
(20, 'RC-004', 'Gj-02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_access`
--

CREATE TABLE IF NOT EXISTS `tbl_role_access` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `lembaga_id` int(11) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `tbl_role_access`
--

INSERT INTO `tbl_role_access` (`id_role`, `menu_id`, `lembaga_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(10, 9, 1),
(11, 10, 1),
(12, 11, 1),
(13, 12, 1),
(14, 13, 1),
(19, 18, 1),
(20, 19, 1),
(21, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_login`
--

CREATE TABLE IF NOT EXISTS `tbl_user_login` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `password_plain` varchar(30) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 = aktif , 0 = tidak',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_user_login`
--

INSERT INTO `tbl_user_login` (`id_user`, `username`, `password`, `password_plain`, `nik`, `status`) VALUES
(1, 'admin', '8dcc4d9a7d48fc06c0bdf66b295699bb1f0829ff', 'admin', '201110225043', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_daerah`
--
CREATE TABLE IF NOT EXISTS `view_daerah` (
`id_kelurahan` int(11)
,`kelurahan` varchar(100)
,`kecamatan_id` int(11)
,`id_kecamatan` int(11)
,`kecamatan` varchar(100)
,`kabupaten_id` int(11)
,`id_kabupaten` int(11)
,`kabupaten_kota` varchar(100)
,`provinsi_id` int(11)
,`id_provinsi` int(11)
,`provinsi` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_role`
--
CREATE TABLE IF NOT EXISTS `view_role` (
`id_role` int(11)
,`menu_id` int(11)
,`lembaga_id` int(11)
,`menu` varchar(30)
,`id_menu` int(11)
,`parent_menu` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user`
--
CREATE TABLE IF NOT EXISTS `view_user` (
`id_user` int(11)
,`nik` varchar(50)
,`password_plain` varchar(30)
,`status` int(11)
,`username` varchar(50)
,`nama` varchar(50)
);
-- --------------------------------------------------------

--
-- Structure for view `view_daerah`
--
DROP TABLE IF EXISTS `view_daerah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_daerah` AS (select `a`.`id_kelurahan` AS `id_kelurahan`,`a`.`kelurahan` AS `kelurahan`,`a`.`kecamatan_id` AS `kecamatan_id`,`b`.`id_kecamatan` AS `id_kecamatan`,`b`.`kecamatan` AS `kecamatan`,`b`.`kabupaten_id` AS `kabupaten_id`,`c`.`id_kabupaten` AS `id_kabupaten`,`c`.`kabupaten_kota` AS `kabupaten_kota`,`c`.`provinsi_id` AS `provinsi_id`,`d`.`id_provinsi` AS `id_provinsi`,`d`.`provinsi` AS `provinsi` from (((`tbl_kelurahan` `a` join `tbl_kecamatan` `b` on((`a`.`kecamatan_id` = `b`.`id_kecamatan`))) join `tbl_kabupaten` `c` on((`b`.`kabupaten_id` = `c`.`id_kabupaten`))) join `tbl_provinsi` `d` on((`c`.`provinsi_id` = `d`.`id_provinsi`))));

-- --------------------------------------------------------

--
-- Structure for view `view_role`
--
DROP TABLE IF EXISTS `view_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_role` AS select `b`.`id_role` AS `id_role`,`b`.`menu_id` AS `menu_id`,`b`.`lembaga_id` AS `lembaga_id`,`a`.`menu` AS `menu`,`a`.`id_menu` AS `id_menu`,`a`.`parent_menu` AS `parent_menu` from ((`tbl_menu` `a` left join `tbl_role_access` `b` on((`a`.`id_menu` = `b`.`menu_id`))) left join `tbl_lembaga` `c` on((`b`.`lembaga_id` = `c`.`id_lembaga`)));

-- --------------------------------------------------------

--
-- Structure for view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user` AS select `a`.`id_user` AS `id_user`,`a`.`nik` AS `nik`,`a`.`password_plain` AS `password_plain`,`a`.`status` AS `status`,`a`.`username` AS `username`,`b`.`nama` AS `nama` from (((`tbl_user_login` `a` join `tbl_karyawan` `b` on((`a`.`nik` = `b`.`nik`))) join `tbl_jabatan` `c` on((`b`.`jabatan_id` = `c`.`id_jabatan`))) join `tbl_lembaga` `d` on((`c`.`lembaga_id` = `d`.`id_lembaga`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
