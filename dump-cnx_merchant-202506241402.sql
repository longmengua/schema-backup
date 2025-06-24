/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_merchant
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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `merchant_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '支付商ID',
  `merchant_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '支付商名稱',
  `member_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '會員uid',
  `order_id` varchar(50) NOT NULL DEFAULT '' COMMENT '訂單ID',
  `merchant_order_id` varchar(50) NOT NULL DEFAULT '' COMMENT '支付商訂單ID',
  `order_type` tinyint NOT NULL DEFAULT '0' COMMENT '訂單類型 1: 代收 2: 代付',
  `order_status` tinyint NOT NULL DEFAULT '0' COMMENT '訂單狀態 1:創建成功 2:創建失敗 3:收款成功 4:收款失敗 5:用戶上分成功 6:用戶上分失敗 7:用戶上分超時',
  `return_code` varchar(10) NOT NULL DEFAULT '' COMMENT '支付商訂單-狀態',
  `msg` varchar(50) NOT NULL DEFAULT '' COMMENT '支付商訂單-錯誤訊息',
  `amount` decimal(30,18) DEFAULT NULL COMMENT '訂單金額',
  `order_amount` decimal(30,18) DEFAULT NULL COMMENT '訂單實際金額',
  `bank_code` varchar(10) NOT NULL DEFAULT '' COMMENT '銀行代碼',
  `bank_account` varchar(50) NOT NULL DEFAULT '' COMMENT '銀行帳號',
  `bank_account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '銀行戶名',
  `bank_area` varchar(50) NOT NULL DEFAULT '' COMMENT '銀行地址資訊',
  `remark` varchar(50) NOT NULL DEFAULT '' COMMENT '備註',
  `is_received_notify` tinyint NOT NULL DEFAULT '0' COMMENT '是否已收款通知 0:否 1:是',
  `is_test` tinyint NOT NULL DEFAULT '0' COMMENT '是否為測試資料 0:否 1:是',
  `apply_time` bigint NOT NULL DEFAULT '0' COMMENT '訂單申請時間',
  `received_time` bigint NOT NULL DEFAULT '0' COMMENT '訂單付款時間',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '創建時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='支付商訂單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_merchant'
--

--
-- Dumping routines for database 'cnx_merchant'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:02:42
