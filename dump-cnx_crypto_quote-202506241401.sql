/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_crypto_quote
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
) ENGINE=InnoDB AUTO_INCREMENT=11312978 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='job log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(20) DEFAULT NULL COMMENT '幣種',
  `currency_type` tinyint DEFAULT NULL COMMENT '幣種類型 1.加密貨幣 2.法幣 3.穩定幣',
  `status` tinyint DEFAULT NULL COMMENT '啟用狀態 1.啟用 2.禁用',
  `update_time` bigint DEFAULT NULL,
  `create_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency` (`currency`,`currency_type`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_orig`
--

DROP TABLE IF EXISTS `currency_orig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_orig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(20) DEFAULT NULL COMMENT '幣種',
  `currency_type` tinyint DEFAULT NULL COMMENT '幣種類型 1.加密貨幣 2.法幣 3.穩定幣',
  `status` tinyint DEFAULT NULL COMMENT '啟用狀態 1.啟用 2.禁用',
  `update_time` bigint DEFAULT NULL,
  `create_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency` (`currency`,`currency_type`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exchange_rate_switch_log`
--

DROP TABLE IF EXISTS `exchange_rate_switch_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange_rate_switch_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `prev_source_type` tinyint NOT NULL COMMENT '原本匯率類型 (1: 幣安C2C, 2: 自有匯率, 3: 固定匯率)',
  `prev_buy_exchange_rate` decimal(30,18) NOT NULL COMMENT '原本買入匯率值',
  `prev_sell_exchange_rate` decimal(30,18) NOT NULL COMMENT '原本賣出匯率值',
  `prev_rate_time` bigint NOT NULL COMMENT '上次正常的時間',
  `new_source_type` tinyint NOT NULL COMMENT '切換後匯率類型 (1: 幣安C2C, 2: 自有匯率, 3: 固定匯率)',
  `new_buy_exchange_rate` decimal(30,18) NOT NULL COMMENT '切換後買入匯率值',
  `new_sell_exchange_rate` decimal(30,18) NOT NULL COMMENT '切換後賣出匯率值',
  `create_time` bigint NOT NULL COMMENT '創建時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='匯率切換日誌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fix_kline_log`
--

DROP TABLE IF EXISTS `fix_kline_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fix_kline_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) DEFAULT '' COMMENT '操作人',
  `pair` varchar(20) DEFAULT '' COMMENT '幣種',
  `target_price` tinyint DEFAULT NULL COMMENT '1:最新價格 2:標記價格 3:全部',
  `start_time` bigint NOT NULL DEFAULT '0' COMMENT '修改開始時間',
  `end_time` bigint NOT NULL DEFAULT '0' COMMENT '修改結束時間',
  `create_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pair_target_price_time` (`pair`,`target_price`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='修復K線記錄表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kick_price_log`
--

DROP TABLE IF EXISTS `kick_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `kick_price_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pair` varchar(20) DEFAULT '' COMMENT '幣對 如btcusdt',
  `brand` varchar(20) DEFAULT '' COMMENT '平台',
  `is_mark` tinyint DEFAULT NULL COMMENT '0:最新價格 1:標記價格',
  `price` decimal(28,18) DEFAULT '0.000000000000000000' COMMENT '價格',
  `event_time` bigint NOT NULL DEFAULT '0' COMMENT '事件時間',
  `trade_time` bigint NOT NULL DEFAULT '0' COMMENT '成交時間',
  `create_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pair_is_mark_time` (`pair`,`is_mark`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=11383319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='價格剔除記錄表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pin_price_log`
--

DROP TABLE IF EXISTS `pin_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pin_price_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pair` varchar(20) NOT NULL COMMENT '幣對',
  `kline_view_time` bigint NOT NULL COMMENT '时间颗粒度下，Kline對應時間',
  `pin_type` tinyint NOT NULL COMMENT '插針類型 1: 最高 2: 最低',
  `status` tinyint NOT NULL COMMENT '狀態 1: 未處理 2: 已處理 3: 無歷史資料',
  `create_time` bigint NOT NULL COMMENT 'timestamp',
  `price` decimal(30,10) NOT NULL COMMENT '插針價格',
  `position_id` varchar(100) NOT NULL COMMENT '倉位ID',
  `random_slippery` decimal(30,10) NOT NULL COMMENT '隨機滑點',
  `slippery` decimal(30,10) NOT NULL COMMENT '基礎滑點',
  `is_mark` tinyint NOT NULL COMMENT '0: 最新價格 1: 標記價格',
  `price_scale` int NOT NULL COMMENT '價格精度',
  `fix_price` decimal(30,10) NOT NULL COMMENT '修正價格',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_pair_kline_pin` (`pair`,`kline_view_time`,`pin_type`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=38149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='K線插針最高最低價格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `price_change_log`
--

DROP TABLE IF EXISTS `price_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_change_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pair` varchar(20) DEFAULT '' COMMENT '幣對 如btcusdt',
  `is_mark` tinyint DEFAULT NULL COMMENT '0:最新價格 1:標記價格',
  `price` decimal(28,18) DEFAULT '0.000000000000000000' COMMENT '變動後的價格',
  `change_type` tinyint DEFAULT '0' COMMENT '1: 做市 2:找不到換價格 3:波動替換價格',
  `brand` varchar(20) DEFAULT '' COMMENT '如果change_type=2，這邊顯示換哪家',
  `create_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pair_is_mark_time` (`pair`,`is_mark`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4924311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='價格變動記錄表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tenthousand_price_change_log`
--

DROP TABLE IF EXISTS `tenthousand_price_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenthousand_price_change_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pair` varchar(20) DEFAULT '' COMMENT '幣對 如btcusdt',
  `is_mark` tinyint DEFAULT NULL COMMENT '0:最新價格 1:標記價格',
  `price` decimal(28,18) DEFAULT '0.000000000000000000' COMMENT '變動後的價格',
  `change_type` tinyint DEFAULT '0' COMMENT '1: 做市 2:找不到換價格 3:波動替換價格',
  `brand` varchar(20) DEFAULT '' COMMENT '如果change_type=2，這邊顯示換哪家',
  `create_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pair_is_mark_time` (`pair`,`is_mark`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5146818 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='万倍合约價格變動記錄表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_crypto_quote'
--

--
-- Dumping routines for database 'cnx_crypto_quote'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:01:32
