-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.17 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for login
-- DROP DATABASE IF EXISTS `login`;
CREATE DATABASE IF NOT EXISTS `login` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `login`;

-- Dumping structure for table login.hibernate_sequence
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table login.hibernate_sequence: 2 rows
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
REPLACE INTO `hibernate_sequence` (`next_val`) VALUES
	(3),
	(3);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Dumping structure for table login.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table login.role: 1 rows
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
REPLACE INTO `role` (`role_id`, `role`) VALUES
	(1, 'ROLE_ADMIN');
REPLACE INTO `role` (`role_id`, `role`) VALUES
	(2, 'ROLE_USER');	
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table login.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table login.user: 2 rows
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`user_id`, `active`, `email`, `last_name`, `name`, `password`) VALUES
	(1, 1, 'admin@test.com', 'admin', 'admin', '$2a$10$hvHUTbDacFq744F6ED2ljutUavii0.ReEnuT41K0T3oy9PkM7R5Fm'),
	(2, 1, 'test@admin.com', 'admin', 'admin', '$2a$10$kgtovQXglfu102mWznbRe.Co9Ow9SJoH1KanGHz1pr/EX7h4MwTvG');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table login.user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table login.user_role: 2 rows
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
REPLACE INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
