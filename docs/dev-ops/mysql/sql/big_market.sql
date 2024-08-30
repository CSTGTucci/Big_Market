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

 Date: 30/08/2024 10:29:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE database if NOT EXISTS `big_market` default character set utf8mb4 collate utf8mb4_0900_ai_ci;
use `big_market`;
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `strategy_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖策略描述',
  `rule_models` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抽奖规则模型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy
-- ----------------------------
INSERT INTO `strategy` VALUES (3, 10001, '抽奖策略A', NULL, '2024-08-30 09:02:26', '2024-08-30 09:08:17');

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
  `award_count` int NOT NULL COMMENT '奖品库存总量',
  `award_count_surplus` int NOT NULL COMMENT '奖品库存剩余',
  `award_rate` decimal(6, 4) NOT NULL COMMENT '奖品中间概率',
  `rule_models` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则模型，rule配置规则记录',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy_award
-- ----------------------------
INSERT INTO `strategy_award` VALUES (1, 10001, 101, '随机积分', NULL, 80000, 80000, 80.0000, 'rule_radom', 1, '2024-08-30 09:09:24', '2024-08-30 09:24:19');
INSERT INTO `strategy_award` VALUES (2, 10001, 102, '5次使用', NULL, 10000, 10000, 10.0000, NULL, 2, '2024-08-30 09:10:24', '2024-08-30 09:14:33');
INSERT INTO `strategy_award` VALUES (3, 10001, 103, '10次使用', NULL, 5000, 5000, 5.0000, NULL, 3, '2024-08-30 09:14:26', '2024-08-30 09:14:26');
INSERT INTO `strategy_award` VALUES (4, 10001, 104, '20次使用', NULL, 4000, 4000, 4.0000, NULL, 4, '2024-08-30 09:15:12', '2024-08-30 09:15:12');
INSERT INTO `strategy_award` VALUES (5, 10001, 105, '增加gpt-4模型', NULL, 600, 600, 0.6000, NULL, 5, '2024-08-30 09:15:47', '2024-08-30 09:15:47');
INSERT INTO `strategy_award` VALUES (6, 10001, 106, '增加dall-e-2模型', '抽奖1次后解锁', 200, 200, 0.2000, 'rule_lock', 6, '2024-08-30 09:16:19', '2024-08-30 09:29:56');
INSERT INTO `strategy_award` VALUES (7, 10001, 107, '增加dall-e-3模型', '抽奖2次后解锁', 199, 199, 0.1999, 'rule_lock,rule_lucky_award', 7, '2024-08-30 09:17:00', '2024-08-30 09:37:04');
INSERT INTO `strategy_award` VALUES (8, 10001, 108, '全部模型', '抽奖6次后解锁', 1, 1, 0.0001, 'rule_lock', 8, '2024-08-30 09:17:20', '2024-08-30 09:29:58');

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
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy_rule
-- ----------------------------
INSERT INTO `strategy_rule` VALUES (1, 10001, 101, 2, 'rule_random', '1,1000', '随即积分策略', '2024-08-30 09:20:08', '2024-08-30 09:20:08');
INSERT INTO `strategy_rule` VALUES (2, 10001, 106, 2, 'rule_lock', '1', '抽奖1次后解锁', '2024-08-30 09:27:01', '2024-08-30 09:27:01');
INSERT INTO `strategy_rule` VALUES (3, 10001, 107, 2, 'rule_lock', '2', '抽奖2次后解锁', '2024-08-30 09:27:28', '2024-08-30 09:27:28');
INSERT INTO `strategy_rule` VALUES (4, 10001, 108, 2, 'rule_lock', '6', '抽奖6次后解锁', '2024-08-30 09:27:57', '2024-08-30 09:27:57');
INSERT INTO `strategy_rule` VALUES (5, 10001, 107, 2, 'rule_lucky_award', '1,100', '随机积分兜底', '2024-08-30 09:29:46', '2024-08-30 09:29:46');
INSERT INTO `strategy_rule` VALUES (6, 10001, NULL, 1, 'rule_weight', '6000:102,103,104,105,106,107,108', '抽奖次数兜底', '2024-08-30 09:32:29', '2024-08-30 09:32:29');
INSERT INTO `strategy_rule` VALUES (7, 10001, NULL, 1, 'rule_blacklist', '1', '黑名单', '2024-08-30 09:34:28', '2024-08-30 09:34:28');

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
