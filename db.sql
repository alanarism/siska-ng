/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.27-0ubuntu0.16.04.1 : Database - db_siskav2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_siskav2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_siskav2`;

/*Table structure for table `m_jabatan` */

DROP TABLE IF EXISTS `m_jabatan`;

CREATE TABLE `m_jabatan` (
  `kode` int(1) NOT NULL,
  `nama_jabatan` varchar(100) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_jabatan` */

insert  into `m_jabatan`(`kode`,`nama_jabatan`,`keterangan`) values (-1,'Semua Kriteria','-'),(0,'Mahasiswa','-'),(1,'Dosen','-'),(2,'Admin','-');

/*Table structure for table `pps_dosen` */

DROP TABLE IF EXISTS `pps_dosen`;

CREATE TABLE `pps_dosen` (
  `pps_dosen_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_dosen_id_prodi` int(11) NOT NULL,
  `pps_dosen_email` varchar(50) NOT NULL,
  `pps_dosen_password` varchar(100) NOT NULL,
  `pps_dosen_nama` varchar(255) NOT NULL,
  `pps_dosen_kode` varchar(25) DEFAULT NULL,
  `pps_dosen_nip` varchar(25) NOT NULL,
  `pps_dosen_nidn` varchar(25) NOT NULL,
  `pps_dosen_topik_penelitian` text,
  `pps_dosen_foto` text,
  `pps_dosen_alamat` text,
  `pps_dosen_no_telp` varchar(16) DEFAULT NULL,
  `pps_dosen_keterangan` text,
  `pps_dosen_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_dosen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `pps_dosen` */

insert  into `pps_dosen`(`pps_dosen_id`,`pps_dosen_id_prodi`,`pps_dosen_email`,`pps_dosen_password`,`pps_dosen_nama`,`pps_dosen_kode`,`pps_dosen_nip`,`pps_dosen_nidn`,`pps_dosen_topik_penelitian`,`pps_dosen_foto`,`pps_dosen_alamat`,`pps_dosen_no_telp`,`pps_dosen_keterangan`,`pps_dosen_aktif`) values (1,1,'test5@test.com','e10adc3949ba59abbe56e057f20f883e','Dr. Drs. I Nyoman Sukajaya, M.T.','DOS242','196711151993031001','0015116701','Basis Data, Data Mining',NULL,NULL,NULL,NULL,'Aktif'),(2,1,'test8@test.com','e10adc3949ba59abbe56e057f20f883e','Dr. I Gede Aris Gunadi, S.Si., M.Kom.','DOS244','197703182008121004','0018037706',NULL,NULL,NULL,NULL,NULL,'Aktif'),(3,1,'test9@test.com','e10adc3949ba59abbe56e057f20f883e','Dr. Dewa Gede Hendra Divayana','DOS245','198407242015041002','0824078401',NULL,NULL,NULL,NULL,NULL,'Aktif'),(4,1,'test3@test.com','e10adc3949ba59abbe56e057f20f883e','Kadek Yota Ernanda, S.Kom., M.T., Ph.D.','DOS231','197803242005011001','0024037804',NULL,NULL,NULL,NULL,NULL,'Aktif'),(5,1,'test@test.com','e10adc3949ba59abbe56e057f20f883e','Prof. Dr. I Made Candiasa, MI.Komp.','DOS052','1234567890','0030066003','Aksara Bali, Citra',NULL,NULL,NULL,NULL,'Aktif'),(6,1,'test2@test.com','e10adc3949ba59abbe56e057f20f883e','Dr. Gede Rasben Dantes, S.T., M.T.I.','DOS216','197502212003121001','0019017602','Basis Data, Data Mining',NULL,'','','','Aktif'),(7,1,'test6@test.com','e10adc3949ba59abbe56e057f20f883e','I Gede Nurhayata, S.T., M.T.','DOS223','197504042002121001','0004047507',NULL,NULL,NULL,NULL,NULL,'Aktif'),(8,1,'test1@test.com','e10adc3949ba59abbe56e057f20f883e','Prof. Dr. Sariyasa, M.Sc., Ph.D.','DOS199','196406151989021001','0015066401',NULL,NULL,NULL,NULL,NULL,'Aktif'),(9,1,'test4@test.com','e10adc3949ba59abbe56e057f20f883e','Dr. Gede Indrawan, S.T., M.T.','DOS241','197601022003121001','0002017603',NULL,NULL,NULL,NULL,NULL,'Aktif'),(10,1,'test10@test.com','e10adc3949ba59abbe56e057f20f883e','Made Windu Antara Kesiman, M.Sc., Ph.D.','DOS246','198211112008121001','0011118203','',NULL,NULL,NULL,NULL,'Aktif'),(11,1,'test7@test.com','e10adc3949ba59abbe56e057f20f883e','Dr. Gede Suweken, M.Sc.','DOS243','196012311986011004','0011116106',NULL,NULL,NULL,NULL,NULL,'Aktif');

/*Table structure for table `pps_jadwal` */

DROP TABLE IF EXISTS `pps_jadwal`;

CREATE TABLE `pps_jadwal` (
  `pps_jadwal_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_jadwal_id_prodi` int(11) NOT NULL,
  `pps_jadwal_tipe_ujian` enum('Ujian Proposal','Ujian Pratesis','Ujian Tesis') NOT NULL,
  `pps_jadwal_id_mahasiswa` int(11) NOT NULL,
  `pps_jadwal_id_penelitian` int(11) NOT NULL,
  `pps_jadwal_id_pembimbing_1` int(11) NOT NULL,
  `pps_jadwal_id_pembimbing_2` int(11) NOT NULL,
  `pps_jadwal_id_ruangan` int(11) NOT NULL,
  `pps_jadwal_id_ketua_penguji` int(11) NOT NULL,
  `pps_jadwal_id_penguji_1` int(11) NOT NULL,
  `pps_jadwal_id_penguji_2` int(11) NOT NULL,
  `pps_jadwal_sesi_ujian` varchar(25) DEFAULT NULL,
  `pps_jadwal_tanggal_ujian` date NOT NULL,
  `pps_jadwal_waktu_mulai` time NOT NULL,
  `pps_jadwal_waktu_selesai` time NOT NULL,
  `pps_jadwal_catatan_ujian` text,
  `pps_jadwal_email_jadwal` enum('Belum Terkirim','Sudah Terkirim') NOT NULL DEFAULT 'Belum Terkirim',
  PRIMARY KEY (`pps_jadwal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `pps_jadwal` */

insert  into `pps_jadwal`(`pps_jadwal_id`,`pps_jadwal_id_prodi`,`pps_jadwal_tipe_ujian`,`pps_jadwal_id_mahasiswa`,`pps_jadwal_id_penelitian`,`pps_jadwal_id_pembimbing_1`,`pps_jadwal_id_pembimbing_2`,`pps_jadwal_id_ruangan`,`pps_jadwal_id_ketua_penguji`,`pps_jadwal_id_penguji_1`,`pps_jadwal_id_penguji_2`,`pps_jadwal_sesi_ujian`,`pps_jadwal_tanggal_ujian`,`pps_jadwal_waktu_mulai`,`pps_jadwal_waktu_selesai`,`pps_jadwal_catatan_ujian`,`pps_jadwal_email_jadwal`) values (1,1,'Ujian Proposal',1,1,6,9,1,11,1,6,'sesi 1','2019-07-29','08:30:00','09:30:00','','Sudah Terkirim'),(4,1,'Ujian Proposal',2,2,3,4,2,8,8,5,'Sesi 1','2019-08-13','08:30:00','09:30:00','catatan','Sudah Terkirim'),(5,1,'Ujian Pratesis',1,1,6,9,1,1,4,1,'sesi 1','2019-07-30','08:00:00','09:00:00','catatan','Sudah Terkirim'),(6,1,'Ujian Tesis',1,1,6,9,2,6,6,9,'ss','2019-07-31','13:00:00','14:10:00','catata','Sudah Terkirim'),(8,1,'Ujian Proposal',2,3,1,6,2,9,9,9,'yo','2019-08-20','16:30:00','16:55:00','','Sudah Terkirim'),(9,1,'Ujian Pratesis',2,3,1,6,1,11,6,1,'sesi','2019-08-27','17:30:00','17:50:00','','Sudah Terkirim');

/*Table structure for table `pps_mahasiswa` */

DROP TABLE IF EXISTS `pps_mahasiswa`;

CREATE TABLE `pps_mahasiswa` (
  `pps_mahasiswa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_mahasiswa_id_prodi` int(11) DEFAULT NULL,
  `pps_mahasiswa_id_konsentrasi` int(11) DEFAULT NULL,
  `pps_mahasiswa_email` varchar(50) DEFAULT NULL,
  `pps_mahasiswa_password` varchar(100) DEFAULT NULL,
  `pps_mahasiswa_angkatan` varchar(4) DEFAULT NULL,
  `pps_mahasiswa_nim` varchar(10) DEFAULT NULL,
  `pps_mahasiswa_nik` varchar(20) DEFAULT NULL,
  `pps_mahasiswa_nama` varchar(50) DEFAULT NULL,
  `pps_mahasiswa_foto` text,
  `pps_mahasiswa_tempat_lahir` varchar(25) DEFAULT NULL,
  `pps_mahasiswa_tanggal_lahir` date DEFAULT NULL,
  `pps_mahasiswa_jenis_kelamin` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `pps_mahasiswa_gol_darah` enum('A','B','AB','O') DEFAULT NULL,
  `pps_mahasiswa_agama` varchar(25) DEFAULT NULL,
  `pps_mahasiswa_status_kawin` enum('Belum Kawin','Kawin','Janda','Duda') DEFAULT NULL,
  `pps_mahasiswa_status_tinggal` enum('Orang Tua','Sendiri','Kontrakan','Pihak Lain') DEFAULT NULL,
  `pps_mahasiswa_biaya_kuliah` enum('Orang Tua','Sendiri','Sponsor','Lain-lain') DEFAULT 'Orang Tua',
  `pps_mahasiswa_alamat` varchar(255) DEFAULT NULL,
  `pps_mahasiswa_no_telp` varchar(16) DEFAULT NULL,
  `pps_mahasiswa_no_hp` varchar(16) DEFAULT NULL,
  `pps_mahasiswa_ijazah_terakhir` varchar(50) DEFAULT NULL,
  `pps_mahasiswa_pekerjaan` varchar(50) DEFAULT NULL,
  `pps_mahasiswa_instansi_bekerja` varchar(50) DEFAULT NULL,
  `pps_mahasiswa_instansi_alamat` varchar(255) DEFAULT NULL,
  `pps_mahasiswa_instansi_no_telp` varchar(16) DEFAULT NULL,
  `pps_mahasiswa_nama_ortu` varchar(50) DEFAULT NULL,
  `pps_mahasiswa_pekerjaan_ortu` varchar(50) DEFAULT NULL,
  `pps_mahasiswa_email_ortu` varchar(50) DEFAULT NULL,
  `pps_mahasiswa_telp_ortu` varchar(16) DEFAULT NULL,
  `pps_mahasiswa_tempat_kuliah` enum('Singaraja','Denpasar') DEFAULT NULL,
  `pps_mahasiswa_status_kuliah` enum('Penuh','Sambil Bekerja') DEFAULT NULL,
  `pps_mahasiswa_keterangan` text,
  `pps_mahasiswa_aktif` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  `pps_mahasiswa_token` text,
  PRIMARY KEY (`pps_mahasiswa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `pps_mahasiswa` */

insert  into `pps_mahasiswa`(`pps_mahasiswa_id`,`pps_mahasiswa_id_prodi`,`pps_mahasiswa_id_konsentrasi`,`pps_mahasiswa_email`,`pps_mahasiswa_password`,`pps_mahasiswa_angkatan`,`pps_mahasiswa_nim`,`pps_mahasiswa_nik`,`pps_mahasiswa_nama`,`pps_mahasiswa_foto`,`pps_mahasiswa_tempat_lahir`,`pps_mahasiswa_tanggal_lahir`,`pps_mahasiswa_jenis_kelamin`,`pps_mahasiswa_gol_darah`,`pps_mahasiswa_agama`,`pps_mahasiswa_status_kawin`,`pps_mahasiswa_status_tinggal`,`pps_mahasiswa_biaya_kuliah`,`pps_mahasiswa_alamat`,`pps_mahasiswa_no_telp`,`pps_mahasiswa_no_hp`,`pps_mahasiswa_ijazah_terakhir`,`pps_mahasiswa_pekerjaan`,`pps_mahasiswa_instansi_bekerja`,`pps_mahasiswa_instansi_alamat`,`pps_mahasiswa_instansi_no_telp`,`pps_mahasiswa_nama_ortu`,`pps_mahasiswa_pekerjaan_ortu`,`pps_mahasiswa_email_ortu`,`pps_mahasiswa_telp_ortu`,`pps_mahasiswa_tempat_kuliah`,`pps_mahasiswa_status_kuliah`,`pps_mahasiswa_keterangan`,`pps_mahasiswa_aktif`,`pps_mahasiswa_token`) values (1,101,1,'arysuryaw@gmail.com','e10adc3949ba59abbe56e057f20f883e','2010','1829101020','','I Made Subrata Sandhiyasa','bkv1.png','','2019-07-28','','','','','','Orang Tua','','','','','','','','','','','','','','','','Aktif','fSY3nP1-x9Q:APA91bEw3Fehgbjott826J8Tvv6clhID-fYWqEXhjMarLTM5Jc9vFyhmfnroSv3zClHx8HmfWPbe_hOdKMe7iH1MgRjc-h1prYI85nPa1RCn7JdJH134gvULO4FGU5W-0mqmDUrwa8Cw'),(2,101,3,'agusokagunawan@gmail.com','e10adc3949ba59abbe56e057f20f883e','2010','1234567898','','Oka Gunawan','bkv1.png','','2019-07-28','','','','','','Orang Tua','','','','','','','','','','','','','','','','Aktif','ebqJKN_ny6k:APA91bHPd5S-dQY9QJSDMQW2T5oR9YfB9mtYPHTpmJGBueMY_LuAR75HZSEjX6apDdAH4aX21z9iVITbaPyDnYRySXcOrrDYAu_YRB5QLt8CkMewW8Up9uNpyZ-WWQGglrYTPUvqy9J3'),(3,101,1,'dek@gmail.com','0acf03f408f90ea0dcba786d300620db','2017','12123',NULL,'I Made Subrata Sandhiyasa','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Aktif',NULL),(4,101,1,'dekaa@gmail.cok','202cb962ac59075b964b07152d234b70','2019','1234',NULL,'Oka Gunawan','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Aktif',NULL),(5,101,3,'dekaa@gmail.cok','202cb962ac59075b964b07152d234b70','2018','1234678',NULL,'Oka Gunawan','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Aktif',NULL),(11,101,1,'dek@gmail.com ','00c66aaf5f2c3f49946f15c1ad2ea0d3','2019','123455',NULL,'Oka Gunawan','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Tidak Aktif',NULL),(12,101,3,'sek','77963b7a931377ad4ab5ad6a9cd718aa','2018','123456789',NULL,'I Made Subrata Sandhiyasa','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Aktif',NULL),(13,101,3,'@dek','4297f44b13955235245b2497399d7a93','2017','123123',NULL,'I Made Subrata Sandhiyasa','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Tidak Aktif',NULL),(14,101,3,'ngurah@gmail.com','8946cf76c8165ef3ce0a7c15e9e9e495','2018','1829101053',NULL,'I Made Subrata Sandhiyasa','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Aktif',NULL),(15,101,3,'ifoets.seseber@gmail.com','aca4d8fd761d4711dc6ccf60c8a72c14','2017','14101097',NULL,'Oka Gunawan','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Aktif',NULL),(16,101,3,'dodickokta@gmail.com','26ea8a82f5cde77a98863786ed6ae0ec','2019','1829101047',NULL,'I Made Subrata Sandhiyasa','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Aktif',NULL),(17,101,3,'coba@coba.com','202cb962ac59075b964b07152d234b70','2018','123',NULL,'Oka Gunawan','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Tidak Aktif',NULL),(18,101,3,'gungtia73@yahoo.com','b2541b800de1560026b7ba94d7313920','2018','18001234',NULL,'I Made Subrata Sandhiyasa','bkv1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Orang Tua',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Aktif',NULL);

/*Table structure for table `pps_penelitian_log` */

DROP TABLE IF EXISTS `pps_penelitian_log`;

CREATE TABLE `pps_penelitian_log` (
  `pps_penelitian_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_penelitian_log_id_penelitian` int(11) NOT NULL,
  `pps_penelitian_log_tahapan` enum('Pengajuan Proposal','Proposal','Pra Tesis','Tesis','Wisuda') NOT NULL,
  `pps_penelitian_log_status` varchar(100) NOT NULL,
  `pps_penelitian_log_tanggal` datetime NOT NULL,
  `pps_penelitian_log_id_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`pps_penelitian_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `pps_penelitian_log` */

insert  into `pps_penelitian_log`(`pps_penelitian_log_id`,`pps_penelitian_log_id_penelitian`,`pps_penelitian_log_tahapan`,`pps_penelitian_log_status`,`pps_penelitian_log_tanggal`,`pps_penelitian_log_id_admin`) values (1,1,'Pengajuan Proposal','Pengajuan Proposal','2019-08-15 13:51:37',1),(2,1,'Pengajuan Proposal','Proposal Disetujui Maju ke Tahap Proposal','2019-08-17 13:52:21',1),(3,3,'Pengajuan Proposal','Anda mengajukan judul penelitian','2019-08-17 15:47:51',NULL),(4,3,'Pengajuan Proposal','Tahap Pengajuan Proposal : Lanjut ke Tahap Proposal','2019-08-17 16:07:20',NULL),(5,3,'Proposal','Tahap Kelayakan Proposal  : Sudah Terverifikasi','2019-08-17 16:27:44',1),(6,3,'Proposal','Tahap Ujian Proposal : Siap Ujian','2019-08-17 16:27:56',1),(9,3,'Proposal','Status Ujian Proposal : Terjadwal','2019-08-17 16:56:10',1),(10,3,'Proposal','Status Ujian Proposal : Lulus Ujian','2019-08-18 17:05:13',1),(11,3,'Proposal','Anda mengunggah dokumen revisi proposal','2019-08-18 17:06:07',NULL),(12,3,'Proposal','Tahap Revisi Proposal : Lanjut ke Tahap Pra Tesis','2019-08-18 17:29:20',1),(13,3,'Pra Tesis','Anda mengajukan pra tesis','2019-08-18 17:31:59',NULL),(14,3,'Pra Tesis','Tahap Kelayakan Pra Tesis  : Sudah Terverifikasi','2019-08-18 17:32:20',1),(15,3,'Pra Tesis','Tahap Ujian Pra Tesis : Siap Ujian','2019-08-18 17:32:34',1),(16,3,'Pra Tesis','Status Ujian Pra Tesis : Terjadwal','2019-08-18 17:33:34',1),(17,3,'Pra Tesis','Status Ujian Pra Tesis : Lulus Ujian','2019-08-18 17:34:02',1),(18,3,'Pra Tesis','Anda mengunggah dokumen revisi pra tesis','2019-08-18 17:36:40',NULL),(19,3,'Pra Tesis','Anda mengunggah dokumen revisi pra tesis','2019-08-18 17:51:08',NULL);

/*Table structure for table `pps_penelitian_mahasiswa` */

DROP TABLE IF EXISTS `pps_penelitian_mahasiswa`;

CREATE TABLE `pps_penelitian_mahasiswa` (
  `pps_penelitian_mahasiswa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_penelitian_mahasiswa_id_mahasiswa` int(11) NOT NULL,
  `pps_penelitian_mahasiswa_judul_penelitian` varchar(255) DEFAULT NULL,
  `pps_penelitian_mahasiswa_topik_penelitian` text,
  `pps_penelitian_mahasiswa_id_pembimbing_1` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_pembimbing_2` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_tanggal_pengajuan_upload` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_ringkasan_pengajuan` text,
  `pps_penelitian_mahasiswa_file_pengajuan` text,
  `pps_penelitian_mahasiswa_file_pengajuan_pendukung` text,
  `pps_penelitian_mahasiswa_status_verifikasi_pengajuan` enum('Belum Terverifikasi','Lanjut ke Tahap Proposal','Ditolak') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_pengajuan` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_pengajuan` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_catatan_pengajuan` text,
  `pps_penelitian_mahasiswa_tanggal_proposal_upload` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_ringkasan_proposal` text,
  `pps_penelitian_mahasiswa_file_proposal` text,
  `pps_penelitian_mahasiswa_file_proposal_persetujuan` text,
  `pps_penelitian_mahasiswa_file_proposal_pendukung` text,
  `pps_penelitian_mahasiswa_file_proposal_plagiarisme` text,
  `pps_penelitian_mahasiswa_verifikasi_proposal_kelayakan` enum('Belum Terverifikasi','Sudah Terverifikasi','Ditolak') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_proposal_kelayakan` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_proposal_kelayakan` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_verifikasi_proposal_ujian` enum('Belum Terverifikasi','Siap Ujian') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_proposal_ujian` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_proposal_ujian` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_status_proposal_ujian` enum('Belum Terjadwal','Terjadwal','Lulus Ujian','Tidak Lulus Ujian') DEFAULT 'Belum Terjadwal',
  `pps_penelitian_mahasiswa_file_proposal_revisi_daftar` text,
  `pps_penelitian_mahasiswa_file_proposal_revisi` text,
  `pps_penelitian_mahasiswa_file_proposal_revisi_persetujuan` text,
  `pps_penelitian_mahasiswa_file_proposal_revisi_pendukung` text,
  `pps_penelitian_mahasiswa_verifikasi_proposal_revisi` enum('Belum Terverifikasi','Lanjut ke Tahap Pra Tesis') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_proposal_revisi` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_proposal_revisi` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_catatan_proposal` text,
  `pps_penelitian_mahasiswa_tanggal_pratesis_upload` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_ringkasan_pratesis` text,
  `pps_penelitian_mahasiswa_file_pratesis` text,
  `pps_penelitian_mahasiswa_file_pratesis_persetujuan` text,
  `pps_penelitian_mahasiswa_file_pratesis_pendukung` text,
  `pps_penelitian_mahasiswa_file_pratesis_plagiarisme` text,
  `pps_penelitian_mahasiswa_verifikasi_pratesis_kelayakan` enum('Belum Terverifikasi','Sudah Terverifikasi','Ditolak') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_pratesis_kelayakan` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_pratesis_kelayakan` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_verifikasi_pratesis_ujian` enum('Belum Terverifikasi','Siap Ujian') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_pratesis_ujian` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_pratesis_ujian` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_status_pratesis_ujian` enum('Belum Terjadwal','Terjadwal','Lulus Ujian','Tidak Lulus Ujian') DEFAULT 'Belum Terjadwal',
  `pps_penelitian_mahasiswa_file_pratesis_revisi_daftar` text,
  `pps_penelitian_mahasiswa_file_pratesis_revisi` text,
  `pps_penelitian_mahasiswa_file_pratesis_revisi_persetujuan` text,
  `pps_penelitian_mahasiswa_file_pratesis_revisi_pendukung` text,
  `pps_penelitian_mahasiswa_verifikasi_pratesis_revisi` enum('Belum Terverifikasi','Lanjut ke Tahap Tesis') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_pratesis_revisi` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_pratesis_revisi` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_catatan_pratesis` text,
  `pps_penelitian_mahasiswa_tanggal_tesis_upload` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_ringkasan_tesis` text,
  `pps_penelitian_mahasiswa_file_tesis` text,
  `pps_penelitian_mahasiswa_file_tesis_persetujuan` text,
  `pps_penelitian_mahasiswa_file_tesis_pendukung` text,
  `pps_penelitian_mahasiswa_file_tesis_plagiarisme` text,
  `pps_penelitian_mahasiswa_verifikasi_tesis_kelayakan` enum('Belum Terverifikasi','Sudah Terverifikasi','Ditolak') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_tesis_kelayakan` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_tesis_kelayakan` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_verifikasi_tesis_ujian` enum('Belum Terverifikasi','Siap Ujian') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_tesis_ujian` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_tesis_ujian` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_status_tesis_ujian` enum('Belum Terjadwal','Terjadwal','Lulus Ujian','Tidak Lulus Ujian') DEFAULT 'Belum Terjadwal',
  `pps_penelitian_mahasiswa_file_tesis_revisi_daftar` text,
  `pps_penelitian_mahasiswa_file_tesis_revisi` text,
  `pps_penelitian_mahasiswa_file_tesis_revisi_persetujuan` text,
  `pps_penelitian_mahasiswa_file_tesis_revisi_pendukung` text,
  `pps_penelitian_mahasiswa_verifikasi_tesis_revisi` enum('Belum Terverifikasi','Lanjut ke Tahap Wisuda') DEFAULT 'Belum Terverifikasi',
  `pps_penelitian_mahasiswa_tanggal_verifikasi_tesis_revisi` datetime DEFAULT NULL,
  `pps_penelitian_mahasiswa_id_verifikator_tesis_revisi` int(11) DEFAULT NULL,
  `pps_penelitian_mahasiswa_catatan_tesis` text,
  `pps_penelitian_mahasiswa_status_penelitian` enum('Tahap Pengajuan','Tahap Proposal','Tahap Pra Tesis','Tahap Tesis','Tahap Wisuda') DEFAULT 'Tahap Pengajuan',
  `pps_penelitian_mahasiswa_aktif` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  PRIMARY KEY (`pps_penelitian_mahasiswa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `pps_penelitian_mahasiswa` */

insert  into `pps_penelitian_mahasiswa`(`pps_penelitian_mahasiswa_id`,`pps_penelitian_mahasiswa_id_mahasiswa`,`pps_penelitian_mahasiswa_judul_penelitian`,`pps_penelitian_mahasiswa_topik_penelitian`,`pps_penelitian_mahasiswa_id_pembimbing_1`,`pps_penelitian_mahasiswa_id_pembimbing_2`,`pps_penelitian_mahasiswa_tanggal_pengajuan_upload`,`pps_penelitian_mahasiswa_ringkasan_pengajuan`,`pps_penelitian_mahasiswa_file_pengajuan`,`pps_penelitian_mahasiswa_file_pengajuan_pendukung`,`pps_penelitian_mahasiswa_status_verifikasi_pengajuan`,`pps_penelitian_mahasiswa_tanggal_verifikasi_pengajuan`,`pps_penelitian_mahasiswa_id_verifikator_pengajuan`,`pps_penelitian_mahasiswa_catatan_pengajuan`,`pps_penelitian_mahasiswa_tanggal_proposal_upload`,`pps_penelitian_mahasiswa_ringkasan_proposal`,`pps_penelitian_mahasiswa_file_proposal`,`pps_penelitian_mahasiswa_file_proposal_persetujuan`,`pps_penelitian_mahasiswa_file_proposal_pendukung`,`pps_penelitian_mahasiswa_file_proposal_plagiarisme`,`pps_penelitian_mahasiswa_verifikasi_proposal_kelayakan`,`pps_penelitian_mahasiswa_tanggal_verifikasi_proposal_kelayakan`,`pps_penelitian_mahasiswa_id_verifikator_proposal_kelayakan`,`pps_penelitian_mahasiswa_verifikasi_proposal_ujian`,`pps_penelitian_mahasiswa_tanggal_verifikasi_proposal_ujian`,`pps_penelitian_mahasiswa_id_verifikator_proposal_ujian`,`pps_penelitian_mahasiswa_status_proposal_ujian`,`pps_penelitian_mahasiswa_file_proposal_revisi_daftar`,`pps_penelitian_mahasiswa_file_proposal_revisi`,`pps_penelitian_mahasiswa_file_proposal_revisi_persetujuan`,`pps_penelitian_mahasiswa_file_proposal_revisi_pendukung`,`pps_penelitian_mahasiswa_verifikasi_proposal_revisi`,`pps_penelitian_mahasiswa_tanggal_verifikasi_proposal_revisi`,`pps_penelitian_mahasiswa_id_verifikator_proposal_revisi`,`pps_penelitian_mahasiswa_catatan_proposal`,`pps_penelitian_mahasiswa_tanggal_pratesis_upload`,`pps_penelitian_mahasiswa_ringkasan_pratesis`,`pps_penelitian_mahasiswa_file_pratesis`,`pps_penelitian_mahasiswa_file_pratesis_persetujuan`,`pps_penelitian_mahasiswa_file_pratesis_pendukung`,`pps_penelitian_mahasiswa_file_pratesis_plagiarisme`,`pps_penelitian_mahasiswa_verifikasi_pratesis_kelayakan`,`pps_penelitian_mahasiswa_tanggal_verifikasi_pratesis_kelayakan`,`pps_penelitian_mahasiswa_id_verifikator_pratesis_kelayakan`,`pps_penelitian_mahasiswa_verifikasi_pratesis_ujian`,`pps_penelitian_mahasiswa_tanggal_verifikasi_pratesis_ujian`,`pps_penelitian_mahasiswa_id_verifikator_pratesis_ujian`,`pps_penelitian_mahasiswa_status_pratesis_ujian`,`pps_penelitian_mahasiswa_file_pratesis_revisi_daftar`,`pps_penelitian_mahasiswa_file_pratesis_revisi`,`pps_penelitian_mahasiswa_file_pratesis_revisi_persetujuan`,`pps_penelitian_mahasiswa_file_pratesis_revisi_pendukung`,`pps_penelitian_mahasiswa_verifikasi_pratesis_revisi`,`pps_penelitian_mahasiswa_tanggal_verifikasi_pratesis_revisi`,`pps_penelitian_mahasiswa_id_verifikator_pratesis_revisi`,`pps_penelitian_mahasiswa_catatan_pratesis`,`pps_penelitian_mahasiswa_tanggal_tesis_upload`,`pps_penelitian_mahasiswa_ringkasan_tesis`,`pps_penelitian_mahasiswa_file_tesis`,`pps_penelitian_mahasiswa_file_tesis_persetujuan`,`pps_penelitian_mahasiswa_file_tesis_pendukung`,`pps_penelitian_mahasiswa_file_tesis_plagiarisme`,`pps_penelitian_mahasiswa_verifikasi_tesis_kelayakan`,`pps_penelitian_mahasiswa_tanggal_verifikasi_tesis_kelayakan`,`pps_penelitian_mahasiswa_id_verifikator_tesis_kelayakan`,`pps_penelitian_mahasiswa_verifikasi_tesis_ujian`,`pps_penelitian_mahasiswa_tanggal_verifikasi_tesis_ujian`,`pps_penelitian_mahasiswa_id_verifikator_tesis_ujian`,`pps_penelitian_mahasiswa_status_tesis_ujian`,`pps_penelitian_mahasiswa_file_tesis_revisi_daftar`,`pps_penelitian_mahasiswa_file_tesis_revisi`,`pps_penelitian_mahasiswa_file_tesis_revisi_persetujuan`,`pps_penelitian_mahasiswa_file_tesis_revisi_pendukung`,`pps_penelitian_mahasiswa_verifikasi_tesis_revisi`,`pps_penelitian_mahasiswa_tanggal_verifikasi_tesis_revisi`,`pps_penelitian_mahasiswa_id_verifikator_tesis_revisi`,`pps_penelitian_mahasiswa_catatan_tesis`,`pps_penelitian_mahasiswa_status_penelitian`,`pps_penelitian_mahasiswa_aktif`) values (1,1,'EVALUASI DAN PENGEMBANGAN SISTEM INFORMASI KEMAJUAN AKADEMIK (SISKA) BERBASIS THINK ALOUD DAN USER EXPERIENCE','Pengembangan, Sistem Informasi',9,8,'2019-10-05 02:36:46','Sistem Informasi Kemajuan Akademik (SIsKA) yang sudah digunakan sejak tahun 2016 terbukti bisa membantu pengelola Program Studi Ilmu Komputer Program Pascasarjana Universitas Pendidikan Ganesha (Prodi Ilkom) untuk mengelola kemajuan akademik mahasiswa terkait penelitiannya. Pengelolaan penelitian mahasiswa dimulai dari tahapan pengajuan judul, proposal tesis hingga tahapan tesis (Indrawan, 2017). Pada rentang waktu 3 tahun penggunaannya, beberapa permasalahan-permasalahan SIsKA ditemukan oleh pengguna. Paramita (2018) dalam penelitiannya berhasil menemukan permasalahan terkait antarmuka SIsKA dengan memberikan rekomendasi perbaikan antarmuka berdasarkan evaluasi heuristik. Selain antarmuka sistem, beberapa fungsional sistem juga masih belum berjalan dengan maksimal yang berkonsekuensi langsung pada kualitas layanan SIsKA dalam pengelolaan penelitian mahasiswa pada Prodi Ilkom. Sehingga diperlukan evaluasi dan pengembangan lanjutan dari SIsKA agar bisa digunakan oleh pengguna dengan lebih efektif, efisien, dan memuaskan dalam ruang lingkup penggunanya (ISO 9241-11, 2018). Evaluasi usability merupakan salah satu metode evaluasi sistem yang berfokus mengevaluasi seberapa baik pengguna dapat belajar dan menggunakan sistem, juga merujuk pada seberapa puas pengguna dengan proses-proses pada sistem (usability.gov).','ff8f71ab484a04e709b6015eaba3b110.docx',NULL,'Lanjut ke Tahap Proposal','2019-10-05 02:38:14',1,'','2019-10-05 02:48:40','Sistem Informasi Kemajuan Akademik (SIsKA) yang sudah digunakan sejak tahun 2016 terbukti bisa membantu pengelola Program Studi Ilmu Komputer Program Pascasarjana Universitas Pendidikan Ganesha (Prodi Ilkom) untuk mengelola kemajuan akademik mahasiswa terkait penelitiannya. Pengelolaan penelitian mahasiswa dimulai dari tahapan pengajuan judul, proposal tesis hingga tahapan tesis (Indrawan, 2017). Pada rentang waktu 3 tahun penggunaannya, beberapa permasalahan-permasalahan SIsKA ditemukan oleh pengguna. Paramita (2018) dalam penelitiannya berhasil menemukan permasalahan terkait antarmuka SIsKA dengan memberikan rekomendasi perbaikan antarmuka berdasarkan evaluasi heuristik. Selain antarmuka sistem, beberapa fungsional sistem juga masih belum berjalan dengan maksimal yang berkonsekuensi langsung pada kualitas layanan SIsKA dalam pengelolaan penelitian mahasiswa pada Prodi Ilkom. Sehingga diperlukan evaluasi dan pengembangan lanjutan dari SIsKA agar bisa digunakan oleh pengguna dengan lebih efektif, efisien, dan memuaskan dalam ruang lingkup penggunanya (ISO 9241-11, 2018). Evaluasi usability merupakan salah satu metode evaluasi sistem yang berfokus mengevaluasi seberapa baik pengguna dapat belajar dan menggunakan sistem, juga merujuk pada seberapa puas pengguna dengan proses-proses pada sistem (usability.gov).','1a028519cffd696ed2841a44340cc7d3.docx','c6f8d639980b6287d6e9e5ba6da73d50.pdf',NULL,'d11ef64f6f3a3d08d815e4d6a09ee837.pdf','Sudah Terverifikasi','2019-10-05 02:50:09',1,'Siap Ujian','2019-10-05 09:50:27',1,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Wisuda','Tidak Aktif'),(2,2,'Intrusion Detection System (IDS) Untuk Mendeteksi Serangan DoS Menggunakan Metode Naive Bayes Pada Perangkat Internet of Things (IoT)','Hacking, Microcontroller',4,10,'2019-10-05 20:45:59','Metode yang digunakan dalam penelitian ini adalah dengan menggunakan Naive bayes. Penelitian menerapkan Snort sebagai IDS pada IoT. Penelitian ini dapat menunjukkan Snort memproses semua paket dan dirancang untuk perangkat dengan keterbatasan resource. IDS yang diajukan oleh penelitian ini adalah IDS yang dapat berjalan dengan batasan pada perangkat IoT. IDS juga tidak mengganggu proses aktivitas dan dapat diandalkan dengan menangani serangan DoS di IoT.','44d771ef3ae9bb34f2d8d24e39cf0dcf.docx',NULL,'Lanjut ke Tahap Proposal','2019-10-05 20:46:42',1,'','2019-10-05 20:48:53','Metode yang digunakan dalam penelitian ini adalah dengan menggunakan Naive bayes. Penelitian menerapkan Snort sebagai IDS pada IoT. Penelitian ini dapat menunjukkan Snort memproses semua paket dan dirancang untuk perangkat dengan keterbatasan resource. IDS yang diajukan oleh penelitian ini adalah IDS yang dapat berjalan dengan batasan pada perangkat IoT. IDS juga tidak mengganggu proses aktivitas dan dapat diandalkan dengan menangani serangan DoS di IoT.','7aeddfc36be9e660cd0cc09335cca09f.docx','7849b681b521998d579f6bc314143197.pdf',NULL,'09c41e2d718f54ea1a99dbb42f4ac639.pdf','Sudah Terverifikasi','2019-10-05 20:49:25',1,'Siap Ujian','2019-10-05 20:49:47',1,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Pra Tesis','Aktif'),(3,3,'PENERAPAN TEKNIK BACKPROPAGATION  DALAM PENGEMBANGAN TES BAKAT  VOKASIONAL ONLINE','Data Mining, Jaringan Syaraf Tiruan',5,9,'2019-10-05 20:55:56','Memperhatikan latar belakang yang telah dijabarkan, ada beberapa permasalahan yang muncul dalam penyelenggaraan pendidikan vokasi.\r\n1)	Minat siswa untuk memilih pendidikan vokasi meningkat tajam karena pemerintah menggalakkan pendidikan vokasi dalam upaya menghasilkan sumber daya manusia siap pakai. Mestinya, ada proses seleksi calon, sehingga yang terpilih adalah calon yang memiliki peluang lebih besar untuk sukses.  \r\n2)	Pihak orang tua atau wali siswa mestinya mendapatkan pertimbangan yang jelas tentang bakat anaknya, agar dapat menyarankan anaknya memasuki pendidikan vokasional.\r\n3)	Pihak sekolah “feeder” mestinya memiliki data yang otentik tentang bakat anak didiknya, agar dapat menyarankan anak didiknya memasuki pendidikan vokasional.\r\n4)	Tes masuk yang ada selama ini masih terbatas pemberlakuannya oleh pihak sekolah bersangkutan.\r\n5)	Akses ke berbagai lembaga yang menyiapkan tes bakat masih terbatas.  \r\n','6d164139c91762555c504c7fda03f62e.docx',NULL,'Lanjut ke Tahap Proposal','2019-10-05 21:02:13',1,'','2019-10-05 21:11:27','Memperhatikan latar belakang yang telah dijabarkan, ada beberapa permasalahan yang muncul dalam penyelenggaraan pendidikan vokasi.\r\n1)	Minat siswa untuk memilih pendidikan vokasi meningkat tajam karena pemerintah menggalakkan pendidikan vokasi dalam upaya menghasilkan sumber daya manusia siap pakai. Mestinya, ada proses seleksi calon, sehingga yang terpilih adalah calon yang memiliki peluang lebih besar untuk sukses.  \r\n2)	Pihak orang tua atau wali siswa mestinya mendapatkan pertimbangan yang jelas tentang bakat anaknya, agar dapat menyarankan anaknya memasuki pendidikan vokasional.\r\n3)	Pihak sekolah “feeder” mestinya memiliki data yang otentik tentang bakat anak didiknya, agar dapat menyarankan anak didiknya memasuki pendidikan vokasional.\r\n4)	Tes masuk yang ada selama ini masih terbatas pemberlakuannya oleh pihak sekolah bersangkutan.\r\n5)	Akses ke berbagai lembaga yang menyiapkan tes bakat masih terbatas.  \r\n','5d24d5413027868f9d8f556ca2ff986d.docx','47d3bca102553adfe05c20069ed7ff7d.pdf',NULL,'00bf0772e8b9fbd766dd5ee2f049fd0c.pdf','Sudah Terverifikasi','2019-10-05 21:13:33',1,'Siap Ujian','2019-10-05 21:13:51',1,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Proposal','Aktif'),(4,4,'DETEKSI KETERATURAN KELAS DENGAN METODE SUPPORT VECTOR MACHINE','Data Mining',2,9,'2019-10-05 21:17:57','Pemantauan kondisi kelas melalui video juga merupakan salah satu penerapan video yang dapat membantu guru untuk meninjau apakah kelas tersebut kondusif atau tidak. Data citra dan audio diambil melalui video, di mana masing-masing data diolah berdasarkan fitur masing-masing data. Tingkat keteraturan dan kebisingan kelas dapat mempengaruhi motivasi dan prestasi belajar siswa. Oleh karena itu pada penelitian ini mencoba menerapkan ekstraksi fitur citra dan suara menggunakan metode Ekstraksi Centroid dan MFCC serta melakukan klasifikasi terhadap ruang kelas yang kondusif atau tidak kondusif dengan metode SVM yang diambil melalui video yang terpasang di sebuah ruangan kelas.','bb9b8912d176ecf9a01d7d240ccd48e1.docx',NULL,'Lanjut ke Tahap Proposal','2019-10-05 21:18:36',1,'','2019-10-05 21:20:07','Pemantauan kondisi kelas melalui video juga merupakan salah satu penerapan video yang dapat membantu guru untuk meninjau apakah kelas tersebut kondusif atau tidak. Data citra dan audio diambil melalui video, di mana masing-masing data diolah berdasarkan fitur masing-masing data. Tingkat keteraturan dan kebisingan kelas dapat mempengaruhi motivasi dan prestasi belajar siswa. Oleh karena itu pada penelitian ini mencoba menerapkan ekstraksi fitur citra dan suara menggunakan metode Ekstraksi Centroid dan MFCC serta melakukan klasifikasi terhadap ruang kelas yang kondusif atau tidak kondusif dengan metode SVM yang diambil melalui video yang terpasang di sebuah ruangan kelas.','f8518dbca07087d5cb062bab99e310d5.docx','967e416cf8081ce478dc8232e37c3f23.pdf',NULL,'08b94d1e053cd3964c91ed97813562b5.pdf','Sudah Terverifikasi','2019-10-05 21:23:20',1,'Siap Ujian','2019-10-05 21:23:36',1,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Pengajuan','Aktif'),(5,5,'Evaluasi User Experience Pada Aplikasi E-Rapot Menggunakan Cognitive Walkthrough (WC), Heuristic Evaluation (HE) dan User Experience Quistionneir (UEQ)','Evaluation, User Experience',6,9,'2019-10-05 21:31:44','Berdasarkan uraian tersebut, maka dalam penelitian ini evaluasi pada Aplikasi E-Rapot dilakukan dengan Cognitive Walkthrough, Heuristic Evaluation Dan User Experience Quistionneir (UEQ). Teknik evaluasi Cognitive Walkthrough dan Heuristic Evaluation digunakan untuk mengevaluasi tampilan antarmuka Aplikasi E-Rapot, sedangkan UEQ digunakan untuk mengukur aspek pengalaman pengguna terhadap Aplikasi E-Rapot. Hasil penelitian ini nantinya dapat dijadikan saran atau acuan bagi tim pengembang Aplikasi E-Rapot untuk memperbaiki kualitas sistem, yaitu pada aspek tampilan antarmuka dan pengalaman pengguna.','3075d86bb7c3ace2520006e0f1ca52e5.docx',NULL,'Lanjut ke Tahap Proposal','2019-10-05 21:32:25',1,'','2019-10-05 21:33:28','Berdasarkan uraian tersebut, maka dalam penelitian ini evaluasi pada Aplikasi E-Rapot dilakukan dengan Cognitive Walkthrough, Heuristic Evaluation Dan User Experience Quistionneir (UEQ). Teknik evaluasi Cognitive Walkthrough dan Heuristic Evaluation digunakan untuk mengevaluasi tampilan antarmuka Aplikasi E-Rapot, sedangkan UEQ digunakan untuk mengukur aspek pengalaman pengguna terhadap Aplikasi E-Rapot. Hasil penelitian ini nantinya dapat dijadikan saran atau acuan bagi tim pengembang Aplikasi E-Rapot untuk memperbaiki kualitas sistem, yaitu pada aspek tampilan antarmuka dan pengalaman pengguna.','425599031456c621d076f1bdadbdd4bd.docx','bc0a16667dce6617adceca46214c98f1.pdf',NULL,'26e17a88fb75b5d28d7dbbe7ccb36361.pdf','Sudah Terverifikasi','2019-10-05 21:33:57',1,'Siap Ujian','2019-10-05 21:34:25',1,'Lulus Ujian','b18a3038217c9445c6f3079f0ffaa330.pdf','7f2fb1a2686f3f14683a5a2a2453a5f5.docx','0ad1e57034677012dd056151047668ce.pdf',NULL,'Lanjut ke Tahap Pra Tesis','2019-10-05 21:35:38',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Pra Tesis','Tidak Aktif'),(6,6,'PREDIKSI PEMILIHAN PEMINATAN KOMPETENSI KEAHLIAN SISWA SMK DENGAN JARINGAN SYARAF TIRUAN MENGGUNAKAN  ALGORITMA BACKPROPAGATION','Data Mining, Jaringan Syaraf Tiruan',5,2,'2019-10-05 21:53:13','Berdasarkan latar belakang diatas, penelitian akan mengusulkan menggunakan metode backparagation neural network untuk membantu dalam mendukung keputusan pemilihan kompetensi keahlian siswa. Metode tersebut digunakan setelah melihat perbandingan akurasi dari 4 metode lainnya yang digunakan dalam prediksi pemilihan Kompetensi Keahlian.','9c6de9aa35669d869e48628080da8daa.pdf','65a54e141e34e1227b6406e452641121.pdf','Lanjut ke Tahap Proposal','2019-10-05 21:54:14',1,'','2019-10-05 21:55:24','Berdasarkan latar belakang diatas, penelitian akan mengusulkan menggunakan metode backparagation neural network untuk membantu dalam mendukung keputusan pemilihan kompetensi keahlian siswa. Metode tersebut digunakan setelah melihat perbandingan akurasi dari 4 metode lainnya yang digunakan dalam prediksi pemilihan Kompetensi Keahlian.','46eeaeb3a847cc3f5488f91a1993eee9.pdf','ec64b30531ddd116fc1ff0cc26fa809e.pdf',NULL,'f211156975141e5fa63b9a43b9e3cc62.pdf','Sudah Terverifikasi','2019-10-05 21:55:49',1,'Siap Ujian','2019-10-05 21:55:58',1,'Lulus Ujian','20885d2d050c3adb57ab40731264a94f.pdf','badb7b2a0a2dac43ee1d8d08c1e5f665.pdf','7ffe815d2f98ab999957c07d548b8eee.pdf',NULL,'Lanjut ke Tahap Pra Tesis','2019-10-05 21:57:29',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Tesis','Aktif'),(7,7,'ANALISIS DATA AKADEMIK MAHASISWA MENGGUNAKAN PENGEMBANGAN ALGORITMA  KLASTER DINAMIS PADA K-MEANS (STUDI KASUS: UNIVERSITAS PENDIDIKAN GANESHA) ','Data Mining',2,5,'2019-10-05 22:32:55','Berdasarkan hal tersebut, metode klastering K-Means dikolaborasikan dengan metode pendekatan untuk penentuan pusat awal cluster dan diharapkan dapat mengurangi waktu komputasi untuk dataset yang besar. Metode yang akan dicoba diterapkan dalam penelitian ini adalah menggunakan inisiasi centroid metode mean. Kinerja dari algoritma pengelompokan ini dibandingkan dalam hal kemurnian, menormalkan informasi timbal balik dan waktu diambil untuk membentuk sebuah cluster. Data akademik yang dikumpulkan dikelompokkan sesuai dengan karakteristik mereka yang serupa dan membentuk klaster. Melalui penerapan education data mining (EDM) pengetahuan yang ditemukan dapat digunakan untuk lebih memahami prestasi akademik mahasiswa selama mengikuti perkuliahan di Universitas Pendidikan Ganesha, untuk membantu instruktur dalam meningkatkan pengajaran, mengevaluasi dan meningkatkan sistem pembelajaran, meningkatkan kinerja akademik mahasiswa, serta menyesuaikan kurikulum pembelajaran dan banyak manfaat lainnya.','b32c1af20b3a546124a3324b00b86588.pdf',NULL,'Lanjut ke Tahap Proposal','2019-10-05 22:33:24',1,'','2019-10-05 22:34:38','Berdasarkan hal tersebut, metode klastering K-Means dikolaborasikan dengan metode pendekatan untuk penentuan pusat awal cluster dan diharapkan dapat mengurangi waktu komputasi untuk dataset yang besar. Metode yang akan dicoba diterapkan dalam penelitian ini adalah menggunakan inisiasi centroid metode mean. Kinerja dari algoritma pengelompokan ini dibandingkan dalam hal kemurnian, menormalkan informasi timbal balik dan waktu diambil untuk membentuk sebuah cluster. Data akademik yang dikumpulkan dikelompokkan sesuai dengan karakteristik mereka yang serupa dan membentuk klaster. Melalui penerapan education data mining (EDM) pengetahuan yang ditemukan dapat digunakan untuk lebih memahami prestasi akademik mahasiswa selama mengikuti perkuliahan di Universitas Pendidikan Ganesha, untuk membantu instruktur dalam meningkatkan pengajaran, mengevaluasi dan meningkatkan sistem pembelajaran, meningkatkan kinerja akademik mahasiswa, serta menyesuaikan kurikulum pembelajaran dan banyak manfaat lainnya.','3921aa040a4de5aab2a9aa4a1a95c2f6.pdf','af891e50782752ca1866ea65a43e1209.pdf',NULL,'62873bb791e0e4da43336c24daefe6a7.pdf','Sudah Terverifikasi','2019-10-05 22:35:39',1,'Siap Ujian','2019-10-05 22:35:55',1,'Lulus Ujian','743be0e171727e4c36c5bb9593b2955b.pdf','627eab1daa665aa1657dbf03ce376b67.pdf','9e819b08f206f54776889bf4c2e9971a.pdf',NULL,'Lanjut ke Tahap Pra Tesis','2019-10-05 22:37:17',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Pra Tesis','Aktif'),(8,8,'ANALISIS TINGKAT PUBLIKASI DATA PRIBADI SENSITIF MASYARAKAT PADA SITUS RESMI KOMISI PEMILIHAN UMUM','Big Data',4,3,'2019-10-05 22:54:09','Berdasarkan latar belakang yang telah dijabarkan sebelumnya maka dapat diidentifikasi permasalahan yang ada, antara lain:\r\n1)	Dalam hal publikasi data pribadi masyarakat, masih ada pemilik data atau pengelola situs resmi KPU di Provinsi maupun Kabupaten/ Kota yang kurang menyadari akan pentingnya menjaga dan melindungi data pribadi masyarakat yang dipublikasikan di internet. Mana data yang bisa dipublikasi dan mana yang tidak.\r\n2)	Melalui mesin pencari, web crawling maupun melakukan pencarian langsung ke situs resmi KPU memberikan kesempatan yang besar kepada seseorang untuk memperoleh data pribadi masyarakat dengan cepat dan mudah. Hal ini disebabkan karena tidak adanya kesepakatan dan keseragaman dalam melakukan publikasi data pribadi masyarakat antara KPU pusat dengan daerah. Sehingga memberikan celah yang besar bagi pihak tertentu dalam memperoleh data pribadi masyarakat untuk kepentingan tertentu.\r\n3)	Belum adanya keseragaman dan kepatuhan penerapan aturan yang ada berkaitan dengan publikasi data pribadi yang dilakukan oleh KPU. Hal ini dilihat dari masih adanya situs-situs resmi KPU Provinsi maupun Kabupaten/ Kota yang masih melakukan publikasi data pribadi masyarakat tanpa mempertimbangkan aturan yang ada seperti UU No. 23 Tahun 2006 Tentang Administrasi Kependudukan maupun Peraturan Menteri Komunikasi dan Informatika Nomor 20 Tahun 2016 tentang Perlindungan Data Pribadi dalam Sistem Elektronik.\r\n','24cebd07ca7bef581a97bf54c6bd4edf.docx',NULL,'Lanjut ke Tahap Proposal','2019-10-05 22:54:32',1,'','2019-10-05 22:55:19','Berdasarkan latar belakang yang telah dijabarkan sebelumnya maka dapat diidentifikasi permasalahan yang ada, antara lain:\r\n1)	Dalam hal publikasi data pribadi masyarakat, masih ada pemilik data atau pengelola situs resmi KPU di Provinsi maupun Kabupaten/ Kota yang kurang menyadari akan pentingnya menjaga dan melindungi data pribadi masyarakat yang dipublikasikan di internet. Mana data yang bisa dipublikasi dan mana yang tidak.\r\n2)	Melalui mesin pencari, web crawling maupun melakukan pencarian langsung ke situs resmi KPU memberikan kesempatan yang besar kepada seseorang untuk memperoleh data pribadi masyarakat dengan cepat dan mudah. Hal ini disebabkan karena tidak adanya kesepakatan dan keseragaman dalam melakukan publikasi data pribadi masyarakat antara KPU pusat dengan daerah. Sehingga memberikan celah yang besar bagi pihak tertentu dalam memperoleh data pribadi masyarakat untuk kepentingan tertentu.\r\n3)	Belum adanya keseragaman dan kepatuhan penerapan aturan yang ada berkaitan dengan publikasi data pribadi yang dilakukan oleh KPU. Hal ini dilihat dari masih adanya situs-situs resmi KPU Provinsi maupun Kabupaten/ Kota yang masih melakukan publikasi data pribadi masyarakat tanpa mempertimbangkan aturan yang ada seperti UU No. 23 Tahun 2006 Tentang Administrasi Kependudukan maupun Peraturan Menteri Komunikasi dan Informatika Nomor 20 Tahun 2016 tentang Perlindungan Data Pribadi dalam Sistem Elektronik.\r\n','0afbdacb61c4e013b4e293d249cb2b9c.docx','56b1b3b4efd5b73194d91fe8a218e1d2.PDF',NULL,'70465b48ec43a4dc750a06ffe0207f0c.PDF','Sudah Terverifikasi','2019-10-05 22:56:08',1,'Siap Ujian','2019-10-05 22:56:25',1,'Lulus Ujian','41ef88a3465fd80daceb1d3b978a6864.PDF','ec226dcd40b0710aa964ab70990207b2.docx','a70c1ce92698de5bd0e64cffd5dc2333.PDF',NULL,'Lanjut ke Tahap Pra Tesis','2019-10-05 22:57:42',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Pengajuan','Aktif'),(9,9,'Capability Level Sistem Informasi Pengelolaan Keuangan Daerah (sipkd) Pada Pemerintah Kota Denpasar','Evaluation',6,4,'2019-10-05 23:04:37','Berdasarkan apa yang telah diuraikan pada latar belakang masalah di atas, maka dapat diidentifikasi beberapa permasalahan yang ada di Pemerintah Kota Denpasar khususnya pada Sistem Informasi Pengelola Keungan Daerah (SIPKD) diantaranya :\r\n1.	Sistem yang sering error ketika dijalankan. \r\n2.	Perangkat atau device yang digunakan untuk mengoperasikan sistem masih ada beberapa yang memiliki spesifikasi rendah.\r\n3.	Bandwidth yang terbatas meyebabkan sistem tidak dapat diakses secara bersamaan.\r\n4.	Belum pernah diadakan audit tata kelola teknologi informasi pada Pemerintah Kota Denpasar khususnya pada Sistem Informasi Pengelola Keuangan Daerah (SIPKD) yang selama ini berjalan sampai sekarang.\r\n5.	Pengukuran tingkat kapabilitas tata kelola teknologi informasi dalam proses kerja instansi Pemerintah Kota Denpasar.  \r\n6.	Model Framework Control Objective for Information and Related Technology (COBIT 5) cocok dalam pengukuran tingkat kapabilitas audit tata kelola teknologi informasi yang akan dilakukan pada Pemerintah Kota Denpasar.\r\n7.	Adanya pembaharuan untuk sumber daya manusianya yang dikarenakan adanya mutasi pegawai negeri sipil di lingkungan Pemerintah Kota Denpasar.\r\n8.	Kurangnya bimbingan teknis Sistem Informasi Pengelola Keuangan Daerah (SIPKD) selama ini hanya bimbingan teknis penyusunan laporan keuangan yang akan diinputkan ke SIPKD oleh operator SIPKD pada masing-masing OPD Pemerintah Kota Denpasar.\r\n9.	Suasana kerja yang kurang kondusif dimana dengan sistem yang sering error mengakibatkan belanja yang dilakukan jadi terhambat.\r\n10.	Adanya sentimen antar pegawai yang muncul karena ada pegawai yang kurang bertanggungjawab terhadap pekerjaannya. Sehingga pegawai yang rajin menjadi jengkel.\r\n11.	Di tempat-tempat tertentu, budaya organsisasi sudah berjalan bagus. Hal ini ditandai dengan adanya saling menghormati dan kerja sama antar pegawai negeri sipil di lingkungan Pemerintah Kota Denpasar.','6ca4cf2a5314d9b92b6b0d5e0ab111b3.docx',NULL,'Lanjut ke Tahap Proposal','2019-10-05 23:05:48',1,'','2019-10-05 23:06:39','Berdasarkan apa yang telah diuraikan pada latar belakang masalah di atas, maka dapat diidentifikasi beberapa permasalahan yang ada di Pemerintah Kota Denpasar khususnya pada Sistem Informasi Pengelola Keungan Daerah (SIPKD) diantaranya :\r\n1.	Sistem yang sering error ketika dijalankan. \r\n2.	Perangkat atau device yang digunakan untuk mengoperasikan sistem masih ada beberapa yang memiliki spesifikasi rendah.\r\n3.	Bandwidth yang terbatas meyebabkan sistem tidak dapat diakses secara bersamaan.\r\n4.	Belum pernah diadakan audit tata kelola teknologi informasi pada Pemerintah Kota Denpasar khususnya pada Sistem Informasi Pengelola Keuangan Daerah (SIPKD) yang selama ini berjalan sampai sekarang.\r\n5.	Pengukuran tingkat kapabilitas tata kelola teknologi informasi dalam proses kerja instansi Pemerintah Kota Denpasar.  \r\n6.	Model Framework Control Objective for Information and Related Technology (COBIT 5) cocok dalam pengukuran tingkat kapabilitas audit tata kelola teknologi informasi yang akan dilakukan pada Pemerintah Kota Denpasar.\r\n7.	Adanya pembaharuan untuk sumber daya manusianya yang dikarenakan adanya mutasi pegawai negeri sipil di lingkungan Pemerintah Kota Denpasar.\r\n8.	Kurangnya bimbingan teknis Sistem Informasi Pengelola Keuangan Daerah (SIPKD) selama ini hanya bimbingan teknis penyusunan laporan keuangan yang akan diinputkan ke SIPKD oleh operator SIPKD pada masing-masing OPD Pemerintah Kota Denpasar.\r\n9.	Suasana kerja yang kurang kondusif dimana dengan sistem yang sering error mengakibatkan belanja yang dilakukan jadi terhambat.\r\n10.	Adanya sentimen antar pegawai yang muncul karena ada pegawai yang kurang bertanggungjawab terhadap pekerjaannya. Sehingga pegawai yang rajin menjadi jengkel.\r\n11.	Di tempat-tempat tertentu, budaya organsisasi sudah berjalan bagus. Hal ini ditandai dengan adanya saling menghormati dan kerja sama antar pegawai negeri sipil di lingkungan Pemerintah Kota Denpasar.','e90295c5c024652cf620a4a51ccac69c.docx','55932fc3025a47ae32433563328d3f3a.pdf',NULL,'66a3d5c80229e795e5fdeb9fe0c8304a.pdf','Sudah Terverifikasi','2019-10-05 23:07:05',1,'Siap Ujian','2019-10-05 23:07:25',1,'Lulus Ujian','dac4a1e7cffb4028b37b35400e391947.pdf','169c5a927e88a2117701188465e52859.docx','e0fbadcdfe3010ca8dfdf8fc4cb42676.pdf',NULL,'Lanjut ke Tahap Pra Tesis','2019-10-05 23:08:45',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Pra Tesis','Tidak Aktif'),(10,10,'PENGEMBANGAN SISTEM INFORMASI PUSKESMAS BERBASIS MOBILE DENGAN METODE FEATURE-ORIENTED SOFTWARE DEVELOPMENT (STUDI KASUS PUSKESMAS KUTA UTARA)','Evaluation',6,5,'2019-10-06 01:36:23','Salah satu metode untuk mengembangkan perangkat lunak yaitu FOSD (Feature-Oriented Software Development). Menurut Sven Apel (2009) FOSD adalah metode yang mendukung aplikasi sistematis dari konsep fitur dalam semua tahap dari siklus hidup perangkat lunak. Dalam metode FOSD terdapat tahapan-tahapan yang berurutan dimulai dari Analisis Domain, Desain Domain dan Spesifikasi, Implementasi Domain, serta Konfigurasi Produk dan Generasi. Dasar dari metode FOSD ini adalah memecah atau menguraikan sebuah software menjadi beberapa bagian berdasarkan fitur yang disediakan oleh software tersebut. Tujuan dari penguraian tersebut untuk membangun perangkat lunak yang terstruktur dengan baik dan dapat disesuaikan dengan skenario kebutuhan pengguna. Metode FOSD pada dasarnya bertujuan untuk mengatur structure, reuse, dan variation dalam pengenbangan perangkat lunak. Oleh karena itu metode FOSD cocok digunakan untuk mengembangkan aplikasi mobile rekam medis Puskemas Kuta Utara berdasarkan dari sistem yang sudah ada.','a06d16ea04f1ff9eed4c99f72904fed9.docx',NULL,'Lanjut ke Tahap Proposal','2019-10-06 01:36:51',1,'','2019-10-06 01:37:39','Salah satu metode untuk mengembangkan perangkat lunak yaitu FOSD (Feature-Oriented Software Development). Menurut Sven Apel (2009) FOSD adalah metode yang mendukung aplikasi sistematis dari konsep fitur dalam semua tahap dari siklus hidup perangkat lunak. Dalam metode FOSD terdapat tahapan-tahapan yang berurutan dimulai dari Analisis Domain, Desain Domain dan Spesifikasi, Implementasi Domain, serta Konfigurasi Produk dan Generasi. Dasar dari metode FOSD ini adalah memecah atau menguraikan sebuah software menjadi beberapa bagian berdasarkan fitur yang disediakan oleh software tersebut. Tujuan dari penguraian tersebut untuk membangun perangkat lunak yang terstruktur dengan baik dan dapat disesuaikan dengan skenario kebutuhan pengguna. Metode FOSD pada dasarnya bertujuan untuk mengatur structure, reuse, dan variation dalam pengenbangan perangkat lunak. Oleh karena itu metode FOSD cocok digunakan untuk mengembangkan aplikasi mobile rekam medis Puskemas Kuta Utara berdasarkan dari sistem yang sudah ada.','fc0f815842bacc61115f9211be20cedf.docx','c112308188cb9af8e1efdca62cbec9c2.pdf',NULL,'b151c4ecd44f1321df98122d38d73b8f.pdf','Sudah Terverifikasi','2019-10-06 01:38:11',1,'Siap Ujian','2019-10-06 01:39:15',1,'Lulus Ujian','d61c44a081cd9e61e96e3a0eeea41bad.pdf','b7a5a2384a0cbe3014544a3405fdadc4.docx','8398ce7a9ce543a4a2c14c529371aae3.pdf',NULL,'Lanjut ke Tahap Pra Tesis','2019-10-06 01:40:06',1,NULL,'2019-10-06 01:43:32','Puskesmas adalah unit pelaksana teknis dinas kabupaten/kota yang bertanggungjawab menyelenggarakan pembangunan kesehatan di suatau wilayah kerja. Untuk meningkatkan tertib administrasi sebuah puskesmas sebaiknya ditunjang dengan sistem untuk mengelola rekam medis pasien. Pada Puskesmas Kuta Utara data rekam medis sudah dikelola menggunakan sebuah sistem informasi berbasis web application. Sebagian besar pengguna pasien mengakses sistem melaui smartphone sedangkan tampilan antarmuka dari sistem ini tidak optimal jika diakses malalui smartphone seperti tombol pada aplikasi tertutup oleh elemen antar muka yang lain, ukuran gambar yang melebihi layar smartphone. Untuk itu, dilakukan pengembangan sistem informasi puskesmas berbasis mobile dari sistem yang sudah ada. Untuk mengembangkan sistem tersebut akan diterapkan metode Feature-Oriented Software Development (FOSD). Metode FOSD memiliki tahap analisis domain, desain domain dan spesifikasi, impelementasi domain, konfigurasi produk dan generasi. Pada tahap analisis domain akan menghasilkan analisis kebutuhan kemudian dilanjutkan pada tahap desain domain dan spesifikasi analisis kebutuhan akan diproses menjadi desain sistem. Pada tahap implementasi domain desain sistem akan diimplementasikan menjadi prototipe. Pada tahap konfigurasi produk dan generasi prototipe sistem akan diuji dengan metode black box dan running time. Pengujian black box dilakukan untuk menganalisa apakah hasil yang ditampilkan oleh sistem sudah sesuai dengan skenario pengujian. Metode pengujian running time dilakukan untuk mengetahui seberapa cepat sistem dalam memproses perintah yang diberikan oleh pengguna. Pada pengujian black box sistem yang dikembangkan, menghasilkan output sesuai dengan yang diharapkan dari skenario pengujian sedangkan pada pengujian running time, sistem yang dikembangkan menunjukan hasil 49% lebih cepat dalam mengeksekusi perintah daripada sistem yang digunakan sebagai sampel.','114ee55a9fff8cc4baf9c22d26d70a6a.docx','be44a9727a72505a89cefeba5d4ea0ba.pdf',NULL,'e512f3ccdf3b536daf85195614c67040.pdf','Sudah Terverifikasi','2019-10-06 01:44:19',1,'Siap Ujian','2019-10-06 01:44:32',1,'Lulus Ujian','32f47c683118fae7aa391efb946019a4.pdf','53ce30b0935c5706f2dfe0c8eb5c8a3a.docx','6e002d38ce907c1fc56ba10a43eb95a4.pdf',NULL,'Lanjut ke Tahap Tesis','2019-10-06 01:45:47',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terverifikasi',NULL,NULL,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Tesis','Aktif'),(11,11,'AKUISISI DATA PENGGUNAAN DAYA LISTRIK SEBAGAI IMPLEMENTASI INTERNET OF THINGS PADA RUMAH CERDAS','Microcontroller',4,11,'2019-10-06 01:50:26','Sistem platform yang dirancang sangat dinamis untuk mendukung segala perangkat modul yang dapat terhubung dengan broker dan server. Platform yang dibangun lebih berfokus pada proses manajemen data, proses konfigurasi sistem ataupun modul dan standarisasi perangkat elektronik serta perhitungannya untuk menentukan apakah alat elektronik rumah dalam keadaan normal atau tidak normal berdasarkan perbandingan nilai setpoint dengan pemakaian energi perangkat tersebut dan perhitungan keakurasian pemakaian alat elektronik untuk memberikan peringatan bila penggunaan energi listrik melebihi batas pemakaian.','cb4c669a0c6231d3c7d04398a7288c37.PDF',NULL,'Lanjut ke Tahap Proposal','2019-10-06 01:51:31',1,'','2019-10-06 01:53:07','Sistem platform yang dirancang sangat dinamis untuk mendukung segala perangkat modul yang dapat terhubung dengan broker dan server. Platform yang dibangun lebih berfokus pada proses manajemen data, proses konfigurasi sistem ataupun modul dan standarisasi perangkat elektronik serta perhitungannya untuk menentukan apakah alat elektronik rumah dalam keadaan normal atau tidak normal berdasarkan perbandingan nilai setpoint dengan pemakaian energi perangkat tersebut dan perhitungan keakurasian pemakaian alat elektronik untuk memberikan peringatan bila penggunaan energi listrik melebihi batas pemakaian.','99d7e31b6a6bb40140567ad51fd461f9.pdf','e6587d380f4bf00091439a6772330851.PDF',NULL,'ec2ea2d4b9979a6c5014a65eae353f4a.PDF','Sudah Terverifikasi','2019-10-06 01:53:29',1,'Siap Ujian','2019-10-06 01:53:44',1,'Lulus Ujian','4b3f92229175640680520455ad2f3492.PDF','c0f98c0277bb29ee695e4d4702b8a1a2.pdf','cd1fcaba0277a56f1118f132b40caeec.PDF',NULL,'Lanjut ke Tahap Pra Tesis','2019-10-06 01:56:23',1,NULL,'2019-10-06 01:59:41','Penelitian ini bertujuan untuk mengimplementasikan modul dalam kehidupan sehari-hari agar dapat dikelola secara komputerisasi dengan menghubungkannya kedalam sebuah jaringan sehingga dapat berkomunikasi dengan beberapa sensor. Dalam penelitian ini, peneliti menerapkan teknologi Internet of Things (IoT) agar objek – objek elekronik yang bersifat fisik dapat memberikan informasi dan menyimpan data melalui jaringan internet. Secara teknis artinya mengintegrasikan perangkat keras dengan perangkat lunak dimana menggunakan berbagai teknologi seperti protokol Message Queuing Telemetry Transport (MQTT), sistem database, dan cloud computing. Dalam perancangannya, peneliti membuat sebuah platform yang mempunyai fitur diantaranya terdapat pendataan modul, proses mengkonfigurasi sistem maupun modul, terdapat proses menghitung yang nantinya akan digunakan untuk menentukan apakah alat elekronik rumah dalam keadaan normal atau tidak normal melalui penggunaan energinya. Hasil pengujian proses transmitter dan receiver menggunakan protokol MQTT dapat dilakukan secara realtime dan datanya berhasil tersimpan di dalam database. Selanjutnya pada pengujian untuk mengetahui kondisi perangkat elekronik digunakan nilai real (dengan kilometer milik PT. PLN) sebagai pembanding antara jumlah nilai yang didapatkan dari pengukuran penggunaan energi perangkat tersebut dimana, hasil yang diperoleh dari perbandingan keduanya dapat menentukan perangkat tersebut dalam keadaan normal ataupun tidak normal. Sedangkan pengujian fungsi pada antarmuka web untuk kontrol dan monitoring sudah sesuai dengan skenario yang diinginkan. Berdasarkan hasil penelitian ini dapat disimpulkan, bahwa teknologi IoT dapat menampilkan pemakaian energi pada objek-objek tersebut secara realtime menggunakan protokol MQTT. Dengan demikian, masing-masing objek diperlukan pembuatan modulnya serta proses autentikasi dengan broker maupun server untuk mendapatkan hak akses melakukan komunikasi. Dengan adanya perangkat ini dapat memberikan kita kemudahan mengenai pengetahuan pemakaian atau biaya yang kita keluarkan untuk masing-masing objeknya. Pada penelitian selanjutnya peneliti berharap dapat menggunakan parameter lingkungan sekitar dari perangkat elekronik yang diuji untuk menetukan kondisi perangkat tersebut. Selain hal itu, peneliti juga berharap konsep IoT ini bisa dipakai dalam mengembangkan sistem smartcity.','72240f0c6819567c2851e3fbae8fc95e.docx','c6111fe3d5439b38541785a487a2967b.pdf',NULL,'11fe6acbf3a9e288f015d4f0f20eab8b.pdf','Sudah Terverifikasi','2019-10-06 02:00:01',1,'Siap Ujian','2019-10-06 02:00:19',1,'Lulus Ujian','c7414f580d3962a7c5a19fbef49663bb.pdf','a07473e13d476ff6c57c3a783d07157d.docx','6f9b0d1c06a7ace6be5ce66b330b90b4.pdf',NULL,'Lanjut ke Tahap Tesis','2019-10-06 02:01:55',1,NULL,'2019-10-06 02:25:04','Pada sebuah kutipan dari Data Outlook Energi Indonesia 2014, menjelaskan pada tahun 2012 menunjukkan pangsa terbesar penggunaan energi adalah sektor industri (34,8%) diikuti oleh sektor rumah tangga (30,7%), transportasi (28,8%), komersil (3,3%) dan lainnya (2,4%). Dengan adanya kutipan tersebut maka terdapat beberapa peneliti yang melakukan penelitian diantaranya Agus Surinanto (2018), merancang sebuah prototipe yang dapat mengirim serta menampilkan data penggunaan daya listrik secara realtime dan dapat diakses secara online, serta penelitian yang dilakukan oleh Agus Ady Aryanto (2018), yang merancang sebuah prototipe yang memiliki fitur seperti pendaftaran modul, proses manajemen data, proses konfigurasi sistem, serta proses perhitungan dengan menggunakan nilai setpoint untuk menentukan alat elektronik rumah dalam keadaan normal atau tidak normal. Pada penelitian ini merupakan penelitian yang memperbaiki dan penambahkan menu/fitur yang tidak ada pada penelitian sebelumnya, diantaranya penambahan menu cetak laporan, menampilkan penjelasan dari nilai/jumlah penggunaan energi listrik dan perbaikan proses perhitungan menggunakan nilai kondisi statis. Dalam perancangan perangkat keras menggunakan Node MCU ESP8266 dan Raspberry, sedangkan secara teknis pengintegrasian perangkat keras dengan perangkat lunak dapat menggunakan berbagai teknologi seperti protokol Message Queuing Telemetry Transport (MQTT), sistem database, dan cloud computing. Penggunaan protokol MQTT dalam pengujian proses dapat dilakukan secara realtime dengan hasil data tersimpan dalam database. Dengan hasil pengujian terlihat 15% selisih yang dihasilkan dari data yang masuk ke tersimpan. Nilai selisih tersebut terdapat pada pengujian elektronik magicon yaitu pada nilai -9% dan elektronik kulkas dengan selisih 7%. Hasil pengujian ini dapat disebabkan karena jaringan internet yang digunakan saat pengiriman dan penerimaan data tidak stabil atau disebabkan karena masa pemakaian elektronik yang telah mencapai 3 tahun. Dengan adanya perangkat ini dapat memberikan kita kemudahan mengenai pengetahuan pemakaian untuk masing-masing elektronik. Pada penelitian selanjutnya peneliti berharap dapat menambahkan proses shutdown penggunaan elektronik bila pemakaian berlebih, selain hal itu, peneliti juga berharap konsep IoT ini bisa dipakai dalam mengembangkan sistem smartcity.','c900886dddd5c185bd9b42d29be4c5fa.docx','7facfe8f2eff67ba1b9c3d72737dcb04.pdf',NULL,'4a930c27c041fba03bb82ad888fd6f9e.pdf','Sudah Terverifikasi','2019-10-06 02:25:22',1,'Siap Ujian','2019-10-06 02:25:36',1,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Pra Tesis','Aktif'),(12,12,'CONTENT-BASED IMAGE RETRIEVAL MENGGUNAKAN METODE GRID PARTITIONING, COLOR MOMENTS, DAN CO-OCCURRENCE MATRIX','Data Mining',6,2,'2019-10-06 02:09:29','Berdasarkan uraian di atas dan penelitian sebelumnya yang sudah dilakukan, maka penelitian ini akan mengambil topik Content Based Image Retrieval menggunakan metode Co-occurrence Matrix, Color Moments dan Grid Partitioning. Data yang digunakan dalam penelitian ini adalah Wang Dataset, yang dapat di unduh pada http://wang.ist.psu.edu/~jwang/test1.tar. Untuk pengujian dari kinerja CBIR akan menggunakan pengkuruan confussion matrix dan evaluasi nilai Area Under Curve (AUC). Evaluasi confussion matrix menghasilkan nilai precision, recall, accuracy.(Atmaja, 2017).','ca670e7414ec1dbe073560b2bc12379d.pdf',NULL,'Lanjut ke Tahap Proposal','2019-10-06 02:11:51',1,'','2019-10-06 02:12:34','Berdasarkan uraian di atas dan penelitian sebelumnya yang sudah dilakukan, maka penelitian ini akan mengambil topik Content Based Image Retrieval menggunakan metode Co-occurrence Matrix, Color Moments dan Grid Partitioning. Data yang digunakan dalam penelitian ini adalah Wang Dataset, yang dapat di unduh pada http://wang.ist.psu.edu/~jwang/test1.tar. Untuk pengujian dari kinerja CBIR akan menggunakan pengkuruan confussion matrix dan evaluasi nilai Area Under Curve (AUC). Evaluasi confussion matrix menghasilkan nilai precision, recall, accuracy.(Atmaja, 2017).','58fa601bf23c37aeb5b67b0337ea9991.pdf','cd6435c51a0e72028e818e6354b1633b.pdf',NULL,'6dc9aed122e3ffdab00193f0ebe0a75f.pdf','Sudah Terverifikasi','2019-10-06 02:13:56',1,'Siap Ujian','2019-10-06 02:14:06',1,'Lulus Ujian','742f26ec94e2a840eb7a5e81c9147adc.pdf','dea97c821059882d952b3a11f4e76ff9.pdf','0e98bc79f5607178c676b4b0b5335f86.pdf',NULL,'Lanjut ke Tahap Pra Tesis','2019-10-06 02:16:07',1,NULL,'2019-10-06 02:17:16','Proses temu kembali citra dengan menggunakan kata kunci teks memiliki beberapa kelemahan seperti sulitnya mencari kata kunci yang tepat untuk pencarian citra dan subyektifitas dari pengguna. Content-Based Image Retrieval (CBIR) merupakan salah satu teknik temu kembali citra yang dapat digunakan sebagai solusi. Dalam sistem CBIR informasi citra didapat melalui ciri citra dengan menggunakan metode Color moments untuk warna, Co-occurrence Matrix untuk tekstur serta Grid Partitioning pada praproses. Tujuan penelitian ini adalah mengimplementasikan Content-Based Image Retrieval dengan menggunakan kombinasi Grid Partitioning (GP) dengan Color Moments (CM) menjadi GP-CM. Grid Partitioning (GP) dengan Co-occurence Matrix (GLCM) menjadi GP-GLCM dan kombinasi semua metode menjadi GP-CM-GLCM. Untuk mengukur kinerja sistem dilakukan perhitungan precision, recall, dan accuracy dengan metode confusion matrix. Citra yang digunakan sebagai dataset dalam penelitian ini adalah citra Wang Dataset. Dataset yang digunakan terdiri dari 1000 citra, dimana citra tersebut terbagi kedalam 10 kelas. Dari hasil pengujian kombinasi GP-CM mendapatkan hasil precision 34%, recall 24%, accuracy 87%. Kombinasi metode GP-GLCM dengan hasil precision 24%, recall 40%, dan accuracy 79%. Kombinasi metode GP-CM-GLCM dengan hasil precision 62%, recall 10%, accuracy 90%. Terjadi hubungan yang saling terkait antara recall dengan precision, dengan keadaan recall yang tinggi terjadi penurunan pada precision. Gabungan metode GP-CM-GLCM optimal secara precision dan accuracy dalam temu kembali citra hampir pada semua kelas citra. Dari hasil pengujian dapat dijadikan dasar penelitian lebih lanjut untuk melakukan kombinasi praproses pengolahan citra agar dapat memisahkan objek citra (foreground) dari background pada citra tersebut dengan harapan dapat meningkatkan hasil pengujian.','fedf2ab7b615f0c09c1f2e668e49dec3.docx','38b22364b2f5ec59135f3faee8d9c870.pdf',NULL,'64424069fa21e184d9f23d3fd7a46435.pdf','Sudah Terverifikasi','2019-10-06 02:17:50',1,'Siap Ujian','2019-10-06 02:18:05',1,'Lulus Ujian','1137a231ea13d73839b94dcd398cc490.pdf','e3e0a3ebde4967ac752632e689ca794f.docx','934aac7237343679cb67af561746522f.pdf',NULL,'Lanjut ke Tahap Tesis','2019-10-06 02:21:19',1,NULL,'2019-10-06 02:28:30','Proses temu kembali citra dengan menggunakan kata kunci teks memiliki beberapa kelemahan seperti sulitnya mencari kata kunci yang tepat untuk pencarian citra dan subyektifitas dari pengguna. Content-Based Image Retrieval (CBIR) merupakan salah satu teknik temu kembali citra yang dapat digunakan sebagai solusi. Dalam sistem CBIR informasi citra didapat melalui ciri citra dengan menggunakan metode Color moments (CM) untuk warna, Co-occurrence Matrix (GLCM) untuk tekstur serta Grid Partitioning (GP) pada praproses. Tujuan penelitian ini adalah mengimplementasikan CBIR dengan menggunakan kombinasi GP dengan CM menjadi GP-CM. GP dengan GLCM menjadi GP-GLCM dan kombinasi semua metode menjadi GP-CM-GLCM. Untuk mengukur kinerja sistem dilakukan perhitungan precision, recall, dan accuracy dengan metode confusion matrix. Citra yang digunakan sebagai dataset dalam penelitian ini adalah citra Wang Dataset. Dataset yang digunakan terdiri dari 1000 citra, dimana citra tersebut terbagi ke dalam 10 kelas. Dari hasil pengujian kombinasi GP-CM mendapatkan hasil precision 38%, recall 30%, accuracy 87%. Kombinasi metode GP-GLCM dengan hasil precision 26%, recall 43%, dan accuracy 80%. Kombinasi metode GP-CM-GLCM dengan hasil precision 59%, recall 11%, accuracy 91%. Terjadi hubungan yang saling terkait antara recall dengan precision, dengan keadaan recall yang tinggi terjadi penurunan pada precision. Gabungan metode GP-CM-GLCM optimal secara precision dan accuracy dalam temu kembali citra. Dari hasil pengujian dapat dijadikan dasar penelitian lebih lanjut untuk melakukan kombinasi praproses pengolahan citra agar dapat memisahkan objek utama citra (foreground) dari background pada citra tersebut dengan harapan dapat meningkatkan hasil pengujian.','49340c9a71b3e7ca1a28c883ba49c8ec.docx','e11667406a2541860e6f65c96f8fa34d.PDF',NULL,'4b35ddef9e5c91bdb73041b08d2b6509.PDF','Sudah Terverifikasi','2019-10-06 02:29:02',1,'Siap Ujian','2019-10-06 02:29:18',1,'Belum Terjadwal',NULL,NULL,NULL,NULL,'Belum Terverifikasi',NULL,NULL,NULL,'Tahap Tesis','Aktif');

/*Table structure for table `pps_penelitian_topik` */

DROP TABLE IF EXISTS `pps_penelitian_topik`;

CREATE TABLE `pps_penelitian_topik` (
  `pps_penelitian_topik_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_penelitian_topik_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pps_penelitian_topik_keterangan` text COLLATE utf8mb4_unicode_ci,
  `pps_penelitian_topik_aktif` enum('Aktif','Tidak Aktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_penelitian_topik_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pps_penelitian_topik` */

insert  into `pps_penelitian_topik`(`pps_penelitian_topik_id`,`pps_penelitian_topik_nama`,`pps_penelitian_topik_keterangan`,`pps_penelitian_topik_aktif`) values (1,'topik 1','test3','Aktif'),(2,'Topik 2','test 3','Aktif'),(3,'Topik 3','','Tidak Aktif'),(4,'alert','','Tidak Aktif'),(5,'Topik 5','topik','Aktif'),(6,'Pengembangan',NULL,'Aktif'),(7,'Filsafat Ilmu',NULL,'Aktif'),(8,'Matematika',NULL,'Aktif'),(9,'Game',NULL,'Aktif'),(10,'E-Goverment',NULL,'Aktif'),(11,'Mobile',NULL,'Aktif'),(12,'Hacking',NULL,'Aktif'),(13,'Robot',NULL,'Aktif'),(14,'Film',NULL,'Aktif'),(15,'Sistem Informasi',NULL,'Aktif'),(16,'Data Mining',NULL,'Aktif'),(17,'Microcontroller',NULL,'Aktif'),(18,'Basis Data',NULL,'Aktif'),(19,'Citra',NULL,'Aktif'),(20,'Sistem Pendukung Keputusan',NULL,'Aktif'),(21,'Radiologi',NULL,'Aktif'),(22,'Aksara Bali',NULL,'Aktif'),(23,'Pola',NULL,'Aktif'),(24,'Klasifikasi',NULL,'Aktif'),(25,'Naive Bayes',NULL,'Aktif');

/*Table structure for table `pps_periode_pengajuan` */

DROP TABLE IF EXISTS `pps_periode_pengajuan`;

CREATE TABLE `pps_periode_pengajuan` (
  `pps_periode_pengajuan_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_periode_pengajuan_id_prodi` int(11) DEFAULT NULL,
  `pps_periode_pengajuan_nama` varchar(255) DEFAULT NULL,
  `pps_periode_pengajuan_tanggal_mulai` date DEFAULT NULL,
  `pps_periode_pengajuan_tanggal_selesai` date DEFAULT NULL,
  `pps_periode_pengajuan_id_admin` int(11) DEFAULT NULL,
  `pps_periode_pengajuan_aktif` enum('Aktif','Tidak Aktif') DEFAULT NULL,
  PRIMARY KEY (`pps_periode_pengajuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pps_periode_pengajuan` */

insert  into `pps_periode_pengajuan`(`pps_periode_pengajuan_id`,`pps_periode_pengajuan_id_prodi`,`pps_periode_pengajuan_nama`,`pps_periode_pengajuan_tanggal_mulai`,`pps_periode_pengajuan_tanggal_selesai`,`pps_periode_pengajuan_id_admin`,`pps_periode_pengajuan_aktif`) values (3,1,'test','2019-08-15','2019-08-30',1,'Aktif');

/*Table structure for table `pps_prasyarat` */

DROP TABLE IF EXISTS `pps_prasyarat`;

CREATE TABLE `pps_prasyarat` (
  `pps_prasyarat_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prasyarat_id_prodi` int(11) NOT NULL,
  `pps_prasyarat_nama` varchar(50) NOT NULL,
  `pps_prasyarat_keterangan` text,
  `pps_prasyarat_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prasyarat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prasyarat` */

insert  into `pps_prasyarat`(`pps_prasyarat_id`,`pps_prasyarat_id_prodi`,`pps_prasyarat_nama`,`pps_prasyarat_keterangan`,`pps_prasyarat_aktif`) values (2,1,'syarat 1','','Aktif'),(4,1,'test','','Aktif');

/*Table structure for table `pps_prasyarat_mahasiswa` */

DROP TABLE IF EXISTS `pps_prasyarat_mahasiswa`;

CREATE TABLE `pps_prasyarat_mahasiswa` (
  `pps_prasyarat_mahasiswa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prasyarat_mahasiswa_id_prasyarat` int(11) NOT NULL,
  `pps_prasyarat_mahasiswa_id_mahasiswa` int(11) NOT NULL,
  `pps_prasyarat_mahasiswa_file_prasyarat` text NOT NULL,
  `pps_prasyarat_mahasiswa_file_tambahan` text,
  `pps_prasyarat_mahasiswa_keterangan` text,
  `pps_prasyarat_mahasiswa_status_verifikasi` enum('Belum Terverifikasi','Sudah Terverifikasi') NOT NULL DEFAULT 'Belum Terverifikasi',
  `pps_prasyarat_mahasiswa_id_verifikator` int(11) DEFAULT NULL,
  `pps_prasyarat_mahasiswa_tanggal_verifikasi` datetime DEFAULT NULL,
  `pps_prasyarat_mahasiswa_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prasyarat_mahasiswa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prasyarat_mahasiswa` */

insert  into `pps_prasyarat_mahasiswa`(`pps_prasyarat_mahasiswa_id`,`pps_prasyarat_mahasiswa_id_prasyarat`,`pps_prasyarat_mahasiswa_id_mahasiswa`,`pps_prasyarat_mahasiswa_file_prasyarat`,`pps_prasyarat_mahasiswa_file_tambahan`,`pps_prasyarat_mahasiswa_keterangan`,`pps_prasyarat_mahasiswa_status_verifikasi`,`pps_prasyarat_mahasiswa_id_verifikator`,`pps_prasyarat_mahasiswa_tanggal_verifikasi`,`pps_prasyarat_mahasiswa_aktif`) values (2,2,1,'738a153283180eba3d5f8916d097ab97.pdf','bee8022379f492d1ea91c56c65499daa.pdf','test','Sudah Terverifikasi',1,'2019-08-03 08:49:21','Aktif'),(3,2,1,'b12a24b2a453ec18ee09ee4890c30ee4.pdf',NULL,'','Belum Terverifikasi',NULL,NULL,'Aktif');

/*Table structure for table `pps_prodi` */

DROP TABLE IF EXISTS `pps_prodi`;

CREATE TABLE `pps_prodi` (
  `pps_prodi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prodi_kode` varchar(25) NOT NULL,
  `pps_prodi_nama_prodi` varchar(50) NOT NULL,
  `pps_prodi_nama_program` varchar(50) DEFAULT NULL,
  `pps_prodi_jenjang` enum('S2') NOT NULL DEFAULT 'S2',
  `pps_prodi_keterangan` text,
  `pps_prodi_file_prodi` text,
  `pps_prodi_email` varchar(255) DEFAULT NULL,
  `pps_prodi_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prodi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prodi` */

insert  into `pps_prodi`(`pps_prodi_id`,`pps_prodi_kode`,`pps_prodi_nama_prodi`,`pps_prodi_nama_program`,`pps_prodi_jenjang`,`pps_prodi_keterangan`,`pps_prodi_file_prodi`,`pps_prodi_email`,`pps_prodi_aktif`) values (1,'101','ILMU KOMPUTER','ILKOM (S2)','S2','MAGISTER ILMU KOMPUTER (S2)',NULL,'agusokagunawan@gmail.com','Aktif'),(2,'102','PENDIDIKAN MATEMATIKA',NULL,'S2',NULL,NULL,NULL,'Aktif');

/*Table structure for table `pps_prodi_berita` */

DROP TABLE IF EXISTS `pps_prodi_berita`;

CREATE TABLE `pps_prodi_berita` (
  `pps_prodi_berita_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prodi_berita_id_admin` int(11) NOT NULL,
  `pps_prodi_berita_id_prodi` int(11) NOT NULL,
  `pps_prodi_berita_judul` varchar(255) NOT NULL,
  `pps_prodi_berita_detail` text NOT NULL,
  `pps_prodi_berita_foto` text,
  `pps_prodi_berita_tanggal` datetime NOT NULL,
  `pps_prodi_berita_file_berita` text,
  `pps_prodi_berita_penting` enum('Tidak','Ya') DEFAULT 'Tidak',
  `pps_prodi_berita_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prodi_berita_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prodi_berita` */

insert  into `pps_prodi_berita`(`pps_prodi_berita_id`,`pps_prodi_berita_id_admin`,`pps_prodi_berita_id_prodi`,`pps_prodi_berita_judul`,`pps_prodi_berita_detail`,`pps_prodi_berita_foto`,`pps_prodi_berita_tanggal`,`pps_prodi_berita_file_berita`,`pps_prodi_berita_penting`,`pps_prodi_berita_aktif`) values (1,1,1,'Berita 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','2019-07-15 00:00:00','005de91f756da87637962bb03d744da7.pdf','Ya','Tidak Aktif'),(2,1,1,'Berita 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','2019-07-15 00:00:00',NULL,'Ya','Aktif'),(4,1,1,'hoho','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','2019-07-16 00:00:00','83be16b1071df4c207db5ca1e7fe3cef.pdf','Ya','Aktif'),(5,1,1,'juduuul','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','2019-07-16 00:00:00',NULL,'Ya','Aktif'),(6,1,1,'Berita 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','2019-07-15 00:00:00',NULL,'Ya','Aktif'),(7,1,1,'juduuul','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','2019-07-16 00:00:00',NULL,'Ya','Aktif'),(8,1,1,'juduuul','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','2019-07-16 00:00:00',NULL,'Tidak','Aktif'),(9,1,1,'juduuul','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','eb0ef2afe69028b0b55837f004c44d49.jpeg','2019-07-16 00:00:00','fcdf73d9bb330c3c6850f2b4c7b0e828.pdf','Ya','Aktif'),(10,1,1,'juduuul','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','2019-07-16 00:00:00',NULL,'Ya','Aktif'),(11,1,1,'hoho','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','5c50900a71fcae443d86f172e814271e.jpeg','2019-07-16 00:00:00','83be16b1071df4c207db5ca1e7fe3cef.pdf','Ya','Aktif'),(12,1,1,'hoho','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','0d7936563fa32c429159832dae454f0c.png','2019-07-16 00:00:00','83be16b1071df4c207db5ca1e7fe3cef.pdf','Ya','Tidak Aktif'),(13,1,1,'test urgent','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','4d7af00add01b68076f650bfaeee6d33.jpg','2019-08-31 00:00:00','6eb9938d0d9ed7470248a7f9bf9f9bd9.pdf','Tidak','Aktif'),(14,1,1,'berita 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','84d847712fd4959ed7707593810833c0.png','2019-08-31 00:00:00','29b9b8e86f9bd11f045d41a4eaf9b450.pdf','Ya','Aktif');

/*Table structure for table `pps_prodi_faq` */

DROP TABLE IF EXISTS `pps_prodi_faq`;

CREATE TABLE `pps_prodi_faq` (
  `pps_prodi_faq_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prodi_faq_id_prodi` int(11) NOT NULL,
  `pps_prodi_faq_pertanyaan` text NOT NULL,
  `pps_prodi_faq_jawaban` text NOT NULL,
  `pps_prodi_faq_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prodi_faq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prodi_faq` */

insert  into `pps_prodi_faq`(`pps_prodi_faq_id`,`pps_prodi_faq_id_prodi`,`pps_prodi_faq_pertanyaan`,`pps_prodi_faq_jawaban`,`pps_prodi_faq_aktif`) values (1,1,'berapa besar file yg dapat diupload?','1 mb saja','Tidak Aktif'),(2,1,'apa?','dimana?','Aktif'),(4,1,'halo','hi','Aktif');

/*Table structure for table `pps_prodi_konsentrasi` */

DROP TABLE IF EXISTS `pps_prodi_konsentrasi`;

CREATE TABLE `pps_prodi_konsentrasi` (
  `pps_prodi_konsentrasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prodi_konsentrasi_id_prodi` int(11) NOT NULL,
  `pps_prodi_konsentrasi_kode` varchar(25) NOT NULL,
  `pps_prodi_konsentrasi_nama` varchar(50) NOT NULL,
  `pps_prodi_konsentrasi_keterangan` text,
  `pps_prodi_konsentrasi_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prodi_konsentrasi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prodi_konsentrasi` */

insert  into `pps_prodi_konsentrasi`(`pps_prodi_konsentrasi_id`,`pps_prodi_konsentrasi_id_prodi`,`pps_prodi_konsentrasi_kode`,`pps_prodi_konsentrasi_nama`,`pps_prodi_konsentrasi_keterangan`,`pps_prodi_konsentrasi_aktif`) values (1,1,'123','ilkom',NULL,'Aktif'),(3,2,'test','test','test','Aktif');

/*Table structure for table `pps_prodi_panduan` */

DROP TABLE IF EXISTS `pps_prodi_panduan`;

CREATE TABLE `pps_prodi_panduan` (
  `pps_prodi_panduan_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prodi_panduan_id_admin` int(11) NOT NULL,
  `pps_prodi_panduan_id_prodi` int(11) NOT NULL,
  `pps_prodi_panduan_judul` varchar(255) NOT NULL,
  `pps_prodi_panduan_detail` text NOT NULL,
  `pps_prodi_panduan_foto` text,
  `pps_prodi_panduan_tanggal` date NOT NULL,
  `pps_prodi_panduan_file_panduan` text,
  `pps_prodi_panduan_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prodi_panduan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prodi_panduan` */

insert  into `pps_prodi_panduan`(`pps_prodi_panduan_id`,`pps_prodi_panduan_id_admin`,`pps_prodi_panduan_id_prodi`,`pps_prodi_panduan_judul`,`pps_prodi_panduan_detail`,`pps_prodi_panduan_foto`,`pps_prodi_panduan_tanggal`,`pps_prodi_panduan_file_panduan`,`pps_prodi_panduan_aktif`) values (1,2,2,'Marshmellow','<p>Konser Marshmello</p><p>i am alone</p>',NULL,'2019-07-17','d0028d36732b85bd87af129c8fc870eb.pdf','Tidak Aktif'),(4,1,1,'Card Title That Wraps To A New Line','<p><span style=\"orphans: 1; widows: 1;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum hic officia animi quod iure, vel aliquam quia recusandae accusantium quo impedit labore, eligendi ipsam, fugit tempora, explicabo deleniti minus iste!</span><br></p>','76a982f9ac76f3c99bcbc6cbf5d90b26.jpeg','2019-07-25','126eb3ee9c2a523ef11e75914693ac77.pdf','Aktif');

/*Table structure for table `pps_prodi_pejabat` */

DROP TABLE IF EXISTS `pps_prodi_pejabat`;

CREATE TABLE `pps_prodi_pejabat` (
  `pps_prodi_pejabat_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prodi_pejabat_id_prodi` int(11) NOT NULL,
  `pps_prodi_pejabat_id_dosen` int(11) NOT NULL,
  `pps_prodi_pejabat_jabatan` varchar(50) NOT NULL,
  `pps_prodi_pejabat_masa_jabatan` varchar(25) DEFAULT NULL,
  `pps_prodi_pejabat_keterangan` text,
  `pps_prodi_pejabat_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prodi_pejabat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prodi_pejabat` */

insert  into `pps_prodi_pejabat`(`pps_prodi_pejabat_id`,`pps_prodi_pejabat_id_prodi`,`pps_prodi_pejabat_id_dosen`,`pps_prodi_pejabat_jabatan`,`pps_prodi_pejabat_masa_jabatan`,`pps_prodi_pejabat_keterangan`,`pps_prodi_pejabat_aktif`) values (1,1,1,'','','','Aktif'),(2,2,3,'','','','Tidak Aktif');

/*Table structure for table `pps_prodi_ruangan` */

DROP TABLE IF EXISTS `pps_prodi_ruangan`;

CREATE TABLE `pps_prodi_ruangan` (
  `pps_prodi_ruangan_id` int(11) NOT NULL AUTO_INCREMENT,
  `pps_prodi_ruangan_id_prodi` int(11) NOT NULL,
  `pps_prodi_ruangan_nama` varchar(50) NOT NULL,
  `pps_prodi_ruangan_keterangan` text,
  `pps_prodi_ruangan_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`pps_prodi_ruangan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `pps_prodi_ruangan` */

insert  into `pps_prodi_ruangan`(`pps_prodi_ruangan_id`,`pps_prodi_ruangan_id_prodi`,`pps_prodi_ruangan_nama`,`pps_prodi_ruangan_keterangan`,`pps_prodi_ruangan_aktif`) values (1,1,'ILKOM-1','ILKOM-1','Aktif'),(2,1,'ILKOM-2','ILKOM-2','Aktif');

/*Table structure for table `tx_notif` */

DROP TABLE IF EXISTS `tx_notif`;

CREATE TABLE `tx_notif` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_admin` varchar(10) DEFAULT NULL,
  `judul` text,
  `isi` text,
  `tgl_kirim` date DEFAULT NULL,
  `jenis_pesan` int(11) DEFAULT NULL COMMENT '1.pesan post, 2. pesan jadwal proposal, 3.ujian pra tesis, 4. ujian tesis',
  `id_prodi` varchar(10) DEFAULT NULL,
  `sukses` int(11) DEFAULT NULL,
  `gagal` int(11) DEFAULT '0',
  `calon` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `tx_notif` */

insert  into `tx_notif`(`id`,`id_admin`,`judul`,`isi`,`tgl_kirim`,`jenis_pesan`,`id_prodi`,`sukses`,`gagal`,`calon`) values (6,'2','Pemberitahuan','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it t','2019-10-29',0,'101',0,0,9),(7,'2','Pemberitahuan','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it t','2019-10-29',1,'101',1,0,10),(8,'2','Pemberitahuan','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it t','2019-10-29',0,'101',1,0,10),(9,'2','Pemberitahuan','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it t','2019-10-29',0,'101',1,0,10),(10,'2','tes3','tess1','2019-10-29',0,'101',1,0,10),(11,'2','tes3','tess1','2019-10-29',0,'101',1,0,10),(12,'2','tes3','tess1','2019-10-29',0,'101',1,0,10),(13,'2','tes3','tess1','2019-10-29',0,'101',1,0,10),(14,'2','tes3','tess1','2019-10-29',0,'101',1,0,10),(15,'12','tes ulang ','ulaghgbbg','2019-11-21',0,'101',0,10,10),(16,'12','tes ulang ','ulaghgbbg','2019-11-21',0,'101',0,11,11);

/*Table structure for table `tx_notif_detil` */

DROP TABLE IF EXISTS `tx_notif_detil`;

CREATE TABLE `tx_notif_detil` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_notif` int(10) DEFAULT NULL,
  `nim` varchar(50) DEFAULT NULL,
  `is_read` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `tx_notif_detil` */

insert  into `tx_notif_detil`(`id`,`id_notif`,`nim`,`is_read`) values (1,6,'12',0),(2,7,'12',1),(3,7,'12',1),(4,8,NULL,0),(5,8,'12',1),(6,9,NULL,0),(7,9,'1829101020',1),(8,10,NULL,0),(9,10,'1829101020',1),(10,11,NULL,0),(11,11,'1829101020',1),(12,12,NULL,0),(13,12,'1829101020',1),(14,13,NULL,0),(15,13,'1829101020',1),(16,14,NULL,0),(17,14,'1829101020',0),(18,15,'1234567898',0),(19,16,'1234567898',0),(20,16,'12',1);

/*Table structure for table `z_admin` */

DROP TABLE IF EXISTS `z_admin`;

CREATE TABLE `z_admin` (
  `z_admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `z_admin_id_prodi` int(11) NOT NULL,
  `z_admin_email` varchar(50) NOT NULL,
  `z_admin_password` varchar(100) NOT NULL,
  `z_admin_nama` varchar(50) NOT NULL,
  `z_admin_jabatan` varchar(50) DEFAULT NULL,
  `z_admin_foto` text,
  `z_admin_keterangan` text,
  `z_admin_aktif` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  `token` text,
  PRIMARY KEY (`z_admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `z_admin` */

insert  into `z_admin`(`z_admin_id`,`z_admin_id_prodi`,`z_admin_email`,`z_admin_password`,`z_admin_nama`,`z_admin_jabatan`,`z_admin_foto`,`z_admin_keterangan`,`z_admin_aktif`,`token`) values (1,101,'admin2@admin.com','e10adc3949ba59abbe56e057f20f883e','Oka Gunawan','Ilkom','c4d12dac11b2c6bb984f3e691bc38468.jpeg','test2','Aktif','ei00BOmGf58:APA91bFve6htUYUwVrQQOQ6gWdy6FIJPeD6VIm-JnA_0VAVCNeUtaIcSIjIGEpmn0I3nEjltc6faIhZfjqToZkHoUAkTTxUxpI7243zYsmwtHiPNyAXaJt1oFalk3KUzzAjERZOA_Pki'),(2,2,'admin2@ilkom.com','e10adc3949ba59abbe56e057f20f883e','Admin 2','freelance','a3a06dd9851810325987992878a0cf76.jpeg','test','Aktif',NULL),(3,1,'teste@test.com','e10adc3949ba59abbe56e057f20f883e','','','c32f9c941b90ff282bfa3917fb93e11b.jpg','','Aktif',NULL),(4,1,'teteet@tetes.com','fdcaddd8bdc90f66238a6aeee9e18716','','','1cbeb640014a5000c52d0ae84142e209.jpg','','Tidak Aktif',NULL),(5,1,'teseter@test.com','e10adc3949ba59abbe56e057f20f883e','','','57edeaf33b73a6b811be063f75fc2db4.jpg','','Tidak Aktif',NULL),(6,1,'trastae@test.com','e10adc3949ba59abbe56e057f20f883e','','','4c813d85346f8a8a2a08ebb2cc86381c.jpg','','Tidak Aktif',NULL),(7,1,'dddd@sdad.com','e10adc3949ba59abbe56e057f20f883e','','','8830d6e030db7c97413aff1b862e7fe2.jpg','','Tidak Aktif',NULL),(8,1,'aaaa@aaa.com','e10adc3949ba59abbe56e057f20f883e','','','c3a1c271799678d09ba974406eecdee4.jpg','','Tidak Aktif',NULL),(9,1,'gggg@ggg.com','e10adc3949ba59abbe56e057f20f883e','','','11cd4a2824158ac8fa99b3d9ca6d78ca.jpg','','Tidak Aktif',NULL),(10,1,'yyyy@yyy.com','e10adc3949ba59abbe56e057f20f883e','','','dd57fc6247fe7b273f0c83456526cda2.jpg','','Tidak Aktif',NULL),(11,1,'ddddddd@dddd.com','e10adc3949ba59abbe56e057f20f883e','','','f472d7cc71a6d53a56fb9af59b10cc8d.jpg','','Tidak Aktif',NULL);

/*Table structure for table `z_webmaster` */

DROP TABLE IF EXISTS `z_webmaster`;

CREATE TABLE `z_webmaster` (
  `z_webmaster_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `z_webmaster_nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `z_webmaster_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `z_webmaster_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`z_webmaster_id`),
  UNIQUE KEY `z_webmaster_email_unique` (`z_webmaster_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `z_webmaster` */

insert  into `z_webmaster`(`z_webmaster_id`,`z_webmaster_nama`,`z_webmaster_email`,`z_webmaster_password`) values (1,'Webmaster','webmaster@webmaster.com','e10adc3949ba59abbe56e057f20f883e');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
