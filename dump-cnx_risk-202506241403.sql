/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_risk
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
-- Table structure for table `ten_thousand_position_risk_log`
--

DROP TABLE IF EXISTS `ten_thousand_position_risk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ten_thousand_position_risk_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '合约币对名称',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户id',
  `position_id` varchar(100) NOT NULL COMMENT '仓位id',
  `open_time` bigint DEFAULT NULL COMMENT '开仓时间',
  `trigger_time` bigint DEFAULT NULL COMMENT '触发时间',
  `close_time` bigint DEFAULT '0' COMMENT '平仓时间',
  `is_first` int DEFAULT NULL COMMENT '是否是首次开仓 1是 2否',
  `liquidation_rate` decimal(32,16) DEFAULT NULL COMMENT '随机爆仓概率',
  `random_number` int DEFAULT NULL COMMENT '随机值',
  `open_price` decimal(32,16) DEFAULT NULL COMMENT '开仓价格',
  `close_price` decimal(32,16) DEFAULT NULL COMMENT '平仓/爆仓价格',
  `source_price` decimal(32,16) DEFAULT NULL COMMENT '初始价格',
  `target_price` decimal(32,16) DEFAULT NULL COMMENT '目标价格',
  `profit` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '盈亏',
  `move_kline` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'k线移动记录',
  `is_liquidation` int DEFAULT NULL COMMENT '是否爆仓 1爆仓 2不爆仓',
  `is_loss` int DEFAULT NULL COMMENT '是否亏损 1亏损 2盈利',
  `is_trigger` int DEFAULT NULL COMMENT '是否执行策略 1执行 2不执行',
  `fail_type` int DEFAULT NULL COMMENT '失败类型1成功 2未随机到爆仓 3 其他策略执行中 4 未获取到币对配置 5 波动率过大',
  `fail_msg` varchar(500) DEFAULT NULL COMMENT '失败原因',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`uid`) USING BTREE,
  KEY `idx_position_id` (`position_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='万倍合約仓位风控日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ten_thousand_quote_risk_log`
--

DROP TABLE IF EXISTS `ten_thousand_quote_risk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ten_thousand_quote_risk_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pair` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '币对名称',
  `risk_type` int NOT NULL COMMENT '风控类型 1输出价格中断 2合成价格波动率过大',
  `level_type` int NOT NULL COMMENT '类型 1升级 2降级',
  `current_level` int NOT NULL COMMENT '当前等级',
  `next_level` int NOT NULL COMMENT '下一等级',
  `operate_type` int DEFAULT NULL COMMENT '操作类型 1system 2手动',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` bigint NOT NULL COMMENT '创建时间',
  `update_time` bigint NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='万倍行情合成价格中断日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ten_thousand_risk_config`
--

DROP TABLE IF EXISTS `ten_thousand_risk_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ten_thousand_risk_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_pos_liquidation_rate` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '首仓爆仓概率',
  `win_rate` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '胜率',
  `profit_rate` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '收益率',
  `win_rate_compensation_factor` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '胜率补偿系数',
  `profit_rate_compensation_factor` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '收益率补偿系数',
  `market_making_min` int NOT NULL DEFAULT '0' COMMENT '做市次数区间-最小值',
  `market_making_max` int NOT NULL DEFAULT '0' COMMENT '做市次数区间-最大值',
  `trade_mock_url` varchar(100) DEFAULT NULL COMMENT '交易模拟数据连接',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='万倍合約风控配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ten_thousand_user_position_statistics`
--

DROP TABLE IF EXISTS `ten_thousand_user_position_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ten_thousand_user_position_statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) DEFAULT NULL,
  `nature_win_rate` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '自然胜率',
  `nature_win_count` int NOT NULL DEFAULT '0' COMMENT '自然盈利次数',
  `nature_loss_count` int NOT NULL DEFAULT '0' COMMENT '自然亏损次数',
  `total_win_rate` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '整体胜率',
  `total_win_count` int NOT NULL DEFAULT '0' COMMENT '整体盈利次数',
  `total_loss_count` int NOT NULL DEFAULT '0' COMMENT '整体亏损次数',
  `total_margin` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '总保证金',
  `total_profit` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '总盈亏',
  `profit_rate` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '收益率',
  `first_open_time` bigint NOT NULL DEFAULT '0' COMMENT '首次开仓时间',
  `liquidation_rate` decimal(32,16) NOT NULL COMMENT '随机爆仓概率',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='万倍合約用户仓位统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_risk'
--

--
-- Dumping routines for database 'cnx_risk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:04:02
