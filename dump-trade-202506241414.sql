/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: trade
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
  `id` varchar(20) NOT NULL,
  `base` varchar(16) DEFAULT '' COMMENT '基础币',
  `quote` varchar(8) DEFAULT '' COMMENT '计价币',
  `contract_code` varchar(32) DEFAULT NULL COMMENT '合约名',
  `client_oid` varchar(20) DEFAULT '' COMMENT '止盈止损单对手订单id',
  `user_id` varchar(50) DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '1-普通用户;2-模拟用户',
  `user_level` smallint DEFAULT NULL,
  `side` smallint DEFAULT NULL COMMENT '1-买；2-卖',
  `order_type` smallint DEFAULT NULL COMMENT '订单类型',
  `is_limit_order` smallint DEFAULT NULL COMMENT '2-市价',
  `stop_loss_type` smallint DEFAULT NULL COMMENT '止盈止损类型',
  `parent_id` varchar(20) DEFAULT '' COMMENT '主订单id',
  `offset` smallint DEFAULT NULL COMMENT '1-开仓；2-平仓',
  `leverage` int DEFAULT NULL COMMENT '杠杆倍数',
  `price` decimal(36,18) DEFAULT NULL COMMENT '市价为0',
  `amount` int DEFAULT NULL COMMENT '张数',
  `money` decimal(36,18) DEFAULT NULL COMMENT '金额',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金额',
  `total_amount` decimal(36,18) DEFAULT NULL COMMENT '交易总额',
  `filled_fee` decimal(36,18) DEFAULT NULL COMMENT '成交手续费',
  `hold_mode` smallint DEFAULT NULL COMMENT '持仓模式，2-逐仓',
  `trigger_price` decimal(36,18) DEFAULT NULL COMMENT '触发价',
  `trigger_state` int DEFAULT NULL COMMENT '触发状态',
  `liquidation_type` int DEFAULT NULL COMMENT '强平类型',
  `status` smallint DEFAULT NULL COMMENT '订单状态 1-委托中，2-已完成',
  `close_type` smallint DEFAULT NULL COMMENT '平仓类型 1-用户平仓；2-系统强平',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `created_time` bigint DEFAULT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展字段',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费率',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费率',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `cancel_type` smallint DEFAULT NULL COMMENT '类型 1-用户撤单',
  `pos_id` varchar(32) DEFAULT '',
  `trigger_type` varchar(20) DEFAULT '' COMMENT '触发模式 gte  lte',
  `price_scale` int DEFAULT '0',
  `quantity_scale` int DEFAULT '0',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '数量',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `entrust_price` decimal(36,18) DEFAULT NULL COMMENT '委托价',
  `profit_rate` decimal(36,18) DEFAULT NULL COMMENT '止盈止损率',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_parentid` (`parent_id`) USING BTREE,
  KEY `idx_pos_id_liquidation_type` (`pos_id`,`liquidation_type`),
  KEY `idx_user_id_coin` (`user_id`,`user_type`,`status`,`updated_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order3`
--

DROP TABLE IF EXISTS `order3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order3` (
  `id` varchar(20) NOT NULL,
  `base` varchar(16) DEFAULT '' COMMENT '基础币',
  `quote` varchar(8) DEFAULT '' COMMENT '计价币',
  `contract_code` varchar(32) DEFAULT NULL COMMENT '合约名',
  `client_oid` varchar(20) DEFAULT '' COMMENT '止盈止损单对手订单id',
  `user_id` varchar(50) DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '1-普通用户;2-模拟用户',
  `user_level` smallint DEFAULT NULL,
  `side` smallint DEFAULT NULL COMMENT '1-买；2-卖',
  `order_type` smallint DEFAULT NULL COMMENT '订单类型',
  `is_limit_order` smallint DEFAULT NULL COMMENT '2-市价',
  `stop_loss_type` smallint DEFAULT NULL COMMENT '止盈止损类型',
  `parent_id` varchar(20) DEFAULT '' COMMENT '主订单id',
  `offset` smallint DEFAULT NULL COMMENT '1-开仓；2-平仓',
  `leverage` int DEFAULT NULL COMMENT '杠杆倍数',
  `price` decimal(36,18) DEFAULT NULL COMMENT '市价为0',
  `amount` int DEFAULT NULL COMMENT '张数',
  `money` decimal(36,18) DEFAULT NULL COMMENT '金额',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金额',
  `total_amount` decimal(36,18) DEFAULT NULL COMMENT '交易总额',
  `filled_fee` decimal(36,18) DEFAULT NULL COMMENT '成交手续费',
  `hold_mode` smallint DEFAULT NULL COMMENT '持仓模式，2-逐仓',
  `trigger_price` decimal(36,18) DEFAULT NULL COMMENT '触发价',
  `trigger_state` int DEFAULT NULL COMMENT '触发状态',
  `liquidation_type` int DEFAULT NULL COMMENT '强平类型',
  `status` smallint DEFAULT NULL COMMENT '订单状态 1-委托中，4-已完成，6-已撤销，10-未生效，30已过期(止盈止损单过期)',
  `close_type` smallint DEFAULT NULL COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `created_time` bigint DEFAULT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展字段',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费率',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费率',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `cancel_type` smallint DEFAULT NULL COMMENT '类型 1-用户撤单',
  `pos_id` varchar(20) DEFAULT '' COMMENT '仓位id',
  `trigger_type` varchar(20) DEFAULT '' COMMENT '触发模式 gte  lte',
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '数量',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_parentid` (`parent_id`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order4`
--

DROP TABLE IF EXISTS `order4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order4` (
  `id` varchar(20) NOT NULL,
  `base` varchar(16) DEFAULT '' COMMENT '基础币',
  `quote` varchar(8) DEFAULT '' COMMENT '计价币',
  `contract_code` varchar(32) DEFAULT NULL COMMENT '合约名',
  `client_oid` varchar(20) DEFAULT '' COMMENT '止盈止损单对手订单id',
  `user_id` varchar(50) DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '1-普通用户;2-模拟用户',
  `user_level` smallint DEFAULT NULL,
  `side` smallint DEFAULT NULL COMMENT '1-买；2-卖',
  `order_type` smallint DEFAULT NULL COMMENT '订单类型',
  `is_limit_order` smallint DEFAULT NULL COMMENT '2-市价',
  `stop_loss_type` smallint DEFAULT NULL COMMENT '止盈止损类型',
  `parent_id` varchar(20) DEFAULT '' COMMENT '主订单id',
  `offset` smallint DEFAULT NULL COMMENT '1-开仓；2-平仓',
  `leverage` int DEFAULT NULL COMMENT '杠杆倍数',
  `price` decimal(36,18) DEFAULT NULL COMMENT '市价为0',
  `amount` int DEFAULT NULL COMMENT '张数',
  `money` decimal(36,18) DEFAULT NULL COMMENT '金额',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金额',
  `total_amount` decimal(36,18) DEFAULT NULL COMMENT '交易总额',
  `filled_fee` decimal(36,18) DEFAULT NULL COMMENT '成交手续费',
  `hold_mode` smallint DEFAULT NULL COMMENT '持仓模式，2-逐仓',
  `trigger_price` decimal(36,18) DEFAULT NULL COMMENT '触发价',
  `trigger_state` int DEFAULT NULL COMMENT '触发状态',
  `liquidation_type` int DEFAULT NULL COMMENT '强平类型',
  `status` smallint DEFAULT NULL COMMENT '订单状态 1-委托中，4-已完成，6-已撤销，10-未生效，30已过期(止盈止损单过期)',
  `close_type` smallint DEFAULT NULL COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `created_time` bigint DEFAULT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展字段',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费率',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费率',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `cancel_type` smallint DEFAULT NULL COMMENT '类型 1-用户撤单',
  `pos_id` varchar(20) DEFAULT '' COMMENT '仓位id',
  `trigger_type` varchar(20) DEFAULT '' COMMENT '触发模式 gte  lte',
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '数量',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_parentid` (`parent_id`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order5`
--

DROP TABLE IF EXISTS `order5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order5` (
  `id` varchar(20) NOT NULL,
  `base` varchar(16) DEFAULT '' COMMENT '基础币',
  `quote` varchar(8) DEFAULT '' COMMENT '计价币',
  `contract_code` varchar(32) DEFAULT NULL COMMENT '合约名',
  `client_oid` varchar(20) DEFAULT '' COMMENT '止盈止损单对手订单id',
  `user_id` varchar(50) DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '1-普通用户;2-模拟用户',
  `user_level` smallint DEFAULT NULL,
  `side` smallint DEFAULT NULL COMMENT '1-买；2-卖',
  `order_type` smallint DEFAULT NULL COMMENT '订单类型',
  `is_limit_order` smallint DEFAULT NULL COMMENT '2-市价',
  `stop_loss_type` smallint DEFAULT NULL COMMENT '止盈止损类型',
  `parent_id` varchar(20) DEFAULT '' COMMENT '主订单id',
  `offset` smallint DEFAULT NULL COMMENT '1-开仓；2-平仓',
  `leverage` int DEFAULT NULL COMMENT '杠杆倍数',
  `price` decimal(36,18) DEFAULT NULL COMMENT '市价为0',
  `amount` int DEFAULT NULL COMMENT '张数',
  `money` decimal(36,18) DEFAULT NULL COMMENT '金额',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金额',
  `total_amount` decimal(36,18) DEFAULT NULL COMMENT '交易总额',
  `filled_fee` decimal(36,18) DEFAULT NULL COMMENT '成交手续费',
  `hold_mode` smallint DEFAULT NULL COMMENT '持仓模式，2-逐仓',
  `trigger_price` decimal(36,18) DEFAULT NULL COMMENT '触发价',
  `trigger_state` int DEFAULT NULL COMMENT '触发状态',
  `liquidation_type` int DEFAULT NULL COMMENT '强平类型',
  `status` smallint DEFAULT NULL COMMENT '订单状态 1-委托中，4-已完成，6-已撤销，10-未生效，30已过期(止盈止损单过期)',
  `close_type` smallint DEFAULT NULL COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `created_time` bigint DEFAULT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展字段',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费率',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费率',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `cancel_type` smallint DEFAULT NULL COMMENT '类型 1-用户撤单',
  `pos_id` varchar(20) DEFAULT '' COMMENT '仓位id',
  `trigger_type` varchar(20) DEFAULT '' COMMENT '触发模式 gte  lte',
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '数量',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_parentid` (`parent_id`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_1`
--

DROP TABLE IF EXISTS `order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_1` (
  `id` varchar(20) NOT NULL,
  `base` varchar(16) DEFAULT '' COMMENT '基础币',
  `quote` varchar(8) DEFAULT '' COMMENT '计价币',
  `contract_code` varchar(32) DEFAULT NULL COMMENT '合约名',
  `client_oid` varchar(20) DEFAULT '' COMMENT '止盈止损单对手订单id',
  `user_id` varchar(50) DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '1-普通用户;2-模拟用户',
  `user_level` smallint DEFAULT NULL,
  `side` smallint DEFAULT NULL COMMENT '1-买；2-卖',
  `order_type` smallint DEFAULT NULL COMMENT '订单类型',
  `is_limit_order` smallint DEFAULT NULL COMMENT '2-市价',
  `stop_loss_type` smallint DEFAULT NULL COMMENT '止盈止损类型',
  `parent_id` varchar(20) DEFAULT '' COMMENT '主订单id',
  `offset` smallint DEFAULT NULL COMMENT '1-开仓；2-平仓',
  `leverage` int DEFAULT NULL COMMENT '杠杆倍数',
  `price` decimal(36,18) DEFAULT NULL COMMENT '市价为0',
  `amount` int DEFAULT NULL COMMENT '张数',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金额',
  `total_amount` decimal(36,18) DEFAULT NULL COMMENT '交易总额',
  `filled_fee` decimal(36,18) DEFAULT NULL COMMENT '成交手续费',
  `hold_mode` smallint DEFAULT NULL COMMENT '持仓模式，2-逐仓',
  `trigger_price` decimal(36,18) DEFAULT NULL COMMENT '触发价',
  `trigger_state` int DEFAULT NULL COMMENT '触发状态',
  `liquidation_type` int DEFAULT NULL COMMENT '强平类型',
  `status` smallint DEFAULT NULL COMMENT '订单状态 1-委托中，4-已完成，6-已撤销，10-未生效，30已过期(止盈止损单过期)',
  `close_type` smallint DEFAULT NULL COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `created_time` bigint DEFAULT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展字段',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费率',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费率',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `cancel_type` smallint DEFAULT NULL COMMENT '类型 1-用户撤单',
  `pos_id` varchar(20) DEFAULT '' COMMENT '仓位id',
  `trigger_type` varchar(20) DEFAULT '' COMMENT '触发模式 gte  lte',
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '数量',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  `entrust_price` decimal(36,18) DEFAULT NULL COMMENT '委托价',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_parentid` (`parent_id`,`user_type`) USING BTREE,
  KEY `idx_pos_id_liquidation_type` (`pos_id`,`user_type`,`liquidation_type`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`user_type`,`status`,`updated_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_2`
--

DROP TABLE IF EXISTS `order_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_2` (
  `id` varchar(20) NOT NULL,
  `base` varchar(16) DEFAULT '' COMMENT '基础币',
  `quote` varchar(8) DEFAULT '' COMMENT '计价币',
  `contract_code` varchar(32) DEFAULT NULL COMMENT '合约名',
  `client_oid` varchar(20) DEFAULT '' COMMENT '止盈止损单对手订单id',
  `user_id` varchar(50) DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '1-普通用户;2-模拟用户',
  `user_level` smallint DEFAULT NULL,
  `side` smallint DEFAULT NULL COMMENT '1-买；2-卖',
  `order_type` smallint DEFAULT NULL COMMENT '订单类型',
  `is_limit_order` smallint DEFAULT NULL COMMENT '2-市价',
  `stop_loss_type` smallint DEFAULT NULL COMMENT '止盈止损类型',
  `parent_id` varchar(20) DEFAULT '' COMMENT '主订单id',
  `offset` smallint DEFAULT NULL COMMENT '1-开仓；2-平仓',
  `leverage` int DEFAULT NULL COMMENT '杠杆倍数',
  `price` decimal(36,18) DEFAULT NULL COMMENT '市价为0',
  `amount` int DEFAULT NULL COMMENT '张数',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金额',
  `total_amount` decimal(36,18) DEFAULT NULL COMMENT '交易总额',
  `filled_fee` decimal(36,18) DEFAULT NULL COMMENT '成交手续费',
  `hold_mode` smallint DEFAULT NULL COMMENT '持仓模式，2-逐仓',
  `trigger_price` decimal(36,18) DEFAULT NULL COMMENT '触发价',
  `trigger_state` int DEFAULT NULL COMMENT '触发状态',
  `liquidation_type` int DEFAULT NULL COMMENT '强平类型',
  `status` smallint DEFAULT NULL COMMENT '订单状态 1-委托中，4-已完成，6-已撤销，10-未生效，30已过期(止盈止损单过期)',
  `close_type` smallint DEFAULT NULL COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `created_time` bigint DEFAULT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展字段',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费率',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费率',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `cancel_type` smallint DEFAULT NULL COMMENT '类型 1-用户撤单',
  `pos_id` varchar(20) DEFAULT '' COMMENT '仓位id',
  `trigger_type` varchar(20) DEFAULT '' COMMENT '触发模式 gte  lte',
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '数量',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  `entrust_price` decimal(36,18) DEFAULT NULL COMMENT '委托价',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_parentid` (`parent_id`,`user_type`) USING BTREE,
  KEY `idx_pos_id_liquidation_type` (`pos_id`,`user_type`,`liquidation_type`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`user_type`,`status`,`updated_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '仓位id',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '用户类型 1-普通用户；2-模拟用户',
  `pos_side` smallint NOT NULL COMMENT '仓位方向 1-多；2-空',
  `leverage` int NOT NULL COMMENT '杠杆倍数',
  `contract_code` varchar(32) DEFAULT '' COMMENT '合约名称',
  `pos` int DEFAULT NULL COMMENT '总仓位',
  `pos_available` int DEFAULT NULL COMMENT '可用仓位',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金',
  `open_price_avg` decimal(36,18) DEFAULT NULL COMMENT '开仓均价',
  `open_time` bigint DEFAULT NULL COMMENT '开仓时间',
  `status` smallint DEFAULT NULL COMMENT '仓位状态',
  `liquidation_type` smallint DEFAULT NULL COMMENT '强平类型',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `order_id` varchar(32) DEFAULT '' COMMENT '订单id',
  `created_time` bigint NOT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展',
  `open_fee` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓费率',
  `close_fee` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓费率',
  `open_total_amount` decimal(36,18) DEFAULT NULL COMMENT '总价值',
  `close_total_amount` decimal(36,18) DEFAULT NULL COMMENT '平仓总价值',
  `close_price_avg` decimal(36,18) DEFAULT NULL COMMENT '平仓均价',
  `liquidation_price` decimal(36,18) DEFAULT NULL COMMENT '预估强平价',
  `risk_rate` decimal(36,18) DEFAULT NULL COMMENT '风险率',
  `close_order_id` varchar(32) DEFAULT NULL COMMENT '平仓id',
  `fee_currency` varchar(32) DEFAULT NULL COMMENT '手续费币种',
  `mark_price` decimal(36,18) DEFAULT NULL COMMENT '爆仓时标记价格',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `close_time` bigint DEFAULT NULL,
  `price_scale` int DEFAULT '0',
  `quantity_scale` int DEFAULT '0',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '数量',
  `fund_fee` decimal(36,18) DEFAULT NULL COMMENT '资金费',
  `init_margin` decimal(36,18) DEFAULT NULL COMMENT '初始保证金',
  `close_type` tinyint DEFAULT '0' COMMENT '1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `liquidation_balance` decimal(36,18) DEFAULT NULL COMMENT '爆仓结余',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_orderid` (`order_id`),
  KEY `idx_coin_status` (`contract_code`,`user_type`,`status`,`pos_side`),
  KEY `idx_userid` (`user_id`,`user_type`,`status`),
  KEY `idx_price_status` (`status`,`liquidation_price`),
  KEY `idx_status_code_price` (`status`,`contract_code`,`liquidation_price`),
  KEY `idx_status_code_side_price` (`status`,`contract_code`,`pos_side`,`liquidation_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position3`
--

DROP TABLE IF EXISTS `position3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `position3` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '仓位id',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '用户类型 1-普通用户；2-模拟用户',
  `pos_side` smallint NOT NULL COMMENT '仓位方向 1-多；2-空',
  `leverage` int NOT NULL COMMENT '杠杆倍数',
  `contract_code` varchar(32) DEFAULT '' COMMENT '合约名称',
  `pos` int DEFAULT NULL COMMENT '总仓位',
  `pos_available` int DEFAULT NULL COMMENT '可用仓位',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金',
  `open_price_avg` decimal(36,18) DEFAULT NULL COMMENT '开仓均价',
  `open_time` bigint DEFAULT NULL COMMENT '开仓时间',
  `status` smallint DEFAULT NULL COMMENT '仓位状态1-开仓中，2-已结束',
  `liquidation_type` smallint DEFAULT NULL COMMENT '强平类型',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `order_id` varchar(32) DEFAULT '' COMMENT '订单id',
  `created_time` bigint NOT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展',
  `open_fee` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓费率',
  `close_fee` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓费率',
  `open_total_amount` decimal(36,18) DEFAULT NULL COMMENT '总价值',
  `close_total_amount` decimal(36,18) DEFAULT NULL COMMENT '平仓总价值',
  `close_price_avg` decimal(36,18) DEFAULT NULL COMMENT '平仓均价',
  `liquidation_price` decimal(36,18) DEFAULT NULL COMMENT '预估强平价',
  `risk_rate` decimal(36,18) DEFAULT NULL COMMENT '风险率',
  `close_order_id` varchar(32) DEFAULT NULL COMMENT '平仓id',
  `fee_currency` varchar(32) DEFAULT NULL COMMENT '手续费币种',
  `mark_price` decimal(36,18) DEFAULT NULL COMMENT '爆仓时标记价格',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `close_time` bigint DEFAULT NULL,
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '总数量',
  `fund_fee` decimal(36,18) DEFAULT NULL COMMENT '资金费',
  `close_type` int DEFAULT '0' COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `init_margin` decimal(36,18) DEFAULT NULL COMMENT '初始保证金',
  `liquidation_balance` decimal(36,18) DEFAULT NULL COMMENT '爆仓结余',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_open_time` (`open_time`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position4`
--

DROP TABLE IF EXISTS `position4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `position4` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '仓位id',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '用户类型 1-普通用户；2-模拟用户',
  `pos_side` smallint NOT NULL COMMENT '仓位方向 1-多；2-空',
  `leverage` int NOT NULL COMMENT '杠杆倍数',
  `contract_code` varchar(32) DEFAULT '' COMMENT '合约名称',
  `pos` int DEFAULT NULL COMMENT '总仓位',
  `pos_available` int DEFAULT NULL COMMENT '可用仓位',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金',
  `open_price_avg` decimal(36,18) DEFAULT NULL COMMENT '开仓均价',
  `open_time` bigint DEFAULT NULL COMMENT '开仓时间',
  `status` smallint DEFAULT NULL COMMENT '仓位状态1-开仓中，2-已结束',
  `liquidation_type` smallint DEFAULT NULL COMMENT '强平类型',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `order_id` varchar(32) DEFAULT '' COMMENT '订单id',
  `created_time` bigint NOT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展',
  `open_fee` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓费率',
  `close_fee` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓费率',
  `open_total_amount` decimal(36,18) DEFAULT NULL COMMENT '总价值',
  `close_total_amount` decimal(36,18) DEFAULT NULL COMMENT '平仓总价值',
  `close_price_avg` decimal(36,18) DEFAULT NULL COMMENT '平仓均价',
  `liquidation_price` decimal(36,18) DEFAULT NULL COMMENT '预估强平价',
  `risk_rate` decimal(36,18) DEFAULT NULL COMMENT '风险率',
  `close_order_id` varchar(32) DEFAULT NULL COMMENT '平仓id',
  `fee_currency` varchar(32) DEFAULT NULL COMMENT '手续费币种',
  `mark_price` decimal(36,18) DEFAULT NULL COMMENT '爆仓时标记价格',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `close_time` bigint DEFAULT NULL,
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '总数量',
  `fund_fee` decimal(36,18) DEFAULT NULL COMMENT '资金费',
  `close_type` int DEFAULT '0' COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `init_margin` decimal(36,18) DEFAULT NULL COMMENT '初始保证金',
  `liquidation_balance` decimal(36,18) DEFAULT NULL COMMENT '爆仓结余',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_open_time` (`open_time`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position5`
--

DROP TABLE IF EXISTS `position5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `position5` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '仓位id',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '用户类型 1-普通用户；2-模拟用户',
  `pos_side` smallint NOT NULL COMMENT '仓位方向 1-多；2-空',
  `leverage` int NOT NULL COMMENT '杠杆倍数',
  `contract_code` varchar(32) DEFAULT '' COMMENT '合约名称',
  `pos` int DEFAULT NULL COMMENT '总仓位',
  `pos_available` int DEFAULT NULL COMMENT '可用仓位',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金',
  `open_price_avg` decimal(36,18) DEFAULT NULL COMMENT '开仓均价',
  `open_time` bigint DEFAULT NULL COMMENT '开仓时间',
  `status` smallint DEFAULT NULL COMMENT '仓位状态1-开仓中，2-已结束',
  `liquidation_type` smallint DEFAULT NULL COMMENT '强平类型',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `order_id` varchar(32) DEFAULT '' COMMENT '订单id',
  `created_time` bigint NOT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展',
  `open_fee` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓费率',
  `close_fee` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓费率',
  `open_total_amount` decimal(36,18) DEFAULT NULL COMMENT '总价值',
  `close_total_amount` decimal(36,18) DEFAULT NULL COMMENT '平仓总价值',
  `close_price_avg` decimal(36,18) DEFAULT NULL COMMENT '平仓均价',
  `liquidation_price` decimal(36,18) DEFAULT NULL COMMENT '预估强平价',
  `risk_rate` decimal(36,18) DEFAULT NULL COMMENT '风险率',
  `close_order_id` varchar(32) DEFAULT NULL COMMENT '平仓id',
  `fee_currency` varchar(32) DEFAULT NULL COMMENT '手续费币种',
  `mark_price` decimal(36,18) DEFAULT NULL COMMENT '爆仓时标记价格',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `close_time` bigint DEFAULT NULL,
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '总数量',
  `fund_fee` decimal(36,18) DEFAULT NULL COMMENT '资金费',
  `close_type` int DEFAULT '0' COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `init_margin` decimal(36,18) DEFAULT NULL COMMENT '初始保证金',
  `liquidation_balance` decimal(36,18) DEFAULT NULL COMMENT '爆仓结余',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_open_time` (`open_time`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position_1`
--

DROP TABLE IF EXISTS `position_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_1` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '仓位id',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '用户类型 1-普通用户；2-模拟用户',
  `pos_side` smallint NOT NULL COMMENT '仓位方向 1-多；2-空',
  `leverage` int NOT NULL COMMENT '杠杆倍数',
  `contract_code` varchar(32) DEFAULT '' COMMENT '合约名称',
  `pos` int DEFAULT NULL COMMENT '总仓位',
  `pos_available` int DEFAULT NULL COMMENT '可用仓位',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金',
  `open_price_avg` decimal(36,18) DEFAULT NULL COMMENT '开仓均价',
  `open_time` bigint DEFAULT NULL COMMENT '开仓时间',
  `status` smallint DEFAULT NULL COMMENT '仓位状态1-开仓中，2-已结束',
  `liquidation_type` smallint DEFAULT NULL COMMENT '强平类型',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `order_id` varchar(32) DEFAULT '' COMMENT '订单id',
  `created_time` bigint NOT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展',
  `open_fee` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓费率',
  `close_fee` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓费率',
  `open_total_amount` decimal(36,18) DEFAULT NULL COMMENT '总价值',
  `close_total_amount` decimal(36,18) DEFAULT NULL COMMENT '平仓总价值',
  `close_price_avg` decimal(36,18) DEFAULT NULL COMMENT '平仓均价',
  `liquidation_price` decimal(36,18) DEFAULT NULL COMMENT '预估强平价',
  `risk_rate` decimal(36,18) DEFAULT NULL COMMENT '风险率',
  `close_order_id` varchar(32) DEFAULT NULL COMMENT '平仓id',
  `fee_currency` varchar(32) DEFAULT NULL COMMENT '手续费币种',
  `mark_price` decimal(36,18) DEFAULT NULL COMMENT '爆仓时标记价格',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `close_time` bigint DEFAULT NULL,
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '总数量',
  `fund_fee` decimal(36,18) DEFAULT NULL COMMENT '资金费',
  `close_type` int DEFAULT '0' COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `init_margin` decimal(36,18) DEFAULT NULL COMMENT '初始保证金',
  `liquidation_balance` decimal(36,18) DEFAULT NULL COMMENT '爆仓结余',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_order_id` (`order_id`,`user_type`) USING BTREE,
  KEY `idx_coin_status` (`contract_code`,`user_type`,`status`,`pos_side`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`user_type`,`status`,`created_time`) USING BTREE,
  KEY `idx_status_code_price` (`status`,`contract_code`,`liquidation_price`),
  KEY `idx_status_code_side_price` (`status`,`contract_code`,`pos_side`,`liquidation_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position_2`
--

DROP TABLE IF EXISTS `position_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_2` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '仓位id',
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `user_type` smallint DEFAULT NULL COMMENT '用户类型 1-普通用户；2-模拟用户',
  `pos_side` smallint NOT NULL COMMENT '仓位方向 1-多；2-空',
  `leverage` int NOT NULL COMMENT '杠杆倍数',
  `contract_code` varchar(32) DEFAULT '' COMMENT '合约名称',
  `pos` int DEFAULT NULL COMMENT '总仓位',
  `pos_available` int DEFAULT NULL COMMENT '可用仓位',
  `margin` decimal(36,18) DEFAULT NULL COMMENT '保证金',
  `open_price_avg` decimal(36,18) DEFAULT NULL COMMENT '开仓均价',
  `open_time` bigint DEFAULT NULL COMMENT '开仓时间',
  `status` smallint DEFAULT NULL COMMENT '仓位状态1-开仓中，2-已结束',
  `liquidation_type` smallint DEFAULT NULL COMMENT '强平类型',
  `profit_real` decimal(36,18) DEFAULT NULL COMMENT '已实现盈亏',
  `order_id` varchar(32) DEFAULT '' COMMENT '订单id',
  `created_time` bigint NOT NULL,
  `updated_time` bigint DEFAULT NULL,
  `ext` text COMMENT '扩展',
  `open_fee` decimal(36,18) DEFAULT NULL COMMENT '开仓手续费',
  `open_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '开仓费率',
  `close_fee` decimal(36,18) DEFAULT NULL COMMENT '平仓手续费',
  `close_fee_rate` decimal(36,18) DEFAULT NULL COMMENT '平仓费率',
  `open_total_amount` decimal(36,18) DEFAULT NULL COMMENT '总价值',
  `close_total_amount` decimal(36,18) DEFAULT NULL COMMENT '平仓总价值',
  `close_price_avg` decimal(36,18) DEFAULT NULL COMMENT '平仓均价',
  `liquidation_price` decimal(36,18) DEFAULT NULL COMMENT '预估强平价',
  `risk_rate` decimal(36,18) DEFAULT NULL COMMENT '风险率',
  `close_order_id` varchar(32) DEFAULT NULL COMMENT '平仓id',
  `fee_currency` varchar(32) DEFAULT NULL COMMENT '手续费币种',
  `mark_price` decimal(36,18) DEFAULT NULL COMMENT '爆仓时标记价格',
  `unit` decimal(36,18) DEFAULT NULL COMMENT '每张数量',
  `mode` smallint DEFAULT NULL COMMENT '1-普通模式；2-闪电模式',
  `close_time` bigint DEFAULT NULL,
  `price_scale` int DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) DEFAULT NULL COMMENT '总数量',
  `fund_fee` decimal(36,18) DEFAULT NULL COMMENT '资金费',
  `close_type` int DEFAULT '0' COMMENT '平仓类型 1-用户平仓；2-止盈；3-止损；4-爆仓；5-做市',
  `init_margin` decimal(36,18) DEFAULT NULL COMMENT '初始保证金',
  `liquidation_balance` decimal(36,18) DEFAULT NULL COMMENT '爆仓结余',
  `profit_rate` decimal(36,18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_order_id` (`order_id`,`user_type`) USING BTREE,
  KEY `idx_coin_status` (`contract_code`,`user_type`,`status`,`pos_side`) USING BTREE,
  KEY `idx_user_id_coin` (`user_id`,`user_type`,`status`,`created_time`) USING BTREE,
  KEY `idx_status_code_price` (`status`,`contract_code`,`liquidation_price`),
  KEY `idx_status_code_side_price` (`status`,`contract_code`,`pos_side`,`liquidation_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'trade'
--

--
-- Dumping routines for database 'trade'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:14:31
