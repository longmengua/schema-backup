/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: esc_customer_service
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
-- Table structure for table `appeal`
--

DROP TABLE IF EXISTS `appeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appeal` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '申訴單編號',
  `order_id` varchar(30) NOT NULL COMMENT '申訴訂單編號',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '申訴狀態 1:申訴中, 2:協商中, 3: 取消申訴, 4: 同意協商, 5: 完成申訴, 6: 仲裁中',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '申訴建立時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '申訴更新時間',
  `side` tinyint NOT NULL DEFAULT '0' COMMENT '買賣方向',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `order_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '下單用戶 UID',
  `reference_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '訂單來源用戶 UID',
  `ruling_uid` varchar(50) NOT NULL DEFAULT '',
  `create_uid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='申訴單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appeal_reason`
--

DROP TABLE IF EXISTS `appeal_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appeal_reason` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `reason_id` bigint NOT NULL COMMENT '申訴原因 ID',
  `language_code` varchar(10) NOT NULL COMMENT '語言識別，如en, tw, cn',
  `text` varchar(255) NOT NULL COMMENT '文本内容',
  `buyer_seller_indicator` tinyint NOT NULL COMMENT '買方原因或賣方的申訴原因 1:買方, 2:賣方',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reason_language` (`reason_id`,`language_code`),
  CONSTRAINT `appeal_reason_ibfk_1` FOREIGN KEY (`reason_id`) REFERENCES `appeal_reason` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='申訴原因';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appeal_status`
--

DROP TABLE IF EXISTS `appeal_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appeal_status` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '狀態編號',
  `status` varchar(50) NOT NULL COMMENT '申訴狀態 `1訴中, 2協商中, 3取消申訴, 4同意協商, 5完成申訴, 6仲裁中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='申訴狀態';
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
) ENGINE=InnoDB AUTO_INCREMENT=101114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='job log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '群組編號',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '群組名稱',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '修改時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='群組';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `judgmental_status`
--

DROP TABLE IF EXISTS `judgmental_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `judgmental_status` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '狀態編號',
  `status` varchar(50) NOT NULL COMMENT '狀態放行 取消交易',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='裁決選單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operator_group_relations`
--

DROP TABLE IF EXISTS `operator_group_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `operator_group_relations` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '關係id',
  `operator_id` varchar(50) NOT NULL DEFAULT '' COMMENT '客服人員 UID',
  `group_id` int NOT NULL COMMENT '群組 id',
  `joined_at` bigint NOT NULL DEFAULT '0' COMMENT '加入時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_operator_group` (`operator_id`,`group_id`),
  KEY `operator_id_idx` (`operator_id`),
  KEY `group_id_idx` (`group_id`),
  CONSTRAINT `fk_group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_operator` FOREIGN KEY (`operator_id`) REFERENCES `operator_list` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='群組與運營人員關係';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operator_list`
--

DROP TABLE IF EXISTS `operator_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `operator_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `uid` varchar(50) NOT NULL DEFAULT '' COMMENT '客服人員 UID',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '聊天室狀態 1: 不可接單狀態, 2: 可接單狀態',
  `processing_case_count` bigint NOT NULL DEFAULT '0' COMMENT '處理的案件',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '修改時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客服人員列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'esc_customer_service'
--

--
-- Dumping routines for database 'esc_customer_service'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:05:35
