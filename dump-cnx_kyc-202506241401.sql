/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_kyc
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
-- Table structure for table `advanced_list`
--

DROP TABLE IF EXISTS `advanced_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advanced_list` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `member_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '會員uid',
  `operator_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '審批人uid',
  `operator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '審批人姓名',
  `verify_status` tinyint NOT NULL DEFAULT '0' COMMENT '驗證狀態 1:審核中 2:成功 3:失敗',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `area` char(3) NOT NULL DEFAULT '' COMMENT '國家',
  `address` varchar(512) NOT NULL DEFAULT '' COMMENT '地址',
  `bill_type` tinyint NOT NULL DEFAULT '0' COMMENT '帳單類型 mapping document.id',
  `bill_photo_link` varchar(100) NOT NULL DEFAULT '' COMMENT '帳單',
  `fail_type` tinyint NOT NULL DEFAULT '0' COMMENT '錯誤類型',
  `fail_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '錯誤理由',
  `apply_time` bigint NOT NULL DEFAULT '0' COMMENT '申請時間',
  `approve_time` bigint NOT NULL DEFAULT '0' COMMENT '審批時間',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_member_uid` (`member_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='高級(一般)認證清單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advanced_philippines_list`
--

DROP TABLE IF EXISTS `advanced_philippines_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `advanced_philippines_list` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `member_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '會員uid mapping esc_member.user.uid',
  `operator_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '審批人uid',
  `operator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '審批人姓名',
  `verify_status` tinyint NOT NULL DEFAULT '0' COMMENT '驗證狀態 1:審核中 2:成功 3:失敗',
  `area` char(3) NOT NULL DEFAULT '' COMMENT '國碼',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `gender` tinyint NOT NULL DEFAULT '0' COMMENT '性別 1:male 2:female 3:other',
  `birth_date` bigint NOT NULL DEFAULT '0' COMMENT '生日',
  `birth_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出生地',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '電話',
  `address` text NOT NULL COMMENT '出生地',
  `job_category` tinyint NOT NULL DEFAULT '0' COMMENT '工作性質',
  `company_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司名稱',
  `income_source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '資金來源',
  `tax_number` varchar(12) NOT NULL DEFAULT '' COMMENT '稅號號碼',
  `sss` varchar(10) NOT NULL DEFAULT '' COMMENT '社保號碼',
  `gsis` varchar(10) DEFAULT '' COMMENT '保險號碼',
  `note` text COMMENT '備註',
  `fail_type` tinyint NOT NULL DEFAULT '0' COMMENT '錯誤類型',
  `fail_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '錯誤理由',
  `apply_time` bigint NOT NULL DEFAULT '0' COMMENT '申請時間',
  `approve_time` bigint NOT NULL DEFAULT '0' COMMENT '審批時間',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_member_uid` (`member_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='高級(菲律賓)認證清單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `basic_list`
--

DROP TABLE IF EXISTS `basic_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `basic_list` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `member_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '會員uid',
  `operator_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '審批人uid',
  `operator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '審批人姓名',
  `applicant_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'sumsub.applicant_id',
  `verify_type` tinyint NOT NULL DEFAULT '0' COMMENT '驗證類型 1:人審 2:機審',
  `verify_status` tinyint NOT NULL DEFAULT '0' COMMENT '驗證狀態 1:審核中 2:成功 3:失敗',
  `name` varchar(200) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `gender` tinyint NOT NULL DEFAULT '0' COMMENT '性別 1:男 2:女',
  `birthday` bigint NOT NULL DEFAULT '0' COMMENT '生日',
  `area` varchar(100) DEFAULT NULL,
  `identity_type` tinyint NOT NULL DEFAULT '0' COMMENT '身份類型 mapping document.id',
  `identity_number` varchar(50) NOT NULL DEFAULT '' COMMENT '證件號碼',
  `front_photo_link` varchar(500) DEFAULT NULL,
  `back_photo_link` varchar(500) DEFAULT NULL,
  `selfie_photo_link` varchar(500) DEFAULT NULL,
  `selfie_video_link` varchar(500) NOT NULL DEFAULT '',
  `verify_code` varchar(10) NOT NULL DEFAULT '',
  `fail_type` tinyint NOT NULL DEFAULT '0' COMMENT '錯誤類型',
  `fail_reason` varchar(256) NOT NULL DEFAULT '' COMMENT '錯誤理由',
  `apply_time` bigint NOT NULL DEFAULT '0' COMMENT '申請時間',
  `approve_time` bigint NOT NULL DEFAULT '0' COMMENT '審批時間',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_member_uid` (`member_uid`),
  KEY `idx_member_uid_apply_time` (`member_uid`,`apply_time` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='初級認證清單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `document_name` varchar(50) NOT NULL COMMENT '文件名稱',
  `document_type` tinyint NOT NULL DEFAULT '0' COMMENT '文件類型 1:證件 2:帳單',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kyc_level`
--

DROP TABLE IF EXISTS `kyc_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `kyc_level` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `deposit_status` tinyint NOT NULL DEFAULT '2' COMMENT '充值 1:開啟 2:關閉',
  `withdrawal_limit` decimal(25,4) DEFAULT NULL COMMENT '提款限額',
  `c2c_trading_status` tinyint NOT NULL DEFAULT '2' COMMENT 'c2c交易 1:開啟 2:關閉',
  `quick_trading_status` tinyint NOT NULL DEFAULT '2' COMMENT '快速交易 1:開啟 2:關閉',
  `third_party_payment_status` tinyint NOT NULL DEFAULT '2' COMMENT '三方支付 1:開啟 2:關閉',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='kyc層級表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `member_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '會員uid mapping esc_member.user.uid',
  `kyc_level` tinyint NOT NULL DEFAULT '1' COMMENT 'kyc等級 mapping kyc_level.id',
  `verify_status` tinyint NOT NULL DEFAULT '0' COMMENT '驗證狀態 1:審核中 2:成功 3:失敗',
  `basic_id` bigint DEFAULT NULL COMMENT '初級id mapping basic_list.id',
  `basic_verify_type` tinyint NOT NULL DEFAULT '0' COMMENT '初級驗證類型 1:人審 2:機審',
  `advanced_id` bigint DEFAULT NULL COMMENT '高級id mapping advanced_list/advanced_philippines_list.id',
  `advanced_verify_type` tinyint NOT NULL DEFAULT '0' COMMENT '高級驗證類型 1:一般 2:菲律賓',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_member_uid` (`member_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='會員kyc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `view_advanced_listing`
--

DROP TABLE IF EXISTS `view_advanced_listing`;
/*!50001 DROP VIEW IF EXISTS `view_advanced_listing`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_advanced_listing` AS SELECT
 1 AS `member_uid`,
  1 AS `id`,
  1 AS `verify_status`,
  1 AS `name`,
  1 AS `area`,
  1 AS `bill_type`,
  1 AS `apply_time`,
  1 AS `approve_time`,
  1 AS `operator_uid`,
  1 AS `operator_name` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'cnx_kyc'
--

--
-- Dumping routines for database 'cnx_kyc'
--

--
-- Final view structure for view `view_advanced_listing`
--

/*!50001 DROP VIEW IF EXISTS `view_advanced_listing`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_advanced_listing` AS select `advanced_list`.`member_uid` AS `member_uid`,`advanced_list`.`id` AS `id`,`advanced_list`.`verify_status` AS `verify_status`,`advanced_list`.`name` AS `name`,`advanced_list`.`area` AS `area`,`advanced_list`.`bill_type` AS `bill_type`,`advanced_list`.`apply_time` AS `apply_time`,`advanced_list`.`approve_time` AS `approve_time`,`advanced_list`.`operator_uid` AS `operator_uid`,`advanced_list`.`operator_name` AS `operator_name` from `advanced_list` union select `advanced_philippines_list`.`member_uid` AS `member_uid`,`advanced_philippines_list`.`id` AS `id`,`advanced_philippines_list`.`verify_status` AS `verify_status`,`advanced_philippines_list`.`name` AS `name`,`advanced_philippines_list`.`area` AS `area`,0 AS `bill_type`,`advanced_philippines_list`.`apply_time` AS `apply_time`,`advanced_philippines_list`.`approve_time` AS `approve_time`,`advanced_philippines_list`.`operator_uid` AS `operator_uid`,`advanced_philippines_list`.`operator_name` AS `operator_name` from `advanced_philippines_list` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:02:00
