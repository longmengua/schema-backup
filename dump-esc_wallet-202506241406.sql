/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: esc_wallet
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='job log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_setting`
--

DROP TABLE IF EXISTS `payment_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `client_id` bigint unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL COMMENT '名稱',
  `currency` varchar(50) NOT NULL COMMENT '法幣',
  `account_type` tinyint NOT NULL COMMENT '1: 銀行，2: 支付',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態 1: 啟用, 2: 禁用',
  `field_type` tinyint NOT NULL DEFAULT '1' COMMENT '欄位類型 1: text，2: selection，3: pic',
  `field_name` varchar(50) NOT NULL COMMENT '欄位名稱',
  `field_status` tinyint NOT NULL DEFAULT '1' COMMENT '欄位狀態 1: 可選, 2: 必填',
  `field_memo` varchar(50) NOT NULL COMMENT '欄位說明',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='收支設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `uid` varchar(50) NOT NULL,
  `whitelist` tinyint(1) NOT NULL COMMENT '是否開啟白名單',
  `one_step` tinyint(1) NOT NULL COMMENT '是否開啟白名單一步提現',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `transaction_id` varchar(200) NOT NULL COMMENT 'tx id',
  `order_id` varchar(200) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `to_uid` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint NOT NULL COMMENT '1: withdraw，2: deposit',
  `business_type` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '結算狀態',
  `crypto` varchar(20) NOT NULL COMMENT '幣種',
  `amount` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '交易金額',
  `balance` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '餘額',
  `before_balance` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '餘額(交易前)',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `due_time` bigint NOT NULL DEFAULT '0' COMMENT 'T+N 執行時間',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='交易';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_hour_report`
--

DROP TABLE IF EXISTS `transaction_hour_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_hour_report` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `uid` varchar(50) NOT NULL,
  `type` tinyint NOT NULL COMMENT '1: withdraw，2: deposit',
  `crypto` varchar(20) NOT NULL COMMENT '幣種',
  `amount` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '金額',
  `before_balance` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '餘額(上一個小時最後)',
  `date` date NOT NULL COMMENT '日期',
  `hour` tinyint NOT NULL COMMENT '時',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_date_hour` (`date`,`hour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用戶每小時交易報告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `uid` varchar(50) NOT NULL,
  `chain` varchar(20) NOT NULL COMMENT '鏈',
  `crypto` varchar(20) NOT NULL COMMENT '幣種',
  `type` tinyint NOT NULL COMMENT '1: 一般，2: 白名單',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `memo` varchar(50) NOT NULL,
  `note` varchar(50) NOT NULL COMMENT '筆記',
  `last_withdraw_time` bigint NOT NULL DEFAULT '0' COMMENT '最後提幣時間',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_uid_crypto_chain` (`uid`,`crypto`,`chain`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用戶地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `uid` varchar(50) NOT NULL,
  `crypto` varchar(20) NOT NULL COMMENT '幣種',
  `balance` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '餘額',
  `type` tinyint NOT NULL COMMENT '1: 可用，2: 凍結，3: 限制(出金)',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `freeze` decimal(30,18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uid_crypto_status` (`uid`,`crypto`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='錢包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet_transaction`
--

DROP TABLE IF EXISTS `wallet_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `transaction_id` bigint NOT NULL COMMENT 'transaction.id',
  `order_id` varchar(200) NOT NULL COMMENT '來自order的id',
  `brand` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `wallet_type` tinyint NOT NULL COMMENT '餘額種類 1: 可用，2: 凍結，3: 限制(出金)',
  `business_type` tinyint NOT NULL,
  `crypto` varchar(20) NOT NULL COMMENT '幣種',
  `amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '金額',
  `balance` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '交易完後的餘額',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `before_balance` decimal(30,18) DEFAULT NULL,
  `freeze` decimal(30,18) DEFAULT NULL,
  `before_freeze` decimal(30,18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`,`brand`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=677 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='錢包金額變化';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'esc_wallet'
--

--
-- Dumping routines for database 'esc_wallet'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:06:59
