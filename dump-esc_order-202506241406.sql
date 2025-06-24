/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: esc_order
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182865 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='job log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine_node`
--

DROP TABLE IF EXISTS `machine_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine_node` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `host_name` varchar(200) NOT NULL DEFAULT '' COMMENT 'host name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='machineID Assigner for Generator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL DEFAULT '0' COMMENT '交易訂單編號',
  `business_id` varchar(255) NOT NULL DEFAULT '' COMMENT '訂單業務流水號',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `order_type` tinyint NOT NULL DEFAULT '0' COMMENT '訂單類型 1.充提 2.C2C',
  `direction_type` tinyint NOT NULL DEFAULT '0' COMMENT '交易方向 1.買入 2.賣出',
  `order_status` tinyint NOT NULL DEFAULT '0' COMMENT '訂單狀態 0.建立訂單 1.建單失敗 2.審核中 3.付款中 4.已付款 5.已付款待轉帳 6.申訴中 7.交易完成 8.交易失敗 9.交易取消 10.交易異常 11.交易超時',
  `wallet_status` tinyint NOT NULL DEFAULT '0' COMMENT '交易金額狀態 1.未凍結 2.已凍結 3.解凍(扣錢) 4.未增加資產 5.已增加資產 6.解凍還原 7.限制(將凍結餘額轉至限制餘額)',
  `three_party_status` tinyint NOT NULL DEFAULT '0' COMMENT '三方請求狀態 1.已發送 2.通知處理中 3.通知已完成',
  `crypto_type` varchar(50) NOT NULL DEFAULT '' COMMENT '交易幣種',
  `order_brand` varchar(50) NOT NULL DEFAULT '' COMMENT '下單平台',
  `order_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '下單用戶 UID',
  `reference_brand` varchar(50) NOT NULL DEFAULT '' COMMENT '訂單來源平台',
  `reference_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '訂單來源用戶 UID',
  `reference_id` varchar(200) NOT NULL DEFAULT '' COMMENT '訂單來源',
  `order_count` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單數量',
  `order_fee` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單手續費',
  `third_party_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '第三方手續費',
  `crypto_to_usdt_rate` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '交易幣種 對 USDT 匯率',
  `fiat_to_usd_rate` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '法幣 對 USD 匯率',
  `fee_crypto_to_usdt_rate` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '手續費幣種 對 USDT 匯率',
  `usdt_to_crypto_rate` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT 'USDT 對 交易幣種 匯率',
  `payment_fiat` varchar(100) NOT NULL DEFAULT '' COMMENT '支付法幣',
  `payment_unit_price` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT 'crypto 單價',
  `payment_amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單價格',
  `payment_template_id` varchar(255) NOT NULL DEFAULT '' COMMENT '支付方式配置 ID',
  `order_arrival_time` bigint NOT NULL DEFAULT '0' COMMENT '訂單到帳時間/充值到帳時間',
  `order_payment_time` bigint NOT NULL DEFAULT '0' COMMENT '訂單付款時間/鏈上成功或失敗時間',
  `unpaid_timeout_second` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '支付期限秒數',
  `chain_type` varchar(50) NOT NULL DEFAULT '' COMMENT '主網類型',
  `tx_hash` varchar(255) NOT NULL DEFAULT '' COMMENT '交易哈希',
  `from_address` varchar(255) NOT NULL DEFAULT '' COMMENT '來源地址',
  `to_address` varchar(255) NOT NULL DEFAULT '' COMMENT '目標地址',
  `chain_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '鏈上交易手續費',
  `chain_fee_crypto` varchar(50) NOT NULL DEFAULT '' COMMENT '鏈上手續費使用幣別',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '鏈上備註',
  `order_note` varchar(255) NOT NULL DEFAULT '' COMMENT '訂單交易備註',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_business_id` (`business_id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_order_arrival_time` (`order_arrival_time`),
  KEY `idx_order_uid_order_brand` (`order_uid`,`order_brand`),
  KEY `idx_reference_uid_reference_brand` (`reference_uid`,`reference_brand`),
  KEY `idx_reference_id` (`reference_id`),
  KEY `idx_order_uid_order_type_create_time` (`order_uid`,`order_type`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='交易訂單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_reversal`
--

DROP TABLE IF EXISTS `order_reversal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_reversal` (
  `id` bigint NOT NULL DEFAULT '0' COMMENT '交易訂單編號',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `order_type` tinyint NOT NULL DEFAULT '0' COMMENT '沖正訂單類型 1. 快捷交易',
  `business_id` varchar(200) NOT NULL DEFAULT '' COMMENT '訂單編號',
  `order_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '下單用戶 UID',
  `reversal_id` varchar(200) NOT NULL DEFAULT '' COMMENT '沖正訂單編號',
  `reference_id` varchar(200) NOT NULL DEFAULT '' COMMENT '來源訂單編號',
  `reference_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '訂單來源用戶 UID',
  `direction_type` tinyint NOT NULL DEFAULT '0' COMMENT '交易方向 1.買入 2.賣出',
  `crypto_type` varchar(50) NOT NULL DEFAULT '' COMMENT '交易幣種',
  `payment_fiat` varchar(100) NOT NULL DEFAULT '' COMMENT '支付法幣',
  `order_count` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單數量',
  `payment_amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單價格',
  `crypto_to_usdt_rate` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '交易幣種 對 USDT 匯率',
  `fiat_to_usd_rate` decimal(30,18) unsigned NOT NULL DEFAULT '0.000000000000000000' COMMENT '法幣 對 USD 匯率',
  `operator_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人員 UID',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '沖正原因',
  `server_memo` varchar(255) NOT NULL DEFAULT '' COMMENT '伺服器註解',
  `order_status` tinyint NOT NULL DEFAULT '0' COMMENT '訂單狀態 1.發起沖正 2.沖正完成 3.沖正失敗 4.沖正餘額不足',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_business_id` (`business_id`),
  UNIQUE KEY `uk_reversal_id` (`reversal_id`),
  UNIQUE KEY `uk_reference_id` (`reference_id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_direction_type` (`direction_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='沖正訂單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'esc_order'
--

--
-- Dumping routines for database 'esc_order'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:06:36
