/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_notification
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
-- Table structure for table `block_list_device`
--

DROP TABLE IF EXISTS `block_list_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_list_device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL COMMENT '使用者設備ID',
  `block_type` tinyint DEFAULT NULL COMMENT '1.IPAddress  2.Device 3 business',
  `target` varchar(20) DEFAULT NULL COMMENT '1.IPAddress  2.Device 3 business enum',
  `target_memo` varchar(20) DEFAULT NULL,
  `block_reason` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '1:禁用 2:解禁',
  `memo` varchar(100) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人員',
  `create_time` bigint DEFAULT NULL,
  `update_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_id_UNIQUE` (`device_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  KEY `idx_uid` (`uid`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_block_type` (`block_type`),
  KEY `isc_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_list_ip`
--

DROP TABLE IF EXISTS `block_list_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_list_ip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL COMMENT '使用者IP',
  `ip_location` varchar(20) DEFAULT NULL COMMENT 'IP 所在位置',
  `block_type` tinyint DEFAULT NULL COMMENT '1.IP repeat  2.op enable 3.op disable',
  `block_reason` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '1:禁用 2:解禁',
  `memo` varchar(100) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人員',
  `create_time` bigint DEFAULT NULL,
  `update_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_address_UNIQUE` (`ip_address`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  KEY `idx_uid` (`uid`),
  KEY `idx_device_id` (`ip_address`),
  KEY `idx_block_type` (`block_type`),
  KEY `isc_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_log`
--

DROP TABLE IF EXISTS `cron_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `job` varchar(50) NOT NULL COMMENT 'job name',
  `service` varchar(50) NOT NULL COMMENT 'service name',
  `status` tinyint NOT NULL COMMENT '狀態 1:進行中 2:完成 3:失敗',
  `date_time` varchar(50) NOT NULL COMMENT '指定資料的時間',
  `handle_count` int NOT NULL DEFAULT '0' COMMENT '處理筆數',
  `affect_count` int NOT NULL DEFAULT '0' COMMENT '影響或新增筆數',
  `input` text NOT NULL COMMENT 'cron參數',
  `output` text NOT NULL COMMENT 'cron結果',
  `time_duration_sec` double NOT NULL DEFAULT '0' COMMENT 'job處理耗費時間(sec)',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_job_date_time` (`job`,`date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=292274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='job log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(20) DEFAULT NULL,
  `type_id` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT '',
  `header` varchar(100) DEFAULT '',
  `body` varchar(512) DEFAULT NULL COMMENT '內容',
  `footer` varchar(100) DEFAULT NULL COMMENT '頁腳',
  `fish` varchar(50) DEFAULT NULL COMMENT '釣魚碼',
  `duration` int DEFAULT NULL COMMENT '驗證碼有效時間 分',
  `limit_duration` int DEFAULT NULL COMMENT '不可重複發送時間 秒',
  `create_time` bigint DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人員',
  `update_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_login`
--

DROP TABLE IF EXISTS `last_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `last_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `ip_location` varchar(50) DEFAULT NULL COMMENT 'IP所在位置 (國家-城市,TW-Taipei)',
  `ip_country` varchar(50) DEFAULT NULL,
  `ip_city` varchar(50) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `device_model` varchar(50) DEFAULT NULL,
  `device_os_version` varchar(50) DEFAULT NULL,
  `login_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9596 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_template`
--

DROP TABLE IF EXISTS `message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(20) DEFAULT NULL,
  `type_id` varchar(50) DEFAULT NULL COMMENT '樣板TypeID',
  `brand` varchar(50) DEFAULT NULL COMMENT '平台',
  `header` varchar(100) DEFAULT NULL COMMENT '內容標頭',
  `body` varchar(512) DEFAULT NULL COMMENT '內容',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `notification_type` tinyint DEFAULT NULL COMMENT '通知類型 (sms,email..etc)',
  `to` varchar(255) DEFAULT NULL COMMENT '目的地址 (phone,email)',
  `content` text,
  `is_send` tinyint DEFAULT NULL COMMENT '1.送出 2.未發送',
  `send_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` varchar(255) NOT NULL DEFAULT '' COMMENT '訂單業務流水號',
  `order_type` tinyint NOT NULL DEFAULT '0' COMMENT '訂單類型 1.充提 2.C2C',
  `apply_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `approval_status` tinyint NOT NULL DEFAULT '0' COMMENT '訂單狀態 1.待審核 2.審核完成/不須審核 ',
  `crypto` varchar(50) NOT NULL DEFAULT '' COMMENT '交易幣種',
  `uid` varchar(50) NOT NULL DEFAULT '' COMMENT '下單用戶 UID',
  `fee` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單手續費',
  `network` varchar(50) NOT NULL DEFAULT '' COMMENT '主網',
  `amount` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單金額',
  `to_address` varchar(255) NOT NULL DEFAULT '' COMMENT '目標地址',
  `alert_count` int NOT NULL DEFAULT '0' COMMENT '通知次數',
  PRIMARY KEY (`order_id`),
  KEY `idx_approval_status` (`approval_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='交易訂單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` bigint unsigned DEFAULT NULL COMMENT '訊息ID(外部)',
  `type` tinyint DEFAULT NULL COMMENT '訊息來源(外部)',
  `title` varchar(50) DEFAULT NULL COMMENT '標題',
  `status` tinyint DEFAULT NULL COMMENT '排程狀態',
  `publish_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_message_id_type` (`message_id`,`type`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduler_message`
--

DROP TABLE IF EXISTS `scheduler_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduler_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scheduler_id` bigint unsigned DEFAULT NULL COMMENT 'scheduler.id',
  `lang` varchar(10) DEFAULT NULL COMMENT '語系',
  `title` varchar(50) DEFAULT NULL COMMENT '標題',
  `content` text COMMENT '內容',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_scheduler_id` (`scheduler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_template`
--

DROP TABLE IF EXISTS `sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `language` varchar(20) DEFAULT NULL,
  `type_id` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` varchar(512) DEFAULT NULL,
  `fish` varchar(50) DEFAULT NULL COMMENT '釣魚碼',
  `duration` int DEFAULT NULL COMMENT '驗證碼有效時間 分',
  `limit_duration` int DEFAULT NULL COMMENT '不可重複發送時間 秒',
  `create_time` bigint DEFAULT NULL,
  `operator` varchar(45) DEFAULT NULL COMMENT '操作人員',
  `update_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_device_management`
--

DROP TABLE IF EXISTS `user_device_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_device_management` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL COMMENT '使用者裝置ID',
  `device_os_version` varchar(50) DEFAULT NULL COMMENT '系統版本 (android 13, ios 16…)',
  `device_brand` varchar(50) DEFAULT NULL COMMENT '設備品牌 (samsung, apple…)',
  `device_model` varchar(50) DEFAULT NULL COMMENT '設備型號 (S23, IPhone14..)',
  `security_type` tinyint DEFAULT '2' COMMENT '信任類型 (1.信任 2.非信任 3.解除)',
  `ip` varchar(50) DEFAULT '',
  `ip_location` varchar(50) DEFAULT '',
  `ip_country` varchar(50) DEFAULT NULL,
  `ip_city` varchar(50) DEFAULT NULL,
  `login_count` int DEFAULT '0',
  `security_operation_count` int DEFAULT '0',
  `token` varchar(510) DEFAULT '',
  `create_time` bigint DEFAULT NULL,
  `update_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_device_id_UNIQUE` (`uid`,`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11678 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_mail`
--

DROP TABLE IF EXISTS `user_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_mail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '手機',
  `language` varchar(10) NOT NULL DEFAULT 'en-US' COMMENT '語系',
  `create_time` bigint NOT NULL,
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  KEY `idx_brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=11478 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_message_management`
--

DROP TABLE IF EXISTS `user_message_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_message_management` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL COMMENT '用戶ID',
  `brand` varchar(45) NOT NULL COMMENT '平台',
  `device_id` varchar(50) NOT NULL DEFAULT '' COMMENT '裝置ID',
  `device_token` varchar(512) NOT NULL DEFAULT '' COMMENT 'fcm裝置Token',
  `alarm_subscribe` tinyint NOT NULL DEFAULT '1' COMMENT '告警訂閱開關 1:開 2:關',
  `transaction_subscribe` tinyint NOT NULL DEFAULT '1' COMMENT '交易訂閱開關 1:開 2:關',
  `article_subscribe` tinyint NOT NULL DEFAULT '1' COMMENT '公告訂閱開關 1:開 2:關',
  `topic_article` varchar(40) NOT NULL DEFAULT '' COMMENT '公告訂閱的Topic',
  `language` varchar(20) NOT NULL DEFAULT 'en-US' COMMENT '裝置語系',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid_deviceID_idx` (`uid`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_notification'
--

--
-- Dumping routines for database 'cnx_notification'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:03:03
