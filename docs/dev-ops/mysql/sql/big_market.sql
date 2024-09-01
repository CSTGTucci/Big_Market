/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:13306
 Source Schema         : big_market

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 01/09/2024 19:17:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for award
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `award_id` int NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
  `award_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品对接标识 - 每一个都是一个对应的发奖策略',
  `award_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品配置信息',
  `award_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品内容描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES (1, 101, 'user_credit_random', '1,100', '用户积分【优先透彻规则范围，如果没有则走配置】', '2023-12-09 11:07:06', '2023-12-09 11:21:31');
INSERT INTO `award` VALUES (2, 102, 'openai_use_count', '5', 'OpenAI 增加使用次数', '2023-12-09 11:07:06', '2023-12-09 11:12:59');
INSERT INTO `award` VALUES (3, 103, 'openai_use_count', '10', 'OpenAI 增加使用次数', '2023-12-09 11:07:06', '2023-12-09 11:12:59');
INSERT INTO `award` VALUES (4, 104, 'openai_use_count', '20', 'OpenAI 增加使用次数', '2023-12-09 11:07:06', '2023-12-09 11:12:58');
INSERT INTO `award` VALUES (5, 105, 'openai_model', 'gpt-4', 'OpenAI 增加模型', '2023-12-09 11:07:06', '2023-12-09 11:12:01');
INSERT INTO `award` VALUES (6, 106, 'openai_model', 'dall-e-2', 'OpenAI 增加模型', '2023-12-09 11:07:06', '2023-12-09 11:12:08');
INSERT INTO `award` VALUES (7, 107, 'openai_model', 'dall-e-3', 'OpenAI 增加模型', '2023-12-09 11:07:06', '2023-12-09 11:12:10');
INSERT INTO `award` VALUES (9, 108, 'openai_model', 'gpt-4,dall-e-2,dall-e-3', 'OpenAI 增加模型', '2023-12-09 11:07:06', '2024-08-30 10:29:01');
INSERT INTO `award` VALUES (10, 100, 'blacklist_award', '1', '黑名单奖励', '2024-09-01 16:37:51', '2024-09-01 16:37:51');

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `strategy_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖策略描述',
  `rule_models` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抽奖规则模型',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of strategy
-- ----------------------------
INSERT INTO `strategy` VALUES (3, 10001, '抽奖策略A', 'rule_weight,rule_blacklist', '2024-08-30 09:02:26', '2024-08-31 14:55:14');
INSERT INTO `strategy` VALUES (4, 10003, '抽奖策略lock测试', '', '2024-09-01 16:44:32', '2024-09-01 18:52:52');

-- ----------------------------
-- Table structure for strategy_award
-- ----------------------------
DROP TABLE IF EXISTS `strategy_award`;
CREATE TABLE `strategy_award`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `award_id` int NOT NULL COMMENT '抽奖奖品ID',
  `award_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖奖品标题',
  `award_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抽奖奖品副标题',
  `award_count` int NOT NULL DEFAULT 0 COMMENT '奖品库存总量',
  `award_count_surplus` int NOT NULL DEFAULT 0 COMMENT '奖品库存剩余',
  `award_rate` decimal(4, 2) NOT NULL COMMENT '奖品中间概率',
  `rule_models` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则模型，rule配置规则记录',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of strategy_award
-- ----------------------------
INSERT INTO `strategy_award` VALUES (1, 10001, 101, '随机积分', NULL, 80000, 80000, 70.00, 'rule_radom', 1, '2024-08-30 09:09:24', '2024-08-31 14:31:22');
INSERT INTO `strategy_award` VALUES (4, 10001, 102, '20次使用', '', 4000, 4000, 15.00, 'rule_lucky_award', 2, '2024-08-30 09:15:12', '2024-09-01 16:38:44');
INSERT INTO `strategy_award` VALUES (5, 10001, 103, '增加gpt-4模型', '抽奖2次后解锁', 600, 600, 10.00, 'rule_weight', 3, '2024-08-30 09:15:47', '2024-09-01 16:38:57');
INSERT INTO `strategy_award` VALUES (7, 10001, 104, '增加dall-e-3模型', '抽奖6次后解锁', 199, 199, 2.00, 'rule_weight', 4, '2024-08-30 09:17:00', '2024-09-01 16:38:59');
INSERT INTO `strategy_award` VALUES (8, 10001, 105, '全部模型', '抽奖7次后解锁', 1, 1, 3.00, 'rule_weight', 5, '2024-08-30 09:17:20', '2024-09-01 16:39:01');
INSERT INTO `strategy_award` VALUES (9, 10002, 109, '廉价模型', NULL, 10000, 10000, 70.00, NULL, 1, '2024-08-31 09:45:19', '2024-08-31 09:46:23');
INSERT INTO `strategy_award` VALUES (10, 10002, 110, '还行的模型', NULL, 5000, 5000, 20.00, NULL, 2, '2024-08-31 09:45:42', '2024-08-31 09:46:28');
INSERT INTO `strategy_award` VALUES (11, 10002, 111, '好模型', NULL, 10, 10, 10.00, NULL, 3, '2024-08-31 09:46:10', '2024-08-31 09:46:32');
INSERT INTO `strategy_award` VALUES (12, 10003, 112, '黑奖品', '抽奖2次后解锁', 100, 100, 50.00, 'rule_lock', 1, '2024-09-01 16:45:26', '2024-09-01 16:45:26');
INSERT INTO `strategy_award` VALUES (13, 10003, 113, '白奖品', '抽奖3次后解锁', 100, 100, 25.00, 'rule_lock', 0, '2024-09-01 16:46:02', '2024-09-01 16:46:02');
INSERT INTO `strategy_award` VALUES (14, 10003, 114, '黄奖品', '抽奖6次后解锁', 50, 50, 25.00, 'rule_lock', 0, '2024-09-01 16:48:06', '2024-09-01 16:48:06');

-- ----------------------------
-- Table structure for strategy_rule
-- ----------------------------
DROP TABLE IF EXISTS `strategy_rule`;
CREATE TABLE `strategy_rule`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` int NOT NULL COMMENT '抽奖策略ID',
  `award_id` int NULL DEFAULT NULL COMMENT '抽奖奖品ID',
  `rule_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '抽奖规则类型【抽奖策略，奖品规则】',
  `rule_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则类型',
  `rule_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则比值',
  `rule_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of strategy_rule
-- ----------------------------
INSERT INTO `strategy_rule` VALUES (1, 10001, 101, 2, 'rule_random', '1,1000', '随机积分策略', '2024-08-30 09:20:08', '2024-08-30 15:23:49');
INSERT INTO `strategy_rule` VALUES (2, 10001, 102, 2, 'rule_lucky_award', '1000', '抽奖次数兜底', '2024-08-30 09:27:01', '2024-08-31 14:54:49');
INSERT INTO `strategy_rule` VALUES (3, 10001, 103, 2, 'rule_lock', '2', '抽奖2次后解锁', '2024-08-30 09:27:28', '2024-08-31 14:32:47');
INSERT INTO `strategy_rule` VALUES (4, 10001, 104, 2, 'rule_lock', '6', '抽奖6次后解锁', '2024-08-30 09:27:57', '2024-08-31 14:32:49');
INSERT INTO `strategy_rule` VALUES (5, 10001, 105, 2, 'rule_lock', '7', '抽奖7次后解锁', '2024-08-30 09:29:46', '2024-08-31 14:54:42');
INSERT INTO `strategy_rule` VALUES (6, 10001, NULL, 1, 'rule_weight', '6000:101,102,103,104,105 4000:101,102', '', '2024-08-30 09:32:29', '2024-09-01 16:41:18');
INSERT INTO `strategy_rule` VALUES (7, 10001, NULL, 1, 'rule_blacklist', '100:user001,user002', '黑名单', '2024-08-30 09:34:28', '2024-09-01 16:36:42');
INSERT INTO `strategy_rule` VALUES (8, 10003, 112, 2, 'rule_lock', '2', '2次解锁', '2024-09-01 18:38:39', '2024-09-01 18:39:47');
INSERT INTO `strategy_rule` VALUES (9, 10003, 113, 2, 'rule_lock', '3', '3次解锁', '2024-09-01 18:39:04', '2024-09-01 18:39:04');
INSERT INTO `strategy_rule` VALUES (10, 10003, 114, 2, 'rule_lock', '6', '6次解锁', '2024-09-01 18:39:29', '2024-09-01 18:39:29');

-- ----------------------------
-- Triggers structure for table strategy
-- ----------------------------
DROP TRIGGER IF EXISTS `c_time`;
delimiter ;;
CREATE TRIGGER `c_time` BEFORE INSERT ON `strategy` FOR EACH ROW BEGIN
	IF NEW.create_time is NULL THEN
		set NEW.create_time = NOW();
		set NEW.update_time = NOW();
	End if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table strategy_award
-- ----------------------------
DROP TRIGGER IF EXISTS `ctime`;
delimiter ;;
CREATE TRIGGER `ctime` BEFORE INSERT ON `strategy_award` FOR EACH ROW BEGIN
	IF NEW.create_time is NULL THEN
		set NEW.create_time = NOW();
		set NEW.update_time = NOW();
	End if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table strategy_rule
-- ----------------------------
DROP TRIGGER IF EXISTS `ctime_rule`;
delimiter ;;
CREATE TRIGGER `ctime_rule` BEFORE INSERT ON `strategy_rule` FOR EACH ROW BEGIN
	IF NEW.create_time is NULL THEN
		set NEW.create_time = NOW();
		set NEW.update_time = NOW();
	End if;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
