/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_c2c
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
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '廣告單編號',
  `crypto` varchar(20) NOT NULL COMMENT '幣種名稱',
  `crypto_scale` tinyint NOT NULL DEFAULT '0',
  `fiat_currency` varchar(20) NOT NULL COMMENT '法幣名稱',
  `fiat_scale` tinyint NOT NULL DEFAULT '0',
  `currency_pair` varchar(20) NOT NULL COMMENT '貨幣交易對',
  `side` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:買入, 2:賣出',
  `uid` varchar(50) NOT NULL,
  `brand` varchar(30) NOT NULL COMMENT '三方來源',
  `quantity` decimal(30,18) NOT NULL COMMENT '總數量',
  `remain_quantity` decimal(30,18) NOT NULL COMMENT '剩餘數量',
  `in_progress_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '交易進行中數量',
  `price` decimal(30,18) NOT NULL COMMENT '單價',
  `price_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '價格類型: 1:固定, 2:浮動',
  `minimum_amount` decimal(30,18) NOT NULL COMMENT '交易最小限額',
  `maximum_amount` decimal(30,18) NOT NULL COMMENT '交易最大限額',
  `float_rate` decimal(5,2) NOT NULL COMMENT '浮動指數百分比',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '狀態: 1:進行中 2:已成交 3:用戶撤銷 4:運營撤銷 5:系統撤銷 6:風控下架 7:前台隱藏 8:無效',
  `unpaid_timeout_second` mediumint unsigned NOT NULL COMMENT '支付期限秒數',
  `tx_terms_memo` text COMMENT '交易條款',
  `is_complete_kyc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '限制是否通過KYC',
  `complete_signup_day` int unsigned NOT NULL COMMENT '限制通過註冊天數',
  `assets_greater_btc` decimal(30,18) NOT NULL COMMENT '限制資產BTC錢包餘額',
  `create_time` bigint NOT NULL,
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_serialNo` (`serial_no`),
  KEY `idx_uid_status` (`uid`,`status`),
  KEY `idx_crypto_fiatCurrency_status` (`crypto`,`fiat_currency`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='c2c 廣告單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertisement_change_record`
--

DROP TABLE IF EXISTS `advertisement_change_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_change_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ads_id` bigint NOT NULL COMMENT '廣告單ID',
  `order_id` varchar(50) NOT NULL COMMENT '交易單ID',
  `trace_id` varchar(50) NOT NULL COMMENT '追蹤ID',
  `current_qty` decimal(30,18) NOT NULL COMMENT '當前數量',
  `after_qty` decimal(30,18) NOT NULL COMMENT '交易後數量',
  `change_qty` decimal(30,18) NOT NULL COMMENT '異動數量',
  `action_type` varchar(50) NOT NULL COMMENT '異動類型',
  `memo` text COMMENT '備注',
  `create_time` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='c2c 廣告單庫存異動紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertisement_payment_method`
--

DROP TABLE IF EXISTS `advertisement_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_payment_method` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `advertisement_id` bigint unsigned NOT NULL COMMENT '廣告單ID',
  `payment_method_template_id` varchar(50) NOT NULL COMMENT '支付方法樣板ID',
  `payment_method_id` varchar(50) NOT NULL COMMENT '支付方法ID',
  `payment_name` varchar(50) NOT NULL DEFAULT '1' COMMENT '1:買入, 2:賣出',
  `create_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_advertisementID_paymentMethodID` (`advertisement_id`,`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='c2c 廣告單關聯支付方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advertisement_risk_revoke_record`
--

DROP TABLE IF EXISTS `advertisement_risk_revoke_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_risk_revoke_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `uid` varchar(50) NOT NULL,
  `ads_id` bigint NOT NULL DEFAULT '0' COMMENT '廣告單ID',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `expired_at` bigint NOT NULL DEFAULT '0' COMMENT '風控下架失效時間',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '執行狀態 1.等待取消 2.已取消風控下架',
  `current_ads_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '當前廣告單狀態',
  PRIMARY KEY (`id`),
  KEY `idx_status_expired_at` (`status`,`expired_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='廣告單風控下架紀錄';
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='job log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crypto_coin_configure`
--

DROP TABLE IF EXISTS `crypto_coin_configure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_coin_configure` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '幣種名稱',
  `minimum` decimal(30,18) NOT NULL COMMENT '最小交易數',
  `decimals` tinyint unsigned NOT NULL COMMENT '交易精度',
  `maximum` decimal(30,18) NOT NULL COMMENT '最大交易數',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:啟用 2:禁用',
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='幣種配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fiat_coin_configure`
--

DROP TABLE IF EXISTS `fiat_coin_configure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiat_coin_configure` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '法幣名稱',
  `full_name` varchar(50) NOT NULL COMMENT '法幣全稱',
  `decimals` tinyint unsigned NOT NULL COMMENT '交易精度',
  `status` tinyint(1) NOT NULL COMMENT '1:禁用 2:啟用',
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='法幣配置';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='machineID Assigner for Generator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_c2c'
--

--
-- Dumping routines for database 'cnx_c2c'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 13:59:58
