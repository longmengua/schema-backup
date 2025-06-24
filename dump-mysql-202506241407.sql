/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 34.124.186.46    Database: mysql
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
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL,
  `server_id` int unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int NOT NULL,
  `rows_examined` int NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int NOT NULL,
  `insert_id` int NOT NULL,
  `server_id` int unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit_log_rules`
--

DROP TABLE IF EXISTS `audit_log_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log_rules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(2048) COLLATE utf8mb4_bin NOT NULL,
  `dbname` varchar(2048) COLLATE utf8mb4_bin NOT NULL,
  `object` varchar(2048) COLLATE utf8mb4_bin NOT NULL,
  `operation` varchar(2048) COLLATE utf8mb4_bin NOT NULL,
  `op_result` char(1) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit_log_rules_expanded`
--

DROP TABLE IF EXISTS `audit_log_rules_expanded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log_rules_expanded` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rule_id` bigint NOT NULL,
  `userdef` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `hostdef` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dbname` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `object` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `operation` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `op_result` char(1) COLLATE utf8mb4_bin NOT NULL,
  `modified` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userdef` (`userdef`,`hostdef`,`dbname`,`object`,`operation`,`op_result`),
  KEY `modidx` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit_log_supported_ops`
--

DROP TABLE IF EXISTS `audit_log_supported_ops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log_supported_ops` (
  `op_name` varchar(32) NOT NULL,
  PRIMARY KEY (`op_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_db_advisor_jobs`
--

DROP TABLE IF EXISTS `cloudsql_db_advisor_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_db_advisor_jobs` (
  `JOB_ID` bigint NOT NULL AUTO_INCREMENT,
  `OPERATION` varchar(50) DEFAULT NULL,
  `START_DATE` timestamp(6) NULL DEFAULT NULL,
  `END_DATE` timestamp(6) NULL DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `COMMENT` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_db_advisor_recommendation_analysis`
--

DROP TABLE IF EXISTS `cloudsql_db_advisor_recommendation_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_db_advisor_recommendation_analysis` (
  `QUERY_ID` bigint NOT NULL,
  `SNAPSHOT_DATE` timestamp(6) NOT NULL,
  `OLD_COUNT_STAR` bigint unsigned NOT NULL,
  `OLD_TOTAL_RUN_TIME` bigint unsigned NOT NULL,
  `OLD_AVG_RUN_TIME` bigint unsigned NOT NULL,
  `OLD_SUM_ROWS_SENT` bigint unsigned NOT NULL,
  `OLD_SUM_ROWS_EXAMINED` bigint unsigned NOT NULL,
  `FIRST_INDEX_ADOPTION_DATE` timestamp(6) NULL DEFAULT NULL,
  `NEW_COUNT_STAR` bigint unsigned DEFAULT NULL,
  `NEW_TOTAL_RUN_TIME` bigint unsigned DEFAULT NULL,
  `NEW_TOTAL_AVG_TIME` bigint unsigned DEFAULT NULL,
  `NEW_SUM_ROWS_SENT` bigint unsigned DEFAULT NULL,
  `NEW_SUM_ROWS_EXAMINED` bigint unsigned DEFAULT NULL,
  UNIQUE KEY `QUERY_ID` (`QUERY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_db_advisor_recommended_indexes`
--

DROP TABLE IF EXISTS `cloudsql_db_advisor_recommended_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_db_advisor_recommended_indexes` (
  `INDEX_ID` bigint NOT NULL AUTO_INCREMENT,
  `SCHEMA_NAME` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `COLUMN_NAMES` varchar(520) DEFAULT NULL,
  `INDEX_TYPE` varchar(64) DEFAULT NULL,
  `DDL_TYPE` varchar(64) DEFAULT NULL,
  `SQL_STATEMENT` text,
  `ESTIMATED_SIZE_BYTES` bigint unsigned NOT NULL,
  `READ_WRITE_RATIO` int unsigned DEFAULT NULL,
  `WEIGHT_IMPACT` bigint unsigned DEFAULT '0',
  `CREATED_TIME` timestamp(6) NULL DEFAULT NULL,
  `ADOPTED_DATE` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`),
  UNIQUE KEY `SCHEMA_TABLE_COLUMN_NAME` (`SCHEMA_NAME`,`TABLE_NAME`,`COLUMN_NAMES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_db_advisor_report_index_mapping`
--

DROP TABLE IF EXISTS `cloudsql_db_advisor_report_index_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_db_advisor_report_index_mapping` (
  `QUERY_ID` bigint NOT NULL,
  `INDEX_ID` bigint NOT NULL,
  `COST_IN_PERCENT` int NOT NULL,
  UNIQUE KEY `QUERY_INDEX_ID` (`QUERY_ID`,`INDEX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_db_advisor_workload_report`
--

DROP TABLE IF EXISTS `cloudsql_db_advisor_workload_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_db_advisor_workload_report` (
  `QUERY_ID` bigint NOT NULL AUTO_INCREMENT,
  `SCHEMA_NAME` varchar(64) DEFAULT NULL,
  `DIGEST` varchar(64) DEFAULT NULL,
  `QUERY_HASH` bigint unsigned DEFAULT NULL,
  `AVERAGE_EXECUTION_TIME` bigint DEFAULT NULL,
  `TOTAL_EXECUTION_TIME` bigint DEFAULT NULL,
  `EXPLAIN_REPORT` json DEFAULT NULL,
  `RECOMMENDATION_DATE` timestamp(6) NOT NULL,
  `SERVER_ID` varchar(64) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`QUERY_ID`),
  KEY `SCHEMA_TABLE_COLUMN_NAME` (`SCHEMA_NAME`,`DIGEST`,`QUERY_HASH`,`IS_ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_db_advisor_workload_statements`
--

DROP TABLE IF EXISTS `cloudsql_db_advisor_workload_statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_db_advisor_workload_statements` (
  `SCHEMA_NAME` varchar(64) DEFAULT NULL,
  `DIGEST` varchar(64) DEFAULT NULL,
  `DIGEST_TEXT` longtext,
  `AVG_TIMER_WAIT` bigint unsigned NOT NULL,
  `COUNT_STAR` bigint unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint unsigned NOT NULL,
  `SUM_ROWS_AFFECTED` bigint unsigned NOT NULL,
  `SUM_ROWS_SENT` bigint unsigned NOT NULL,
  `SUM_ROWS_EXAMINED` bigint unsigned NOT NULL,
  `SUM_NO_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_SELECT_SCAN` bigint unsigned NOT NULL,
  `LAST_RUN_COUNT_STAR` bigint unsigned NOT NULL,
  `LAST_RUN_SUM_TIMER_WAIT` bigint unsigned NOT NULL,
  `LAST_RUN_SUM_ROWS_AFFECTED` bigint unsigned NOT NULL,
  `LAST_RUN_SUM_ROWS_SENT` bigint unsigned NOT NULL,
  `LAST_RUN_SUM_ROWS_EXAMINED` bigint unsigned NOT NULL,
  `LAST_RUN_SUM_NO_INDEX_USED` bigint unsigned NOT NULL,
  `LAST_RUN_SUM_NO_GOOD_INDEX_USED` bigint unsigned NOT NULL,
  `LAST_RUN_SUM_SELECT_SCAN` bigint unsigned NOT NULL,
  `FIRST_SEEN` timestamp(6) NOT NULL,
  `LAST_SEEN` timestamp(6) NOT NULL,
  `QUERY_SAMPLE_TEXT` longtext,
  UNIQUE KEY `SCHEMA_NAME` (`SCHEMA_NAME`,`DIGEST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_events_statements_aggregate_by_account_by_database`
--

DROP TABLE IF EXISTS `cloudsql_events_statements_aggregate_by_account_by_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_events_statements_aggregate_by_account_by_database` (
  `SCHEMA_NAME` varchar(64) DEFAULT NULL,
  `USER_NAME` varchar(64) DEFAULT NULL,
  `HOST_NAME` varchar(64) DEFAULT NULL,
  `COUNT_STAR` bigint unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint unsigned NOT NULL,
  `SUM_LOCK_TIME` bigint unsigned NOT NULL,
  `SUM_ERRORS` bigint unsigned NOT NULL,
  `SUM_WARNINGS` bigint unsigned NOT NULL,
  `SUM_ROWS_AFFECTED` bigint unsigned NOT NULL,
  `SUM_ROWS_SENT` bigint unsigned NOT NULL,
  `SUM_ROWS_EXAMINED` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint unsigned NOT NULL,
  `SUM_SELECT_SCAN` bigint unsigned NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint unsigned NOT NULL,
  `SUM_SORT_RANGE` bigint unsigned NOT NULL,
  `SUM_SORT_ROWS` bigint unsigned NOT NULL,
  `SUM_SORT_SCAN` bigint unsigned NOT NULL,
  `SUM_NO_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_CPU_TIME` bigint unsigned NOT NULL,
  `MAX_CONTROLLED_MEMORY` bigint unsigned NOT NULL,
  `MAX_TOTAL_MEMORY` bigint unsigned NOT NULL,
  `COUNT_SECONDARY` bigint unsigned NOT NULL,
  `FIRST_SEEN` timestamp NOT NULL,
  `LAST_SEEN` timestamp NOT NULL,
  `QUANTILE_95` bigint unsigned NOT NULL,
  `QUANTILE_99` bigint unsigned NOT NULL,
  `QUANTILE_999` bigint unsigned NOT NULL,
  `SUM_IO_WAIT_TIME` bigint unsigned NOT NULL,
  `SUM_EXECUTION_TIME` bigint unsigned NOT NULL,
  KEY `SCHEMA_NAME` (`SCHEMA_NAME`,`USER_NAME`,`HOST_NAME`),
  KEY `TIME_SLICE` (`FIRST_SEEN`,`LAST_SEEN`,`SUM_TIMER_WAIT`),
  KEY `USER` (`USER_NAME`,`SUM_TIMER_WAIT`),
  KEY `HOST` (`HOST_NAME`,`SUM_TIMER_WAIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3
/*!50100 PARTITION BY RANGE (unix_timestamp(`FIRST_SEEN`))
(PARTITION p_stmtagg_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_events_statements_summary_by_digest`
--

DROP TABLE IF EXISTS `cloudsql_events_statements_summary_by_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_events_statements_summary_by_digest` (
  `SCHEMA_NAME` varchar(64) DEFAULT NULL,
  `USER_NAME` varchar(64) DEFAULT NULL,
  `HOST_NAME` varchar(64) DEFAULT NULL,
  `DIGEST` varchar(64) DEFAULT NULL,
  `DIGEST_TEXT` longtext,
  `QUERY_HASH` bigint unsigned NOT NULL DEFAULT '0',
  `COUNT_STAR` bigint unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint unsigned NOT NULL,
  `SUM_LOCK_TIME` bigint unsigned NOT NULL,
  `SUM_ERRORS` bigint unsigned NOT NULL,
  `SUM_WARNINGS` bigint unsigned NOT NULL,
  `SUM_ROWS_AFFECTED` bigint unsigned NOT NULL,
  `SUM_ROWS_SENT` bigint unsigned NOT NULL,
  `SUM_ROWS_EXAMINED` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint unsigned NOT NULL,
  `SUM_SELECT_SCAN` bigint unsigned NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint unsigned NOT NULL,
  `SUM_SORT_RANGE` bigint unsigned NOT NULL,
  `SUM_SORT_ROWS` bigint unsigned NOT NULL,
  `SUM_SORT_SCAN` bigint unsigned NOT NULL,
  `SUM_NO_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_CPU_TIME` bigint unsigned NOT NULL,
  `MAX_CONTROLLED_MEMORY` bigint unsigned NOT NULL,
  `MAX_TOTAL_MEMORY` bigint unsigned NOT NULL,
  `COUNT_SECONDARY` bigint unsigned NOT NULL,
  `FIRST_SEEN` timestamp NOT NULL,
  `LAST_SEEN` timestamp NOT NULL,
  `QUANTILE_95` bigint unsigned NOT NULL,
  `QUANTILE_99` bigint unsigned NOT NULL,
  `QUANTILE_999` bigint unsigned NOT NULL,
  `QUERY_SAMPLE_TEXT` longtext,
  `QUERY_SAMPLE_SEEN` timestamp(6) NOT NULL,
  `QUERY_SAMPLE_TIMER_WAIT` bigint unsigned NOT NULL,
  `SUM_IO_WAIT_TIME` bigint unsigned NOT NULL,
  `SUM_EXECUTION_TIME` bigint unsigned NOT NULL,
  `TRACE_INFO` text,
  KEY `SCHEMA_NAME` (`SCHEMA_NAME`,`DIGEST`,`USER_NAME`,`HOST_NAME`),
  KEY `TIME_SLICE` (`FIRST_SEEN`,`LAST_SEEN`,`DIGEST`,`SUM_TIMER_WAIT`),
  KEY `USER` (`USER_NAME`,`DIGEST`,`SUM_TIMER_WAIT`),
  KEY `HOST` (`HOST_NAME`,`DIGEST`,`SUM_TIMER_WAIT`),
  KEY `DIGEST` (`DIGEST`,`SUM_TIMER_WAIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3
/*!50100 PARTITION BY RANGE (unix_timestamp(`FIRST_SEEN`))
(PARTITION p_stmt_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_events_statements_summary_by_tag`
--

DROP TABLE IF EXISTS `cloudsql_events_statements_summary_by_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_events_statements_summary_by_tag` (
  `SCHEMA_NAME` varchar(64) DEFAULT NULL,
  `USER_NAME` varchar(64) DEFAULT NULL,
  `HOST_NAME` varchar(64) DEFAULT NULL,
  `TAG_HASH` varchar(64) DEFAULT NULL,
  `TAG_TEXT` longtext,
  `TAG_FINGERPRINT` bigint unsigned NOT NULL DEFAULT '0',
  `COUNT_STAR` bigint unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint unsigned NOT NULL,
  `SUM_LOCK_TIME` bigint unsigned NOT NULL,
  `SUM_ERRORS` bigint unsigned NOT NULL,
  `SUM_WARNINGS` bigint unsigned NOT NULL,
  `SUM_ROWS_AFFECTED` bigint unsigned NOT NULL,
  `SUM_ROWS_SENT` bigint unsigned NOT NULL,
  `SUM_ROWS_EXAMINED` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint unsigned NOT NULL,
  `SUM_SELECT_SCAN` bigint unsigned NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint unsigned NOT NULL,
  `SUM_SORT_RANGE` bigint unsigned NOT NULL,
  `SUM_SORT_ROWS` bigint unsigned NOT NULL,
  `SUM_SORT_SCAN` bigint unsigned NOT NULL,
  `SUM_NO_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_CPU_TIME` bigint unsigned NOT NULL,
  `MAX_CONTROLLED_MEMORY` bigint unsigned NOT NULL,
  `MAX_TOTAL_MEMORY` bigint unsigned NOT NULL,
  `COUNT_SECONDARY` bigint unsigned NOT NULL,
  `FIRST_SEEN` timestamp NOT NULL,
  `LAST_SEEN` timestamp NOT NULL,
  `QUANTILE_95` bigint unsigned NOT NULL,
  `QUANTILE_99` bigint unsigned NOT NULL,
  `QUANTILE_999` bigint unsigned NOT NULL,
  `QUERY_SAMPLE_TEXT` longtext,
  `QUERY_SAMPLE_SEEN` timestamp(6) NOT NULL,
  `QUERY_SAMPLE_TIMER_WAIT` bigint unsigned NOT NULL,
  `SUM_IO_WAIT_TIME` bigint unsigned NOT NULL,
  `SUM_EXECUTION_TIME` bigint unsigned NOT NULL,
  `APPLICATION` text,
  `DB_DRIVER` text,
  `FRAMEWORK_ACTION` text,
  `FRAMEWORK_CONTROLLER` text,
  `FRAMEWORK_NAME` text,
  `FRAMEWORK_ROUTE` text,
  `TRACEPARENT` text,
  KEY `SCHEMA_NAME` (`SCHEMA_NAME`,`TAG_HASH`,`USER_NAME`,`HOST_NAME`),
  KEY `TIME_SLICE` (`FIRST_SEEN`,`LAST_SEEN`,`TAG_HASH`,`SUM_TIMER_WAIT`),
  KEY `USER` (`USER_NAME`,`TAG_HASH`,`SUM_TIMER_WAIT`),
  KEY `HOST` (`HOST_NAME`,`TAG_HASH`,`SUM_TIMER_WAIT`),
  KEY `TAGS` (`TAG_HASH`,`SUM_TIMER_WAIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3
/*!50100 PARTITION BY RANGE (unix_timestamp(`FIRST_SEEN`))
(PARTITION p_tag_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudsql_replica_index`
--

DROP TABLE IF EXISTS `cloudsql_replica_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudsql_replica_index` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `index_name` varchar(64) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`db_name`,`table_name`,`index_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Secondary indexes created on read replica via stored procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `component_id` int unsigned NOT NULL AUTO_INCREMENT,
  `component_group_id` int unsigned NOT NULL,
  `component_urn` text NOT NULL,
  PRIMARY KEY (`component_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Components';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `default_roles`
--

DROP TABLE IF EXISTS `default_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_roles` (
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `DEFAULT_ROLE_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '%',
  `DEFAULT_ROLE_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`HOST`,`USER`,`DEFAULT_ROLE_HOST`,`DEFAULT_ROLE_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Default roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `global_grants`
--

DROP TABLE IF EXISTS `global_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_grants` (
  `USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `PRIV` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `WITH_GRANT_OPTION` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER`,`HOST`,`PRIV`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Extended global grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gtid_executed`
--

DROP TABLE IF EXISTS `gtid_executed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`,`interval_start`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `heartbeat`
--

DROP TABLE IF EXISTS `heartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `heartbeat` (
  `id` int unsigned NOT NULL,
  `master_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int unsigned NOT NULL,
  `help_keyword_id` int unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `innodb_index_stats`
--

DROP TABLE IF EXISTS `innodb_index_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `innodb_index_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `stat_value` bigint unsigned NOT NULL,
  `sample_size` bigint unsigned DEFAULT NULL,
  `stat_description` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`,`index_name`,`stat_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `innodb_table_stats`
--

DROP TABLE IF EXISTS `innodb_table_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `innodb_table_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_rows` bigint unsigned NOT NULL,
  `clustered_index_size` bigint unsigned NOT NULL,
  `sum_of_other_index_sizes` bigint unsigned NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_history` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Password` text COLLATE utf8_bin,
  PRIMARY KEY (`Host`,`User`,`Password_timestamp` DESC)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Password history for user accounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patch_action_execution_state`
--

DROP TABLE IF EXISTS `patch_action_execution_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `patch_action_execution_state` (
  `action_name` varchar(255) NOT NULL,
  `version` int NOT NULL,
  `status_time` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `retries` int NOT NULL,
  PRIMARY KEY (`action_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `procs_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxies_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replication_asynchronous_connection_failover`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover` (
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Port` int unsigned NOT NULL COMMENT 'The source port that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Network_namespace` char(64) NOT NULL COMMENT 'The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.',
  `Weight` tinyint unsigned NOT NULL COMMENT 'The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.',
  `Managed_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the group which this server belongs to.',
  PRIMARY KEY (`Channel_name`,`Host`,`Port`,`Network_namespace`,`Managed_name`),
  KEY `Channel_name` (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replication_asynchronous_connection_failover_managed`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover_managed` (
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Managed_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the source which needs to be managed.',
  `Managed_type` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Determines the managed type.',
  `Configuration` json DEFAULT NULL COMMENT 'The data to help manage group. For Managed_type = GroupReplication, Configuration value should contain {"Primary_weight": 80, "Secondary_weight": 60}, so that it assigns weight=80 to PRIMARY of the group, and weight=60 for rest of the members in mysql.replication_asynchronous_connection_failover table.',
  PRIMARY KEY (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The managed source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replication_group_configuration_version`
--

DROP TABLE IF EXISTS `replication_group_configuration_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_configuration_version` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The configuration name.',
  `version` bigint unsigned NOT NULL COMMENT 'The version of the configuration name.',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The group configuration version.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replication_group_member_actions`
--

DROP TABLE IF EXISTS `replication_group_member_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_member_actions` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action name.',
  `event` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The event that will trigger the action.',
  `enabled` tinyint(1) NOT NULL COMMENT 'Whether the action is enabled.',
  `type` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action type.',
  `priority` tinyint unsigned NOT NULL COMMENT 'The order on which the action will be run, value between 1 and 100, lower values first.',
  `error_handling` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'On errors during the action will be handled: IGNORE, CRITICAL.',
  PRIMARY KEY (`name`,`event`),
  KEY `event` (`event`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The member actions configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_edges`
--

DROP TABLE IF EXISTS `role_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_edges` (
  `FROM_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `FROM_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `TO_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `TO_USER` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `WITH_ADMIN_OPTION` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`FROM_HOST`,`FROM_USER`,`TO_HOST`,`TO_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Role hierarchy and role grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'disk_temptable_create_cost' then 20.0 when _utf8mb3'disk_temptable_row_cost' then 0.5 when _utf8mb3'key_compare_cost' then 0.05 when _utf8mb3'memory_temptable_create_cost' then 1.0 when _utf8mb3'memory_temptable_row_cost' then 0.1 when _utf8mb3'row_evaluate_cost' then 0.1 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skip_replication_error_history`
--

DROP TABLE IF EXISTS `skip_replication_error_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `skip_replication_error_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `call_time` timestamp NOT NULL,
  `source_uuid` char(36) NOT NULL,
  `enabled_auto_position` tinyint NOT NULL,
  `gtid_executed` varchar(1024) DEFAULT NULL,
  `parallel_workers` int NOT NULL,
  `gtid_next` varchar(1024) DEFAULT NULL,
  `success` tinyint(1) NOT NULL,
  `error_num` int DEFAULT NULL,
  `error_message` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='History tracking table for skipReplicationError stored procedure';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_master_info`
--

DROP TABLE IF EXISTS `slave_master_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slave_master_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The password used to connect to the master.',
  `Port` int unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Tls version',
  `Public_key_path` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file containing public key of master server.',
  `Get_public_key` tinyint(1) NOT NULL COMMENT 'Preference to get public key from master.',
  `Network_namespace` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Network namespace used for communication with the master server.',
  `Master_compression_algorithm` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Compression algorithm supported for data transfer between master and slave.',
  `Master_zstd_compression_level` int unsigned NOT NULL COMMENT 'Compression level associated with zstd compression algorithm.',
  `Tls_ciphersuites` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Ciphersuites used for TLS 1.3 communication with the master server.',
  `Source_connection_auto_failover` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates whether the channel connection failover is enabled.',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

DROP TABLE IF EXISTS `slave_relay_log_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slave_relay_log_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int DEFAULT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int unsigned DEFAULT NULL,
  `Id` int unsigned DEFAULT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Privilege_checks_username` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Username part of PRIVILEGE_CHECKS_USER.',
  `Privilege_checks_hostname` char(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'Hostname part of PRIVILEGE_CHECKS_USER.',
  `Require_row_format` tinyint(1) NOT NULL COMMENT 'Indicates whether the channel shall only accept row based events.',
  `Require_table_primary_key_check` enum('STREAM','ON','OFF') NOT NULL DEFAULT 'STREAM' COMMENT 'Indicates what is the channel policy regarding tables having primary keys on create and alter table queries',
  `Assign_gtids_to_anonymous_transactions_type` enum('OFF','LOCAL','UUID') NOT NULL DEFAULT 'OFF' COMMENT 'Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value',
  `Assign_gtids_to_anonymous_transactions_value` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Indicates the UUID used while generating GTIDs for anonymous transactions',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slave_worker_info` (
  `Id` int unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_seqno` int unsigned NOT NULL,
  `Checkpoint_group_size` int unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` varchar(288) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB AUTO_INCREMENT=3576 DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint NOT NULL,
  `Correction` int NOT NULL,
  PRIMARY KEY (`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_time` bigint NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  `Offset` int NOT NULL DEFAULT '0',
  `Is_DST` tinyint unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int unsigned NOT NULL DEFAULT '0',
  `max_updates` int unsigned NOT NULL DEFAULT '0',
  `max_connections` int unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin NOT NULL DEFAULT 'caching_sha2_password',
  `authentication_string` text COLLATE utf8_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_role_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_role_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Password_reuse_history` smallint unsigned DEFAULT NULL,
  `Password_reuse_time` smallint unsigned DEFAULT NULL,
  `Password_require_current` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `User_attributes` json DEFAULT NULL,
  PRIMARY KEY (`Host`,`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'mysql'
--

--
-- Dumping routines for database 'mysql'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addSecondaryIdxOnReplica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE  PROCEDURE `addSecondaryIdxOnReplica`(IN idxType VARCHAR(20),
    idxName VARCHAR(100),
    tableName VARCHAR(100),
    idxDefinition VARCHAR(500),
    idxOption VARCHAR(255)
    )
BEGIN

    DECLARE v_newIdxCount INT DEFAULT 0;
    DECLARE v_registerIdx INT DEFAULT 0;
    DECLARE v_oldSqlLogBin INT DEFAULT 0;
    DECLARE v_dbName VARCHAR(64) DEFAULT '';
    DECLARE v_tableName VARCHAR(64) DEFAULT '';
    DECLARE v_idxTypeNormalized VARCHAR(20) DEFAULT '';

    DECLARE exit HANDLER FOR SQLEXCEPTION, SQLSTATE '45000'
    BEGIN
        SET sql_log_bin = v_oldSqlLogBin;
        RESIGNAL;
    END;

    SET v_oldSqlLogBin = (SELECT @@sql_log_bin);
    SET sql_log_bin = 0;

    IF LOCATE('#', idxType) > 0 OR LOCATE('--', idxType) > 0 OR LOCATE('/*', idxType) > 0
    THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Suspicious input parameter with sql comment sequence';
    END IF;

    SET v_idxTypeNormalized = UPPER(TRIM(REPLACE(REPLACE(REPLACE(IFNULL(idxType, ''), '\n', ' '), '\r', ' '), '\t', ' ')));
    
    IF v_idxTypeNormalized NOT IN ('', 'UNIQUE', 'FULLTEXT', 'SPATIAL') THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Invalid index type: Please see MySQL documentation for supported index types';
    END IF;

    IF LOCATE('.', tableName) > 0 THEN
      SET v_dbName = SUBSTRING_INDEX(tableName, '.', 1);
      SET v_tableName = SUBSTRING_INDEX(tableName, '.', -1);
    ELSE
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Please provide database name along with table name: db.table';
    END IF;

    IF v_dbName = 'mysql' THEN
       SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT = 'Invalid database name: mysql. Please provide database name along with table name: db.table';
    END IF;

    SET @addSecondaryIdx_sql = CONCAT('CREATE ', v_idxTypeNormalized, ' INDEX ', idxName, ' ON ', v_dbName, '.', v_tableName, ' ( ', idxDefinition, ' ) ', idxOption);

    SELECT @addSecondaryIdx_sql AS 'Step 1';
    PREPARE idx_stmt FROM @addSecondaryIdx_sql;
    EXECUTE idx_stmt;
    DEALLOCATE PREPARE idx_stmt;

    SELECT table_schema, table_name, non_unique, index_schema, index_name, seq_in_index,
    column_name, collation, cardinality, index_type, comment, index_comment
    FROM information_schema.statistics
    WHERE table_schema = v_dbName
    AND table_name = v_tableName
    AND index_name = idxName;

    SELECT 'Insert record into mysql.cloudsql_replica_index' AS 'Step 2';
    INSERT INTO mysql.cloudsql_replica_index
      (db_name, table_name, index_name)
    VALUES
      (v_dbName, v_tableName, idxName);

    SELECT * FROM mysql.cloudsql_replica_index WHERE db_name = v_dbName AND table_name = v_tableName AND index_name = idxName;

    SET sql_log_bin = v_oldSqlLogBin;

   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cloudsql_create_audit_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE  PROCEDURE `cloudsql_create_audit_rule`( IN user VARCHAR(2048), IN db VARCHAR(2048), IN obj VARCHAR(2048), IN ops VARCHAR(2048), IN op_result CHAR(1) CHARACTER SET binary, IN reload_mode SMALLINT, OUT rc SMALLINT, OUT errormsg TEXT )
BEGIN DECLARE msg TEXT; DECLARE v_userdef VARCHAR(64); DECLARE v_hostdef VARCHAR(64); DECLARE new_rule_id BIGINT; DECLARE read_only_flag SMALLINT; DECLARE op_result_type_cnt TINYINT;  DECLARE read_only CONDITION FOR SQLSTATE 'AR994'; DECLARE invalid_reload_mode CONDITION FOR SQLSTATE 'AR995'; DECLARE empty_parameter CONDITION FOR SQLSTATE 'AR997'; DECLARE invalid_op_result CONDITION FOR SQLSTATE 'AR998';  DECLARE EXIT HANDLER FOR empty_parameter BEGIN SET errormsg = 'One or more rule attributes are empty'; SELECT errormsg AS ERROR; SET rc = 4; ROLLBACK; END;  DECLARE EXIT HANDLER FOR invalid_op_result BEGIN IF op_result_type_cnt = 2 THEN SET errormsg = "op_result should only be 'S'(successful), 'U'(unsuccessful), 'B'(both) or 'E' (exclude)"; ELSEIF op_result_type_cnt = 0 THEN SET errormsg = "op_result should only be 'S'(successful), 'U'(unsuccessful) or 'B'(both)"; ELSE SET errormsg = "One of the audit_log_rules tables has op_result column not set to CHAR(1)"; END IF; SELECT errormsg as ERROR; set rc = 9; ROLLBACK; END;  DECLARE EXIT HANDLER FOR invalid_reload_mode BEGIN SET errormsg = "reload_mode should only be 1 (reload audit rules) or 0 (DO NOT reload audit rules)"; SELECT errormsg as ERROR; set rc = 5; ROLLBACK; END;  DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN GET DIAGNOSTICS CONDITION 1 msg = MESSAGE_TEXT; SET errormsg = CONCAT('Unexpected error while creating the rule. The error returned by the server was: << ',msg,' >>'); SELECT errormsg AS ERROR; SET rc = 1; ROLLBACK; END;  DECLARE EXIT HANDLER FOR read_only BEGIN SET errormsg = "The MySQL server is running with the --read-only option so it cannot execute this statement"; SELECT errormsg as ERROR; set rc = 10; ROLLBACK; END;  IF user IS NULL OR LENGTH(TRIM(user)) = 0 OR db IS NULL OR LENGTH(TRIM(db)) = 0 OR obj IS NULL OR LENGTH(TRIM(obj)) = 0 OR ops IS NULL OR LENGTH(TRIM(ops)) = 0 OR op_result IS NULL OR LENGTH(LTRIM(op_result)) = 0 THEN SIGNAL SQLSTATE 'AR997'; END IF;  SELECT COUNT(*) INTO op_result_type_cnt FROM information_schema.columns WHERE table_schema = 'mysql' AND table_name LIKE 'audit_log_rules%' AND column_name = 'op_result' AND column_type = 'char(1)';  IF (op_result_type_cnt = 2 AND op_result NOT IN ('S', 'U', 'B', 'E')) OR (op_result_type_cnt = 0 AND op_result NOT IN ('S', 'U', 'B')) OR op_result_type_cnt NOT IN (0, 2) THEN SIGNAL SQLSTATE 'AR998'; END IF;  IF reload_mode IS NULL OR reload_mode NOT IN (0,1) THEN SIGNAL SQLSTATE 'AR995'; END IF;  select @@GLOBAL.read_only into read_only_flag; IF read_only_flag = 1 THEN SIGNAL SQLSTATE 'AR994'; END IF;  SET rc = 1;  CREATE TEMPORARY TABLE temp_rules SELECT * FROM audit_log_rules_expanded LIMIT 0;  START TRANSACTION;  INSERT INTO mysql.audit_log_rules (username,dbname,object,operation,op_result) VALUES (user,db,obj,ops,op_result);  SET new_rule_id = last_insert_id();  CALL mysql.cloudsql_create_canonical_rules(new_rule_id,user,db,obj,ops,op_result,rc,errormsg);  IF rc <> 0 THEN ROLLBACK; ELSE COMMIT; SET rc = 0; CALL mysql.cloudsql_reload_audit_rule(reload_mode); END IF;  DROP TEMPORARY TABLE IF EXISTS temp_rules; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cloudsql_create_canonical_rules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE  PROCEDURE `cloudsql_create_canonical_rules`( IN in_rule_id BIGINT, IN user VARCHAR(2048), IN db VARCHAR(2048), IN obj VARCHAR(2048), IN ops VARCHAR(2048), IN in_op_result CHAR(1) CHARACTER SET binary, OUT rc SMALLINT, OUT errormsg TEXT )
    SQL SECURITY INVOKER
BEGIN DECLARE msg TEXT; DECLARE found_rows INT; DECLARE user_strend INT; DECLARE db_strend INT; DECLARE obj_strend INT; DECLARE ops_strend INT; DECLARE val_strend INT; DECLARE crules_cnt INT DEFAULT 0; DECLARE ol_rule_id BIGINT; DECLARE user_pos INT DEFAULT 1; DECLARE db_pos INT DEFAULT 1; DECLARE obj_pos INT DEFAULT 1; DECLARE ops_pos INT DEFAULT 1; DECLARE val_pos INT DEFAULT 1; DECLARE v_userdef VARCHAR(64) DEFAULT ''; DECLARE v_hostdef VARCHAR(64) DEFAULT ''; DECLARE userstr VARCHAR(128); DECLARE dbstr VARCHAR(64); DECLARE objstr VARCHAR(64); DECLARE opstr VARCHAR(64); DECLARE val_str VARCHAR(64); DECLARE read_only_flag SMALLINT; DECLARE val_to_check VARCHAR(2048); DECLARE val_to_check1 VARCHAR(2048); DECLARE val VARCHAR(2048); DECLARE invalid_parameter VARCHAR(15); DECLARE loop_id INT DEFAULT 1; DECLARE t_id BIGINT DEFAULT 1; DECLARE op_result_type_cnt TINYINT;  DECLARE malformed_user CONDITION FOR SQLSTATE 'AR998'; DECLARE empty_parameter CONDITION FOR SQLSTATE 'AR997'; DECLARE invalid_op_name CONDITION FOR SQLSTATE 'AR996'; DECLARE invalid_op_result CONDITION FOR SQLSTATE 'AR995'; DECLARE read_only CONDITION FOR SQLSTATE 'AR994'; DECLARE invalid_backtick CONDITION FOR SQLSTATE 'AR993'; DECLARE invalid_wildcard CONDITION FOR SQLSTATE 'AR992'; DECLARE invalid_character CONDITION FOR SQLSTATE 'AR991';  DECLARE EXIT HANDLER FOR 1062 BEGIN GET DIAGNOSTICS CONDITION 1 msg = MESSAGE_TEXT;  SELECT rule_id INTO ol_rule_id FROM audit_log_rules_expanded WHERE (userdef,hostdef,dbname,object,operation,op_result) IN (SELECT userdef,hostdef,dbname,object,operation,op_result FROM temp_rules WHERE id = t_id);  IF ol_rule_id = in_rule_id THEN SET errormsg = CONCAT('One or more values for user, database, object or operation are duplicated'); SET rc = 6; ELSE SET errormsg = CONCAT('The audit rule provided overlaps with rule ',ol_rule_id); SET rc = 2; END IF; SELECT errormsg AS ERROR; END;  DECLARE EXIT HANDLER FOR invalid_op_name BEGIN SET errormsg = CONCAT('The operation "',opstr,'" is not supported or invalid'); SELECT errormsg AS ERROR; SET rc = 7; END;  DECLARE EXIT HANDLER FOR malformed_user BEGIN SET errormsg = 'Malformed user account provided. The account should include a host definition'; SELECT errormsg AS ERROR; SET rc = 5; END;  DECLARE EXIT HANDLER FOR empty_parameter BEGIN SET errormsg = 'One or more rule attributes are empty'; SELECT errormsg AS ERROR; SET rc = 4; END;  DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN GET DIAGNOSTICS CONDITION 1 msg = MESSAGE_TEXT; SET errormsg = CONCAT('Unexpected error while updating a rule. The error returned by the server was: << ',msg,' >>'); SELECT errormsg AS ERROR; SET rc = 1; END;  DECLARE EXIT HANDLER FOR invalid_op_result BEGIN IF op_result_type_cnt = 2 THEN SET errormsg = "op_result should only be 'S'(successful), 'U'(unsuccessful), 'B'(both) or 'E' (exclude)"; ELSEIF op_result_type_cnt = 0 THEN SET errormsg = "op_result should only be 'S'(successful), 'U'(unsuccessful) or 'B'(both)"; ELSE SET errormsg = "One of the audit_log_rules tables has op_result column not set to CHAR(1)"; END IF; SELECT errormsg as ERROR; set rc = 9; END;  DECLARE EXIT HANDLER FOR read_only BEGIN SET errormsg = "The MySQL server is running with the --read-only option so it cannot execute this statement"; SELECT errormsg as ERROR; set rc = 10; END;  DECLARE EXIT HANDLER FOR invalid_backtick BEGIN SET errormsg = CONCAT('Invalid value for "', invalid_parameter,'" is provided. Backticks are only supported as both prefix and suffix but not in between two chars'); SELECT errormsg AS ERROR; SET rc = 11; END;  DECLARE EXIT HANDLER FOR invalid_wildcard BEGIN SET errormsg = CONCAT('Invalid value for "', invalid_parameter,'" is provided. Wildcards are only supported as a prefix or suffix or both but not in between two chars'); SELECT errormsg AS ERROR; SET rc = 12; END;  DECLARE EXIT HANDLER FOR invalid_character BEGIN SET errormsg = CONCAT('Invalid value for "', invalid_parameter,'" is provided. Special characters are only supported between two backticks'); SELECT errormsg AS ERROR; SET rc = 13; END;  IF in_op_result IS NULL OR LENGTH(LTRIM(in_op_result)) = 0 THEN SIGNAL SQLSTATE 'AR995'; ELSE SELECT COUNT(*) INTO op_result_type_cnt FROM information_schema.columns WHERE table_schema = 'mysql' AND table_name LIKE 'audit_log_rules%' AND column_name = 'op_result' AND column_type = 'char(1)';  IF (op_result_type_cnt = 2 AND in_op_result NOT IN ('S', 'U', 'B', 'E')) OR (op_result_type_cnt = 0 AND in_op_result NOT IN ('S', 'U', 'B')) OR op_result_type_cnt NOT IN (0, 2) THEN SIGNAL SQLSTATE 'AR995'; END IF; END IF;  IF LENGTH(TRIM(user)) = 0 OR LENGTH(TRIM(db)) = 0 OR LENGTH(TRIM(obj)) = 0 OR LENGTH(TRIM(ops)) = 0 THEN SIGNAL SQLSTATE 'AR997'; END IF;  select @@GLOBAL.read_only into read_only_flag; IF read_only_flag = 1 THEN SIGNAL SQLSTATE 'AR994'; END IF;  SET rc = 1; SET user_strend = LOCATE(',',user, user_pos); SET db_strend = LOCATE(',',db, db_pos); SET obj_strend = LOCATE(',',obj, obj_pos); SET ops_strend = LOCATE(',',ops, ops_pos);  WHILE user_pos <= LENGTH(user) OR user_strend != 0 DO IF user_strend = 0 THEN SET user_strend = LENGTH(user) + 1; END IF; SET userstr = SUBSTR(user FROM user_pos FOR user_strend - user_pos); IF userstr = '*' THEN SET v_userdef = '*'; SET v_hostdef = '*'; END IF; WHILE db_pos <= LENGTH(db) OR db_strend != 0 DO IF db_strend = 0 THEN SET db_strend = LENGTH(db) + 1; END IF; WHILE obj_pos <= LENGTH(obj) OR obj_strend != 0 DO IF obj_strend = 0 THEN SET obj_strend = LENGTH(obj) + 1; END IF; WHILE ops_pos <= LENGTH(ops) OR ops_strend != 0 DO IF ops_strend = 0 THEN SET ops_strend = LENGTH(ops) + 1; END IF;  SET dbstr = TRIM(SUBSTR(db FROM db_pos FOR db_strend - db_pos)); SET objstr = TRIM(SUBSTR(obj FROM obj_pos FOR obj_strend - obj_pos)); SET opstr = LOWER(TRIM(SUBSTR(ops FROM ops_pos FOR ops_strend - ops_pos))); IF LENGTH(dbstr) = 0 OR LENGTH(objstr) = 0 OR LENGTH(opstr) = 0 THEN SIGNAL SQLSTATE 'AR997'; END IF;  SET loop_id = 1; SET val_to_check1 = ''; check_backtick_wildcard: LOOP CASE loop_id WHEN 1 THEN IF (LOCATE('@', userstr) > 0) THEN SET v_userdef = TRIM(SUBSTRING_INDEX(userstr,'@',1)); SET v_hostdef = LOWER(TRIM(SUBSTRING_INDEX(userstr,'@',-1))); ELSE SET v_userdef = userstr; END IF; IF LENGTH(v_userdef) = 0 OR STRCMP(v_userdef, '`') = 0 OR STRCMP(v_hostdef, '`') = 0 THEN SIGNAL SQLSTATE 'AR997'; END IF; SET val_to_check = v_userdef; SET val = user; SET val_strend = user_strend; SET invalid_parameter = 'user'; WHEN 2 THEN IF (LOCATE('@', userstr) > 0) THEN SET v_hostdef = LOWER(TRIM(SUBSTRING_INDEX(userstr,'@',-1))); ELSE SET v_hostdef = userstr; END IF; SET val_to_check = v_hostdef; SET val = user; SET val_strend = user_strend; SET invalid_parameter = 'host'; WHEN 3 THEN SET val_to_check = dbstr; SET val = db; SET val_strend = db_strend; SET invalid_parameter = 'db'; WHEN 4 THEN SET val_to_check = objstr; SET val = obj; SET val_strend = obj_strend; SET invalid_parameter = 'object'; END CASE;  IF (LOCATE('`', REVERSE(val_to_check)) = 1) THEN SET val_to_check1 = CONCAT(val_to_check1, val_to_check); SET val_to_check = val_to_check1; SET val_to_check1 = '';  CASE loop_id WHEN 1 THEN SET v_userdef = val_to_check; IF (LENGTH(v_hostdef) = 0) THEN SIGNAL SQLSTATE 'AR998'; END IF; WHEN 2 THEN SET v_hostdef = val_to_check; WHEN 3 THEN SET dbstr = val_to_check; WHEN 4 THEN SET objstr = val_to_check; END CASE; ELSE IF (LENGTH(val_to_check1) = 0 AND LOCATE('`', val_to_check) = 1) THEN SET val_to_check1 = CONCAT(val_to_check, ','); ELSE IF (LENGTH(val_to_check1) > 0) THEN SET val_to_check1 = CONCAT(val_to_check1, val_to_check, ','); END IF; END IF; IF (LENGTH(val_to_check1) > 0) THEN SET val_pos = val_strend + 1; SET val_strend = LOCATE(',', val, val_pos); IF val_strend = 0 THEN SET val_strend = LENGTH(val) + 1; END IF; SET val_str = TRIM(SUBSTR(val FROM val_pos FOR val_strend - val_pos));  IF (LENGTH(val_str) > 0) THEN CASE loop_id WHEN 1 THEN SET userstr = val_str; SET user_strend = val_strend; WHEN 2 THEN SET userstr = val_str; SET user_strend = val_strend; WHEN 3 THEN SET dbstr = val_str; SET db_strend = val_strend; WHEN 4 THEN SET objstr = val_str; SET obj_strend = val_strend; END CASE;  ITERATE check_backtick_wildcard; END IF; END IF; END IF;  IF (loop_id = 1 AND LENGTH(v_hostdef) = 0) THEN SIGNAL SQLSTATE 'AR998'; END IF; IF (LENGTH(val_to_check1) > 0) THEN SET val_to_check = val_to_check1; SET val_to_check1 = ''; END IF;  IF (LOCATE('``', val_to_check) = 1) THEN SIGNAL SQLSTATE 'AR993'; ELSEIF (LOCATE('`', val_to_check) = 1) THEN IF (LOCATE('`', val_to_check, 2) < LENGTH(val_to_check)) THEN SIGNAL SQLSTATE 'AR993'; END IF; ELSE IF (LOCATE('`', val_to_check, 2) > 1) THEN SIGNAL SQLSTATE 'AR993'; ELSE IF (loop_id = 2) THEN SET v_hostdef = REPLACE(v_hostdef, '%', '*'); SET val_to_check = v_hostdef; END IF; IF ((LOCATE('*', val_to_check) = 1) OR (LOCATE('*', val_to_check) = LENGTH(val_to_check))) THEN IF (LOCATE('*', val_to_check, 2) BETWEEN 2 and LENGTH(val_to_check)-1) THEN SIGNAL SQLSTATE 'AR992'; END IF; ELSEIF (LOCATE('*', val_to_check) BETWEEN 2 and LENGTH(val_to_check)-1) THEN SIGNAL SQLSTATE 'AR992'; END IF; IF (loop_id = 2) THEN IF (val_to_check REGEXP '[^A-Za-z0-9*.:-]') THEN SIGNAL SQLSTATE 'AR991'; END IF; ELSE IF (val_to_check REGEXP '[^A-Za-z0-9_*]') THEN SIGNAL SQLSTATE 'AR991'; END IF; END IF; END IF; END IF;  SET loop_id = loop_id + 1; IF loop_id < 5 THEN ITERATE check_backtick_wildcard; END IF;  LEAVE check_backtick_wildcard; END LOOP check_backtick_wildcard;  SELECT count(*) INTO found_rows FROM mysql.audit_log_supported_ops WHERE op_name = opstr; IF found_rows = 0 AND opstr <> "*" THEN SIGNAL SQLSTATE 'AR996'; END IF;  INSERT INTO temp_rules (id,rule_id,userdef,hostdef,dbname,object,operation,op_result,modified) VALUES (crules_cnt+1, in_rule_id, v_userdef, v_hostdef, dbstr, objstr, opstr, in_op_result, 1); SET crules_cnt = crules_cnt + 1; SET ops_pos = ops_strend + 1; SET ops_strend = LOCATE(',',ops, ops_pos); END WHILE; SET ops_pos = 1; SET ops_strend = LOCATE(',',ops, ops_pos); SET obj_pos = obj_strend + 1; SET obj_strend = LOCATE(',',obj, obj_pos); END WHILE; SET obj_pos = 1; SET obj_strend = LOCATE(',',obj, obj_pos); SET db_pos = db_strend + 1; SET db_strend = LOCATE(',',db, db_pos); END WHILE; SET db_pos = 1; SET db_strend = LOCATE(',',db, db_pos); SET user_pos = user_strend + 1; SET user_strend = LOCATE(',',user, user_pos); SET v_userdef = ''; SET v_hostdef = ''; END WHILE;  WHILE (t_id <= crules_cnt) DO INSERT INTO audit_log_rules_expanded (rule_id,userdef,hostdef,dbname,object,operation,op_result,modified) SELECT rule_id,userdef,hostdef,dbname,object,operation,op_result,modified FROM temp_rules WHERE id = t_id; SET t_id = t_id + 1; END WHILE;  SET rc = 0; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cloudsql_delete_audit_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE  PROCEDURE `cloudsql_delete_audit_rule`( IN rule_id_list VARCHAR(2048), IN reload_mode INT, OUT rc SMALLINT, OUT errormsg TEXT )
BEGIN DECLARE msg TEXT; DECLARE comma_pos INT; DECLARE hyphen_pos INT; DECLARE ruleid_start BIGINT; DECLARE ruleid_end BIGINT; DECLARE ruleid_pos INT DEFAULT 1; DECLARE rule_range VARCHAR(2048); DECLARE in_list VARCHAR(1000); DECLARE in_candidates INT DEFAULT 0; DECLARE range_candidates INT DEFAULT 0; DECLARE where_cond TEXT; DECLARE delete_stmt TEXT; DECLARE read_only_flag SMALLINT;  DECLARE empty_parameter CONDITION FOR SQLSTATE 'AR997'; DECLARE read_only CONDITION FOR SQLSTATE 'AR994'; DECLARE invalid_id CONDITION FOR SQLSTATE 'AR995'; DECLARE invalid_range CONDITION FOR SQLSTATE 'AR996';  DECLARE EXIT HANDLER FOR empty_parameter BEGIN SET errormsg = 'One or more rule attributes are empty'; SELECT errormsg AS ERROR; SET rc = 4; ROLLBACK; END;  DECLARE EXIT HANDLER FOR invalid_id BEGIN SET errormsg = 'Invalid ID is provided. The ID values must be numeric'; SELECT errormsg AS ERROR; SET rc = 5; ROLLBACK; END;  DECLARE EXIT HANDLER FOR invalid_range BEGIN SET errormsg = 'Invalid range is provided. From and To values must be provided'; SELECT errormsg AS ERROR; SET rc = 6; END;  DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN GET DIAGNOSTICS CONDITION 1 msg = MESSAGE_TEXT; SET errormsg = CONCAT('Unexpected error while deleting a rule. The error returned by the server was: << ',msg,' >>'); SELECT errormsg AS ERROR; SET rc = 1; ROLLBACK; END;  DECLARE EXIT HANDLER FOR read_only BEGIN SET errormsg = "The MySQL server is running with the --read-only option so it cannot execute this statement"; SELECT errormsg as ERROR; set rc = 10; ROLLBACK; END;  IF rule_id_list IS NULL OR LENGTH(TRIM(rule_id_list)) = 0 THEN SIGNAL SQLSTATE 'AR997'; END IF;  select @@GLOBAL.read_only into read_only_flag; IF read_only_flag = 1 THEN SIGNAL SQLSTATE 'AR994'; END IF;  SET rc = 1; SET comma_pos = LOCATE(',', rule_id_list, ruleid_pos); SET in_list = '('; SET where_cond = ' WHERE ';  START TRANSACTION; WHILE ruleid_pos <= LENGTH(rule_id_list) OR comma_pos != 0 DO IF comma_pos = 0 THEN SET comma_pos = LENGTH(rule_id_list)+1; END IF;  SET rule_range = SUBSTR(rule_id_list FROM ruleid_pos FOR comma_pos - ruleid_pos); SET hyphen_pos = LOCATE('-', rule_range, 1);  IF hyphen_pos > 0 THEN IF (SUBSTR(rule_range FROM 1 FOR hyphen_pos - 1) = '') OR (SUBSTR(rule_range FROM hyphen_pos + 1) = '') THEN SIGNAL SQLSTATE 'AR996'; END IF;  IF (SUBSTR(rule_range FROM 1 FOR hyphen_pos - 1) REGEXP '[^0-9]') OR (SUBSTR(rule_range FROM hyphen_pos + 1) REGEXP '[^0-9]') THEN SIGNAL SQLSTATE 'AR995'; END IF;  SET ruleid_start = SUBSTR(rule_range FROM 1 FOR hyphen_pos - 1); SET ruleid_end = SUBSTR(rule_range FROM hyphen_pos + 1);  IF range_candidates = 0 THEN SET where_cond = CONCAT(where_cond, 'id BETWEEN ', ruleid_start, ' AND ', ruleid_end); ELSE SET where_cond = CONCAT(where_cond, ' OR id BETWEEN ', ruleid_start, ' AND ', ruleid_end); END IF; SET range_candidates = range_candidates + 1; ELSE IF (rule_range REGEXP '[^0-9]') THEN SIGNAL SQLSTATE 'AR995'; END IF; SET ruleid_start = rule_range;  IF in_candidates = 0 THEN SET in_list = CONCAT(in_list, ruleid_start); ELSE SET in_list = CONCAT(in_list, ',', ruleid_start); END IF; SET in_candidates = in_candidates + 1; END IF;  SET ruleid_pos = comma_pos + 1; SET comma_pos = LOCATE(',', rule_id_list, ruleid_pos); END WHILE;  IF in_candidates > 0 THEN SET in_list = CONCAT(in_list, ')'); IF range_candidates > 0 THEN SET where_cond = CONCAT(where_cond, ' OR id IN ', in_list); ELSE SET where_cond = CONCAT(where_cond, 'id IN ', in_list); END IF; END IF;  SET delete_stmt = 'DELETE FROM mysql.audit_log_rules'; SET delete_stmt = CONCAT(delete_stmt, where_cond);  SET @prepare_stmt = delete_stmt; PREPARE stmt FROM @prepare_stmt; EXECUTE stmt;  SET delete_stmt = 'DELETE FROM mysql.audit_log_rules_expanded'; SET where_cond = REPLACE(where_cond, 'id', 'rule_id'); SET delete_stmt = CONCAT(delete_stmt, where_cond);  SET @prepare_stmt = delete_stmt; PREPARE stmt FROM @prepare_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;  COMMIT; SET rc = 0; CALL mysql.cloudsql_reload_audit_rule(reload_mode); END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cloudsql_list_audit_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE  PROCEDURE `cloudsql_list_audit_rule`( IN rule_id_list VARCHAR(2048), OUT rc SMALLINT, OUT errormsg TEXT )
BEGIN DECLARE msg TEXT; DECLARE comma_pos INT; DECLARE hyphen_pos INT; DECLARE ruleid_start BIGINT; DECLARE ruleid_end BIGINT; DECLARE ruleid_pos INT DEFAULT 1; DECLARE rule_range VARCHAR(2048); DECLARE in_list VARCHAR(1000); DECLARE in_candidates INT DEFAULT 0; DECLARE range_candidates INT DEFAULT 0; DECLARE where_cond TEXT; DECLARE select_stmt TEXT;  DECLARE empty_parameter CONDITION FOR SQLSTATE 'AR997'; DECLARE invalid_range CONDITION FOR SQLSTATE 'AR996'; DECLARE invalid_id CONDITION FOR SQLSTATE 'AR995';  DECLARE EXIT HANDLER FOR empty_parameter BEGIN SET errormsg = 'One or more rule attributes are empty'; SELECT errormsg AS ERROR; SET rc = 4; END;  DECLARE EXIT HANDLER FOR invalid_range BEGIN SET errormsg = 'Invalid range is provided. From and To values must be provided'; SELECT errormsg AS ERROR; SET rc = 5; END;  DECLARE EXIT HANDLER FOR invalid_id BEGIN SET errormsg = 'Invalid ID is provided. The ID values must be numeric'; SELECT errormsg AS ERROR; SET rc = 6; END;  DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN GET DIAGNOSTICS CONDITION 1 msg = MESSAGE_TEXT; SET errormsg = CONCAT('Unexpected error while reading the rule. The error returned by the server was: << ',msg,' >>'); SELECT errormsg AS ERROR; SET rc = 1; END;  IF rule_id_list IS NULL OR LENGTH(TRIM(rule_id_list)) = 0 THEN SIGNAL SQLSTATE 'AR997'; END IF;  SET rc = 1; SET comma_pos = LOCATE(',', rule_id_list, ruleid_pos); SET in_list = '('; SET where_cond = ' WHERE ';  while_loop: WHILE ruleid_pos <= LENGTH(rule_id_list) OR comma_pos != 0 DO IF comma_pos = 0 THEN SET comma_pos = LENGTH(rule_id_list)+1; END IF;  SET rule_range = SUBSTR(rule_id_list FROM ruleid_pos FOR comma_pos - ruleid_pos); IF rule_range = '*' THEN LEAVE while_loop; END IF; SET hyphen_pos = LOCATE('-', rule_range, 1);  IF hyphen_pos > 0 THEN IF (SUBSTR(rule_range FROM 1 FOR hyphen_pos - 1) = '') OR (SUBSTR(rule_range FROM hyphen_pos + 1) = '') THEN SIGNAL SQLSTATE 'AR996'; END IF;  IF (SUBSTR(rule_range FROM 1 FOR hyphen_pos - 1) REGEXP '[^0-9]') OR (SUBSTR(rule_range FROM hyphen_pos + 1) REGEXP '[^0-9]') THEN SIGNAL SQLSTATE 'AR995'; END IF;  SET ruleid_start = SUBSTR(rule_range FROM 1 FOR hyphen_pos - 1); SET ruleid_end = SUBSTR(rule_range FROM hyphen_pos + 1);  IF range_candidates = 0 THEN SET where_cond = CONCAT(where_cond, 'id BETWEEN ', ruleid_start, ' AND ', ruleid_end); ELSE SET where_cond = CONCAT(where_cond, ' OR id BETWEEN ', ruleid_start, ' AND ', ruleid_end); END IF; SET range_candidates = range_candidates + 1; ELSE IF (rule_range REGEXP '[^0-9]') THEN SIGNAL SQLSTATE 'AR995'; END IF; SET ruleid_start = rule_range;  IF in_candidates = 0 THEN SET in_list = CONCAT(in_list, ruleid_start); ELSE SET in_list = CONCAT(in_list, ',', ruleid_start); END IF; SET in_candidates = in_candidates + 1; END IF;  SET ruleid_pos = comma_pos + 1; SET comma_pos = LOCATE(',', rule_id_list, ruleid_pos); END WHILE while_loop;  IF in_candidates > 0 THEN SET in_list = CONCAT(in_list, ')'); IF range_candidates > 0 THEN SET where_cond = CONCAT(where_cond, ' OR id IN ', in_list); ELSE SET where_cond = CONCAT(where_cond, 'id IN ', in_list); END IF; END IF;  SET select_stmt = 'SELECT id, username, dbname, object, operation, op_result FROM mysql.audit_log_rules'; IF rule_range != '*' THEN SET select_stmt = CONCAT(select_stmt, where_cond); END IF;  SET @prepare_stmt = select_stmt; PREPARE stmt FROM @prepare_stmt; EXECUTE stmt; DEALLOCATE PREPARE stmt;  SET rc = 0; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cloudsql_reload_audit_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE  PROCEDURE `cloudsql_reload_audit_rule`(IN mode INT)
BEGIN SELECT plugin_status INTO @status FROM information_schema.plugins WHERE plugin_name = 'cloudsql_mysql_audit'; IF @status = 'ACTIVE' AND mode <> 0 THEN SET @mode = mode; PREPARE stmt FROM 'SET GLOBAL cloudsql_mysql_audit_rules_reload=?'; EXECUTE stmt USING @mode; END IF; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cloudsql_update_audit_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
DELIMITER ;;
CREATE  PROCEDURE `cloudsql_update_audit_rule`( IN in_rule_id bigint, IN user VARCHAR(2048), IN db VARCHAR(2048), IN obj VARCHAR(2048), IN ops VARCHAR(2048), IN in_op_result CHAR(1) CHARACTER SET binary, IN reload_mode SMALLINT, OUT rc SMALLINT, OUT errormsg TEXT )
BEGIN DECLARE msg TEXT; DECLARE found_rows INT; DECLARE new_rule_id BIGINT; DECLARE ol_rule_id BIGINT; DECLARE v_userdef VARCHAR(64); DECLARE v_hostdef VARCHAR(64); DECLARE read_only_flag SMALLINT; DECLARE cur_user_list VARCHAR(2048); DECLARE cur_db_list VARCHAR(2048); DECLARE cur_obj_list VARCHAR(2048); DECLARE cur_ops_list VARCHAR(2048); DECLARE cur_opres CHAR(1) CHARACTER SET binary; DECLARE op_result_type_cnt TINYINT;  DECLARE invalid_op_result CONDITION FOR SQLSTATE 'AR998'; DECLARE empty_parameter CONDITION FOR SQLSTATE 'AR997'; DECLARE invalid_reload_mode CONDITION FOR SQLSTATE 'AR996'; DECLARE rule_not_found CONDITION FOR SQLSTATE 'AR995'; DECLARE read_only CONDITION FOR SQLSTATE 'AR994';  DECLARE EXIT HANDLER FOR invalid_op_result BEGIN IF op_result_type_cnt = 2 THEN SET errormsg = "op_result should only be 'S'(successful), 'U'(unsuccessful), 'B'(both) or 'E' (exclude)"; ELSEIF op_result_type_cnt = 0 THEN SET errormsg = "op_result should only be 'S'(successful), 'U'(unsuccessful) or 'B'(both)"; ELSE SET errormsg = "One of the audit_log_rules tables has op_result column not set to CHAR(1)"; END IF; SELECT errormsg as ERROR; set rc = 9; ROLLBACK; END;  DECLARE EXIT HANDLER FOR invalid_reload_mode BEGIN SET errormsg = "reload_mode should only be 1 (reload audit rules) or 0 (DO NOT reload audit rules)"; SELECT errormsg as ERROR; set rc = 5; ROLLBACK; END;  DECLARE EXIT HANDLER FOR empty_parameter BEGIN SET errormsg = 'One or more rule attributes are empty. To keep the existing value specify NULL instead'; SELECT errormsg AS ERROR; SET rc = 4; ROLLBACK; END;  DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN GET DIAGNOSTICS CONDITION 1 msg = MESSAGE_TEXT; SET errormsg = concat('Unexpected error while updating a rule. The error returned by the server was: << ',msg,' >>'); SELECT errormsg AS ERROR; SET rc = 1; ROLLBACK; END;  DECLARE EXIT HANDLER FOR rule_not_found BEGIN SET errormsg = 'The rule id provided was not found'; SELECT errormsg AS ERROR; SET rc = 8; ROLLBACK; END;  DECLARE EXIT HANDLER FOR read_only BEGIN SET errormsg = "The MySQL server is running with the --read-only option so it cannot execute this statement"; SELECT errormsg as ERROR; set rc = 10; ROLLBACK; END;  IF LENGTH(trim(user)) = 0 OR LENGTH(trim(db)) = 0 OR LENGTH(trim(obj)) = 0 OR LENGTH(trim(ops)) = 0 OR LENGTH(LTRIM(in_op_result)) = 0 THEN SIGNAL SQLSTATE 'AR997'; END IF;  SELECT COUNT(*) INTO op_result_type_cnt FROM information_schema.columns WHERE table_schema = 'mysql' AND table_name LIKE 'audit_log_rules%' AND column_name = 'op_result' AND column_type = 'char(1)';  IF (op_result_type_cnt = 2 AND in_op_result NOT IN ('S', 'U', 'B', 'E')) OR (op_result_type_cnt = 0 AND in_op_result NOT IN ('S', 'U', 'B')) OR op_result_type_cnt NOT IN (0, 2) THEN SIGNAL SQLSTATE 'AR998'; END IF;  IF reload_mode IS NULL OR reload_mode NOT IN (0,1) THEN SIGNAL SQLSTATE 'AR996'; END IF;  select @@GLOBAL.read_only into read_only_flag; IF read_only_flag = 1 THEN SIGNAL SQLSTATE 'AR994'; END IF;  SET rc = 1;  CREATE TEMPORARY TABLE temp_rules SELECT * FROM audit_log_rules_expanded LIMIT 0;  START TRANSACTION;  SELECT count(*) INTO found_rows FROM mysql.audit_log_rules WHERE id = in_rule_id; IF found_rows = 0 THEN SIGNAL SQLSTATE 'AR995'; END IF;  SELECT username,dbname,object,operation,op_result INTO cur_user_list,cur_db_list,cur_obj_list,cur_ops_list,cur_opres FROM mysql.audit_log_rules WHERE id = in_rule_id;  DELETE FROM mysql.audit_log_rules_expanded WHERE rule_id = in_rule_id;  UPDATE mysql.audit_log_rules SET username = IFNULL(user,username), dbname = IFNULL(db,dbname), object = IFNULL(obj,object), operation = IFNULL(ops,operation), op_result = IFNULL(in_op_result,op_result) WHERE id = in_rule_id;  SET new_rule_id = in_rule_id;  IF(user IS NULL) THEN SET user = cur_user_list; END IF; IF(db IS NULL) THEN SET db = cur_db_list; END IF; IF(obj IS NULL) THEN SET obj = cur_obj_list; END IF; IF(ops IS NULL) THEN SET ops = cur_ops_list; END IF; IF(in_op_result IS NULL) THEN SET in_op_result = cur_opres; END IF;  CALL mysql.cloudsql_create_canonical_rules(new_rule_id,user,db,obj,ops,in_op_result,rc,errormsg);  IF rc <> 0 THEN ROLLBACK; ELSE COMMIT; SET rc = 0; CALL mysql.cloudsql_reload_audit_rule(reload_mode); END IF;  DROP TEMPORARY TABLE IF EXISTS temp_rules; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dropSecondaryIdxOnReplica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE  PROCEDURE `dropSecondaryIdxOnReplica`(IN
    idxName VARCHAR(100),
    tableName VARCHAR(100),
    idxOption VARCHAR(255)
    )
BEGIN

    DECLARE v_oldSqlLogBin INT;
    DECLARE v_dbName VARCHAR(64) DEFAULT NULL;
    DECLARE v_tableName VARCHAR(64) DEFAULT NULL;
    DECLARE v_removeIdx INT DEFAULT 0;

    DECLARE exit HANDLER FOR SQLEXCEPTION, SQLSTATE '45000'
    BEGIN
        SET sql_log_bin = v_oldSqlLogBin;
        RESIGNAL;
    END;

    SET v_oldSqlLogBin = (SELECT @@sql_log_bin);
    SET sql_log_bin = 0;

    IF LOCATE('.', tableName) > 0 THEN
      SET v_dbName = SUBSTRING_INDEX(tableName, '.', 1);
      SET v_tableName = SUBSTRING_INDEX(tableName, '.', -1);
    ELSE
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Please provide database name along with table name: db.table';
    END IF;

    SELECT 'Delete record from mysql.cloudsql_replica_index' AS 'Step 1';
    DELETE FROM mysql.cloudsql_replica_index
    WHERE db_name = v_dbName
    AND table_name = v_tableName
    AND index_name = idxName;

    SELECT ROW_COUNT() INTO v_removeIdx;
    IF v_removeIdx = 0 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Failed to find the index in mysql.cloudsql_replica_index table. The index is not dropped.';
    END IF;

    SET @dropSecondaryIdx_sql = CONCAT('DROP INDEX ', idxName, ' ON ', v_dbName, '.', v_tableName, ' ', idxOption);
    SELECT @dropSecondaryIdx_sql  AS 'Step 2';
    PREPARE drop_idx_stmt FROM @dropSecondaryIdx_sql;
    EXECUTE drop_idx_stmt;
    DEALLOCATE PREPARE drop_idx_stmt;

    SET sql_log_bin = v_oldSqlLogBin;

   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-24 14:08:08
