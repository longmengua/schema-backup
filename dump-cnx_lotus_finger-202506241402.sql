/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_lotus_finger
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
-- Table structure for table `asset_pool`
--

DROP TABLE IF EXISTS `asset_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_pool` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) NOT NULL COMMENT '平台帳戶名稱',
  `base` varchar(20) NOT NULL COMMENT '幣種名稱',
  `quote` varchar(20) NOT NULL COMMENT '單位幣種',
  `symbol` varchar(50) NOT NULL COMMENT '合約交易對',
  `init_balance` decimal(30,18) NOT NULL COMMENT '初始資金額',
  `current_balance` decimal(30,18) NOT NULL COMMENT '當前資金額',
  `manual_deposit_balance` decimal(30,18) NOT NULL COMMENT '手動轉入金額',
  `manual_withdraw_balance` decimal(30,18) NOT NULL COMMENT '手動轉出金額',
  `long_unrealize_quantity` decimal(30,18) NOT NULL COMMENT '合約多倉未實現加密數量',
  `long_unrealize_pl` decimal(30,18) NOT NULL COMMENT '合約多倉未實現損益',
  `long_realize_pl` decimal(30,18) NOT NULL COMMENT '合約多倉已實現損益',
  `long_open_count` bigint NOT NULL DEFAULT '0' COMMENT '未實現多倉數量',
  `short_unrealize_quantity` decimal(30,18) NOT NULL COMMENT '合約空倉未實現加密數量',
  `short_unrealize_pl` decimal(30,18) NOT NULL COMMENT '合約空倉未實現損益',
  `short_realize_pl` decimal(30,18) NOT NULL COMMENT '合約空倉已實現損益',
  `short_open_count` bigint NOT NULL DEFAULT '0' COMMENT '未實現空倉數量',
  `update_uid` varchar(50) NOT NULL COMMENT '更新者UID',
  `create_time` bigint NOT NULL,
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_symbol` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='永續合約平台資金池';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_pool_tx_detail`
--

DROP TABLE IF EXISTS `asset_pool_tx_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_pool_tx_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '交易者uid',
  `base` varchar(20) NOT NULL COMMENT '幣種名稱',
  `quote` varchar(20) NOT NULL COMMENT '單位幣種',
  `symbol` varchar(50) NOT NULL COMMENT '合約交易對',
  `after_balance` decimal(30,18) NOT NULL COMMENT '異動後資金額度',
  `before_balance` decimal(30,18) NOT NULL COMMENT '異動前資金額度',
  `change_balance` decimal(30,18) NOT NULL COMMENT '異動金額',
  `position_id` bigint NOT NULL COMMENT '合約倉位ID',
  `tx_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易類型 1.用戶虧損 2.用戶盈利 3.手動轉入 4.手動轉出',
  `create_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createTime` (`create_time` DESC),
  KEY `idx_symbol_createTime` (`symbol`,`create_time` DESC),
  KEY `idx_txType_createTime` (`tx_type`,`create_time` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=40438 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='永續合約平台資金池交易詳情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `random_ploy`
--

DROP TABLE IF EXISTS `random_ploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `random_ploy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ploy_id` varchar(20) DEFAULT NULL,
  `ploy_type` tinyint DEFAULT NULL,
  `hit_prob` tinyint DEFAULT NULL,
  `min_hold_time` int DEFAULT NULL,
  `max_hold_time` int DEFAULT NULL,
  `min_rand_num` tinyint DEFAULT NULL,
  `max_rand_num` tinyint DEFAULT NULL,
  `min_delay` tinyint DEFAULT NULL,
  `max_delay` tinyint DEFAULT NULL,
  `open` tinyint DEFAULT NULL,
  `create_time` bigint DEFAULT NULL,
  `update_time` bigint DEFAULT NULL,
  `pair` varchar(32) DEFAULT NULL,
  `min_margin` int DEFAULT NULL,
  `margin_status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ploy_id` (`ploy_id`) USING BTREE,
  KEY `ploy_type` (`ploy_type`) USING BTREE,
  KEY `update_time` (`update_time`) USING BTREE,
  KEY `open` (`open`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `random_ploy_log`
--

DROP TABLE IF EXISTS `random_ploy_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `random_ploy_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ploy_id` varbinary(20) DEFAULT NULL,
  `ploy_type` tinyint DEFAULT NULL,
  `operate_type` tinyint DEFAULT NULL,
  `operate_time` bigint DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_id` varchar(255) DEFAULT NULL,
  `change_content` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ploy_id` (`ploy_id`) USING BTREE,
  KEY `ploy_type` (`ploy_type`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `operate_time` (`operate_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `random_slide`
--

DROP TABLE IF EXISTS `random_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `random_slide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ploy_id` varchar(20) NOT NULL COMMENT '策略ID',
  `min_slide` float unsigned zerofill NOT NULL DEFAULT '000000000000' COMMENT '最小滑点',
  `max_slide` float unsigned zerofill NOT NULL DEFAULT '000000000000' COMMENT '最大滑点',
  `min_leverage` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000' COMMENT '幅度最小值',
  `max_leverage` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000' COMMENT '幅度最大值',
  `create_time` bigint(20) unsigned zerofill NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) unsigned zerofill NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_lotus_finger'
--

--
-- Dumping routines for database 'cnx_lotus_finger'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:02:09
