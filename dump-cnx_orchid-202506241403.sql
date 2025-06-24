/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: cnx_orchid
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
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL COMMENT '合約類型(1:永續 2:閃電)',
  `crypto` varchar(50) NOT NULL COMMENT '交易幣種',
  `crypto_price_unit` varchar(50) NOT NULL COMMENT '計價資產(USDT/USDC)',
  `pair` varchar(50) NOT NULL COMMENT '交易對名稱(BTC/USDT)',
  `multiple` double NOT NULL DEFAULT '1' COMMENT '合約倍數',
  `price_scale` int NOT NULL DEFAULT '0' COMMENT '價格精度',
  `quantity_scale` int NOT NULL DEFAULT '0' COMMENT '數量精度',
  `asset_type` tinyint NOT NULL COMMENT '下單資產類型(1:交易資產 2:計價資產)',
  `max_profit_multiples` int NOT NULL DEFAULT '0' COMMENT '最大止盈倍數',
  `risk_rate` double NOT NULL DEFAULT '0' COMMENT '爆倉風險率(低於會爆倉)',
  `unit` decimal(30,18) NOT NULL COMMENT '資產最小單位(張) ex: 0.0001 BTC = 1張',
  `init_leverage` int NOT NULL DEFAULT '1' COMMENT '初始槓桿',
  `min_leverage` int NOT NULL DEFAULT '1' COMMENT '最小槓桿',
  `max_leverage` int NOT NULL DEFAULT '1' COMMENT '最大槓桿',
  `open_slippage` double NOT NULL DEFAULT '0' COMMENT '開倉基礎滑點%',
  `close_slippage` double NOT NULL DEFAULT '0' COMMENT '平倉基礎滑點%',
  `max_open_dynamic_slippery` double DEFAULT '0.00005' COMMENT '開倉最大動態滑點',
  `open_fee` double NOT NULL DEFAULT '0' COMMENT '開倉手續費%',
  `close_fee` double NOT NULL DEFAULT '0' COMMENT '平倉手續費%',
  `sharerate_fee` double NOT NULL DEFAULT '0' COMMENT '平均手續費%',
  `is_append_margin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可追加保證金 1:可',
  `append_max_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '保證金最大可增加額度',
  `open_position_max_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉最大保證金',
  `open_position_min_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉最小保證金',
  `min_order_book_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單簿備用數量範圍下限',
  `max_order_book_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單簿備用數量範圍上限',
  `min_volume_multiplier` decimal(8,5) NOT NULL DEFAULT '0.00000' COMMENT '聚合成交量最小乘數',
  `max_volume_multiplier` decimal(8,5) NOT NULL DEFAULT '0.00000' COMMENT '聚合成交量最大乘數',
  `system_max_long_position_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平台最大多頭持倉量(幣量)',
  `system_max_short_position_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平台最大空頭持倉量(幣量)',
  `funding_fee_payment_frequency` int NOT NULL DEFAULT '0' COMMENT '資金費支付頻率(小時)',
  `funding_fee_rate` double NOT NULL DEFAULT '0' COMMENT '資金費率',
  `pair_status` int DEFAULT '3',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '交易狀態(1: 上線 2:下線)',
  `trading_area` int NOT NULL DEFAULT '1' COMMENT '交易区(1:主区、2:创新区)',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  `is_online` int DEFAULT '2',
  `last_funding_fee` bigint DEFAULT '0',
  `binance_weight` decimal(10,8) NOT NULL DEFAULT '1.00000000' COMMENT '幣安報價權重',
  `okx_weight` decimal(10,8) NOT NULL DEFAULT '0.00000000' COMMENT 'OKX報價權重',
  `bybit_weight` decimal(10,8) NOT NULL DEFAULT '0.00000000' COMMENT 'Bybit報價權重',
  `market_mode` varchar(255) DEFAULT (_utf8mb4'FOLLOW') COMMENT '做市模式',
  `max_value` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000',
  `min_value` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000',
  PRIMARY KEY (`id`),
  KEY `idx_pair` (`pair`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合約配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_orig`
--

DROP TABLE IF EXISTS `contract_orig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_orig` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL COMMENT '合約類型(1:永續 2:閃電)',
  `crypto` varchar(50) NOT NULL COMMENT '交易幣種',
  `crypto_price_unit` varchar(50) NOT NULL COMMENT '計價資產(USDT/USDC)',
  `pair` varchar(50) NOT NULL COMMENT '交易對名稱(BTC/USDT)',
  `price_scale` int NOT NULL DEFAULT '0' COMMENT '價格精度',
  `quantity_scale` int NOT NULL DEFAULT '0' COMMENT '數量精度',
  `asset_type` tinyint NOT NULL COMMENT '下單資產類型(1:交易資產 2:計價資產)',
  `max_profit_multiples` int NOT NULL DEFAULT '0' COMMENT '最大止盈倍數',
  `risk_rate` double NOT NULL DEFAULT '0' COMMENT '爆倉風險率(低於會爆倉)',
  `unit` decimal(30,18) NOT NULL COMMENT '資產最小單位(張) ex: 0.0001 BTC = 1張',
  `init_leverage` int NOT NULL DEFAULT '1' COMMENT '初始槓桿',
  `min_leverage` int NOT NULL DEFAULT '1' COMMENT '最小槓桿',
  `max_leverage` int NOT NULL DEFAULT '1' COMMENT '最大槓桿',
  `open_slippage` double NOT NULL DEFAULT '0' COMMENT '開倉基礎滑點%',
  `close_slippage` double NOT NULL DEFAULT '0' COMMENT '平倉基礎滑點%',
  `max_open_dynamic_slippery` double DEFAULT '0' COMMENT '開倉最大動態滑點',
  `open_fee` double NOT NULL DEFAULT '0' COMMENT '開倉手續費%',
  `close_fee` double NOT NULL DEFAULT '0' COMMENT '平倉手續費%',
  `sharerate_fee` double NOT NULL DEFAULT '0' COMMENT '平均手續費%',
  `is_append_margin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可追加保證金 1:可',
  `append_max_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '保證金最大可增加額度',
  `open_position_max_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉最大保證金',
  `open_position_min_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉最小保證金',
  `min_order_book_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單簿備用數量範圍下限',
  `max_order_book_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '訂單簿備用數量範圍上限',
  `system_max_long_position_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平台最大多頭持倉量(幣量)',
  `system_max_short_position_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平台最大空頭持倉量(幣量)',
  `funding_fee_payment_frequency` int NOT NULL DEFAULT '0' COMMENT '資金費支付頻率(小時)',
  `funding_fee_rate` double NOT NULL DEFAULT '0' COMMENT '資金費率',
  `pair_status` int DEFAULT '3',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '交易狀態(1: 上線 2:下線)',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  `is_online` int DEFAULT '2',
  `last_funding_fee` bigint DEFAULT '0',
  `binance_weight` decimal(10,8) NOT NULL DEFAULT '1.00000000' COMMENT '幣安報價權重',
  `okx_weight` decimal(10,8) NOT NULL DEFAULT '0.00000000' COMMENT 'OKX報價權重',
  `bybit_weight` decimal(10,8) NOT NULL DEFAULT '0.00000000' COMMENT 'Bybit報價權重',
  PRIMARY KEY (`id`),
  KEY `idx_pair` (`pair`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合約配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `margin_rate_config`
--

DROP TABLE IF EXISTS `margin_rate_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `margin_rate_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `min_lever` int NOT NULL DEFAULT '0' COMMENT '最小杠杆配置',
  `max_lever` int NOT NULL DEFAULT '0' COMMENT '最大杠杆配置',
  `imr` decimal(12,10) NOT NULL DEFAULT '0.0000000000' COMMENT '初始保证金率',
  `mmr` decimal(12,10) NOT NULL DEFAULT '0.0000000000' COMMENT '维持保证金率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='全局設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL DEFAULT '0',
  `order_id` varchar(100) NOT NULL COMMENT '訂單id',
  `position_order_id` varchar(100) NOT NULL COMMENT '倉位單號(委託單成立後更新)',
  `pair` varchar(50) NOT NULL COMMENT '交易對',
  `crypto` varchar(50) NOT NULL COMMENT '交易幣種',
  `crypto_price_unit` varchar(50) NOT NULL COMMENT '計價資產(USDT/USDC)',
  `contract_type` tinyint NOT NULL COMMENT '合約類型(普通/得勁)',
  `uid` varchar(50) NOT NULL COMMENT '用戶uid',
  `reference_uid` varchar(50) DEFAULT '' COMMENT '參考uid',
  `side` tinyint NOT NULL COMMENT '買賣',
  `position_side` tinyint NOT NULL COMMENT '委託倉位方向',
  `order_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '委託成本(USDT)',
  `order_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '委託數量(幣種)',
  `quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '實際成交數量(幣種)',
  `unit` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '資產最小單位(張) ex: 0.0001 BTC = 1張',
  `number` bigint NOT NULL DEFAULT '0' COMMENT '總張數',
  `leverage` int NOT NULL DEFAULT '0' COMMENT '槓桿數',
  `price_scale` int NOT NULL DEFAULT '0' COMMENT '價格精度',
  `price_source` tinyint NOT NULL COMMENT '開倉價格來源 1:最新 2:標記',
  `price_type` tinyint NOT NULL COMMENT '價格類型 1:市價 2:限價',
  `slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '滑點',
  `random_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '随机滑點',
  `close_slippery_rate` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉滑點％',
  `order_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '委託價格',
  `init_latest_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '報價最新價格',
  `transaction_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '成交價格',
  `price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '成交價格(開/平倉滑點+開/平倉成交價格)',
  `open_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉手續費',
  `pre_close_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '預估平倉手續費',
  `open_fee_rate` double NOT NULL DEFAULT '0' COMMENT '開倉手續費%',
  `sharerate_fee` double NOT NULL DEFAULT '0' COMMENT '平均手續費%',
  `close_fee_rate` double NOT NULL DEFAULT '0' COMMENT '平倉手續費%',
  `liquidation_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '爆倉/強平價',
  `take_profit_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '止盈價',
  `stop_loss_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '止損價',
  `risk` double NOT NULL DEFAULT '0' COMMENT '爆倉風險率',
  `pay_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '支付保證金(開倉成本)',
  `init_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '初始保證金(開倉成本-開倉手續費)',
  `margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '倉位保證金(預設是初始保證金會根據資金費,增加保證金異動)',
  `quantity_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '倉位佔用保證金',
  `profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已實現盈虧',
  `profit_and_loss_ratio` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已實現盈虧%',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態 1:未成交 2:已成交 3:已取消',
  `create_source` tinyint DEFAULT '0',
  `create_platform` varchar(50) NOT NULL DEFAULT '' COMMENT '委託平台',
  `is_simulate` tinyint NOT NULL DEFAULT '2' COMMENT '是否為模擬交易 1:是 2:否',
  `voucher_id` varchar(50) DEFAULT '' COMMENT '使用者體驗券ID',
  `close_time` bigint NOT NULL DEFAULT '0' COMMENT '結束時間',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `close_type` tinyint NOT NULL DEFAULT '0' COMMENT '成交類型',
  `margin_mode` tinyint NOT NULL DEFAULT '1' COMMENT '全仓标识: 1逐仓 2全仓 ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_uk` (`order_id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_pair` (`pair`),
  KEY `idx_reference_uid` (`reference_uid`),
  KEY `idx_simulate_status_time_range` (`is_simulate`,`status`,`create_time`,`close_time`) USING BTREE,
  KEY `idx_is_simulate_position_order` (`is_simulate`,`position_order_id`),
  KEY `idx_is_simulate_ct` (`is_simulate`,`create_time`),
  KEY `idx_is_simulate_closetime` (`is_simulate`,`close_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='委託單(訂單簿)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` bigint NOT NULL DEFAULT '0',
  `order_id` varchar(100) NOT NULL COMMENT '訂單id',
  `form_order_id` varchar(100) NOT NULL COMMENT '委託單id',
  `pair` varchar(50) NOT NULL COMMENT '交易對',
  `crypto` varchar(50) NOT NULL COMMENT '交易幣種',
  `crypto_price_unit` varchar(50) NOT NULL COMMENT '計價資產(USDT/USDC)',
  `contract_type` tinyint NOT NULL COMMENT '合約類型(普通/得勁)',
  `uid` varchar(50) NOT NULL COMMENT '用戶uid',
  `reference_uid` varchar(50) DEFAULT '' COMMENT '參考uid',
  `reference_order_id` varchar(200) DEFAULT '' COMMENT '參考order_id',
  `copy_ratio` decimal(16,8) NOT NULL DEFAULT '0.00000000' COMMENT '跟单系数',
  `side` tinyint NOT NULL COMMENT '方向(多/空)',
  `quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '實際成交數量(幣種)',
  `open_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '开仓数量',
  `pend_close_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '待平仓数量',
  `close_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已平仓数量',
  `unit` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '資產最小單位(張) ex: 0.0001 BTC = 1張',
  `number` bigint NOT NULL DEFAULT '0' COMMENT '總張數',
  `price_scale` int NOT NULL DEFAULT '0' COMMENT '價格精度',
  `leverage` int NOT NULL DEFAULT '0' COMMENT '槓桿數',
  `open_price_source` tinyint NOT NULL COMMENT '開倉價格來源 1:最新 2:標記',
  `open_price_type` tinyint NOT NULL COMMENT '開倉價格類型 1:市價 2:限價',
  `open_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉滑點',
  `open_random_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '开仓随机滑點',
  `init_open_latest_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉報價最新價格',
  `open_transaction_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉原成交價格',
  `open_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉成交價格(開倉滑點+開倉原成交價格)',
  `open_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉手續費',
  `open_fee_rate` double NOT NULL DEFAULT '0' COMMENT '開倉手續費%',
  `close_price_source` tinyint NOT NULL COMMENT '平倉價格來源 1:最新 2:標記',
  `close_price_type` tinyint NOT NULL COMMENT '平倉價格類型 1:市價 2:限價',
  `close_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉滑點',
  `close_random_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓随机滑點',
  `init_close_latest_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉報價最新價格',
  `close_transaction_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉原成交價格',
  `close_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉成交價格(開倉滑點+開倉原成交價格)',
  `close_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉手續費',
  `freeze_close_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '預估/凍結平倉手續費',
  `close_fee_rate` double NOT NULL DEFAULT '0' COMMENT '平倉手續費%',
  `sharerate_fee` double NOT NULL DEFAULT '0' COMMENT '平均手續費%',
  `take_profit_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '止盈價',
  `stop_loss_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '止損價',
  `liquidation_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '爆倉/強平價',
  `risk` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '爆倉風險率',
  `pay_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '支付保證金(開倉成本)',
  `init_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '初始保證金(開倉成本-開倉手續費)',
  `margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '倉位保證金(預設是初始保證金會根據資金費,增加保證金異動)',
  `quantity_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '倉位佔用保證金',
  `append_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '追加保證金',
  `unrealized_profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '未实现盈亏',
  `profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已實現盈虧',
  `total_profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '結算總收支(已實現盈虧+佔用保證金+保證金餘額)',
  `profit_and_loss_ratio` double NOT NULL DEFAULT '0' COMMENT '已實現報酬/盈虧率',
  `total_funding_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '累積多少資金費',
  `liquidation` decimal(30,18) DEFAULT '0.000000000000000000',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '倉位狀態(持倉 平倉中 異常)',
  `close_type` tinyint NOT NULL DEFAULT '1' COMMENT '平倉類型',
  `create_platform` varchar(50) NOT NULL DEFAULT '' COMMENT '委託平台',
  `is_simulate` tinyint NOT NULL DEFAULT '2' COMMENT '是否為模擬交易 1:是 2:否',
  `voucher_id` varchar(50) DEFAULT '' COMMENT '使用者體驗券ID',
  `close_profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓盈亏',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立/撮合時間',
  `close_time` bigint NOT NULL DEFAULT '0' COMMENT '平倉時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `margin_mode` tinyint NOT NULL DEFAULT '1' COMMENT '全仓标识: 1逐仓 2全仓 ',
  `append_position` json DEFAULT (_utf8mb4'[]'),
  `net_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓时净持仓',
  `merge_mode` tinyint NOT NULL DEFAULT '0' COMMENT '0: 分仓 1: 合仓',
  `merge_position_unique_key` varchar(512) GENERATED ALWAYS AS (if(((`merge_mode` = 1) and (`status` = 1)),concat(`uid`,_utf8mb4'_',`pair`,_utf8mb4'_',`side`,_utf8mb4'_',`status`,_utf8mb4'_',`margin_mode`,_utf8mb4'_',`is_simulate`),NULL)) STORED,
  `stop_loss_multiple` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '止損倍數',
  `take_profit_multiple` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '止盈倍數',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_uk` (`order_id`),
  UNIQUE KEY `idx_unique_position_merge` (`merge_position_unique_key`),
  KEY `idx_uid` (`uid`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_pair` (`pair`),
  KEY `idx_close_time` (`close_time`),
  KEY `idx_position_status_pair_side` (`status`,`pair`,`side`),
  KEY `idx_reference_uid` (`reference_uid`),
  KEY `idx_reference_order_id` (`reference_order_id`),
  KEY `idx_position_status_sim_close_time` (`status`,`is_simulate`,`close_quantity`,`create_time`),
  KEY `idx_position_status_sim_time1` (`status`,`is_simulate`,`create_time`),
  KEY `idx_position_status_sim_time` (`is_simulate`,`create_time` DESC) USING BTREE,
  KEY `idx_is_simulate_ct` (`is_simulate`,`create_time`),
  KEY `idx_profixandloss` (`profit_and_loss`),
  KEY `idx_margin` (`margin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='倉位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position_copy1`
--

DROP TABLE IF EXISTS `position_copy1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_copy1` (
  `id` bigint NOT NULL DEFAULT '0',
  `order_id` varchar(100) NOT NULL COMMENT '訂單id',
  `form_order_id` varchar(100) NOT NULL COMMENT '委託單id',
  `pair` varchar(50) NOT NULL COMMENT '交易對',
  `crypto` varchar(50) NOT NULL COMMENT '交易幣種',
  `crypto_price_unit` varchar(50) NOT NULL COMMENT '計價資產(USDT/USDC)',
  `contract_type` tinyint NOT NULL COMMENT '合約類型(普通/得勁)',
  `uid` varchar(50) NOT NULL COMMENT '用戶uid',
  `reference_uid` varchar(50) DEFAULT '' COMMENT '參考uid',
  `reference_order_id` varchar(200) DEFAULT '' COMMENT '參考order_id',
  `copy_ratio` decimal(16,8) NOT NULL DEFAULT '0.00000000' COMMENT '跟单系数',
  `side` tinyint NOT NULL COMMENT '方向(多/空)',
  `quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '實際成交數量(幣種)',
  `open_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '开仓数量',
  `pend_close_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '待平仓数量',
  `close_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已平仓数量',
  `unit` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '資產最小單位(張) ex: 0.0001 BTC = 1張',
  `number` bigint NOT NULL DEFAULT '0' COMMENT '總張數',
  `price_scale` int NOT NULL DEFAULT '0' COMMENT '價格精度',
  `leverage` int NOT NULL DEFAULT '0' COMMENT '槓桿數',
  `open_price_source` tinyint NOT NULL COMMENT '開倉價格來源 1:最新 2:標記',
  `open_price_type` tinyint NOT NULL COMMENT '開倉價格類型 1:市價 2:限價',
  `open_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉滑點',
  `open_random_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '开仓随机滑點',
  `init_open_latest_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉報價最新價格',
  `open_transaction_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉原成交價格',
  `open_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉成交價格(開倉滑點+開倉原成交價格)',
  `open_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉手續費',
  `open_fee_rate` double NOT NULL DEFAULT '0' COMMENT '開倉手續費%',
  `close_price_source` tinyint NOT NULL COMMENT '平倉價格來源 1:最新 2:標記',
  `close_price_type` tinyint NOT NULL COMMENT '平倉價格類型 1:市價 2:限價',
  `close_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉滑點',
  `close_random_slippery` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓随机滑點',
  `init_close_latest_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉報價最新價格',
  `close_transaction_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉原成交價格',
  `close_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉成交價格(開倉滑點+開倉原成交價格)',
  `close_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平倉手續費',
  `freeze_close_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '預估/凍結平倉手續費',
  `close_fee_rate` double NOT NULL DEFAULT '0' COMMENT '平倉手續費%',
  `sharerate_fee` double NOT NULL DEFAULT '0' COMMENT '平均手續費%',
  `take_profit_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '止盈價',
  `stop_loss_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '止損價',
  `liquidation_price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '爆倉/強平價',
  `risk` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '爆倉風險率',
  `pay_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '支付保證金(開倉成本)',
  `init_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '初始保證金(開倉成本-開倉手續費)',
  `margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '倉位保證金(預設是初始保證金會根據資金費,增加保證金異動)',
  `quantity_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '倉位佔用保證金',
  `append_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '追加保證金',
  `unrealized_profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '未实现盈亏',
  `profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已實現盈虧',
  `total_profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '結算總收支(已實現盈虧+佔用保證金+保證金餘額)',
  `profit_and_loss_ratio` double NOT NULL DEFAULT '0' COMMENT '已實現報酬/盈虧率',
  `total_funding_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '累積多少資金費',
  `liquidation` decimal(30,18) DEFAULT '0.000000000000000000',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '倉位狀態(持倉 平倉中 異常)',
  `close_type` tinyint NOT NULL DEFAULT '1' COMMENT '平倉類型',
  `create_platform` varchar(50) NOT NULL DEFAULT '' COMMENT '委託平台',
  `is_simulate` tinyint NOT NULL DEFAULT '2' COMMENT '是否為模擬交易 1:是 2:否',
  `voucher_id` varchar(50) DEFAULT '' COMMENT '使用者體驗券ID',
  `close_profit_and_loss` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓盈亏',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立/撮合時間',
  `close_time` bigint NOT NULL DEFAULT '0' COMMENT '平倉時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  `margin_mode` tinyint NOT NULL DEFAULT '1' COMMENT '全仓标识: 1逐仓 2全仓 ',
  `append_position` json DEFAULT (_utf8mb4'[]'),
  `net_quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平仓时净持仓',
  `merge_mode` tinyint NOT NULL DEFAULT '0' COMMENT '0: 分仓 1: 合仓',
  `merge_position_unique_key` varchar(512) GENERATED ALWAYS AS (if(((`merge_mode` = 1) and (`status` = 1)),concat(`uid`,_utf8mb4'_',`pair`,_utf8mb4'_',`side`,_utf8mb4'_',`status`,_utf8mb4'_',`margin_mode`,_utf8mb4'_',`is_simulate`),NULL)) STORED,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_uk` (`order_id`),
  UNIQUE KEY `idx_unique_position_merge` (`merge_position_unique_key`),
  KEY `idx_uid` (`uid`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_close_time` (`close_time`),
  KEY `idx_reference_uid` (`reference_uid`),
  KEY `idx_reference_order_id` (`reference_order_id`),
  KEY `idx_create_time` (`create_time` DESC) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='倉位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `retry_handle_order`
--

DROP TABLE IF EXISTS `retry_handle_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `retry_handle_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) NOT NULL COMMENT '訂單id',
  `position_order_id` varchar(100) NOT NULL COMMENT '倉位單號(委託單成立後更新)',
  `uid` varchar(50) NOT NULL COMMENT '用戶uid',
  `pair` varchar(50) NOT NULL DEFAULT '' COMMENT '交易對',
  `side` tinyint NOT NULL COMMENT '買賣/方向',
  `quantity` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '成交數量(幣種)',
  `price` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '成交價格',
  `type` tinyint NOT NULL COMMENT '觸發類型',
  `trigger_type` tinyint NOT NULL COMMENT '觸發類型',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '狀態 1:未完成 2:已完成',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=22157045 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='retry_handle_order 未處理完成的委託單或倉位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `max_position` int NOT NULL DEFAULT '0' COMMENT '用戶最大倉位',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1. 啟用 2. 禁用',
  `create_time` bigint NOT NULL DEFAULT '0',
  `update_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='全局設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_funding_fee`
--

DROP TABLE IF EXISTS `system_funding_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_funding_fee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) DEFAULT NULL,
  `uid` varchar(100) DEFAULT NULL,
  `pair` varchar(50) NOT NULL COMMENT '交易對',
  `amount` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '資金費',
  `contract_type` tinyint DEFAULT '1',
  `position_side` tinyint DEFAULT '0',
  `funding_fee_rate` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '資金費率',
  `amount_type` tinyint DEFAULT '1' COMMENT '訂單類型(金額)',
  `new_price` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '當時最新價格',
  `net_position_quantity` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '淨頭寸的資產數量',
  `ustd_rate` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT 'ustd匯率',
  `voucher_id` varchar(50) DEFAULT '' COMMENT '使用者體驗券ID',
  `is_handle` tinyint DEFAULT '2',
  `update_time` bigint NOT NULL DEFAULT '0',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  PRIMARY KEY (`id`),
  KEY `idx_pair` (`pair`),
  KEY `idx_is_handle` (`is_handle`)
) ENGINE=InnoDB AUTO_INCREMENT=461196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='平台資金費';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_funding_fee_aggregate`
--

DROP TABLE IF EXISTS `system_funding_fee_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_funding_fee_aggregate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pair` varchar(50) NOT NULL COMMENT '交易對',
  `amount` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '資金費',
  `funding_fee_rate` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '資金費率',
  `new_price` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '當時最新價格',
  `net_position_quantity` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '淨頭寸的資產數量',
  `usdt_rate` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT 'usdt匯率',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  `timestamp` bigint NOT NULL DEFAULT '0' COMMENT '聚合用時間戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_pair_timestamp` (`pair`,`timestamp`),
  KEY `idx_pair` (`pair`)
) ENGINE=InnoDB AUTO_INCREMENT=22913 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聚合平台資金費';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ten_thousand_contract`
--

DROP TABLE IF EXISTS `ten_thousand_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ten_thousand_contract` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `base` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '交易基础幣種(BTC)',
  `quote` varchar(50) NOT NULL COMMENT '計價資產(USDT/USDC)',
  `pair` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '交易對名稱(BTC/USDT)',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '交易狀態(1待上线 2开放交易 3仅关仓 4停止交易 5下线)',
  `price_scale` int NOT NULL DEFAULT '0' COMMENT '價格精度',
  `quantity_scale` int NOT NULL DEFAULT '0' COMMENT '數量精度',
  `unit` decimal(30,16) NOT NULL COMMENT '資產最小單位(張) ex: 0.0001 BTC = 1張',
  `max_profit_multiples` int NOT NULL DEFAULT '0' COMMENT '最大止盈倍數',
  `open_fee` decimal(30,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '開倉手續費',
  `close_fee` decimal(30,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '平倉手續費',
  `share_rate` decimal(30,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '盈利抽成比例',
  `market_random_rate` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '做市随机值出现概率',
  `market_random_max` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '做市随机值max',
  `market_random_min` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '做市随机值min',
  `init_leverage` int NOT NULL DEFAULT '1' COMMENT '初始槓桿',
  `min_leverage` int NOT NULL DEFAULT '1' COMMENT '最小槓桿',
  `max_leverage` int NOT NULL DEFAULT '1' COMMENT '最大槓桿',
  `show_leverage` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前台显示杠杆',
  `show_stop_profit` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前端止盈显示',
  `show_stop_loss` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前端止损显示',
  `open_position_max_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉最大保證金',
  `open_position_min_margin` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '開倉最小保證金',
  `price_source_binance_weight` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '价格来源权重-币安',
  `price_source_bybit_weight` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '价格来源权重-bybit',
  `price_source_okx_weight` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '价格来源权重-okx',
  `price_source_lbank_weight` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000' COMMENT '价格来源权重-lbank',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_pair` (`pair`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='万倍合約配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ten_thousand_global_config`
--

DROP TABLE IF EXISTS `ten_thousand_global_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ten_thousand_global_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `max_position` int NOT NULL COMMENT '最大持仓数量',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='万倍合約全局配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` varchar(100) NOT NULL COMMENT '用户id',
  `contract_type` int NOT NULL DEFAULT '0' COMMENT '类型 1普通合约 2千倍合约 3万倍合约',
  `setting_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置key',
  `setting_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置value',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_limit` (`uid`,`contract_type`,`setting_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户偏好设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `id` bigint NOT NULL DEFAULT '0' COMMENT '體驗金ID',
  `task_id` bigint NOT NULL DEFAULT '0' COMMENT '產品ＩＤ',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '體驗金名稱',
  `display_name` json NOT NULL DEFAULT (_utf8mb4'[]') COMMENT '體驗金顯示內容',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '體驗金狀態 1: 上架, 2:下架',
  `is_limit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有限制',
  `limit_count` bigint NOT NULL DEFAULT '0' COMMENT '限制數量',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '體驗券類型 1=Futures Trading Bonus',
  `source` tinyint NOT NULL DEFAULT '0' COMMENT '體驗金來源 1=直接發放, 2=體驗金池',
  `category` tinyint NOT NULL DEFAULT '0' COMMENT '體驗金種類 1=體驗金券, 2=滿減券, 3=手續費抵扣券',
  `amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '體驗券金額',
  `crypto` varchar(50) NOT NULL COMMENT '幣種',
  `claim_type` tinyint NOT NULL DEFAULT '1' COMMENT '領取類型 1=手動, 2=自動',
  `claim_period` int NOT NULL DEFAULT '0' COMMENT '體驗金領取有效天數',
  `available_period` int NOT NULL DEFAULT '0' COMMENT '使用有效期，領取後的有效天數',
  `leverage_range_start` int DEFAULT '0' COMMENT '體驗券可使用的槓桿範圍_起始',
  `leverage_range_end` int DEFAULT '0' COMMENT '體驗券可使用的槓桿範圍_結束',
  `holding_range_min` int DEFAULT '0' COMMENT '體驗金可以使用的最小持倉時間',
  `holding_range_max` int DEFAULT '0' COMMENT '體驗金可以使用的最大持倉時間',
  `selected` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被選中',
  `remark` varchar(100) DEFAULT NULL COMMENT '體驗金說明',
  `user_id` varchar(20) NOT NULL DEFAULT '' COMMENT '建立人員ID',
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
  `register_time_start` int NOT NULL DEFAULT '0' COMMENT '註冊開始時間',
  `register_time_end` int NOT NULL DEFAULT '0' COMMENT '註冊結束時間',
  `user_tag` varchar(50) NOT NULL DEFAULT '' COMMENT '用戶標籤',
  `total_amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '發放總金額',
  `total_count` int NOT NULL DEFAULT '0' COMMENT '發放總數量',
  `apportion_time` bigint NOT NULL COMMENT '發放時間',
  `claim_type` tinyint NOT NULL COMMENT '領取類型 1=手動, 2=自動',
  `claim_before` bigint NOT NULL COMMENT '體驗金領取有效期',
  `available_period` int NOT NULL COMMENT '使用有效期，領取後的有效天數',
  `invalid_time` bigint NOT NULL DEFAULT '0' COMMENT '體驗金的失效時間',
  `comment` varchar(100) DEFAULT NULL COMMENT '發放備註',
  `user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '發放人員 uid',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`,`update_time`),
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `apportion_id` bigint NOT NULL DEFAULT '0' COMMENT '發放ID',
  `voucher_id` bigint NOT NULL DEFAULT '0' COMMENT '體驗金ID',
  `amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '體驗券金額',
  `member_uid` varchar(50) NOT NULL DEFAULT '' COMMENT '會員UID',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '使用狀態 1=未使用, 2=已領取, 3=已使用, 4=已過期, 5=已失效',
  `claim_type` tinyint NOT NULL DEFAULT '0' COMMENT '領取類型 1=手動領取, 2=自動領取',
  `claim_time` bigint DEFAULT NULL COMMENT '領取時間',
  `used_time` bigint DEFAULT NULL COMMENT '使用時間',
  `expiration_time` bigint DEFAULT NULL COMMENT '過期時間',
  `invalid_time` bigint DEFAULT NULL COMMENT '失效時間',
  `side` tinyint DEFAULT '0' COMMENT '方向(1=多/2=空)',
  `process` tinyint NOT NULL DEFAULT '0' COMMENT '流程 1=持倉中, 2=結束',
  `recovered_amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已回收金額',
  `earned_profit` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '已獲利金額',
  `create_time` bigint NOT NULL DEFAULT '0' COMMENT '建立時間',
  `update_time` bigint NOT NULL DEFAULT '0' COMMENT '更新時間',
  PRIMARY KEY (`id`),
  KEY `idx_apportion_id` (`apportion_id`),
  KEY `idx_voucher_id` (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1595415253975041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='體驗金發放詳情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_category_dtl`
--

DROP TABLE IF EXISTS `voucher_category_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher_category_dtl` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '流水ＩＤ',
  `category` tinyint NOT NULL DEFAULT '0' COMMENT '體驗金種類 1=體驗金券, 2=滿減券, 3=手續費抵扣券',
  `task_id_range_min` bigint NOT NULL DEFAULT '0' COMMENT '產品ＩＤ值_起始',
  `task_id_range_max` bigint NOT NULL DEFAULT '0' COMMENT '產品ＩＤ值_結束',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='體驗券種類詳細設定';
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
  UNIQUE KEY `uq_uid` (`uid`,`crypto`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='錢包';
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
  `wallet_type` tinyint NOT NULL COMMENT '餘額種類(1:可用 2:凍結 3:模擬可用 4:模擬凍結)',
  `type` tinyint NOT NULL COMMENT '交易種類',
  `amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '金額',
  `finish_balance` decimal(30,18) NOT NULL COMMENT '完成交易後餘額',
  `create_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='錢包流水';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'cnx_orchid'
--

--
-- Dumping routines for database 'cnx_orchid'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:03:29
