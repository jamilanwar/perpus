/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : 127.0.0.1:3306
 Source Schema         : db_perpus

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 11/11/2018 18:54:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for anggota
-- ----------------------------
DROP TABLE IF EXISTS `anggota`;
CREATE TABLE `anggota`  (
  `anggota_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `anggota_nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anggota_alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anggota_jk` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anggota_telp` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`anggota_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of anggota
-- ----------------------------
INSERT INTO `anggota` VALUES (1, 'Fajar', 'Glagah', 'P', '09876788999333');
INSERT INTO `anggota` VALUES (2, 'Eko', 'Romawi', 'L', '4343562555674');

-- ----------------------------
-- Table structure for buku
-- ----------------------------
DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku`  (
  `buku_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `buku_judul` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori_id` int(11) UNSIGNED NOT NULL,
  `buku_deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `buku_jumlah` int(11) UNSIGNED NOT NULL,
  `buku_cover` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`buku_id`) USING BTREE,
  INDEX `kategori_id`(`kategori_id`) USING BTREE,
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of buku
-- ----------------------------
INSERT INTO `buku` VALUES (5, 'Buku baru', 10, 'Ini buku baru', 10, 'mt.jpg');
INSERT INTO `buku` VALUES (7, 'preketek', 10, 'pro', 1, '15996662264_4088cd1e53_o.png');

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `kategori_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategori_nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kategori_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (2, 'Sci & Fic');
INSERT INTO `kategori` VALUES (10, 'Pemrograman');

-- ----------------------------
-- Table structure for kembali
-- ----------------------------
DROP TABLE IF EXISTS `kembali`;
CREATE TABLE `kembali`  (
  `kembali_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pinjam_id` int(11) UNSIGNED NOT NULL,
  `tgl_kembali` date NOT NULL,
  `denda` double UNSIGNED NOT NULL,
  PRIMARY KEY (`kembali_id`) USING BTREE,
  INDEX `pinjam_id`(`pinjam_id`) USING BTREE,
  CONSTRAINT `kembali_ibfk_1` FOREIGN KEY (`pinjam_id`) REFERENCES `pinjam` (`pinjam_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for petugas
-- ----------------------------
DROP TABLE IF EXISTS `petugas`;
CREATE TABLE `petugas`  (
  `petugas_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `petugas_nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`petugas_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of petugas
-- ----------------------------
INSERT INTO `petugas` VALUES (1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for pinjam
-- ----------------------------
DROP TABLE IF EXISTS `pinjam`;
CREATE TABLE `pinjam`  (
  `pinjam_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `buku_id` int(11) UNSIGNED NOT NULL,
  `anggota_id` int(11) UNSIGNED NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_jatuh_tempo` date NOT NULL,
  PRIMARY KEY (`pinjam_id`) USING BTREE,
  INDEX `anggota_id`(`anggota_id`) USING BTREE,
  INDEX `buku_id`(`buku_id`) USING BTREE,
  CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`buku_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`anggota_id`) REFERENCES `anggota` (`anggota_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
