/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_member
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='job log';
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fast_login`
--

DROP TABLE IF EXISTS `fast_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fast_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL COMMENT 'User ID',
  `device_id` varchar(50) DEFAULT NULL COMMENT '裝置 ID',
  `fast_login_key` varchar(255) DEFAULT NULL COMMENT '快速登入 KEY',
  `updated_time` bigint DEFAULT NULL COMMENT '更新時間',
  `expired_time` bigint NOT NULL COMMENT '過期時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_fast_login_key` (`fast_login_key`),
  UNIQUE KEY `uni_uid_device_id` (`uid`,`device_id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` varchar(50) NOT NULL,
  `start_time` bigint NOT NULL DEFAULT '0' COMMENT '什麼時候執行',
  `create_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_type_uid` (`type`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='價格剔除記錄表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_login_log`
--

DROP TABLE IF EXISTS `last_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `last_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL DEFAULT '',
  `uid` varchar(50) NOT NULL,
  `device_id` varchar(50) NOT NULL COMMENT '裝置ID',
  `device` varchar(50) DEFAULT NULL COMMENT '設備 例如Mobile',
  `device_brand` varchar(50) DEFAULT NULL COMMENT '設備品牌 例如Apple',
  `device_version` varchar(255) DEFAULT NULL,
  `login_ip` varchar(50) NOT NULL COMMENT '最後一次登入IP',
  `login_location` varchar(255) DEFAULT NULL,
  `login_time` bigint NOT NULL COMMENT '最後一次登入時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_idx_uid` (`uid`),
  UNIQUE KEY `uni_idx_uid_device_id` (`uid`,`device_id`),
  UNIQUE KEY `uni_idx_uid_login_ip` (`uid`,`login_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=9598 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL DEFAULT '',
  `uid` varchar(50) NOT NULL,
  `device_id` varchar(50) NOT NULL COMMENT '裝置ID',
  `device` varchar(50) DEFAULT NULL COMMENT 'WEB/APP',
  `device_brand` varchar(50) DEFAULT NULL COMMENT '設備品牌 例如Apple',
  `device_version` varchar(50) DEFAULT NULL,
  `login_ip` varchar(50) NOT NULL COMMENT '最後一次登入IP',
  `login_location` varchar(255) DEFAULT NULL,
  `login_time` bigint NOT NULL DEFAULT '0' COMMENT '最後一次登入時間',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_uid_device_id` (`uid`,`device_id`),
  KEY `idx_uid_login_ip` (`uid`,`login_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='價格變動記錄表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `register_log`
--

DROP TABLE IF EXISTS `register_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `register_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `ip_location` varchar(255) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL COMMENT '設備 例如Mobile',
  `device_type` varchar(50) DEFAULT NULL COMMENT '設備類型 例如IOS',
  `device_brand` varchar(50) DEFAULT NULL COMMENT '設備品牌 例如Apple',
  `device_version` varchar(255) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL,
  `register_time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `content` varchar(255) NOT NULL,
  `language` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_questionId_language` (`question_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL DEFAULT '',
  `login_id` varchar(50) NOT NULL COMMENT '登入ID',
  `uid` varchar(50) NOT NULL,
  `login_type` int NOT NULL COMMENT '登入方式 1: Email 2: Phone',
  `password` varchar(255) NOT NULL,
  `user_type` int NOT NULL COMMENT '用戶類型 1.一般使用者 2.後台用戶',
  `google_verify` tinyint(1) NOT NULL DEFAULT '2' COMMENT 'Google 驗證器 1. 啟用 2. 禁用',
  `email_verify` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Email 驗證 1. 啟用 2. 禁用',
  `first_login` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否第一次登入 1. 啟用 2. 禁用',
  `system_alarm` tinyint(1) NOT NULL DEFAULT '1' COMMENT '系統告警 1. 啟用 2. 禁用',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '人員狀態 1.啟用 2.凍結 3.暫時凍結 4.刪除',
  `kyc_status` tinyint NOT NULL DEFAULT '0' COMMENT 'kyc 狀態',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  `agent_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '代理商开关，1，开启；2，关闭',
  `agent_create_time` bigint NOT NULL DEFAULT '0' COMMENT '代理商创建时间',
  `agent_turn_on_time` bigint NOT NULL DEFAULT '0' COMMENT '代理商开关时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `login_id_login_type_unique` (`login_id`,`login_type`),
  KEY `idx_uid_login_type` (`uid`,`login_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11679 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_approval_system_risk`
--

DROP TABLE IF EXISTS `user_approval_system_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_approval_system_risk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `unblock_time` bigint NOT NULL DEFAULT '0',
  `create_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_blocked_device`
--

DROP TABLE IF EXISTS `user_blocked_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_blocked_device` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `trigger_type` int NOT NULL COMMENT '封鎖觸發類型 1: 系統 2: 運營',
  `device_id` varchar(50) NOT NULL COMMENT '封鎖的裝置ID',
  `device` varchar(50) DEFAULT NULL COMMENT '設備 例如Mobile',
  `device_brand` varchar(50) DEFAULT NULL COMMENT '設備品牌 例如Apple',
  `device_version` varchar(50) DEFAULT NULL,
  `unblock_time` bigint NOT NULL DEFAULT '0' COMMENT '解鎖時間',
  `submit_uid` varchar(50) DEFAULT NULL COMMENT '運營封鎖人員 uid',
  `submit_username` varchar(50) DEFAULT NULL COMMENT '運營封鎖人員名稱',
  `comment` text NOT NULL COMMENT '備註',
  `created_time` bigint NOT NULL DEFAULT '0',
  `updated_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_uid_trigger_type` (`uid`,`trigger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=80850 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_blocked_ip`
--

DROP TABLE IF EXISTS `user_blocked_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_blocked_ip` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `trigger_type` int NOT NULL COMMENT '封鎖觸發類型 1: 系統 2: 運營',
  `ip_address` varchar(50) NOT NULL COMMENT '封鎖的裝置ID',
  `ip_location` varchar(255) DEFAULT NULL,
  `unblock_time` bigint NOT NULL DEFAULT '0' COMMENT '解鎖時間',
  `submit_uid` varchar(50) DEFAULT NULL COMMENT '運營封鎖人員 uid',
  `submit_username` varchar(50) DEFAULT NULL COMMENT '運營封鎖人員名稱',
  `comment` text NOT NULL COMMENT '備註',
  `created_time` bigint NOT NULL DEFAULT '0',
  `updated_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_uid_trigger_type` (`uid`,`trigger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `role_id` varchar(50) NOT NULL COMMENT '角色名稱',
  `nickname` varchar(50) NOT NULL,
  `live_id` bigint DEFAULT NULL COMMENT '直播id',
  `email` varchar(50) NOT NULL,
  `phone` varchar(35) NOT NULL,
  `area_code` varchar(6) NOT NULL,
  `nickname_update_time` bigint NOT NULL COMMENT '暱稱修改時間',
  `update_time` bigint NOT NULL,
  `brand` varchar(50) NOT NULL DEFAULT '' COMMENT '來源',
  `fiat_currency` varchar(10) NOT NULL DEFAULT 'USD' COMMENT '法幣',
  `language` varchar(10) NOT NULL DEFAULT 'en-US' COMMENT '語系設定',
  `izrda` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Innovation Zone Risk Disclosure Agreement 简写为 (IZRDA)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `nickname_uni` (`nickname`),
  KEY `idx_email_uid` (`email`,`uid`),
  KEY `idx_phone_area_code_uid` (`phone`,`area_code`,`uid`),
  KEY `idx_uid_nickname` (`uid`,`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=11530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_security`
--

DROP TABLE IF EXISTS `user_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_security` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL DEFAULT '',
  `uid` varchar(50) NOT NULL,
  `device_id` varchar(50) NOT NULL DEFAULT '',
  `security_type` varchar(20) NOT NULL COMMENT '安全類型 (mail,ga,sms,phishing)',
  `security_code` varchar(50) NOT NULL,
  `binding` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否綁定 1: true 2: false',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否啟用 1: true 2: false',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_uid_security_type_device_id` (`uid`,`security_type`,`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_security_question_relation`
--

DROP TABLE IF EXISTS `user_security_question_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_security_question_relation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL DEFAULT '',
  `uid` varchar(50) NOT NULL,
  `question_id` int unsigned NOT NULL,
  `answer` varchar(255) NOT NULL,
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_uid_questionid` (`uid`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `create_order` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可以開倉 1. 啟用 2. 禁用',
  `withdraw` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可以提幣 1. 啟用 2. 禁用',
  `approval` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否可以提幣 1. 啟用 2. 禁用',
  `c2c_withdraw` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可以提幣 1. 啟用 2. 禁用',
  `c2c_approval` tinyint(1) NOT NULL DEFAULT '2' COMMENT '人工審批 1. 啟用 2. 禁用',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用戶設定(前台不可見、僅用於後台及程式邏輯使用)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `id` bigint NOT NULL DEFAULT '0' COMMENT '體驗金ID',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '體驗券類型 1=Futures Trading Bonus',
  `amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '體驗券金額',
  `crypto` varchar(50) NOT NULL COMMENT '幣種',
  `leverage_range_start` int DEFAULT '0' COMMENT '體驗券可使用的槓桿範圍_起始',
  `leverage_range_end` int DEFAULT '0' COMMENT '體驗券可使用的槓桿範圍_結束',
  `holding_range_min` int DEFAULT '0' COMMENT '體驗金可以使用的最小持倉時間',
  `holding_range_max` int DEFAULT '0' COMMENT '體驗金可以使用的最大持倉時間',
  `remark` varchar(100) DEFAULT NULL COMMENT '體驗金說明',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='體驗金設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_apportion`
--

DROP TABLE IF EXISTS `voucher_apportion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher_apportion` (
  `id` bigint NOT NULL DEFAULT '0' COMMENT '發放ID',
  `voucher_id` bigint NOT NULL DEFAULT '0' COMMENT '體驗金ID',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '體驗券狀態 1=未使用, 2=已領取(已發放), 3=已過期, 4=已失效',
  `target` tinyint DEFAULT NULL COMMENT '發放目標 1=UID, 2=註冊時間, 3=用戶tag',
  `total_amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '發放總金額',
  `apportion_time` bigint NOT NULL COMMENT '發放時間',
  `claim_type` tinyint NOT NULL COMMENT '領取類型 1=手動, 2=自動',
  `claim_before` bigint NOT NULL COMMENT '體驗金領取有效期',
  `available_period` int NOT NULL COMMENT '使用有效期，領取後的有效天數',
  `comment` varchar(100) DEFAULT NULL COMMENT '發放備註',
  `user_id` varchar(30) DEFAULT NULL COMMENT '發放後台使用者ID',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_voucher_id` (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='體驗金發放';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_apportion_dtl`
--

DROP TABLE IF EXISTS `voucher_apportion_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher_apportion_dtl` (
  `id` bigint NOT NULL COMMENT '使用者體驗券ID',
  `apportion_id` bigint NOT NULL DEFAULT '0' COMMENT '發放ID',
  `voucher_id` bigint NOT NULL DEFAULT '0' COMMENT '體驗金ID',
  `member_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '會員UID',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '使用狀態 1=未使用, 2=已領取, 3=已使用, 4=已過期, 5=已失效',
  `claim_type` tinyint NOT NULL DEFAULT '0' COMMENT '領取類型 1=手動領取, 2=自動領取',
  `claim_time` bigint DEFAULT NULL COMMENT '領取時間',
  `used_time` bigint DEFAULT NULL COMMENT '使用時間',
  `expiration_time` bigint DEFAULT NULL COMMENT '過期失效時間',
  `invalid_time` bigint DEFAULT NULL COMMENT '過期失效時間',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_apportion_id` (`apportion_id`),
  KEY `idx_voucher_id` (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='體驗金發放詳情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_member'
--

--
-- Dumping routines for database 'cnx_member'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:02:38
