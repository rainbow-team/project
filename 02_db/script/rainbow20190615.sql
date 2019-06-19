/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : rainbow

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 14/06/2019 19:49:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for check_activity
-- ----------------------------
DROP TABLE IF EXISTS `check_activity`;
CREATE TABLE `check_activity`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键',
  `equip_depart_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称(外键)，来源于核安全设备单位信息\r\n\r\n参考表：unit_equip_depart',
  `fac_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '军工核设施名称,外键\r\n\r\n参考表:unit_fac',
  `check_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审查内容',
  `activity_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核活动类型外键\r\n\r\n参考表：config_activity_type',
  `check_date` date NULL DEFAULT NULL COMMENT '审评时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核活动及其他审评信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_activity_file
-- ----------------------------
DROP TABLE IF EXISTS `check_activity_file`;
CREATE TABLE `check_activity_file`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，用来在file_info中查找具体文件',
  `check_activity_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核活动及其他审评信息外键id，参考表:check_activity',
  `file_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `activity_check_file_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核活动及其他审评信息文件类型，参考表:config_activity_file_type',
  `file_date` date NULL DEFAULT NULL COMMENT '文件时间',
  `file_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件文号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设备审评阶段文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_equip
-- ----------------------------
DROP TABLE IF EXISTS `check_equip`;
CREATE TABLE `check_equip`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `equip_depart_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称(外键)，来源于核安全设备单位信息\r\n\r\n参考表：unit_equip_depart',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键\r\n\r\n参考表：unit_service',
  `fac_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施名称,外键\r\n\r\n参考表:unit_fac',
  `equip_type_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备类别，外键\r\n\r\n参考表：config_equip_type',
  `equip_level_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备核安全级别，外键\r\n\r\n参考表：config_equip_level',
  `equip_check_stage_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备评审阶段，外键\r\n\r\n外键：config_equip_check_stage',
  `check_date` date NULL DEFAULT NULL COMMENT '审评时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全设备审评信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_equip_file
-- ----------------------------
DROP TABLE IF EXISTS `check_equip_file`;
CREATE TABLE `check_equip_file`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，用来在file_info中查找具体文件',
  `check_equip_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设备审评信息外键id，参考表:check_equip',
  `file_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `equip_check_file_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设备审评文件类型，\r\n参考表:config_fac_check_file_type',
  `file_date` date NULL DEFAULT NULL COMMENT '文件时间',
  `file_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件文号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设备审评阶段文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_fac
-- ----------------------------
DROP TABLE IF EXISTS `check_fac`;
CREATE TABLE `check_fac`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `servive_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键\r\n\r\n参考表:unit_service',
  `fac_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施名称,外键\r\n参考表：unit_umine_fac\r\n',
  `type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施审评类型，外键\r\n\r\n参考表：config_fac_check_type',
  `stage_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审评阶段的外键id，\r\n参考表:config_fac_check_stage',
  `check_date` date NULL DEFAULT NULL COMMENT '审评时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施审评信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_fac_file
-- ----------------------------
DROP TABLE IF EXISTS `check_fac_file`;
CREATE TABLE `check_fac_file`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，用来在file_info中查找具体文件',
  `check_fac_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施审评信息外键id，参考表:check_fac',
  `file_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `fac_check_file_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施审评文件类型，\r\n参考表:config_fac_check_file_type',
  `file_date` date NULL DEFAULT NULL COMMENT '文件时间',
  `file_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件文号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施审评阶段文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_umine_mountain
-- ----------------------------
DROP TABLE IF EXISTS `check_umine_mountain`;
CREATE TABLE `check_umine_mountain`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿冶单位信息，外键\r\n\r\n参考表unit_umine',
  `umine_mountain_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山信息，外键\r\n\r\n参考表：umine_mountain',
  `check_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审查内容',
  `check_date` date NULL DEFAULT NULL COMMENT '审查时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀矿山井下消防审查信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_umine_mountain_file
-- ----------------------------
DROP TABLE IF EXISTS `check_umine_mountain_file`;
CREATE TABLE `check_umine_mountain_file`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，用来在file_info中查找具体文件',
  `check_umine_mountain_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山井下消防审评信息外键id，参考表:check_umine_mountain',
  `file_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `check_file_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山井下消防审查文件类型，\r\n参考表:config_umine_mountain_check_file_type',
  `file_date` date NULL DEFAULT NULL COMMENT '文件时间',
  `file_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件文号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀矿山井下消防审查-评审文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_umine_place
-- ----------------------------
DROP TABLE IF EXISTS `check_umine_place`;
CREATE TABLE `check_umine_place`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿冶单位信息，外键\r\n\r\n参考表：unit_umine',
  `umine_place_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库信息，外键\r\n\r\n参考表：unit_umine_place',
  `check_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库审评类型外键\r\n\r\n参考表：config_umine_place_check_type',
  `check_stage_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库审评阶段,外键\r\n\r\n参考表：config_umine_place_check_stage',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库审评信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for check_umine_place_file
-- ----------------------------
DROP TABLE IF EXISTS `check_umine_place_file`;
CREATE TABLE `check_umine_place_file`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，用来在file_info中查找具体文件',
  `check_umine_place_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库评信息外键id，参考表:check_umine_place',
  `file_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `check_file_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设施/设备/铀尾矿(渣)库审评文件类型，\r\n参考表:config_fac_check_file_type',
  `file_date` date NULL DEFAULT NULL COMMENT '文件时间',
  `file_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件文号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库审评信息文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_accident_nature
-- ----------------------------
DROP TABLE IF EXISTS `config_accident_nature`;
CREATE TABLE `config_accident_nature`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事故事件性质的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '事故事件性质表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_accident_type
-- ----------------------------
DROP TABLE IF EXISTS `config_accident_type`;
CREATE TABLE `config_accident_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事故事件类别的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '事故事件类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_activity_check_file_type
-- ----------------------------
DROP TABLE IF EXISTS `config_activity_check_file_type`;
CREATE TABLE `config_activity_check_file_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核活动及其他审评信息文件类型值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核活动及其他审评信息文件类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_activity_type
-- ----------------------------
DROP TABLE IF EXISTS `config_activity_type`;
CREATE TABLE `config_activity_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核活动类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核活动类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_check_level
-- ----------------------------
DROP TABLE IF EXISTS `config_check_level`;
CREATE TABLE `config_check_level`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无损检验等级的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '无损检验等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_check_method
-- ----------------------------
DROP TABLE IF EXISTS `config_check_method`;
CREATE TABLE `config_check_method`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无损检验方法的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '无损检验方法' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_degree
-- ----------------------------
DROP TABLE IF EXISTS `config_degree`;
CREATE TABLE `config_degree`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学位的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_education
-- ----------------------------
DROP TABLE IF EXISTS `config_education`;
CREATE TABLE `config_education`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学历' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_equip_check_stage
-- ----------------------------
DROP TABLE IF EXISTS `config_equip_check_stage`;
CREATE TABLE `config_equip_check_stage`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备评审阶段的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全设备评审阶段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_equip_level
-- ----------------------------
DROP TABLE IF EXISTS `config_equip_level`;
CREATE TABLE `config_equip_level`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备核安全级别的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备核安全级别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_equip_permit_stage
-- ----------------------------
DROP TABLE IF EXISTS `config_equip_permit_stage`;
CREATE TABLE `config_equip_permit_stage`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备许可阶段的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全设备许可阶段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_equip_security_question_type
-- ----------------------------
DROP TABLE IF EXISTS `config_equip_security_question_type`;
CREATE TABLE `config_equip_security_question_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备安全问题类别的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备安全问题类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_equip_type
-- ----------------------------
DROP TABLE IF EXISTS `config_equip_type`;
CREATE TABLE `config_equip_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备类别的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全设备类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_check_file_type
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_check_file_type`;
CREATE TABLE `config_fac_check_file_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设施/设备/铀尾矿(渣)库审评文件类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设施/设备/铀尾矿(渣)库审评文件类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_check_stage
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_check_stage`;
CREATE TABLE `config_fac_check_stage`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施审评阶段的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施审评阶段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_check_type
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_check_type`;
CREATE TABLE `config_fac_check_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施审评类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施审评类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_permit_situation
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_permit_situation`;
CREATE TABLE `config_fac_permit_situation`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可情况的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施的许可情况' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_periodical_report_type
-- ----------------------------
DROP TABLE IF EXISTS `config_periodical_report_type`;
CREATE TABLE `config_periodical_report_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施定期报告类别的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施定期报告类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_permit_stage
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_permit_stage`;
CREATE TABLE `config_fac_permit_stage`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施许可阶段的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施许可阶段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_security_question_nature
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_security_question_nature`;
CREATE TABLE `config_fac_security_question_nature`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施安全问题性质的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施安全问题性质表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_security_question_type
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_security_question_type`;
CREATE TABLE `config_fac_security_question_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施安全问题类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施安全问题类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_status
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_status`;
CREATE TABLE `config_fac_status`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施监管状态的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_supervison_category
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_supervison_category`;
CREATE TABLE `config_fac_supervison_category`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施监管类别的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施监管类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_fac_type
-- ----------------------------
DROP TABLE IF EXISTS `config_fac_type`;
CREATE TABLE `config_fac_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_monitor_check_file_type
-- ----------------------------
DROP TABLE IF EXISTS `config_monitor_check_file_type`;
CREATE TABLE `config_monitor_check_file_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督检查文件类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监督检查文件类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_monitor_check_type
-- ----------------------------
DROP TABLE IF EXISTS `config_monitor_check_type`;
CREATE TABLE `config_monitor_check_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督检查类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监督检查类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_monitor_daily_file_type
-- ----------------------------
DROP TABLE IF EXISTS `config_monitor_daily_file_type`;
CREATE TABLE `config_monitor_daily_file_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日常监督文件类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日常监督文件类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_monitor_report_type
-- ----------------------------
DROP TABLE IF EXISTS `config_monitor_report_type`;
CREATE TABLE `config_monitor_report_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督报告类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监督报告类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_operator_license_type
-- ----------------------------
DROP TABLE IF EXISTS `config_operator_license_type`;
CREATE TABLE `config_operator_license_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执照种类的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '研究堆操纵员执照种类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_political
-- ----------------------------
DROP TABLE IF EXISTS `config_political`;
CREATE TABLE `config_political`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '政治面貌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_review_status
-- ----------------------------
DROP TABLE IF EXISTS `config_review_status`;
CREATE TABLE `config_review_status`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审评状态的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '审评状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_security_check_type
-- ----------------------------
DROP TABLE IF EXISTS `config_security_check_type`;
CREATE TABLE `config_security_check_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全问题检查类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '安全问题检查类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_security_reform_status
-- ----------------------------
DROP TABLE IF EXISTS `config_security_reform_status`;
CREATE TABLE `config_security_reform_status`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完全问题整改状态的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '安全问题整改状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_supervision_org_nature
-- ----------------------------
DROP TABLE IF EXISTS `config_supervision_org_nature`;
CREATE TABLE `config_supervision_org_nature`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权监管机构单位性质值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '授权监管机构单位性质' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_title
-- ----------------------------
DROP TABLE IF EXISTS `config_title`;
CREATE TABLE `config_title`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职称' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_mountain_check_file_type
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_mountain_check_file_type`;
CREATE TABLE `config_umine_mountain_check_file_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山井下消防审查文件类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀矿山井下消防审查文件类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_mountain_status
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_mountain_status`;
CREATE TABLE `config_umine_mountain_status`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山设施状态的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀矿山设施状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_place_check_stage
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_place_check_stage`;
CREATE TABLE `config_umine_place_check_stage`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库审评阶段的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库审评阶段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_place_check_type
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_place_check_type`;
CREATE TABLE `config_umine_place_check_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库审评类型的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序列',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库审评类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_place_level
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_place_level`;
CREATE TABLE `config_umine_place_level`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库等别的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库等别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_place_permit_situation
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_place_permit_situation`;
CREATE TABLE `config_umine_place_permit_situation`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库许可情况的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿（渣）库许可情况表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_place_permit_stage
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_place_permit_stage`;
CREATE TABLE `config_umine_place_permit_stage`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库许可阶段的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库许可阶段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_place_security_question_nature
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_place_security_question_nature`;
CREATE TABLE `config_umine_place_security_question_nature`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施安全问题性质的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库安全问题性质表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_place_security_question_type
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_place_security_question_type`;
CREATE TABLE `config_umine_place_security_question_type`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库安全问题类别的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库安全问题类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_umine_place_status
-- ----------------------------
DROP TABLE IF EXISTS `config_umine_place_status`;
CREATE TABLE `config_umine_place_status`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `value` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣) 库设施状态的值',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣) 库设施状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info`  (
  `fileinfo_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `fileinfo_ref_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引用此附件的ID',
  `fileinfo_file_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `fileinfo_server_file_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传到服务器后的文件名',
  `fileinfo_client_file_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传前用户本地的文件名',
  `fileinfo_server_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器上面的文件路径',
  `fileinfo_upload_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人id',
  `fileinfo_upload_date` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `fileinfo_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`fileinfo_id`) USING BTREE,
  INDEX `index_fileinfo_ref_id`(`fileinfo_ref_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitor_check
-- ----------------------------
DROP TABLE IF EXISTS `monitor_check`;
CREATE TABLE `monitor_check`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键\r\n\r\n参考表：unit_service',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿冶单位信息,外键\r\n\r\n参考表：unit_umine',
  `equip_depart_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备单位，外键\r\n\r\n参考表：unit_equip_depart',
  `check_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '检查内容',
  `check_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督检查类型，外键\r\n\r\n参考表：config_monitor_check_type',
  `supervision_org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查监督机构外键，参考表supervison_org',
  `check_from_date` date NULL DEFAULT NULL COMMENT '检查时间',
  `check_end_date` date NULL DEFAULT NULL COMMENT '检查结束时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监督检查信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitor_check_file
-- ----------------------------
DROP TABLE IF EXISTS `monitor_check_file`;
CREATE TABLE `monitor_check_file`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，用来在file_info中查找具体文件',
  `monitor_check_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督检查信息  外键id\r\n\r\n参考表:monitor_check',
  `file_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督检查文件类型外键 \r\n\r\n参考表:config_monitor_check_file_type',
  `file_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件文号',
  `file_date` date NULL DEFAULT NULL COMMENT '文件时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监督检查文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitor_daily
-- ----------------------------
DROP TABLE IF EXISTS `monitor_daily`;
CREATE TABLE `monitor_daily`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键\r\n\r\n参考表:unit_service',
  `fac_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '军工核设施名称,外键\r\n\r\n参考表:unit_fac',
  `fac_status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施状态，外键\r\n\r\n 参考表：config_fac_status',
  `supervision_org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权监管机构外键，参考表：supervision_org',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日常监督信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitor_daily_file
-- ----------------------------
DROP TABLE IF EXISTS `monitor_daily_file`;
CREATE TABLE `monitor_daily_file`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，用来在file_info中查找具体文件',
  `monitor_daily_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日常监督信息  外键id\r\n\r\n参考表:monitor_daily',
  `file_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日常监督文件类型外键 \r\n\r\n参考表:config_monitor_daily_file_type',
  `file_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_date` date NULL DEFAULT NULL COMMENT '文件时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日常监督信息文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitor_report
-- ----------------------------
DROP TABLE IF EXISTS `monitor_report`;
CREATE TABLE `monitor_report`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `supervision_org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全监管机构信息，外键\r\n\r\n参考表:supervision_org',
  `name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告名称',
  `report_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督报告类型，外键\r\n\r\n参考表：config_monitor_report_type',
  `date` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '报告时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监督报告信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitor_witness
-- ----------------------------
DROP TABLE IF EXISTS `monitor_witness`;
CREATE TABLE `monitor_witness`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键\r\n\r\n参考表:unit_service',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿冶单位信息,外键\r\n\r\n参考表:unit_umine',
  `equip_depart_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备单位，外键\r\n\r\n参考表：unit_equip_depart',
  `object` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '见证对象',
  `items` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '见证事项',
  `date` date NULL DEFAULT NULL COMMENT '见证时间',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '见证结论',
  `question` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '存在问题',
  `reform` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '整改情况',
  `witness` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '见证人',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监督见证信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permit_activity
-- ----------------------------
DROP TABLE IF EXISTS `permit_activity`;
CREATE TABLE `permit_activity`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位,外键\r\n\r\n关联表:unit_service',
  `depart_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称(外键)，来源于核设备单位信息\r\n关联表：unit_equip_depart',
  `fac_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施名称,外键\r\n\r\n关联表：unit_fac',
  `permit_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可名称',
  `permit_content` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可内容',
  `activity_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核活动类型外键.\r\n关联表：config_activity_type',
  `permit_date` date NULL DEFAULT NULL COMMENT '许可时间',
  `validate_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期限',
  `permit_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可文号',
  `permit_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '许可条件',
  `review_promise` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审评承诺',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核活动许可信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permit_equip
-- ----------------------------
DROP TABLE IF EXISTS `permit_equip`;
CREATE TABLE `permit_equip`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `depart_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称(外键)，来源于核设备单位信息\r\n关联表：unit_equip_depart',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键\r\n\r\n关联表:unit_service',
  `fac_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施名称,外键\r\n\r\n关联表：unit_fac',
  `type_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备类别，外键\r\n\r\n参考表：config_equip_type',
  `level_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备核安全级别，外键\r\n\r\n关联表：config_equip_level',
  `permit_stage_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全设备许可阶段，外键\r\n关联表：config_equip_permit_stage',
  `permit_date` date NULL DEFAULT NULL COMMENT '许可时间',
  `validate_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期限',
  `permit_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可文号',
  `permit_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '许可条件',
  `review_promise` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审评承诺',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全设备许可信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permit_fac
-- ----------------------------
DROP TABLE IF EXISTS `permit_fac`;
CREATE TABLE `permit_fac`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键,参考表：umine_service',
  `fac_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施名称,外键\r\n1、跟营运单位相关联动\r\n2、关联表umine_fac',
  `permit_stage_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施许可阶段,外键.\r\n参考表：config_fac_permit_stage',
  `permit_scope` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '许可范围',
  `permit_date` date NULL DEFAULT NULL COMMENT '许可时间',
  `permit_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可文号',
  `permit_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '许可条件',
  `review_promise` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审评承诺',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施许可信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permit_umine_mountain
-- ----------------------------
DROP TABLE IF EXISTS `permit_umine_mountain`;
CREATE TABLE `permit_umine_mountain`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿冶单位信息，外键\r\n\r\n关联表:unit_umine',
  `umine_mountain_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山信息，外键\r\n\r\n参考表：unit_umine_mountain',
  `record_date` date NULL DEFAULT NULL COMMENT '备案时间',
  `record_number` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备案文号',
  `record_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备案条件',
  `review_promise` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审评承诺',
  `record_attach` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备案附件的id，用来在file_info中查找',
  `accept_date` date NULL DEFAULT NULL COMMENT '验收时间',
  `accept_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收文号',
  `accept_conclusion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主要验收结论',
  `accept_attach` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收文件附件主键ID，用来在file_info中查找',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀矿山井下消防许可信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permit_umine_place
-- ----------------------------
DROP TABLE IF EXISTS `permit_umine_place`;
CREATE TABLE `permit_umine_place`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿冶单位信息,外键\r\n\r\n关联表:unit_umine',
  `umine_place_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库名称，外键\r\n关联表：unit_umine_place',
  `permit_stage_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库许可阶段外键.\r\n关联表：config_umine_place_permit_stage',
  `permit_date` date NULL DEFAULT NULL COMMENT '许可时间',
  `validate_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期限',
  `permit_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可文号',
  `permit_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '许可条件',
  `review_promise` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审评承诺',
  `permit_content` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可内容',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库许可信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for relation_supervision_org_nature
-- ----------------------------
DROP TABLE IF EXISTS `relation_supervision_org_nature`;
CREATE TABLE `relation_supervision_org_nature`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权监管机构外键，参考表：supervision_org',
  `nature_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权监管机构单位性质外键，参考表：config_supervision_org_nature',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '授权监管机构单位性质关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for security_accident
-- ----------------------------
DROP TABLE IF EXISTS `security_accident`;
CREATE TABLE `security_accident`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位信息外键，参考表unit_service',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿冶单位外键，参考表unit_umine',
  `fac_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施信息外键，参考表unit_fac',
  `umine_place_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库信息外键，参考表：unit_umine_place',
  `fac_status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施状态外键，参考表：config_fac_status',
  `umine_place_status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库状态外键，\r\n参考表：config_umine_place_status',
  `name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件名称',
  `occur_date` date NULL DEFAULT NULL COMMENT '发生时间',
  `process` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '事件过程',
  `consequence` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '事件后果',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原因分析',
  `type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事故时间类别外键，\r\n参考表：config_accident_type',
  `nature_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事故时间性质外键，\r\n参考表：config_accident_nature',
  `measure` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处理措施',
  `feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '反馈',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '事故事件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for security_equip
-- ----------------------------
DROP TABLE IF EXISTS `security_equip`;
CREATE TABLE `security_equip`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `equip_depart_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设备单位信息外键，\r\n\r\n参考表：unit_equip_depart',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位外键，参考表：unit_service',
  `fac_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施信息外键，参考表：unit_fac',
  `check_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全问题检查类型，外键\r\n\r\n参考表：config_security_check_type',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题内容',
  `find_date` date NULL DEFAULT NULL COMMENT '发现时间',
  `question_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设备安全问题类别，外键。\r\n参考表：config_equip_security_question_type',
  `reform_status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全问题整改状态外键，\r\n参考表：config_security_reform_status',
  `require` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '监督要求',
  `reform_plan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '整改方案',
  `reform_complete_date` date NULL DEFAULT NULL COMMENT '整改完成时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设备安全问题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for security_fac
-- ----------------------------
DROP TABLE IF EXISTS `security_fac`;
CREATE TABLE `security_fac`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位，外键\r\n\r\n参考表：unit_service',
  `fac_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '军工核设施名称,外键\r\n\r\n参考表:unit_fac，如果是空则为综合性安全问题',
  `fac_status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施状态，外键\r\n\r\nconfig_fac_status',
  `check_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全问题检查类型，外键\r\n\r\n参考表：config_security_check_type',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题内容',
  `find_date` date NULL DEFAULT NULL COMMENT '发现时间',
  `question_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施安全问题类别，外键。\r\n参考表：config_fac_security_question_type',
  `question_nature_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施安全问题性质外键，\r\n参考表：config_fac_security_question_nature',
  `reform_status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全问题整改状态外键，参考表：config_security_reform_status',
  `require` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '监督要求',
  `reform_plan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '整改方案',
  `reform_complete_date` date NULL DEFAULT NULL COMMENT '整改完成时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施安全问题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for security_umine_place
-- ----------------------------
DROP TABLE IF EXISTS `security_umine_place`;
CREATE TABLE `security_umine_place`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿冶单位信息外键，\r\n\r\n参考表：unit_umine',
  `umine_place_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库信息外键，参考表：unit_umine_place',
  `status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库设施状态外键\r\n\r\n参考表：config_umine_place_status',
  `check_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全问题检查类型，外键\r\n\r\n参考表：config_security_check_type',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题内容',
  `find_date` date NULL DEFAULT NULL COMMENT '发现时间',
  `question_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库安全问题类别外键。\r\n\r\n参考表：config_umine_place_security_question_type',
  `question_nature_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库安全问题性质外键，参考表：config_umine_place_security_question_type',
  `reform_status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全问题整改状态外键，参考表：config_security_reform_status',
  `require` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '监督要求',
  `reform_plan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '整改方案',
  `reform_complete_date` date NULL DEFAULT NULL COMMENT '整改完成时间',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库安全问题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_break_checker
-- ----------------------------
DROP TABLE IF EXISTS `supervision_break_checker`;
CREATE TABLE `supervision_break_checker`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `sex` int(5) NULL DEFAULT NULL COMMENT '性别\r\n1表示男，0表示女',
  `employ_depart` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聘用单位',
  `check_method_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无损检验方法外键，参考表：config_check_method',
  `check_level_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无损检验级别外键，参考表：config_check_level',
  `valid_start` date NULL DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end` date NULL DEFAULT NULL COMMENT '有效期结束时间',
  `cert_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书编号',
  `cert_depart` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发证单位',
  `cert_date` date NULL DEFAULT NULL COMMENT '发证日期',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '无损检验人员资质信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_expert
-- ----------------------------
DROP TABLE IF EXISTS `supervision_expert`;
CREATE TABLE `supervision_expert`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家姓名',
  `identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `sex` int(5) NULL DEFAULT NULL COMMENT '性别\r\n1表示男，0表示女',
  `major` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `title_id` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称外键，参考表：config_title',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `contact` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `org` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属单位',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全监督专家信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_law
-- ----------------------------
DROP TABLE IF EXISTS `supervision_law`;
CREATE TABLE `supervision_law`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法规文号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法规名称',
  `release_date` date NULL DEFAULT NULL COMMENT '发布时间',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `modify_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '监管法规信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_operator
-- ----------------------------
DROP TABLE IF EXISTS `supervision_operator`;
CREATE TABLE `supervision_operator`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `employ_depart` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聘用单位',
  `heap_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '研究堆名称',
  `license_type_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操纵员执照种类外键\r\n参考表：config_operator_license_type',
  `license_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书编号',
  `cert_depart` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发证单位',
  `cert_date` date NULL DEFAULT NULL COMMENT '发证日期',
  `expire_date` date NULL DEFAULT NULL COMMENT '有效日期',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '研究堆操纵员执照信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_org
-- ----------------------------
DROP TABLE IF EXISTS `supervision_org`;
CREATE TABLE `supervision_org`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授权监管机构基本信息主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监管机构名称',
  `duty` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作职责',
  `leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构领导',
  `leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司领导电话',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creater_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '授权监管机构基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_sastind
-- ----------------------------
DROP TABLE IF EXISTS `supervision_sastind`;
CREATE TABLE `supervision_sastind`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国防科工局表主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司局名称',
  `org_set` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处室设置',
  `duty` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作职责',
  `leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司领导',
  `leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司领导电话',
  `security_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分管核安全司领导',
  `security_leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分管核安全司领导电话',
  `permit_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全许可处室领导',
  `permit_leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全许可处室领导电话',
  `supervise_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全监督处室领导',
  `supervise_leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全监督处室领导电话',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `creater_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '国防科工局基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_supervisor
-- ----------------------------
DROP TABLE IF EXISTS `supervision_supervisor`;
CREATE TABLE `supervision_supervisor`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生年月',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全授权监管机构外键\r\n\r\n参考表：supervision_org',
  `entry_date` date NULL DEFAULT NULL COMMENT '入职时间',
  `title_id` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称外键,参考表：config_title',
  `post` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
  `political_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌的外键,参考表：config_political',
  `sex` int(5) NULL DEFAULT NULL COMMENT '性别\r\n0表示男，1表示女',
  `contact` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `continue_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从事核安全工作时间',
  `education_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历外键，参考表：config_education',
  `degree_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学位外键。参考表：config_degree',
  `education_school` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `educate_date` date NULL DEFAULT NULL COMMENT '毕业时间',
  `major` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全监督员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_train
-- ----------------------------
DROP TABLE IF EXISTS `supervision_train`;
CREATE TABLE `supervision_train`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训班次',
  `begin_date` date NULL DEFAULT NULL COMMENT '培训时间',
  `end_date` date NULL DEFAULT NULL COMMENT '培训结束日期',
  `place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训地点',
  `number` int(11) NULL DEFAULT NULL COMMENT '参培人数',
  `content_teacher` text NULL DEFAULT NULL COMMENT '培训内容及教师',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `rmodify_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全监督培训信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for production_train
-- ----------------------------
DROP TABLE IF EXISTS `production_train`;
CREATE TABLE `production_train`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训班次',
  `begin_date` date NULL DEFAULT NULL COMMENT '培训时间',
  `end_date` date NULL DEFAULT NULL COMMENT '培训结束日期',
  `place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训地点',
  `number` int(11) NULL DEFAULT NULL COMMENT '参培人数',
  `content_teacher` text NULL DEFAULT NULL COMMENT '培训内容及教师',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `rmodify_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '安全生产培训信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_welder
-- ----------------------------
DROP TABLE IF EXISTS `supervision_welder`;
CREATE TABLE `supervision_welder`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `sex` int(5) NULL DEFAULT NULL COMMENT '性别1表示男，0表示女',
  `employ_depart` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聘用单位',
  `cert_depart` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发证单位',
  `cert_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书编号',
  `steel_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钢印号',
  `exam_project` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '考试合格项目代号',
  `valid_start` date NULL DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end` date NULL DEFAULT NULL COMMENT '有效期结束时间',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '焊接人员资质信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervisor_train_records
-- ----------------------------
DROP TABLE IF EXISTS `supervisor_train_records`;
CREATE TABLE `supervisor_train_records`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `supervisor_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核安全监督员外键ID，参考表：supervision_suprvisor',
  `class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训班次',
  `begin_date` date NULL DEFAULT NULL COMMENT '培训起始时间',
  `end_date` date NULL DEFAULT NULL COMMENT '培训结束时间',
  `score` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训成绩',
  `number` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督员证号',
  `issue_date` date NULL DEFAULT NULL COMMENT '发证日期',
  `expire_date` date NULL DEFAULT NULL COMMENT '到期时间\r\n\r\n按照发证时间自动填入，发证有效期三年',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核安全监督员培训信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能代码',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `status` int(11) NULL DEFAULT NULL COMMENT '功能状态  1 正常 0 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_organization
-- ----------------------------
DROP TABLE IF EXISTS `system_organization`;
CREATE TABLE `system_organization`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织主键',
  `code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位编码',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织名称',
  `parent_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级组织ID',
  `creater_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入人id',
  `create_date` date NULL DEFAULT NULL COMMENT '录入时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` date NULL DEFAULT NULL COMMENT '修改时间',
  `org_lever` int(11) NULL DEFAULT NULL COMMENT '类别层级',
  `org_lever_order` int(11) NULL DEFAULT NULL COMMENT '层级中的顺序'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织结构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色主键ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 1 正常 0 删除',
  `creater_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '录入时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `role_menu_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能ID',
  PRIMARY KEY (`role_menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与功能对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码,md5加密',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 1 正常 0失效',
  `org_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所属组织ID外键',
  `creater_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '录入时间',
  `last_modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `last_modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `last_login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后一次登录ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `user_role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键ID',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户外键ID',
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色外键ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_equip_depart
-- ----------------------------
DROP TABLE IF EXISTS `unit_equip_depart`;
CREATE TABLE `unit_equip_depart`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `survey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '基本概况',
  `product` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主要产品',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `emergency_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应急电话',
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `owner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主管质量领导',
  `leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主管质量领导电话',
  `depart_quality_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质量部门领导',
  `depart_quality_leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质量部门领导电话',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设备单位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_fac
-- ----------------------------
DROP TABLE IF EXISTS `unit_fac`;
CREATE TABLE `unit_fac`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施名称',
  `serial_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施编号',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施营运单位\r\n\r\n关联表:unit_service',
  `builder` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参建单位',
  `build_year` date NULL DEFAULT NULL COMMENT '建造年代',
  `supervision_category_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监管类别外键\r\n\r\n 参考表：config_fac_supervison_category',
  `type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设施类型\r\n\r\n参考表：config_fac_type',
  `status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设施状态\r\n\r\n 参考表：config_fac_status',
  `review_status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审评状态 参考表：config_review_status',
  `fac_permit_situation_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施的许可情况，参考表：config_fac_permit_situation',
  `survey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设施简介',
  `feature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '场址特征',
  `is_earthquake` int(11) NULL DEFAULT NULL COMMENT '是否满足抗震设防登记 0 不满足，1满足',
  `is_flood` int(11) NULL DEFAULT NULL COMMENT '是否满足防洪要求0不满足，1满足',
  `tech_des` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工艺描述',
  `design_standard_accident` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设计基准事故',
  `measure` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作人员剂量约束',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_fac_improve
-- ----------------------------
DROP TABLE IF EXISTS `unit_fac_improve`;
CREATE TABLE `unit_fac_improve`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `fac_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施外键ID，关联表unit_fac',
  `improve_date` date NULL DEFAULT NULL COMMENT '安技改时间',
  `improve_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '安技改内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施安技改对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_group
-- ----------------------------
DROP TABLE IF EXISTS `unit_group`;
CREATE TABLE `unit_group`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集团名称',
  `survey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '基本概况',
  `service_num` int(5) NULL DEFAULT NULL COMMENT '核设施营运单位数量，自动计算',
  `umine_num` int(5) NULL DEFAULT NULL COMMENT '铀矿冶单位数量,自动计算',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `emergency_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应急电话',
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `owner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主管安全领导',
  `leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主管安全领导电话',
  `depart_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全部门领导',
  `depart_leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全部门领导电话',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '军工集团信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_service
-- ----------------------------
DROP TABLE IF EXISTS `unit_service`;
CREATE TABLE `unit_service`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '核设施营运单位主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `group_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属集团外键，参考表unit_group',
  `survey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '基本概况',
  `fac_num` int(11) NULL DEFAULT NULL COMMENT '核设施信息的数量，根据关联关系自动统计',
  `feature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '厂址特征',
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代号',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `emergency_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应急电话',
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `owner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主管安全领导',
  `leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主管安全领导电话',
  `depart_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全部门领导',
  `depart_leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全部门领导电话',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `attach_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施附件的外键关联id，在file_info中查找',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施营运单位信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_service_annual_report
-- ----------------------------
DROP TABLE IF EXISTS `unit_service_annual_report`;
CREATE TABLE `unit_service_annual_report`  (
  `report_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '核设施营运单位年度报告id,file_info关联查找',
  `report_year` date NULL DEFAULT NULL COMMENT '报告年度',
  `service_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核设施运营单位外键',
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施营运单位年度报告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_fac_annual_report
-- ----------------------------
DROP TABLE IF EXISTS `unit_fac_annual_report`;
CREATE TABLE `unit_fac_annual_report`  (
  `report_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '核设施定期报告id,file_info关联查找',
  `report_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定期报告类别,参考:config_periodical_report_type',
  `report_year` date NULL DEFAULT NULL COMMENT '定期报告时间',  
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核设施定期报告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_umine
-- ----------------------------
DROP TABLE IF EXISTS `unit_umine`;
CREATE TABLE `unit_umine`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `group_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属集团\r\n\r\n关联表:\r\nunit_group',
  `survey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '基本概况',
  `umine_place_num` int(11) NULL DEFAULT NULL COMMENT '铀尾矿(渣)库数量，根据关系计算',
  `umine_mountain_num` int(10) NULL DEFAULT NULL COMMENT '铀矿山数量，通过计算统计',
  `feature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '厂址特征',
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代号',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `emergency_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应急电话',
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `owner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主管安全领导',
  `leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主管安全领导电话',
  `depart_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全部门领导',
  `depart_leader_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全部门领导电话',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀矿冶单位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_umine_mountain
-- ----------------------------
DROP TABLE IF EXISTS `unit_umine_mountain`;
CREATE TABLE `unit_umine_mountain`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山名称',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营运单位,来源于【铀矿冶单位表】：unit_umine',
  `build_year` date NULL DEFAULT NULL COMMENT '建造年代',
  `status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山设施状态的外键，\r\n关联表：config_umine_mountain_status',
  `is_record` int(11) NULL DEFAULT NULL COMMENT '井下消防审查备案情况 0 未备案 ，1已备案',
  `is_accept` int(11) NULL DEFAULT NULL COMMENT '井下消防验收情况 0未验收 ，1已验收',
  `survey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '井下消防设计简介',
  `danger_firepoint` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '井下重点火灾危险源',
  `water_volumn` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消防水池容积',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀矿山信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_umine_mountain_improve
-- ----------------------------
DROP TABLE IF EXISTS `unit_umine_mountain_improve`;
CREATE TABLE `unit_umine_mountain_improve`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `umine_mountain_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀矿山ID，关联表unit_umine_mountain',
  `improve_date` date NULL DEFAULT NULL COMMENT '安技改时间',
  `improve_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '安技改内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀矿山安技改对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_umine_place
-- ----------------------------
DROP TABLE IF EXISTS `unit_umine_place`;
CREATE TABLE `unit_umine_place`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库名称',
  `umine_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营运单位,来源于【铀尾矿单位信息】,关联表：unit_service',
  `build_year` year NULL DEFAULT NULL COMMENT '建造年代',
  `level_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库等别，参考表：config_umine_place_level',
  `status_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(库)设施状态的外键，\r\n参考表：config_umine_place_status',
  `review_status` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审评状态，参考表：config_review_status',
  `permit_situation_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库许可情况的值，\r\n参考表:config_umine_place_permit_situation',
  `survey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设施简介',
  `feature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '场址特征',
  `capacity` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设计有效库容',
  `design_flood_reproduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设计洪水重现期',
  `check_flood_reproduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '校核洪水重现期',
  `early_dam_type` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '初期坝型',
  `early_dam_height` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '初期坝高',
  `have_monitor` int(11) NULL DEFAULT NULL COMMENT '是否设置坝体监测设施',
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `is_import` int(11) NULL DEFAULT NULL COMMENT '是否导入0 否 1 是',
  `creator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)库信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit_umine_place_improve
-- ----------------------------
DROP TABLE IF EXISTS `unit_umine_place_improve`;
CREATE TABLE `unit_umine_place_improve`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `umine_place_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铀尾矿(渣)库ID，关联表unit_umine_place',
  `improve_date` date NULL DEFAULT NULL COMMENT '安技改时间',
  `improve_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '安技改内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铀尾矿(渣)安技改对应表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
