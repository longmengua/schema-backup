/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_commission
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
-- Table structure for table `agent_nodes`
--

DROP TABLE IF EXISTS `agent_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_nodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `referral_code` varchar(50) NOT NULL,
  `is_valid_user` int NOT NULL DEFAULT '2',
  `upgrade_type` int NOT NULL DEFAULT '1',
  `rebate_level_type` int NOT NULL DEFAULT '0',
  `create_time` bigint NOT NULL,
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_uid` (`uid`),
  UNIQUE KEY `uk_referral_code` (`referral_code`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=11487 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leaderboard_daily`
--

DROP TABLE IF EXISTS `leaderboard_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard_daily` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` bigint NOT NULL,
  `rank` tinyint NOT NULL,
  `uid` varchar(50) NOT NULL,
  `rebate` decimal(30,18) NOT NULL,
  `invite_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leaderboard_monthly`
--

DROP TABLE IF EXISTS `leaderboard_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard_monthly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `start_date` bigint NOT NULL DEFAULT '0',
  `end_date` bigint NOT NULL DEFAULT '0',
  `rank` int NOT NULL,
  `uid` varchar(50) NOT NULL,
  `commission` decimal(30,18) NOT NULL,
  `invite_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `start_date` (`start_date`,`end_date`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_nodes`
--

DROP TABLE IF EXISTS `partner_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_nodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '合作方uid',
  `code` varchar(50) NOT NULL COMMENT '合作方标识',
  `referral_code` varchar(50) NOT NULL COMMENT '账户邀请码',
  `direct_downline_count` bigint NOT NULL DEFAULT '0',
  `create_time` bigint NOT NULL,
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_referral_code` (`referral_code`),
  UNIQUE KEY `partner_code` (`code`),
  KEY `idx_referral_code_code` (`referral_code`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rebate_global_setting`
--

DROP TABLE IF EXISTS `rebate_global_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rebate_global_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `upgrade_count` bigint NOT NULL COMMENT '升級條件 次數',
  `upgrade_value` decimal(30,18) NOT NULL COMMENT '升級條件 金額',
  `create_time` bigint NOT NULL COMMENT '創建時間',
  `update_time` bigint NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='返佣全域設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rebate_order`
--

DROP TABLE IF EXISTS `rebate_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rebate_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `create_time` bigint NOT NULL,
  `complete_time` bigint DEFAULT NULL,
  `uid` varchar(50) NOT NULL,
  `rebate_level_type` int NOT NULL DEFAULT '0',
  `upline_uid` varchar(50) NOT NULL DEFAULT '',
  `upline_rebate_level_type` int NOT NULL DEFAULT '0',
  `total_amount` decimal(30,18) DEFAULT '0.000000000000000000',
  `order_id` varchar(50) NOT NULL,
  `total_fee` decimal(30,18) NOT NULL,
  `rebate_rate` decimal(5,2) NOT NULL,
  `risk_rebate_rate` decimal(5,2) DEFAULT '0.00',
  `rebate` decimal(30,18) DEFAULT '0.000000000000000000',
  `origin_rebate` decimal(30,18) DEFAULT '0.000000000000000000',
  `rebate_calculate_time` bigint DEFAULT '0',
  `total_rebate_sharing` decimal(30,18) DEFAULT '0.000000000000000000',
  `origin_total_rebate_sharing` decimal(30,18) DEFAULT '0.000000000000000000',
  `rebate_sharing_calculate_time` bigint DEFAULT '0',
  `transaction_fee_net_of_rebates` decimal(30,18) DEFAULT '0.000000000000000000',
  `total_peer_level_bonus` decimal(30,18) DEFAULT '0.000000000000000000',
  `origin_total_peer_level_bonus` decimal(30,18) DEFAULT '0.000000000000000000',
  `peer_level_bonus_calculate_time` bigint DEFAULT '0',
  `actual_transaction_fee` decimal(30,18) DEFAULT '0.000000000000000000',
  `order_status` int NOT NULL DEFAULT '1',
  `risk_status` tinyint DEFAULT '2',
  `symbol` varchar(100) NOT NULL DEFAULT '',
  `contract_type` int DEFAULT '0' COMMENT '合约类型 1 普通合约 2 千倍 3 万倍',
  `leverage` int DEFAULT '0' COMMENT '杠杆倍数',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_uid_create_time` (`uid`,`create_time`),
  KEY `idx_uid_complete_time` (`uid`,`complete_time`),
  KEY `idx_uid_order_status` (`uid`,`order_status`),
  KEY `rebate_order_symbol_IDX` (`symbol`) USING BTREE,
  KEY `idx_uid_total_amount` (`uid`,`total_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=80705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rebate_setting`
--

DROP TABLE IF EXISTS `rebate_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rebate_setting` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` int DEFAULT NULL,
  `level_id` varchar(50) DEFAULT NULL,
  `rebate_rate` decimal(5,2) DEFAULT NULL,
  `system_rebate_rate` decimal(5,2) DEFAULT NULL,
  `peer_level_bonus_generations` int DEFAULT NULL,
  `peer_level_bonus_rate` decimal(5,2) DEFAULT NULL,
  `perform_rebate_rate` decimal(5,2) DEFAULT NULL,
  `perform_system_rebate_rate` decimal(5,2) DEFAULT NULL,
  `perform_peer_level_bonus_rate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_level_id` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rebate_setting_v2`
--

DROP TABLE IF EXISTS `rebate_setting_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rebate_setting_v2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rebate_level_type` int NOT NULL COMMENT '反佣等級類型 1:交易商 2:初級社區 3:中級社區 4:高級社區 5:運營中心 6:獨立社區',
  `rebate_rate` decimal(5,2) NOT NULL COMMENT '自反佣比率',
  `system_rebate_rate` decimal(5,2) NOT NULL COMMENT '體系反佣比率',
  `peer_bonus_generations` bigint NOT NULL COMMENT '平級獎勵層數',
  `peer_bonus_rate` decimal(5,2) NOT NULL COMMENT '平級獎勵比率',
  `sort_type` int NOT NULL DEFAULT '0' COMMENT '升級順序',
  `create_time` bigint NOT NULL COMMENT '創建時間',
  `update_time` bigint NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rebate_level_type` (`rebate_level_type`),
  UNIQUE KEY `uk_sort_type` (`sort_type`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='返佣設定配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rebate_upgrade_setting`
--

DROP TABLE IF EXISTS `rebate_upgrade_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rebate_upgrade_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rebate_level_type` int NOT NULL COMMENT '反佣等級類型 1:交易商 2:初級社區 3:中級社區 4:高級社區 5:運營中心 6:獨立社區',
  `upgrade_type` int NOT NULL COMMENT '升級類型: 1:總交易量, 2:有效用戶數, 3:達有效社區用戶數, 4:社區總交易量, 5:社區總人數',
  `upgrade_value` decimal(30,18) NOT NULL COMMENT '升級條件值',
  `create_time` bigint NOT NULL COMMENT '創建時間',
  `update_time` bigint NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rebate_level_upgrade` (`rebate_level_type`,`upgrade_type`)
) ENGINE=InnoDB AUTO_INCREMENT=835 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='返佣升級設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_copy_trading_info`
--

DROP TABLE IF EXISTS `user_copy_trading_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_copy_trading_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `agent_uid` varchar(50) NOT NULL COMMENT '所属代理商uid',
  `uid` varchar(50) NOT NULL COMMENT '下线uid',
  `margin_percentage` double NOT NULL DEFAULT '0' COMMENT '跟单担保金系数%',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '跟单狀態 0: 關閉, 1: 啟用, 2: 刪除',
  `follower_status` tinyint NOT NULL DEFAULT '3' COMMENT '跟单狀態 3: 關閉, 4: 啟用',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_rebate_info`
--

DROP TABLE IF EXISTS `user_rebate_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rebate_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `withdraw_status` tinyint NOT NULL DEFAULT '1',
  `withdraw_total` decimal(30,18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11485 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_rebate_report`
--

DROP TABLE IF EXISTS `user_rebate_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rebate_report` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `report_type` tinyint DEFAULT '0' COMMENT '記錄種類 1. 手續費收入 2. 自+體系返佣總額支出 3. 平級獎勵合計支出 4. 手續費淨收入',
  `date_time` bigint DEFAULT '0' COMMENT '記錄時間',
  `value` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '紀錄值',
  PRIMARY KEY (`id`),
  KEY `idx_date_time` (`date_time`),
  KEY `idx_type` (`report_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用戶uid',
  `crypto` varchar(50) NOT NULL COMMENT '幣種',
  `type` tinyint NOT NULL COMMENT '餘額種類(1:可用 2:凍結 3:模擬可用 4:模擬凍結)',
  `balance` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '餘額',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1:正常 2:禁用',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=22957 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='錢包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet_transaction`
--

DROP TABLE IF EXISTS `wallet_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) NOT NULL COMMENT '訂單id',
  `uid` varchar(50) NOT NULL COMMENT '用戶uid',
  `crypto` varchar(50) NOT NULL COMMENT '幣種',
  `wallet_type` tinyint NOT NULL COMMENT '餘額種類(1:可用 2:凍結)',
  `type` tinyint NOT NULL COMMENT '交易種類',
  `amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '金額',
  `finish_balance` decimal(30,18) NOT NULL COMMENT '完成交易後餘額',
  `create_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=101256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='錢包流水';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_commission'
--

--
-- Dumping routines for database 'cnx_commission'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:01:19
