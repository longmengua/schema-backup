/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: one_risk
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
-- Table structure for table `risk_example`
--

DROP TABLE IF EXISTS `risk_example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_example` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL COMMENT '风控实例名称',
  `plate` tinyint NOT NULL COMMENT '所属板块',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `operator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='风控实例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_example_factor_ref`
--

DROP TABLE IF EXISTS `risk_example_factor_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_example_factor_ref` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `example_id` bigint NOT NULL COMMENT '风控实体id',
  `factor_id` bigint NOT NULL COMMENT '风控因子id',
  `factor_comparator` varchar(50) NOT NULL COMMENT '比较符',
  `factor_parameter` varchar(255) DEFAULT NULL COMMENT '参数值',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_factors`
--

DROP TABLE IF EXISTS `risk_factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_factors` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL COMMENT '风控因子名称',
  `plate` int NOT NULL COMMENT '所属板块,1-登陆注册，2-充值提现，3-合约交易，4-公共模块',
  `type` tinyint NOT NULL COMMENT '风控因子类型,1-参数计数类，2-参数求和类，3-平均值，4-取最大值，5-最小值，6-真假类',
  `unit` tinyint DEFAULT NULL COMMENT '单位',
  `definition` varchar(255) DEFAULT NULL COMMENT '定义',
  `create_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(50) DEFAULT NULL COMMENT '最后操作人',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `code` varchar(50) NOT NULL COMMENT '风控因子编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COMMENT='风控因子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_message_login_report`
--

DROP TABLE IF EXISTS `risk_message_login_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_message_login_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户id',
  `brand` varchar(40) NOT NULL DEFAULT '' COMMENT 'brand',
  `tag` varchar(40) NOT NULL DEFAULT '' COMMENT 'tag',
  `service_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'service name',
  `action` varchar(40) NOT NULL DEFAULT '' COMMENT 'action',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '1.注册 2.登录',
  `ip` bigint NOT NULL COMMENT 'ipv4地址',
  `device_id` varchar(40) NOT NULL DEFAULT '' COMMENT '设备id',
  `phone` varchar(40) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(40) NOT NULL DEFAULT '' COMMENT '邮箱',
  `data_time` bigint NOT NULL DEFAULT '0' COMMENT '发生时间',
  `db_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'db创建时间',
  `db_modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'db修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_datatime` (`data_time`),
  KEY `idx_uid_datatime` (`uid`,`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1800889988916514818 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户登录信息上报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_message_order_report`
--

DROP TABLE IF EXISTS `risk_message_order_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_message_order_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '1.普通用户 2.模拟用户',
  `order_id` bigint NOT NULL DEFAULT '0' COMMENT '订单orderid',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '主订单id',
  `action` varchar(40) NOT NULL DEFAULT '',
  `price` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '成交价格',
  `amount` int NOT NULL DEFAULT '0' COMMENT '委托数量(张数)',
  `leverage` int NOT NULL DEFAULT '0' COMMENT '杠杆倍数',
  `filled_fee` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '成交手续费',
  `contract_code` varchar(40) NOT NULL DEFAULT '' COMMENT '币对',
  `order_type` tinyint NOT NULL DEFAULT '0' COMMENT '10-普通订单  31-止盈  36-止损',
  `is_limit_order` tinyint NOT NULL DEFAULT '0' COMMENT '1.限价 2.市价',
  `stop_loss_type` tinyint NOT NULL DEFAULT '0' COMMENT '1.委托时止盈止损单 2.持仓时开止盈止损单',
  `side` tinyint NOT NULL DEFAULT '0' COMMENT '1.买 2.卖',
  `offset` tinyint NOT NULL DEFAULT '0' COMMENT '1.开仓 2.平仓',
  `hold_mode` tinyint NOT NULL DEFAULT '0' COMMENT '2.逐仓',
  `unit` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '每张数量',
  `margin` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '保证金',
  `total_amount` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '总市值单位USDT',
  `total_quantity` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '总数量',
  `trigger_price` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '触发价格',
  `trigger_state` tinyint NOT NULL DEFAULT '0' COMMENT '触发状态',
  `liquidation_type` bigint NOT NULL DEFAULT '0' COMMENT '0.普通单 1.强平单 2.做市单',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1.委托中 4.已完成 6.已撤销 10.未激活 30.已过期',
  `close_type` tinyint NOT NULL DEFAULT '0' COMMENT '1.手动平仓 2.止盈 3.止损 4.爆仓 5.做市',
  `open_fee_rate` decimal(9,8) NOT NULL DEFAULT '0.00000000' COMMENT '开仓手续费率',
  `close_fee_rate` decimal(9,8) NOT NULL DEFAULT '0.00000000' COMMENT '平仓手续费率',
  `mode` tinyint NOT NULL DEFAULT '0' COMMENT '1.普通仓位 2.闪电仓位',
  `cancel_type` tinyint NOT NULL DEFAULT '0' COMMENT '1.手动撤单 2.系统撤单',
  `pos_id` bigint NOT NULL DEFAULT '0' COMMENT '仓位id',
  `price_scale` int NOT NULL DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int NOT NULL DEFAULT '0' COMMENT '数量精度',
  `max_profit_multiples` int NOT NULL DEFAULT '0' COMMENT '最大盈利倍数',
  `profit_real` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已实现盈亏',
  `fund_fee` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '资金费',
  `last_price` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '成交价',
  `entrust_price` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '委托价',
  `push_time` bigint NOT NULL DEFAULT '0' COMMENT '推送时间',
  `close_time` bigint DEFAULT NULL COMMENT '平仓时间',
  `created_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_time` bigint NOT NULL DEFAULT '0' COMMENT '更新时间',
  `db_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'db创建时间',
  `db_modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'db修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户委托单行为记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_message_position_report`
--

DROP TABLE IF EXISTS `risk_message_position_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_message_position_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '1.普通用户 2.模拟用户',
  `position_id` bigint NOT NULL DEFAULT '0' COMMENT '仓位id',
  `order_id` bigint NOT NULL DEFAULT '0' COMMENT '开仓订单id',
  `close_order_id` bigint NOT NULL DEFAULT '0' COMMENT '平仓订单id',
  `action` varchar(40) NOT NULL DEFAULT '',
  `pos` int NOT NULL DEFAULT '0' COMMENT '持仓张数',
  `pos_available` int NOT NULL DEFAULT '0' COMMENT '可用持仓张数',
  `leverage` int NOT NULL DEFAULT '0' COMMENT '杠杆倍数',
  `contract_code` varchar(40) NOT NULL DEFAULT '' COMMENT '币对',
  `unit` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '每张数量',
  `pos_side` tinyint NOT NULL DEFAULT '0' COMMENT '1.多 2.空',
  `margin` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '保证金',
  `open_time` bigint NOT NULL DEFAULT '0' COMMENT '开仓时间',
  `liquidation_type` bigint NOT NULL DEFAULT '0' COMMENT '1.爆仓类型 2.做市',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1.持仓中 2.结束',
  `profit_real` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已实现盈亏',
  `mark_price` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓或爆仓的当前价',
  `open_fee` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '开仓手续费',
  `open_price_avg` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '开仓均价',
  `open_fee_rate` decimal(9,8) NOT NULL DEFAULT '0.00000000' COMMENT '开仓手续费率',
  `open_total_amount` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '开仓总市值',
  `close_fee` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓手续费',
  `close_price_avg` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓均价',
  `close_fee_rate` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓均价',
  `close_total_amount` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓总市值',
  `liquidation_price` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '预估爆仓价',
  `risk_rate` decimal(9,8) NOT NULL DEFAULT '0.00000000' COMMENT '风险率',
  `fee_currency` varchar(40) NOT NULL DEFAULT '' COMMENT '手续费币种',
  `mode` tinyint NOT NULL DEFAULT '0' COMMENT '1.普通仓位 2.闪电仓位',
  `price_scale` int NOT NULL DEFAULT '0' COMMENT '价格精度',
  `quantity_scale` int NOT NULL DEFAULT '0' COMMENT '数量精度',
  `total_quantity` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '总数量',
  `fund_fee` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '资金费',
  `init_margin` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '初始保证金',
  `liquidation_balance` decimal(36,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '爆仓结余',
  `close_type` tinyint NOT NULL DEFAULT '0' COMMENT '1.手动平仓 2.止盈 3.止损 4.爆仓 5.做市',
  `max_profit_multiples` int NOT NULL DEFAULT '0' COMMENT '最大盈利倍数',
  `push_time` bigint NOT NULL DEFAULT '0' COMMENT '推送时间',
  `close_time` bigint DEFAULT NULL COMMENT '平仓时间',
  `created_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_time` bigint NOT NULL DEFAULT '0' COMMENT '更新时间',
  `db_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'db创建时间',
  `db_modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'db修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户交易行为记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_model_device_login`
--

DROP TABLE IF EXISTS `risk_model_device_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_model_device_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `batch_id` bigint NOT NULL DEFAULT '0' COMMENT '当前批次id',
  `device_id` varchar(128) DEFAULT NULL COMMENT '设备id',
  `login_num` int NOT NULL DEFAULT '0' COMMENT '登录用户数',
  `register_num` int NOT NULL DEFAULT '0' COMMENT '注册用户数',
  `db_create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'db创建时间',
  `db_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'db更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='登录注册模型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_model_factor_ref`
--

DROP TABLE IF EXISTS `risk_model_factor_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_model_factor_ref` (
  `id` bigint NOT NULL COMMENT '主键id',
  `model_key` varchar(50) NOT NULL COMMENT '风控实体id',
  `factor_id` bigint NOT NULL COMMENT '风控因子id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_model_ip_login`
--

DROP TABLE IF EXISTS `risk_model_ip_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_model_ip_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `batch_id` bigint NOT NULL DEFAULT '0' COMMENT '当前批次id',
  `ip` bigint DEFAULT NULL COMMENT '用户ip',
  `login_num` int NOT NULL DEFAULT '0' COMMENT '登录用户数',
  `register_num` int NOT NULL DEFAULT '0' COMMENT '注册用户数',
  `db_create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'db创建时间',
  `db_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'db更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ip_batchid` (`ip`,`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ip登录注册模型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_model_user_trans`
--

DROP TABLE IF EXISTS `risk_model_user_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_model_user_trans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `batch_id` bigint NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '1.普通用户 2.模拟用户',
  `deal_num` int NOT NULL DEFAULT '0' COMMENT '成交笔数',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '委托数量',
  `cancel_num` int NOT NULL DEFAULT '0' COMMENT '撤单笔数',
  `transaction_amount` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `profit_real_amount` decimal(16,8) NOT NULL DEFAULT '0.00000000' COMMENT '已实现盈亏',
  `fee_amount` decimal(16,8) NOT NULL DEFAULT '0.00000000' COMMENT '手续费总额',
  `rebate_amount` decimal(16,8) NOT NULL DEFAULT '0.00000000' COMMENT '交易返佣',
  `position_duration` bigint NOT NULL DEFAULT '0' COMMENT '持仓时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_statistictime` (`user_id`,`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合约交易用户风控模型数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_strategy`
--

DROP TABLE IF EXISTS `risk_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_strategy` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL COMMENT '风控策略名称',
  `example_ref` tinyint DEFAULT NULL COMMENT '风控实例关系, 1-且，2-或',
  `time_limit_type` tinyint NOT NULL COMMENT '时间范围类型,1-分钟，2-单日，3-周，4-月，5-年',
  `plate` tinyint DEFAULT NULL COMMENT '所属模块, 1-登陆注册，2-充值提现，3-合约交易，4-公共模块',
  `disposal_type` varchar(200) DEFAULT NULL COMMENT '处置方式，1-禁止交易，2-禁止登陆，3-禁止注册',
  `disposal_period` int DEFAULT NULL COMMENT '处置有效期,1-永久，2-分钟',
  `switch_flag` tinyint DEFAULT NULL COMMENT '开关',
  `expand_info` varchar(255) DEFAULT NULL COMMENT '其他参数',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `operator` varchar(50) DEFAULT NULL COMMENT '最后操作人',
  `time_limit` int DEFAULT NULL COMMENT '时间范围',
  `disposal_period_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='风控策略';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_strategy_example_ref`
--

DROP TABLE IF EXISTS `risk_strategy_example_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_strategy_example_ref` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `strategy_id` bigint NOT NULL COMMENT '风控策略id',
  `example_id` bigint NOT NULL COMMENT '风控实体id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_strategy_record`
--

DROP TABLE IF EXISTS `risk_strategy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_strategy_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `strategy_id` bigint NOT NULL COMMENT '策略id',
  `trigger_time` timestamp NULL DEFAULT NULL COMMENT '触发时间',
  `email` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '用户手机',
  `uid` varchar(20) DEFAULT NULL COMMENT '用户uid',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP',
  `device_id` varchar(255) DEFAULT NULL COMMENT '设备id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_strategy_record_detail`
--

DROP TABLE IF EXISTS `risk_strategy_record_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_strategy_record_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `strategy_id` bigint NOT NULL COMMENT '策略id',
  `example_id` bigint NOT NULL COMMENT '风控实体id',
  `execute_result` tinyint DEFAULT NULL COMMENT '风控实例执行结果 1-命中，0-未命中',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COMMENT='风控实例执行结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_strategy_result`
--

DROP TABLE IF EXISTS `risk_strategy_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_strategy_result` (
  `id` bigint NOT NULL COMMENT '主键id',
  `strategy_id` bigint NOT NULL COMMENT '风控策略id',
  `model_id` bigint NOT NULL COMMENT '业务模型id',
  `risk_result` int NOT NULL COMMENT '风控引擎执行结果',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'one_risk'
--

--
-- Dumping routines for database 'one_risk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:08:28
