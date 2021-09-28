/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : pudong

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 28/09/2021 23:53:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_therapy
-- ----------------------------
DROP TABLE IF EXISTS `biz_therapy`;
CREATE TABLE `biz_therapy`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `therapy_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案名称，(maxLength=50)',
  `therapy_date` date NULL DEFAULT NULL COMMENT '方案日期',
  `hospital_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院名称，(maxLength=50)',
  `report_files` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '报告文件，文件列表 ，json格式，（maxLength=1000）',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 0 COMMENT '数据状态（0正常，1停用）。',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者管理-用药方案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_therapy_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `biz_therapy_suggestion`;
CREATE TABLE `biz_therapy_suggestion`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `therapy_id` bigint NOT NULL COMMENT '用药方案id',
  `doctor_id` bigint NOT NULL COMMENT '医生名称',
  `doctor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生名称(maxLength=50)',
  `suggestion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生诊断建议 (maxLength=500)',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用药方案建议' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checksum` int NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int NULL DEFAULT NULL,
  `int_prop_2` int NULL DEFAULT NULL,
  `long_prop_1` bigint NULL DEFAULT NULL,
  `long_prop_2` bigint NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint NULL DEFAULT NULL,
  `prev_fire_time` bigint NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_advice_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_advice_template`;
CREATE TABLE `sys_advice_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `template_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模版类型 (LongStandards-长期标准时段医嘱 LongNotStandards-长期非标准时段医嘱)',
  `template_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '模板名称',
  `template_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血糖医嘱模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_advisory
-- ----------------------------
DROP TABLE IF EXISTS `sys_advisory`;
CREATE TABLE `sys_advisory`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '咨询内容',
  `image_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` int NULL DEFAULT 0 COMMENT '1：删除，0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者咨询' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_advisory_reply
-- ----------------------------
DROP TABLE IF EXISTS `sys_advisory_reply`;
CREATE TABLE `sys_advisory_reply`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `advisory_id` bigint NOT NULL COMMENT '咨询id',
  `reply_user_id` bigint NULL DEFAULT NULL COMMENT '回复用户id',
  `reply_user_type` int NOT NULL COMMENT '1：我，2：医生。',
  `reply_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `image_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片url',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` int NULL DEFAULT 0 COMMENT '0:正常，1：删除。',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '咨询回复' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_appointment
-- ----------------------------
DROP TABLE IF EXISTS `sys_appointment`;
CREATE TABLE `sys_appointment`  (
  `appointment_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约号',
  `patient_id` bigint NULL DEFAULT NULL COMMENT '患者ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '预约医生ID',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '预约日期',
  `time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0：上午；1：下午',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约状态（0：进行中；1：已完成；2：已取消）',
  `appointment_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约留言',
  `cancel_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消留言',
  `deal_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理留言',
  `appointment_date` datetime(0) NULL DEFAULT NULL COMMENT '预约留言日期',
  `cancel_date` datetime(0) NULL DEFAULT NULL COMMENT '取消日期',
  `deal_date` datetime(0) NULL DEFAULT NULL COMMENT '处理日期',
  `queue_number` bigint NULL DEFAULT NULL COMMENT '排在当前时间的序号',
  PRIMARY KEY (`appointment_num`) USING BTREE,
  UNIQUE INDEX `unique`(`patient_id`, `user_id`, `date`, `time`, `status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者预约表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_appointment_count
-- ----------------------------
DROP TABLE IF EXISTS `sys_appointment_count`;
CREATE TABLE `sys_appointment_count`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NULL DEFAULT NULL COMMENT '医生ID',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '预约日期',
  `time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0：上午；1：下午',
  `appointed_amount` bigint NULL DEFAULT 0 COMMENT '已预约人数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `date`(`date`, `time`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '预约统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_appointment_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_appointment_record`;
CREATE TABLE `sys_appointment_record`  (
  `appointment_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约号',
  `patient_id` bigint NULL DEFAULT NULL COMMENT '患者ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '预约医生ID',
  `date` date NULL DEFAULT NULL COMMENT '预约日期',
  `time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0：上午；1：下午',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约状态（0：进行中；1：已完成；2：已取消）',
  `appointment_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约留言',
  `cancel_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消留言',
  `deal_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理留言',
  `appointment_date` datetime(0) NULL DEFAULT NULL COMMENT '预约留言日期',
  `cancel_date` datetime(0) NULL DEFAULT NULL COMMENT '取消日期',
  `deal_date` datetime(0) NULL DEFAULT NULL COMMENT '处理日期',
  `queue_number` bigint NULL DEFAULT NULL COMMENT '排在当前时间的序号',
  PRIMARY KEY (`appointment_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_blood_glucose
-- ----------------------------
DROP TABLE IF EXISTS `sys_blood_glucose`;
CREATE TABLE `sys_blood_glucose`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `measure_period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量时段(KF-空腹 ZCH-早餐后 WUCQ-午餐前 WUCH-午餐后 WACQ-晚餐前 WACH-晚餐后 SQ-睡前LC-凌晨 LC3-凌晨3点  SJ-随机)',
  `measure_time` datetime(0) NULL DEFAULT NULL COMMENT '测量时间',
  `meature_value` double NULL DEFAULT NULL COMMENT '测量值',
  `equipment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量设备编号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `data_source` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源(0血糖盒子手工录入1管理后台录入 2血糖盒子设备上传 3小程序手工录入 4小程序设备录入)',
  `measure_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量状态 1-偏低 2-正常 3-偏高',
  `abnormal_result` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常结果()',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `other_remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他原因',
  `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量颜色',
  `data_status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `com_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_record`(`patient_id`, `measure_time`, `meature_value`, `status`) USING BTREE,
  INDEX `com_code`(`com_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者血糖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_blood_glucose_qa
-- ----------------------------
DROP TABLE IF EXISTS `sys_blood_glucose_qa`;
CREATE TABLE `sys_blood_glucose_qa`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `equipment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质控设备编号',
  `liquid_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '质控液类型(1-高 2-中 3-低)',
  `liquid_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '质控液批次号',
  `manufactor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生产厂家',
  `max_value` double NULL DEFAULT NULL COMMENT '最大测量值',
  `min_value` double NULL DEFAULT NULL COMMENT '最小测量值',
  `liquid_date` datetime(0) NULL DEFAULT NULL COMMENT '质控液有效期',
  `qa_time` datetime(0) NULL DEFAULT NULL COMMENT '质控时间',
  `qa_value` double NULL DEFAULT NULL COMMENT '质控值',
  `test_paper_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '试纸批次号',
  `test_paper_date` datetime(0) NULL DEFAULT NULL COMMENT '试纸有效期',
  `qa_result` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '质控结果（0合格 1不合格 2 未质控）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '执行人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `solution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '改进措施',
  `create_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'createName-不冗余',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_record`(`equipment_sn`, `qa_time`, `liquid_num`, `test_paper_num`, `qa_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血糖仪质控结果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_blood_pressure
-- ----------------------------
DROP TABLE IF EXISTS `sys_blood_pressure`;
CREATE TABLE `sys_blood_pressure`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `measure_period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量时段(SW-上午 ZW-中午 XW-下午)',
  `measure_time` datetime(0) NULL DEFAULT NULL COMMENT '测量时间',
  `systolic` double NULL DEFAULT NULL COMMENT '收缩压',
  `diastolic` double NULL DEFAULT NULL COMMENT '舒张压',
  `pluse` double NULL DEFAULT NULL COMMENT '心率',
  `equipment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量设备编号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `data_source` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源(0移动端录入1管理后台录入 2设备上传)',
  `measure_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量状态（High1-一级高血压 High2-二级高血压 High3-三级高血压）',
  `display_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '测量状态颜色',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量颜色',
  `data_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型[平均:average, 测量值:real]',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '测量值对应平均值id',
  `hand` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '左 left右 right',
  `ext` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gprs上传的测量时间',
  `data_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '数据推送码',
  `qrcode_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫描二维码ID',
  `take_medicine` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0-未服药,1-服药',
  `hypertension_therapy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0-否, 1-是',
  `pressure_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '血压类型：0-诊室，1-家庭',
  `measure_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量类型（1-一次测量；2-两次测量；3-三次测量）',
  `com_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_patient_id`(`patient_id`) USING BTREE,
  INDEX `com_code`(`com_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49984 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者血压记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_blood_pressure_qa
-- ----------------------------
DROP TABLE IF EXISTS `sys_blood_pressure_qa`;
CREATE TABLE `sys_blood_pressure_qa`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `equipment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质控设备编号',
  `qa_time` datetime(0) NULL DEFAULT NULL COMMENT '质控时间',
  `qa_result` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '质控结果（0合格 1不合格 2 未质控）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '执行人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血压计质控结果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_common_advice
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_advice`;
CREATE TABLE `sys_common_advice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `common_advice_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱类型(medicate-用药医嘱)',
  `advice_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱名称',
  `advice_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱内容(json)',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '医嘱医生',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '普通医嘱信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_consultation
-- ----------------------------
DROP TABLE IF EXISTS `sys_consultation`;
CREATE TABLE `sys_consultation`  (
  `consultation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id,关联患者表',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '归属部门',
  `birth` date NULL DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别(0男 1女 2未知)',
  `hospitalized_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `bed_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '床号',
  `consultation_dept_id` bigint NULL DEFAULT NULL COMMENT '会诊部门',
  `consultation_doctor` bigint NULL DEFAULT NULL COMMENT '会诊医生',
  `consultation_time` datetime(0) NULL DEFAULT NULL COMMENT '会诊时间',
  `create_dept_id` bigint NULL DEFAULT NULL COMMENT '申请会诊人部门',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(0-会诊中 1-已完成)',
  PRIMARY KEY (`consultation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者会诊信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_consultation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_consultation_log`;
CREATE TABLE `sys_consultation_log`  (
  `consultation_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `consultation_id` bigint NOT NULL COMMENT '会诊id,关联会诊信息表',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(0-会诊中 1-已完成)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`consultation_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者会诊记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `com_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编码',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `parent_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '父部门名称',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `wristband_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腕带类型',
  `report_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表类型',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `qa_lock` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '质控锁闭开关（0-关闭；1-开启）',
  `shop_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `com_code`(`com_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_doctor_advice
-- ----------------------------
DROP TABLE IF EXISTS `sys_doctor_advice`;
CREATE TABLE `sys_doctor_advice`  (
  `advice_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '日期',
  `user_id` bigint NULL DEFAULT NULL COMMENT '医生ID',
  `advice` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建议',
  `record_id` bigint NULL DEFAULT NULL COMMENT '病历档案ID',
  PRIMARY KEY (`advice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医生建议表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_doctor_schedule
-- ----------------------------
DROP TABLE IF EXISTS `sys_doctor_schedule`;
CREATE TABLE `sys_doctor_schedule`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '医生ID',
  `appointment_amount` bigint NULL DEFAULT NULL COMMENT '可预约人数',
  `day_week` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MON：星期一；TUE：星期二',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0：可预约；1：不可预约',
  `time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0：上午；1：下午',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医生预约时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_doctor_schedule_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_doctor_schedule_config`;
CREATE TABLE `sys_doctor_schedule_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '医生id',
  `appointment_scope` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可预约范围（0：一周；1：半个月；2：一个月；3：三个月；4：六个月）',
  `week_repeatedly` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许一周预约多次（0-允许；1-禁止）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_equipment
-- ----------------------------
DROP TABLE IF EXISTS `sys_equipment`;
CREATE TABLE `sys_equipment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `equipment_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '设备类型(pressure-血压仪 glucose-血糖仪)',
  `equipment_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '设备编号',
  `manufactor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生产厂家',
  `product_model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品型号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `mid_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '锁闭与启用的中间状态（0-启用中 1-停用中 2-锁闭中 ）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7082 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_evaluation_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_evaluation_data`;
CREATE TABLE `sys_evaluation_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_id` bigint NULL DEFAULT NULL COMMENT '患者ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别（0-男；1-女；2-未知）',
  `height` double NULL DEFAULT NULL COMMENT '身高m',
  `weight` double NULL DEFAULT NULL COMMENT '体重kg',
  `bmi` double NULL DEFAULT NULL COMMENT '体重指数',
  `smoking` int NULL DEFAULT NULL COMMENT '吸烟（1-不；2-偶尔；3-每天）',
  `drinking` int NULL DEFAULT NULL COMMENT '饮酒（1-不；2-偶尔；3-每天）',
  `systolic` int NULL DEFAULT NULL COMMENT '收缩压',
  `high_sport_time` int NULL DEFAULT NULL COMMENT '重体力活动时间（1-小于75m；2-大于等于75m）',
  `middle_sport_time` int NULL DEFAULT NULL COMMENT '中体力活动时间（1-小于120m；2-大于等于120m；3-大于等于150m）',
  `sport` int NULL DEFAULT NULL COMMENT '活动程度（1-不太活动；2-轻度；3-中度）',
  `fruit` int NULL DEFAULT NULL COMMENT '是否每周食用水果（1-是；2-否）',
  `hypertension` int NULL DEFAULT NULL COMMENT '高血压（1-是；2-否）',
  `myocardial_infarction` int NULL DEFAULT NULL COMMENT '心肌梗死（1-是；2-否）',
  `stroke` int NULL DEFAULT NULL COMMENT '脑卒中（1-是；2-否）',
  `coronary_heart_disease` int NULL DEFAULT NULL COMMENT '冠心病（1-是；2-否）',
  `fatty_liver` int NULL DEFAULT NULL COMMENT '脂肪肝（1-是；2-否）',
  `chronic_nephritis` int NULL DEFAULT NULL COMMENT '慢性肾炎（1-是；2-否）',
  `blood_glucose` double NULL DEFAULT NULL COMMENT '空腹血糖',
  `serum_creatinine` double NULL DEFAULT NULL COMMENT '血肌酐',
  `glycated_hemoglobin` double NULL DEFAULT NULL COMMENT '糖化血红蛋白',
  `high_density_lipoprotein_cholesterol` double NULL DEFAULT NULL COMMENT '高密度脂蛋白胆固醇',
  `total_cholesterol` double NULL DEFAULT NULL COMMENT '总胆固醇',
  `triglyceride` double NULL DEFAULT NULL COMMENT '甘油三酯',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0-正常；1-删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `glu_update_time` datetime(0) NULL DEFAULT NULL COMMENT '空腹血糖更新时间',
  `hba1c_update_time` datetime(0) NULL DEFAULT NULL COMMENT '糖化血红蛋白更新时间',
  `systolic_update_time` datetime(0) NULL DEFAULT NULL COMMENT '收缩压更新时间',
  `cr_update_time` datetime(0) NULL DEFAULT NULL COMMENT '血肌酐更新时间',
  `blood_lipid_update_time` datetime(0) NULL DEFAULT NULL COMMENT '血脂检查更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52275 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_evaluation_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_evaluation_record`;
CREATE TABLE `sys_evaluation_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_id` bigint NULL DEFAULT NULL COMMENT '患者ID',
  `evaluation_time` datetime(0) NULL DEFAULT NULL COMMENT '评估时间',
  `danger_level` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '危险等级(1-低危；2-中危；3-高危)',
  `level_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '危险等级类型（0-糖尿病；1-高血压）',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0-正常；1-删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_glucose_advice
-- ----------------------------
DROP TABLE IF EXISTS `sys_glucose_advice`;
CREATE TABLE `sys_glucose_advice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `advice_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱类型(LongStandards-长期标准时段医嘱 LongNotStandards-长期非标准时段医嘱 Temporary-临时医嘱)',
  `template_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '模板名称',
  `advice_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱名称',
  `advice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱内容(json)',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '医嘱医生',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '患者部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血糖测量医嘱表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_glucose_advice_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_glucose_advice_task`;
CREATE TABLE `sys_glucose_advice_task`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `advice_id` bigint NOT NULL COMMENT '所属医嘱',
  `advice_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱类型(LongStandards-长期标准时段医嘱 LongNotStandards-长期非标准时段医嘱 Temporary-临时医嘱)',
  `advice_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱名称',
  `advice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱内容(json存储拆分后的结果)',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '医嘱医生',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `isDone` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已测(0 未测 1已测)',
  `blood_glucose_id` bigint NULL DEFAULT NULL COMMENT '血糖记录主键ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '患者部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血糖医嘱任务拆分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_glucose_crisis
-- ----------------------------
DROP TABLE IF EXISTS `sys_glucose_crisis`;
CREATE TABLE `sys_glucose_crisis`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `high_value` double NULL DEFAULT NULL COMMENT '危机高值',
  `high_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '危机高值颜色',
  `low_value` double NULL DEFAULT NULL COMMENT '危机低值',
  `low_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '危机低值颜色',
  `normal_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '正常值颜色',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血糖危急值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_glucose_crisis_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_glucose_crisis_record`;
CREATE TABLE `sys_glucose_crisis_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `measure_period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量时段(KF-空腹 ZCH-早餐后 WUCQ-午餐前 WUCH-午餐后 WACQ-晚餐前 WACH-晚餐后 SQ-睡前LC-凌晨 LC3-凌晨3点  SJ-随机)',
  `measure_time` datetime(0) NULL DEFAULT NULL COMMENT '测量时间',
  `meature_value` double NULL DEFAULT NULL COMMENT '测量值',
  `equipment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量设备编号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `data_source` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源(0移动端录入1管理后台录入 2设备上传)',
  `measure_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '测量状态（1偏低 2正常 3 偏高 ）',
  `abnormal_result` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常结果(normal-normal Lo-Lo Hi-Hi 1001-拒测 1002-外出 1003-食晚 1004-其他)',
  `display_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '测量状态颜色',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `blood_glucose_id` bigint NULL DEFAULT NULL COMMENT '血糖id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血糖危机记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_glucose_period
-- ----------------------------
DROP TABLE IF EXISTS `sys_glucose_period`;
CREATE TABLE `sys_glucose_period`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `measure_period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量时段(KF-空腹 ZCH-早餐后 WUCQ-午餐前 WUCH-午餐后 WACQ-晚餐前 WACH-晚餐后 SQ-睡前LC-凌晨 LC3-凌晨3点  SJ-随机)',
  `display_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '显示名称',
  `start_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `max_value` double NULL DEFAULT NULL COMMENT '最大测量值',
  `min_value` double NULL DEFAULT NULL COMMENT '最小测量值',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `high_Color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '偏高值颜色',
  `low_Color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '偏低值颜色',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 578 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血糖测量时间段配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_health_archives
-- ----------------------------
DROP TABLE IF EXISTS `sys_health_archives`;
CREATE TABLE `sys_health_archives`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `archives_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '档案名称',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `dept_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属部门',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `birth` date NULL DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别(0男 1女 2未知)',
  `hospitalized_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `hospitalized_date` date NULL DEFAULT NULL COMMENT '入院日期',
  `wristband_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腕带码',
  `bed_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '床号',
  `doctor_id` bigint NULL DEFAULT NULL COMMENT '住院医生编号',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
  `card_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型(1-身份证 2-医保卡 3-就诊卡)',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `card_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医保卡/就诊卡号',
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 394 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_label_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_label_config`;
CREATE TABLE `sys_label_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '机构id',
  `top_label_num` int NULL DEFAULT NULL COMMENT '顶级标签标号，1：疾病类型，2：用户等级',
  `label_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '标签父id',
  `ancestors` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联标签集',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构标签配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1209 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `msg_type` int NOT NULL COMMENT '消息类型，1：血糖消息，2：血压消息，3：预约消息，4：咨询消息',
  `patient_id` bigint NOT NULL,
  `msg_time` datetime(0) NULL DEFAULT NULL COMMENT '消息创建时间',
  `msg_body` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息体',
  `is_read` int NOT NULL DEFAULT 0 COMMENT '是否已读,0:未读，1：已读',
  `status` int NOT NULL DEFAULT 0 COMMENT '0:正常，1:删除',
  `appointment_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约消息预约号',
  `source_id` bigint NULL DEFAULT NULL COMMENT '其他消息关联id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2562 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医生app消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_out_blood_glucose
-- ----------------------------
DROP TABLE IF EXISTS `sys_out_blood_glucose`;
CREATE TABLE `sys_out_blood_glucose`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `measure_period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量时段(KF-空腹 ZCH-早餐后 WUCQ-午餐前 WUCH-午餐后 WACQ-晚餐前 WACH-晚餐后 SQ-睡前LC-凌晨 LC3-凌晨3点  SJ-随机)',
  `measure_time` datetime(0) NULL DEFAULT NULL COMMENT '测量时间',
  `meature_value` double NULL DEFAULT NULL COMMENT '测量值',
  `equipment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量设备编号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `data_source` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源(0移动端录入1管理后台录入 2设备上传 3数据来源 )',
  `measure_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '测量状态（1偏低 2正常 3 偏高 ）',
  `display_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '测量状态颜色',
  `abnormal_result` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常结果(normal-normal Lo-Lo Hi-Hi 1001-拒测 1002-外出 1003-食晚 1004-其他)',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门诊患者血糖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_out_patient
-- ----------------------------
DROP TABLE IF EXISTS `sys_out_patient`;
CREATE TABLE `sys_out_patient`  (
  `patient_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '归属部门',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `birth` date NULL DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别(0男 1女 2未知)',
  `hospitalized_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `hospitalized_date` date NULL DEFAULT NULL COMMENT '入院日期',
  `leave_date` date NULL DEFAULT NULL COMMENT '入院日期',
  `hospitalized_type` date NULL DEFAULT NULL COMMENT '住院状态(1 住院 2 出院)',
  `wristband_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腕带码',
  `bed_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '床号',
  `doctor_id` bigint NULL DEFAULT NULL COMMENT '住院医生编号',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `card_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型(1-医保卡 2-就诊卡)',
  `card_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医保卡/就诊卡号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(0-正常 1-禁用)',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门诊患者信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient`;
CREATE TABLE `sys_patient`  (
  `patient_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '归属部门',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `patient_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `birth` date NULL DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别(0男 1女 2未知)',
  `hospitalized_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `hospitalized_date` datetime(0) NULL DEFAULT NULL COMMENT '入院日期',
  `leave_date` datetime(0) NULL DEFAULT NULL COMMENT '出院日期',
  `hospitalized_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '住院状态(1 住院 2 出院)',
  `wristband_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腕带码',
  `bed_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '床号',
  `doctor_id` bigint NULL DEFAULT NULL COMMENT '住院医生编号',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `magnetic_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'magneticCard',
  `chip_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '芯片医保卡号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(0-正常 1-禁用)',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `user_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型 bloodPressure高血压 bloodGlucos糖尿病 heart心血管疾病 other其他',
  `high` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高(m)',
  `weight` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重(kg)',
  `waist` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腰围(cm)',
  `hip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '臀围(cm)',
  `contacts_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `contacts_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `user_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户等级 normal 普通 vip vvip',
  `pressure_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血压级别 Normal-正常血压 NormalHigh-正常高值  High1-1级高血压 High2-2级高血压 High3-3级高血压',
  `pressure_danger_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血压危险等级 Init-待评估 Low-低危 Middle-中危 High-高危 Higher-很高危',
  `glucose_danger_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血糖危险等级 Low-低危 Middle-中危 High-高危',
  `code_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫描枪扫出来条形码或二维码的ID',
  `employee_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工卡号',
  `hypertension` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0-无高血压,1-有高血压',
  `open_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `qrcode_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫描二维码id',
  `wx_mini_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信小程序openid',
  `glucose_value` double NULL DEFAULT NULL COMMENT '最近一次测量的血糖值',
  `glucose_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '最后一次血糖测量是否异常（0-正常，1-异常）',
  `pressure_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '最后一次血压测量是否异常（0-正常，1-异常）',
  `bg_last_measure_time` datetime(0) NULL DEFAULT NULL COMMENT '最近血压测量时间',
  `bp_last_measure_time` datetime(0) NULL DEFAULT NULL COMMENT '最近血糖测量时间',
  `blood_glucose_survey` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0-未做调查 1-已做调查',
  `source` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '患者来源：（0-页面，1-小程序，2-血糖盒子，3-迁移，4-公众号）',
  `total` int NULL DEFAULT 0 COMMENT '患者可测量总次数',
  `used` int NULL DEFAULT 0 COMMENT '患者已使用测量次数',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9268 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient_bmi
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient_bmi`;
CREATE TABLE `sys_patient_bmi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `high` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高(m)',
  `weight` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重(kg)',
  `bmi` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'bmi',
  `bmi_result` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身体状况 偏瘦 正常 过重 肥胖',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/测量时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `measure_time` datetime(0) NULL DEFAULT NULL COMMENT '测量时间',
  `equipment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高体重仪设备号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '体重BMI数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient_equipment
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient_equipment`;
CREATE TABLE `sys_patient_equipment`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_id` bigint NULL DEFAULT NULL,
  `equipment_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '绑定设备sn',
  `bind_time` datetime(0) NOT NULL COMMENT '最新绑定时间',
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_SN`(`equipment_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient_label
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient_label`;
CREATE TABLE `sys_patient_label`  (
  `patient_id` bigint NULL DEFAULT NULL,
  `label_id` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者标签关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient_medical_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient_medical_record`;
CREATE TABLE `sys_patient_medical_record`  (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `patient_id` bigint NOT NULL COMMENT '患者ID',
  `medical_record_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病历档案名称',
  `hospital_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院名称',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '日期',
  `self_description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病情自述',
  `medical_record_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '病历档案文件',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0：可用；1：停用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `data_type` int NULL DEFAULT 0 COMMENT '0:病例档案，1:用户咨询',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '档案类型（0-其他，1-门诊病历，2-血常规检查，3-肝功能检查，4-肾功能检查）',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '病历档案记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient_merge_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient_merge_log`;
CREATE TABLE `sys_patient_merge_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `old_patient_id` bigint NOT NULL COMMENT '旧患者id',
  `new_patient_id` bigint NOT NULL COMMENT '新患者id',
  `biz_module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务模块，血压：bloodPressure，血糖：bloodglucose，体重BMI：bmi。',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态，0：正常，1：禁用。',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient_other_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient_other_info`;
CREATE TABLE `sys_patient_other_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `Past_History` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '既往史',
  `family_history` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家族史',
  `drug_taboos` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药物禁忌',
  `smoking` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 吸烟 0无 1偶尔(每周1根以上) 2 经常(每周10根以上) 3 过量(每周20根以上)',
  `drink` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饮酒 0 无 1偶尔(每周1次以上) 2经常(每周4次以上) 3过量(每周20瓶以上)',
  `sport` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运动0无1 偶尔(每周1次以上)2经常(每周2次以上)3过量(每周4次以上)',
  `sport_remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主要运动方式',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者疾病信息及生活方式表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient_record`;
CREATE TABLE `sys_patient_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `dept_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属部门',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `patient_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `birth` date NULL DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别(0男 1女 2未知)',
  `hospitalized_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `hospitalized_date` date NULL DEFAULT NULL COMMENT '入院日期',
  `leave_date` date NULL DEFAULT NULL COMMENT '出院日期',
  `hospitalized_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '住院状态(1 住院 2 出院)',
  `wristband_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腕带码',
  `bed_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '床号',
  `doctor_id` bigint NULL DEFAULT NULL COMMENT '住院医生编号',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
  `card_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型(1-身份证 2-医保卡 3-就诊卡)',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `card_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医保卡/就诊卡号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(0-正常 1-禁用)',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者信息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_patient_report
-- ----------------------------
DROP TABLE IF EXISTS `sys_patient_report`;
CREATE TABLE `sys_patient_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `report_hospital_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检验报告医院',
  `report_date` datetime(0) NULL DEFAULT NULL COMMENT '检验报告时间',
  `report_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检验报告名称',
  `report_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告类型',
  `report_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检验参数',
  `report_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '报告地址',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/测量时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者实验室检查报告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_pressure_advice
-- ----------------------------
DROP TABLE IF EXISTS `sys_pressure_advice`;
CREATE TABLE `sys_pressure_advice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `advice_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱名称',
  `advice_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医嘱内容(json)',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '医嘱医生',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血压测量医嘱表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_pressure_crisis_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_pressure_crisis_record`;
CREATE TABLE `sys_pressure_crisis_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `measure_period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量时段(SW-上午 ZW-中午 XW-下午)',
  `measure_time` datetime(0) NULL DEFAULT NULL COMMENT '测量时间',
  `systolic` double NULL DEFAULT NULL COMMENT '收缩压',
  `diastolic` double NULL DEFAULT NULL COMMENT '舒张压',
  `pluse` double NULL DEFAULT NULL COMMENT '心率',
  `equipment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量设备编号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `data_source` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源(0移动端录入1管理后台录入 2设备上传)',
  `measure_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量状态（High1-一级高血压 High2-二级高血压 High3-三级高血压）',
  `display_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '测量状态颜色',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `pressure_id` bigint NULL DEFAULT NULL COMMENT '血压id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3704 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者血压危机数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_pressure_period
-- ----------------------------
DROP TABLE IF EXISTS `sys_pressure_period`;
CREATE TABLE `sys_pressure_period`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `measure_period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量时段(SW-上午 ZW-中午 XW-下午)',
  `display_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '显示名称',
  `start_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血压测量时间段配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_pressure_report
-- ----------------------------
DROP TABLE IF EXISTS `sys_pressure_report`;
CREATE TABLE `sys_pressure_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `patient_id` bigint NOT NULL COMMENT '患者id',
  `report_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告名称',
  `report_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血压评估报告内容',
  `report_time` datetime(0) NULL DEFAULT NULL COMMENT '评估时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '医生',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血压评估报告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_pressure_standard
-- ----------------------------
DROP TABLE IF EXISTS `sys_pressure_standard`;
CREATE TABLE `sys_pressure_standard`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `standard_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '血压判断标准json',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '血压测量标准判定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_qa_count
-- ----------------------------
DROP TABLE IF EXISTS `sys_qa_count`;
CREATE TABLE `sys_qa_count`  (
  `equipment_sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `count` int NULL DEFAULT 0 COMMENT '质控不合格次数',
  PRIMARY KEY (`equipment_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质控不合格统计表(以每天凌晨4点为周期清空)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_qa_liquid
-- ----------------------------
DROP TABLE IF EXISTS `sys_qa_liquid`;
CREATE TABLE `sys_qa_liquid`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `liquid_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '质控液类型(1-高 2-中 3-低)',
  `liquid_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '质控液批次号',
  `manufactor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生产厂家',
  `max_value` double NULL DEFAULT NULL COMMENT '最大测量值',
  `min_value` double NULL DEFAULT NULL COMMENT '最小测量值',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `expiredTime` datetime(0) NULL DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质控液信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_qa_target
-- ----------------------------
DROP TABLE IF EXISTS `sys_qa_target`;
CREATE TABLE `sys_qa_target`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `manufactor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产厂家',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `high_avg` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '高值靶值平均值',
  `high_sd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '高值靶值标准差值',
  `middle_avg` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '中值靶值平均值',
  `middle_sd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '中值靶值标准差值',
  `low_avg` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '低值靶值平均值',
  `low_sd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '低值靶值标准差值',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质控靶值配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `sys_questionnaire`;
CREATE TABLE `sys_questionnaire`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷编号',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '日期',
  `patient_id` bigint NULL DEFAULT NULL COMMENT '患者ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问卷内容',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷类型（0：高血压随访问卷；1：高血压未治疗年度随访问卷；2：高血压入选问卷；3：心血管检查表；4：颈动脉超声报告单；5：高血压未治疗问卷；6：高血压未治疗体检表；7：房颤入选调查问卷；）',
  `category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷类目（0：随访问卷；1：调查问卷）',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0：进行中；1：已完成；2：删除）',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷调查' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_questionnaire_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_questionnaire_config`;
CREATE TABLE `sys_questionnaire_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '序号父id',
  `questionnaire_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷名称',
  `type` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '（0：高血压随访问卷；1：高血压未治疗年度随访问卷；2：高血压入选问卷；3：心血管检查表；4：颈动脉超声报告单；5：高血压未治疗问卷；6：高血压未治疗体检表；7：房颤入选调查问卷；）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '问卷状态（0：未使用；1：已使用）',
  `category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷类型 (0：随访问卷；1：调查问卷)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_questionnaire_config_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_questionnaire_config_record`;
CREATE TABLE `sys_questionnaire_config_record`  (
  `dept_id` bigint NOT NULL COMMENT '科室id',
  `questionnaire_config_id` bigint NOT NULL COMMENT '问卷配置id',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '问卷状态（0：未使用；1：已使用）',
  PRIMARY KEY (`dept_id`, `questionnaire_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷配置对应机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `resource_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源码，唯一区别一个资源。',
  `resource_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL COMMENT '0：正常，1：禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `resource_code_UNIQUE`(`resource_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `dept_id` bigint NOT NULL DEFAULT 100 COMMENT '部门ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `role_type` int NULL DEFAULT NULL COMMENT '角色类型，0-糖尿病，1-高血压，2-其他',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色id',
  `resource_id` bigint NOT NULL COMMENT '资源id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 0 COMMENT '0：正常，1：禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色按钮关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sys_shop
-- ----------------------------
DROP TABLE IF EXISTS `sys_shop`;
CREATE TABLE `sys_shop`  (
  `shop_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchant_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户编号',
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商店创建者',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `dept_id` bigint NOT NULL COMMENT '归属部门',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_test_strip
-- ----------------------------
DROP TABLE IF EXISTS `sys_test_strip`;
CREATE TABLE `sys_test_strip`  (
  `strip_id` bigint NOT NULL AUTO_INCREMENT COMMENT '试纸ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `strip_lot_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试纸批号',
  `manufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `invalid_date` datetime(0) NULL DEFAULT NULL COMMENT '失效日期',
  `low_max` double NULL DEFAULT NULL COMMENT '低值最大值',
  `low_min` double NULL DEFAULT NULL COMMENT '低值最小值',
  `mid_max` double NULL DEFAULT NULL COMMENT '中值最大值',
  `mid_min` double NULL DEFAULT NULL COMMENT '中值最小值',
  `high_max` double NULL DEFAULT NULL COMMENT '高值最大值',
  `high_min` double NULL DEFAULT NULL COMMENT '高值最小值',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0：正常；1：过期；2：删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `code` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试纸code服务码',
  PRIMARY KEY (`strip_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `docapp_token` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生app的登录token',
  `code_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '二维码类型（0-机构，1-员工）',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 974081 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_mini_code
-- ----------------------------
DROP TABLE IF EXISTS `wx_mini_code`;
CREATE TABLE `wx_mini_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `thumbnail_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图地址',
  `original_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原图地址',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信小程序二维码地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for deptview
-- ----------------------------
DROP VIEW IF EXISTS `deptview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `deptview` AS select distinct `sd`.`dept_id` AS `dept_id`,(case `sd`.`dept_id` when 415 then 'http://10.220.80.40:8084/lifesigns/api/listEmployees?hospID=01' when 414 then 'http://10.220.69.6:8084/lifesigns/api/listEmployees?hospID=01' else 'http://10.220.80.40:8084/lifesigns/api/listEmployees?hospID=01' end) AS `user_url` from `sys_dept` `sd` where (`sd`.`dept_id` = 415);

-- ----------------------------
-- View structure for glucose_view
-- ----------------------------
DROP VIEW IF EXISTS `glucose_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `glucose_view` AS select `sbg`.`id` AS `id`,`sp`.`hospitalized_num` AS `patient_id`,`sp`.`remark` AS `hospitalized_num`,(case `sd`.`dept_id` when 415 then 'http://10.220.80.40:8084/lifesigns/api/Upload' when 414 then 'http://10.220.69.6:8084/lifesigns/api/Upload' else 'http://10.220.69.6:8084/lifesigns/api/Upload' end) AS `glucose_url`,`sbg`.`measure_time` AS `measure_time`,`sp`.`id_card` AS `id_card`,`sbg`.`meature_value` AS `meature_value`,`sbg`.`measure_status` AS `evaluation`,`sbg`.`equipment_sn` AS `device_sn`,`sbg`.`data_status` AS `data_status`,`sbg`.`measure_period` AS `status`,`sbg`.`login_name` AS `login_name`,`sbg`.`other_remark` AS `no` from ((`sys_blood_glucose` `sbg` left join `sys_patient` `sp` on((`sbg`.`patient_id` = `sp`.`patient_id`))) left join `sys_dept` `sd` on((`sd`.`dept_id` = `sbg`.`dept_id`))) where ((`sbg`.`data_status` = '1') and (`sp`.`hospitalized_num` is not null) and (`sp`.`remark` is not null));

-- ----------------------------
-- View structure for patient_blood_glucose_view
-- ----------------------------
DROP VIEW IF EXISTS `patient_blood_glucose_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `patient_blood_glucose_view` AS select `sbg`.`id` AS `id`,`sbg`.`measure_time` AS `measure_time`,`sp`.`id_card` AS `identify_card`,`sbg`.`meature_value` AS `meature_value`,`sbg`.`measure_status` AS `evaluation`,`sbg`.`equipment_sn` AS `devicesn`,`sbg`.`data_status` AS `data_status`,`sbg`.`measure_period` AS `status`,`sd`.`dept_id` AS `deptid` from ((`sys_blood_glucose` `sbg` left join `sys_patient` `sp` on((`sbg`.`patient_id` = `sp`.`patient_id`))) left join `sys_dept` `sd` on((`sd`.`dept_id` = `sbg`.`dept_id`))) where ((`sp`.`id_card` <> '') and (`sbg`.`data_status` = 0));

-- ----------------------------
-- View structure for patient_blood_pressure_view
-- ----------------------------
DROP VIEW IF EXISTS `patient_blood_pressure_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `patient_blood_pressure_view` AS select `sbp`.`id` AS `id`,`sp`.`patient_id` AS `userid`,`sp`.`patient_name` AS `name`,`sp`.`birth` AS `birth`,`sp`.`sex` AS `sex`,`sbp`.`measure_time` AS `measure_time`,`sp`.`id_card` AS `identify_card`,ifnull(`sp`.`magnetic_card`,`sp`.`chip_card`) AS `card_number`,`sbp`.`systolic` AS `systolic`,`sbp`.`diastolic` AS `diastolic`,`sbp`.`pluse` AS `pluse`,if((`sbp`.`data_type` = 'average'),'1','0') AS `is_average`,`sbp`.`measure_status` AS `evaluation`,`sbp`.`hand` AS `hand`,`sbp`.`equipment_sn` AS `devicesn`,`sbp`.`parent_id` AS `parent_id`,`sbp`.`data_status` AS `status` from ((`sys_blood_pressure` `sbp` left join `sys_patient` `sp` on((`sbp`.`patient_id` = `sp`.`patient_id`))) left join `sys_dept` `sd` on((`sbp`.`dept_id` = `sd`.`dept_id`))) where ((`sp`.`id_card` <> '') and (`sbp`.`data_status` <> '3') and (`sbp`.`data_status` = '1') and (date_format(`sbp`.`measure_time`,'%Y%m') > 202103) and (date_format(`sbp`.`measure_time`,'%Y%m') < 202109));

-- ----------------------------
-- View structure for patientview
-- ----------------------------
DROP VIEW IF EXISTS `patientview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `patientview` AS select `sp`.`patient_id` AS `patient_id`,`sp`.`patient_name` AS `patient_name`,`sp`.`hospitalized_num` AS `hospitalized_num`,ifnull(`sp`.`chip_card`,`sp`.`magnetic_card`) AS `chip_card`,`sp`.`remark` AS `remark`,(case `sp`.`dept_id` when 415 then replace('http://10.220.80.40:8084/lifesigns/api/listMzpatients?ghrq=ghdate&hospID=01','ghdate',date_format(now(),'%Y%m%d')) when 414 then replace('http://10.220.69.6:8084/lifesigns/api/listMzpatients?ghrq=ghdate&hospID=01','ghdate',date_format(now(),'%Y%m%d')) else replace('http://10.220.80.40:8084/lifesigns/api/listMzpatients?ghrq=ghdate&hospID=01','ghdate',date_format(now(),'%Y%m%d')) end) AS `patienturl` from `sys_patient` `sp` where (`sp`.`update_time` > (now() + interval -(10) minute));

-- ----------------------------
-- View structure for pressure_view
-- ----------------------------
DROP VIEW IF EXISTS `pressure_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `pressure_view` AS select `sbp`.`id` AS `id`,`sp`.`hospitalized_num` AS `hospitalized_num`,`sp`.`remark` AS `patient_id`,(case `sd`.`dept_id` when 415 then 'http://10.220.80.40:8084/lifesigns/api/Upload' when 414 then 'http://10.220.69.6:8084/lifesigns/api/Upload' else 'http://10.220.80.40:8084/lifesigns/api/Upload' end) AS `pressure_url`,`sbp`.`measure_time` AS `measure_time`,`sbp`.`systolic` AS `systolic`,`sbp`.`diastolic` AS `diastolic`,`sbp`.`pluse` AS `pluse`,`sbp`.`data_status` AS `status`,`sbp`.`dept_id` AS `deptid` from ((`sys_blood_pressure` `sbp` left join `sys_patient` `sp` on((`sbp`.`patient_id` = `sp`.`patient_id`))) left join `sys_dept` `sd` on((`sp`.`dept_id` = `sd`.`dept_id`))) where ((`sp`.`remark` is not null) and (`sp`.`hospitalized_num` is not null) and (`sbp`.`data_status` = 1));

SET FOREIGN_KEY_CHECKS = 1;
