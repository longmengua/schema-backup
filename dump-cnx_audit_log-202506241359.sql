/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_audit_log
-- ------------------------------------------------------
-- Server version	8.0.26-google

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `download_list`
--

DROP TABLE IF EXISTS `download_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `download_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `service` varchar(50) NOT NULL,
  `batch_number` int NOT NULL DEFAULT '0',
  `uid` varchar(50) NOT NULL,
  `complete_time` bigint NOT NULL,
  `create_time` bigint NOT NULL,
  `start_time` bigint NOT NULL DEFAULT '0',
  `end_time` bigint NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_service_batch_number` (`service`,`batch_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `download_permission_control`
--

DROP TABLE IF EXISTS `download_permission_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `download_permission_control` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `service` varchar(50) NOT NULL,
  `allowed` tinyint(1) NOT NULL,
  `batch_number` int NOT NULL DEFAULT '0',
  `updated_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_service` (`service`),
  KEY `idx_allowed` (`allowed`),
  KEY `idx_service_allowed` (`service`,`allowed`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_list`
--

DROP TABLE IF EXISTS `notification_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `service` varchar(50) NOT NULL,
  `batch_number` int NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_service_batch_number` (`service`,`batch_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9063 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_audit_log'
--

--
-- Dumping routines for database 'cnx_audit_log'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 13:59:33
