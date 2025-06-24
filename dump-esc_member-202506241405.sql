/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: esc_member
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
-- Table structure for table `fast_login`
--

DROP TABLE IF EXISTS `fast_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fast_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `device_id` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fast_login_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_time` bigint DEFAULT NULL,
  `expired_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_fast_login_key` (`fast_login_key`),
  UNIQUE KEY `uni_uid_device_id` (`uid`,`device_id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL COMMENT 'job類型',
  `uid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint NOT NULL DEFAULT '0' COMMENT '什麼時候執行',
  `create_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_type_uid` (`type`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_login_log`
--

DROP TABLE IF EXISTS `last_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `last_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '裝置ID',
  `device` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備 例如Mobile',
  `device_brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備品牌 例如Apple',
  `device_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '最後一次登入IP',
  `login_location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_time` bigint NOT NULL COMMENT '最後一次登入時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_idx_uid` (`uid`),
  UNIQUE KEY `uni_idx_uid_device_id` (`uid`,`device_id`),
  UNIQUE KEY `uni_idx_uid_login_ip` (`uid`,`login_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `device_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '裝置ID',
  `device` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備 例如Mobile',
  `device_brand` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備品牌 例如Apple',
  `device_version` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_ip` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '最後一次登入IP',
  `login_location` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_time` bigint NOT NULL COMMENT '最後一次登入時間',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_uid_device_id` (`uid`,`device_id`),
  KEY `idx_uid_login_ip` (`uid`,`login_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `register_log`
--

DROP TABLE IF EXISTS `register_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `register_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip_location` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP所在位置 (國家-城市,TW-Taipei)',
  `device` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備 例如Mobile',
  `device_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備類型 例如IOS',
  `device_brand` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備品牌 例如Apple',
  `device_version` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `device_id` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_question`
--

DROP TABLE IF EXISTS `security_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_question` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `language` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_questionId_language` (`question_id`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_type` int NOT NULL COMMENT '用戶類型 1.一般使用者 2.後台用戶',
  `google_verify` tinyint(1) NOT NULL DEFAULT '2' COMMENT 'Google 驗證器 1. 啟用 2. 禁用',
  `email_verify` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Email 驗證 1. 啟用 2. 禁用',
  `first_login` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否第一次登入 1. 啟用 2. 禁用',
  `system_alarm` tinyint(1) NOT NULL DEFAULT '1' COMMENT '系統告警 1. 啟用 2. 禁用',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '人員狀態 1.啟用 2.凍結 3.暫時凍結 4.刪除',
  `create_time` bigint NOT NULL,
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `email_user_type_uq` (`email`,`user_type`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_blocked_device`
--

DROP TABLE IF EXISTS `user_blocked_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_blocked_device` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` int NOT NULL COMMENT '封鎖觸發類型 1: 系統 2: 運營',
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封鎖的裝置ID',
  `device` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備 例如Mobile',
  `device_brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '設備品牌 例如Apple',
  `device_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `submit_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '運營封鎖人員 uid',
  `submit_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '運營封鎖人員名稱',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '備註',
  `created_time` bigint NOT NULL DEFAULT '0',
  `updated_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uni_uid` (`uid`),
  KEY `uni_uid_trigger_type` (`uid`,`trigger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_blocked_ip`
--

DROP TABLE IF EXISTS `user_blocked_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_blocked_ip` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` int NOT NULL COMMENT '封鎖觸發類型 1: 系統 2: 運營',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封鎖的裝置ID',
  `ip_location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP所在位置 (國家-城市,TW-Taipei)',
  `submit_uid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '運營封鎖人員 uid',
  `submit_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '運營封鎖人員名稱',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '備註',
  `created_time` bigint NOT NULL DEFAULT '0',
  `updated_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uni_uid` (`uid`),
  KEY `uni_uid_trigger_type` (`uid`,`trigger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_changelog`
--

DROP TABLE IF EXISTS `user_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_changelog` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `operation` varchar(50) NOT NULL COMMENT '操作項目',
  `data_before` varchar(50) NOT NULL COMMENT '操作前資料',
  `data_after` varchar(20) NOT NULL COMMENT '操作後資料',
  `submit_uid` varchar(50) NOT NULL COMMENT '操作人員 uid',
  `created_time` bigint NOT NULL DEFAULT '0',
  `updated_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uni_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `role_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `live_id` bigint DEFAULT NULL COMMENT '直播id',
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `area_code` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `nickname_update_time` bigint NOT NULL COMMENT '暱稱修改時間',
  `update_time` bigint NOT NULL,
  `brand` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fiat_currency` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USD',
  `language` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'en-US' COMMENT '語系設定',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `nickname_uni` (`nickname`),
  KEY `idx_uid` (`uid`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_uid_nickname` (`uid`,`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_security`
--

DROP TABLE IF EXISTS `user_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_security` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `device_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `security_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '安全類型 (mail,ga,sms,phishing)',
  `security_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `binding` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否綁定 1: true 2: false',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否啟用 1: true 2: false',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_uid_security_type_device_id` (`uid`,`security_type`,`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23742 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_security_question_relation`
--

DROP TABLE IF EXISTS `user_security_question_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_security_question_relation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `question_id` int unsigned NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_uid_questionid` (`uid`,`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'esc_member'
--

--
-- Dumping routines for database 'esc_member'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:06:07
