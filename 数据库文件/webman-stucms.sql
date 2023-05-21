/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50728 (5.7.28)
 Source Host           : localhost:3306
 Source Schema         : webman-stucms

 Target Server Type    : MySQL
 Target Server Version : 50728 (5.7.28)
 File Encoding         : 65001

 Date: 21/05/2023 11:42:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stu_courses
-- ----------------------------
DROP TABLE IF EXISTS `stu_courses`;
CREATE TABLE `stu_courses`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `full` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '满分',
  `teacher_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '授课老师',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `courses_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_courses
-- ----------------------------
INSERT INTO `stu_courses` VALUES (1, '语文', 150, 2, '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_courses` VALUES (2, '数学', 150, 3, '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_courses` VALUES (3, '英语', 150, 7, '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_courses` VALUES (4, '物理', 100, 5, '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_courses` VALUES (5, '化学', 100, 3, '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_courses` VALUES (6, '生物', 100, 1, '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_courses` VALUES (7, '地理', 100, 3, '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_courses` VALUES (8, '政治', 100, 7, '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_courses` VALUES (9, '历史', 100, 4, '2021-04-03 00:28:11', '2021-04-03 00:28:11');

-- ----------------------------
-- Table structure for stu_exams
-- ----------------------------
DROP TABLE IF EXISTS `stu_exams`;
CREATE TABLE `stu_exams`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '考试名称',
  `time` date NOT NULL COMMENT '考试时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '考试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_exams
-- ----------------------------
INSERT INTO `stu_exams` VALUES (1, '第一次月考', '2020-01-01', '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_exams` VALUES (2, '第二次月考', '2020-02-07', '2021-04-03 00:28:11', '2023-04-01 17:00:39');
INSERT INTO `stu_exams` VALUES (3, '第三次月考', '2020-03-01', '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_exams` VALUES (4, '第四次月考', '2020-04-01', '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_exams` VALUES (5, '第一学期半期考', '2020-05-01', '2021-04-03 00:28:11', '2021-04-03 00:28:11');
INSERT INTO `stu_exams` VALUES (6, '第一学期期末考', '2020-06-01', '2021-04-03 00:28:11', '2021-04-03 00:28:11');

-- ----------------------------
-- Table structure for stu_scores
-- ----------------------------
DROP TABLE IF EXISTS `stu_scores`;
CREATE TABLE `stu_scores`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `score` float(5, 2) UNSIGNED NOT NULL COMMENT '成绩',
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT '学生ID',
  `exam_id` bigint(20) UNSIGNED NOT NULL COMMENT '考试ID',
  `course_id` bigint(20) UNSIGNED NOT NULL COMMENT '课程ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 349 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '成绩表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_scores
-- ----------------------------
INSERT INTO `stu_scores` VALUES (42, 67.00, 3, 5, 3, '2020-09-13 01:26:57', '2020-09-13 01:26:57');
INSERT INTO `stu_scores` VALUES (43, 77.00, 3, 5, 4, '2020-09-13 01:26:57', '2020-09-13 01:26:57');
INSERT INTO `stu_scores` VALUES (44, 77.00, 3, 5, 5, '2020-09-13 01:26:57', '2020-09-13 01:26:57');
INSERT INTO `stu_scores` VALUES (45, 127.00, 3, 5, 6, '2020-09-13 01:26:57', '2020-09-13 01:26:57');
INSERT INTO `stu_scores` VALUES (46, 99.00, 3, 5, 7, '2020-09-13 01:26:57', '2020-09-13 01:26:57');
INSERT INTO `stu_scores` VALUES (47, 99.00, 3, 5, 8, '2020-09-13 01:26:57', '2020-09-13 01:26:57');
INSERT INTO `stu_scores` VALUES (48, 87.00, 3, 5, 9, '2020-09-13 01:26:57', '2020-09-13 01:26:57');
INSERT INTO `stu_scores` VALUES (51, 101.00, 3, 6, 3, '2020-09-13 01:57:55', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (52, 89.00, 3, 6, 4, '2020-09-13 01:57:55', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (53, 90.00, 3, 6, 5, '2020-09-13 01:57:55', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (54, 81.00, 3, 6, 6, '2020-09-13 01:57:55', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (55, 76.00, 3, 6, 7, '2020-09-13 01:57:55', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (56, 79.00, 3, 6, 8, '2020-09-13 01:57:55', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (57, 72.00, 3, 6, 9, '2020-09-13 01:57:55', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (115, 127.00, 3, 1, 3, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (116, 79.00, 3, 1, 4, '2020-09-19 17:21:48', '2020-10-20 22:53:03');
INSERT INTO `stu_scores` VALUES (117, 89.00, 3, 1, 5, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (118, 95.00, 3, 1, 6, '2020-09-19 17:21:48', '2021-01-02 15:38:41');
INSERT INTO `stu_scores` VALUES (119, 90.00, 3, 1, 7, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (120, 78.00, 3, 1, 8, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (121, 88.00, 3, 1, 9, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (124, 145.00, 4, 1, 3, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (125, 97.00, 4, 1, 4, '2020-09-19 17:22:16', '2020-10-24 19:16:02');
INSERT INTO `stu_scores` VALUES (126, 94.00, 4, 1, 5, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (127, 89.00, 4, 1, 6, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (128, 76.00, 4, 1, 7, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (129, 79.00, 4, 1, 8, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (130, 89.00, 4, 1, 9, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (133, 143.00, 6, 1, 3, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (134, 89.00, 6, 1, 4, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (135, 87.00, 6, 1, 5, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (136, 88.00, 6, 1, 6, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (137, 77.00, 6, 1, 7, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (138, 77.00, 6, 1, 8, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (139, 75.00, 6, 1, 9, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (142, 122.00, 4, 3, 3, '2020-09-20 09:38:31', '2020-09-20 09:38:31');
INSERT INTO `stu_scores` VALUES (143, 79.00, 4, 3, 4, '2020-09-20 09:38:31', '2020-09-21 08:29:34');
INSERT INTO `stu_scores` VALUES (144, 78.00, 4, 3, 5, '2020-09-20 09:38:31', '2020-09-20 09:38:31');
INSERT INTO `stu_scores` VALUES (145, 89.00, 4, 3, 6, '2020-09-20 09:38:31', '2020-09-20 09:38:31');
INSERT INTO `stu_scores` VALUES (146, 87.00, 4, 3, 7, '2020-09-20 09:38:31', '2020-09-20 09:38:31');
INSERT INTO `stu_scores` VALUES (147, 67.00, 4, 3, 8, '2020-09-20 09:38:31', '2020-09-20 09:38:31');
INSERT INTO `stu_scores` VALUES (148, 67.00, 4, 3, 9, '2020-09-20 09:38:31', '2020-09-20 09:38:31');
INSERT INTO `stu_scores` VALUES (151, 133.00, 4, 4, 3, '2020-09-20 09:39:43', '2020-09-20 09:39:43');
INSERT INTO `stu_scores` VALUES (152, 89.00, 4, 4, 4, '2020-09-20 09:39:43', '2020-09-20 09:39:43');
INSERT INTO `stu_scores` VALUES (153, 98.00, 4, 4, 5, '2020-09-20 09:39:43', '2020-09-20 09:39:43');
INSERT INTO `stu_scores` VALUES (154, 88.00, 4, 4, 6, '2020-09-20 09:39:43', '2020-09-20 09:39:43');
INSERT INTO `stu_scores` VALUES (155, 87.00, 4, 4, 7, '2020-09-20 09:39:43', '2020-09-20 09:39:43');
INSERT INTO `stu_scores` VALUES (156, 67.00, 4, 4, 8, '2020-09-20 09:39:43', '2020-09-20 09:39:43');
INSERT INTO `stu_scores` VALUES (157, 89.00, 4, 4, 9, '2020-09-20 09:39:43', '2020-09-20 09:39:43');
INSERT INTO `stu_scores` VALUES (169, 135.00, 2, 3, 3, '2020-09-20 10:38:07', '2020-09-20 10:38:07');
INSERT INTO `stu_scores` VALUES (170, 78.00, 2, 3, 4, '2020-09-20 10:38:07', '2020-09-20 10:38:07');
INSERT INTO `stu_scores` VALUES (171, 78.00, 2, 3, 5, '2020-09-20 10:38:07', '2020-09-20 10:38:07');
INSERT INTO `stu_scores` VALUES (172, 88.00, 2, 3, 6, '2020-09-20 10:38:07', '2020-09-20 10:38:07');
INSERT INTO `stu_scores` VALUES (173, 90.00, 2, 3, 7, '2020-09-20 10:38:07', '2020-09-20 10:38:07');
INSERT INTO `stu_scores` VALUES (174, 95.00, 2, 3, 8, '2020-09-20 10:38:07', '2020-09-20 10:38:07');
INSERT INTO `stu_scores` VALUES (175, 89.00, 2, 3, 9, '2020-09-20 10:38:07', '2020-09-20 10:38:07');
INSERT INTO `stu_scores` VALUES (178, 136.00, 2, 4, 3, '2020-09-20 22:47:55', '2020-09-20 22:47:55');
INSERT INTO `stu_scores` VALUES (179, 78.00, 2, 4, 4, '2020-09-20 22:47:55', '2020-09-20 22:47:55');
INSERT INTO `stu_scores` VALUES (180, 89.00, 2, 4, 5, '2020-09-20 22:47:55', '2020-09-20 22:47:55');
INSERT INTO `stu_scores` VALUES (181, 86.00, 2, 4, 6, '2020-09-20 22:47:55', '2020-09-20 22:47:55');
INSERT INTO `stu_scores` VALUES (182, 94.00, 2, 4, 7, '2020-09-20 22:47:55', '2020-09-20 22:47:55');
INSERT INTO `stu_scores` VALUES (183, 87.00, 2, 4, 8, '2020-09-20 22:47:55', '2020-09-20 22:47:55');
INSERT INTO `stu_scores` VALUES (184, 82.00, 2, 4, 9, '2020-09-20 22:47:55', '2020-09-20 22:47:55');
INSERT INTO `stu_scores` VALUES (187, 132.00, 2, 5, 3, '2020-09-20 22:49:33', '2020-09-20 22:49:33');
INSERT INTO `stu_scores` VALUES (188, 78.00, 2, 5, 4, '2020-09-20 22:49:33', '2020-09-20 22:49:33');
INSERT INTO `stu_scores` VALUES (189, 76.00, 2, 5, 5, '2020-09-20 22:49:33', '2020-09-20 22:49:33');
INSERT INTO `stu_scores` VALUES (190, 76.00, 2, 5, 6, '2020-09-20 22:49:33', '2020-09-20 22:49:33');
INSERT INTO `stu_scores` VALUES (191, 88.00, 2, 5, 7, '2020-09-20 22:49:33', '2020-09-20 22:49:33');
INSERT INTO `stu_scores` VALUES (192, 89.00, 2, 5, 8, '2020-09-20 22:49:33', '2020-09-20 22:49:33');
INSERT INTO `stu_scores` VALUES (193, 88.00, 2, 5, 9, '2020-09-20 22:49:33', '2020-09-20 22:49:33');
INSERT INTO `stu_scores` VALUES (196, 100.00, 2, 6, 3, '2020-09-20 22:49:55', '2023-05-20 11:15:40');
INSERT INTO `stu_scores` VALUES (197, 88.00, 2, 6, 4, '2020-09-20 22:49:55', '2023-05-20 11:15:40');
INSERT INTO `stu_scores` VALUES (198, 90.00, 2, 6, 5, '2020-09-20 22:49:55', '2023-05-20 11:15:40');
INSERT INTO `stu_scores` VALUES (199, 80.00, 2, 6, 6, '2020-09-20 22:49:55', '2023-05-20 11:15:40');
INSERT INTO `stu_scores` VALUES (200, 75.00, 2, 6, 7, '2020-09-20 22:49:55', '2023-05-20 11:15:40');
INSERT INTO `stu_scores` VALUES (201, 78.00, 2, 6, 8, '2020-09-20 22:49:55', '2023-05-20 11:15:40');
INSERT INTO `stu_scores` VALUES (202, 71.00, 2, 6, 9, '2020-09-20 22:49:55', '2023-05-20 11:15:40');
INSERT INTO `stu_scores` VALUES (203, 79.00, 4, 2, 8, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (204, 87.00, 6, 2, 5, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (205, 89.00, 6, 2, 4, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (206, 143.00, 6, 2, 3, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (207, 127.00, 3, 2, 3, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (208, 79.00, 3, 2, 4, '2020-09-19 17:21:48', '2020-10-20 22:53:03');
INSERT INTO `stu_scores` VALUES (209, 89.00, 3, 2, 5, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (210, 90.00, 3, 2, 6, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (211, 90.00, 3, 2, 7, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (212, 78.00, 3, 2, 8, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (213, 89.00, 3, 2, 9, '2020-09-19 17:21:48', '2020-09-19 17:21:48');
INSERT INTO `stu_scores` VALUES (214, 140.00, 4, 2, 3, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (215, 92.00, 4, 2, 4, '2020-09-19 17:22:16', '2020-10-24 19:16:02');
INSERT INTO `stu_scores` VALUES (216, 90.00, 4, 2, 5, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (217, 85.00, 4, 2, 9, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (218, 89.00, 4, 2, 7, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (219, 92.00, 6, 2, 6, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (220, 90.00, 6, 2, 7, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (221, 82.00, 4, 2, 6, '2020-09-19 17:22:16', '2020-09-19 17:22:16');
INSERT INTO `stu_scores` VALUES (222, 75.00, 6, 2, 9, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (223, 77.00, 6, 2, 8, '2020-09-20 09:35:53', '2020-09-20 09:35:53');
INSERT INTO `stu_scores` VALUES (224, 136.00, 8, 1, 1, '2020-10-25 19:23:06', '2020-10-25 19:23:06');
INSERT INTO `stu_scores` VALUES (225, 116.00, 8, 1, 2, '2020-10-25 19:23:06', '2020-10-25 19:23:06');
INSERT INTO `stu_scores` VALUES (226, 125.00, 8, 1, 3, '2020-10-25 19:23:06', '2020-10-25 19:23:06');
INSERT INTO `stu_scores` VALUES (227, 82.00, 8, 1, 4, '2020-10-25 19:23:06', '2020-10-25 19:23:06');
INSERT INTO `stu_scores` VALUES (228, 69.00, 8, 1, 5, '2020-10-25 19:23:06', '2020-10-25 19:23:06');
INSERT INTO `stu_scores` VALUES (229, 75.00, 8, 1, 6, '2020-10-25 19:23:06', '2020-10-25 19:23:06');
INSERT INTO `stu_scores` VALUES (230, 77.00, 8, 1, 7, '2020-10-25 19:23:06', '2020-10-25 19:23:06');
INSERT INTO `stu_scores` VALUES (231, 75.00, 8, 1, 8, '2020-10-25 19:23:06', '2020-10-25 19:23:06');
INSERT INTO `stu_scores` VALUES (232, 66.00, 8, 1, 9, '2020-10-25 19:23:06', '2021-04-16 09:08:39');
INSERT INTO `stu_scores` VALUES (233, 136.00, 2, 1, 1, '2020-11-03 11:22:17', '2023-04-03 18:55:27');
INSERT INTO `stu_scores` VALUES (234, 10.00, 2, 1, 2, '2020-11-03 11:22:17', '2020-12-25 11:49:03');
INSERT INTO `stu_scores` VALUES (235, 2.00, 2, 1, 3, '2020-11-03 11:22:17', '2021-04-19 21:44:16');
INSERT INTO `stu_scores` VALUES (236, 1.00, 2, 1, 4, '2020-11-03 11:22:17', '2020-11-03 11:22:17');
INSERT INTO `stu_scores` VALUES (237, 1.00, 2, 1, 5, '2020-11-03 11:22:17', '2020-11-03 11:22:17');
INSERT INTO `stu_scores` VALUES (238, 1.00, 2, 1, 6, '2020-11-03 11:22:17', '2020-11-03 11:22:17');
INSERT INTO `stu_scores` VALUES (239, 2.00, 2, 1, 7, '2020-11-03 11:22:17', '2020-11-03 11:22:17');
INSERT INTO `stu_scores` VALUES (240, 12.00, 2, 1, 8, '2020-11-03 11:22:17', '2021-02-27 17:11:11');
INSERT INTO `stu_scores` VALUES (241, 4.00, 2, 1, 9, '2020-11-03 11:22:17', '2020-11-03 11:22:17');
INSERT INTO `stu_scores` VALUES (242, 23.00, 2, 2, 1, '2020-11-03 11:22:47', '2022-10-02 21:01:26');
INSERT INTO `stu_scores` VALUES (243, 4.00, 2, 2, 2, '2020-11-03 11:22:47', '2020-11-03 11:22:47');
INSERT INTO `stu_scores` VALUES (244, 3.00, 2, 2, 3, '2020-11-03 11:22:47', '2020-11-03 11:22:47');
INSERT INTO `stu_scores` VALUES (245, 4.00, 2, 2, 4, '2020-11-03 11:22:47', '2020-11-03 11:22:47');
INSERT INTO `stu_scores` VALUES (246, 3.00, 2, 2, 5, '2020-11-03 11:22:47', '2020-11-03 11:22:47');
INSERT INTO `stu_scores` VALUES (247, 5.00, 2, 2, 6, '2020-11-03 11:22:47', '2021-04-16 09:09:33');
INSERT INTO `stu_scores` VALUES (248, 2.00, 2, 2, 7, '2020-11-03 11:22:47', '2020-11-03 11:22:47');
INSERT INTO `stu_scores` VALUES (249, 1.00, 2, 2, 8, '2020-11-03 11:22:47', '2020-11-03 11:22:47');
INSERT INTO `stu_scores` VALUES (250, 1.00, 2, 2, 9, '2020-11-03 11:22:47', '2020-11-03 11:22:47');
INSERT INTO `stu_scores` VALUES (251, 99.00, 3, 5, 1, '2020-11-09 00:18:32', '2020-11-09 00:18:32');
INSERT INTO `stu_scores` VALUES (252, 88.00, 3, 5, 2, '2020-11-09 00:18:32', '2020-11-09 00:18:32');
INSERT INTO `stu_scores` VALUES (253, 98.00, 3, 2, 1, '2020-11-09 12:48:59', '2020-11-09 12:48:59');
INSERT INTO `stu_scores` VALUES (254, 89.00, 3, 2, 2, '2020-11-09 12:48:59', '2020-11-09 12:48:59');
INSERT INTO `stu_scores` VALUES (255, 100.00, 6, 4, 1, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (256, 100.00, 6, 4, 2, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (257, 80.00, 6, 4, 3, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (258, 58.00, 6, 4, 4, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (259, 65.00, 6, 4, 5, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (260, 65.00, 6, 4, 6, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (261, 75.00, 6, 4, 7, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (262, 76.00, 6, 4, 8, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (263, 44.00, 6, 4, 9, '2020-11-14 05:14:41', '2020-11-14 05:14:41');
INSERT INTO `stu_scores` VALUES (265, 126.00, 8, 6, 1, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (266, 104.00, 8, 6, 2, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (267, 106.00, 8, 6, 3, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (268, 94.00, 8, 6, 4, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (269, 90.00, 8, 6, 5, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (270, 86.00, 8, 6, 6, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (271, 81.00, 8, 6, 7, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (272, 84.00, 8, 6, 8, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (273, 77.00, 8, 6, 9, '2020-12-17 20:17:23', '2023-05-20 11:15:46');
INSERT INTO `stu_scores` VALUES (287, 120.00, 2, 6, 1, '2020-10-25 19:23:06', '2023-05-20 11:15:38');
INSERT INTO `stu_scores` VALUES (288, 98.00, 2, 6, 2, '2020-10-25 19:23:06', '2023-05-20 11:15:40');
INSERT INTO `stu_scores` VALUES (289, 99.00, 3, 6, 2, '2020-10-25 19:23:06', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (290, 121.00, 3, 6, 1, '2020-10-25 19:23:06', '2023-05-20 11:15:43');
INSERT INTO `stu_scores` VALUES (291, 24.00, 3, 1, 1, '2020-12-26 18:43:46', '2023-04-03 19:05:08');
INSERT INTO `stu_scores` VALUES (292, 66.00, 3, 1, 2, '2020-12-26 18:43:46', '2020-12-26 18:43:46');
INSERT INTO `stu_scores` VALUES (313, 122.00, 4, 6, 1, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (314, 100.00, 4, 6, 2, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (315, 102.00, 4, 6, 3, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (316, 90.00, 4, 6, 4, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (317, 90.00, 4, 6, 5, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (318, 82.00, 4, 6, 6, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (319, 77.00, 4, 6, 7, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (320, 80.00, 4, 6, 8, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (321, 73.00, 4, 6, 9, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (322, 123.00, 5, 6, 1, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (323, 101.00, 5, 6, 2, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (324, 103.00, 5, 6, 3, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (325, 91.00, 5, 6, 4, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (326, 90.00, 5, 6, 5, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (327, 83.00, 5, 6, 6, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (328, 78.00, 5, 6, 7, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (329, 81.00, 5, 6, 8, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (330, 74.00, 5, 6, 9, '2023-05-20 11:15:44', '2023-05-20 11:15:44');
INSERT INTO `stu_scores` VALUES (331, 124.00, 6, 6, 1, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (332, 102.00, 6, 6, 2, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (333, 104.00, 6, 6, 3, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (334, 92.00, 6, 6, 4, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (335, 90.00, 6, 6, 5, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (336, 84.00, 6, 6, 6, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (337, 79.00, 6, 6, 7, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (338, 82.00, 6, 6, 8, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (339, 75.00, 6, 6, 9, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (340, 125.00, 7, 6, 1, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (341, 103.00, 7, 6, 2, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (342, 105.00, 7, 6, 3, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (343, 93.00, 7, 6, 4, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (344, 90.00, 7, 6, 5, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (345, 85.00, 7, 6, 6, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (346, 80.00, 7, 6, 7, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (347, 83.00, 7, 6, 8, '2023-05-20 11:15:45', '2023-05-20 11:15:45');
INSERT INTO `stu_scores` VALUES (348, 76.00, 7, 6, 9, '2023-05-20 11:15:45', '2023-05-20 11:15:45');

-- ----------------------------
-- Table structure for stu_students
-- ----------------------------
DROP TABLE IF EXISTS `stu_students`;
CREATE TABLE `stu_students`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `sysid` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份证号',
  `birth` date NOT NULL COMMENT '出生年月',
  `minzu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '民族',
  `jingguan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '籍贯',
  `hukou` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '户籍',
  `huji` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '户籍地址',
  `xianzz` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '现住址',
  `liushou` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否留守儿童',
  `biye` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `huojiang` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '获奖情况',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_uid_index`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_students
-- ----------------------------
INSERT INTO `stu_students` VALUES (2, 'student', '学生', '男', '110120119', '111196308564', '2023-05-16', '汉', '', '', 'The past has no pow', '', 0, '', '', '2023-05-16 16:08:46', '2023-05-16 16:08:46');
INSERT INTO `stu_students` VALUES (3, '11536946', '黎帅', '男', '13257950920', '23639283', '1985-12-11', '畲', '福建霞浦', NULL, NULL, NULL, 0, '联软传媒有限公司', NULL, '2006-09-28 23:11:05', '2008-09-23 05:41:03');
INSERT INTO `stu_students` VALUES (4, '90460066', '凌晶', '女', '18137801518', '20798288', '2000-02-16', '汉', '福建霞浦', '', '', '', 0, '维旺明科技有限公司', '', '2012-02-19 09:17:25', '2023-03-30 22:21:01');
INSERT INTO `stu_students` VALUES (5, '42365184', '秦冰冰', '男', '13900316761', '87890951', '1973-01-27', '畲', '福建霞浦', NULL, NULL, NULL, 0, '创亿网络有限公司', NULL, '2007-05-03 08:22:12', '1972-04-18 09:30:02');
INSERT INTO `stu_students` VALUES (6, '97827816', '欧玉英', '男', '17767230472', '98366073', '1997-08-17', '畲', '福建霞浦', NULL, NULL, NULL, 0, '飞利信信息有限公司', NULL, '1986-12-12 16:33:45', '1979-04-17 17:56:59');
INSERT INTO `stu_students` VALUES (7, '97452034', '窦成', '男', '17799603758', '14592028', '2018-09-23', '汉', '福建霞浦', NULL, NULL, NULL, 0, '昂歌信息传媒有限公司', NULL, '1972-04-19 20:05:45', '2007-08-13 02:06:51');
INSERT INTO `stu_students` VALUES (8, '34185498', '赵娜', '女', '17197588113', '96107232', '1983-06-22', '畲', '福建霞浦', NULL, NULL, NULL, 0, '双敏电子信息有限公司', NULL, '1989-03-10 12:26:16', '1988-12-29 20:13:34');

-- ----------------------------
-- Table structure for stu_teachers
-- ----------------------------
DROP TABLE IF EXISTS `stu_teachers`;
CREATE TABLE `stu_teachers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '老师表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_teachers
-- ----------------------------
INSERT INTO `stu_teachers` VALUES (1, '沿明霞', '女', '18693843205', '30921280', '2004-04-19 10:21:58', '1986-03-30 09:58:31');
INSERT INTO `stu_teachers` VALUES (2, '季红', '女', '13202609640', '96133282', '2008-11-06 07:18:59', '2001-06-19 23:58:26');
INSERT INTO `stu_teachers` VALUES (3, '米平', '女', '15794232443', '11986672', '1991-06-26 21:23:47', '1976-06-14 10:17:14');
INSERT INTO `stu_teachers` VALUES (4, '蔺超', '男', '17194789423', '79603817', '2020-06-13 18:36:11', '1997-02-21 10:43:24');
INSERT INTO `stu_teachers` VALUES (5, '房晨', '男', '17090885187', '97473593', '1995-07-28 19:13:58', '2002-07-07 07:57:39');
INSERT INTO `stu_teachers` VALUES (6, '位静', '男', '17805364779', '33524284', '2017-09-23 12:58:34', '1983-11-22 23:31:43');
INSERT INTO `stu_teachers` VALUES (7, '敖春梅', '女', '14527895864', '60040396', '1983-06-03 22:21:30', '1991-07-27 02:12:58');
INSERT INTO `stu_teachers` VALUES (8, '符超', '女', '15696544875', '66254164', '2018-12-06 21:50:37', '1974-12-24 22:35:07');
INSERT INTO `stu_teachers` VALUES (9, '卢明', '男', '15130718072', '37366540', '2005-03-03 16:47:24', '2019-11-27 02:32:24');
INSERT INTO `stu_teachers` VALUES (10, '靳凤英', '女', '15607294664', '54964014', '2008-02-10 07:13:25', '1986-11-26 00:53:09');

-- ----------------------------
-- Table structure for wa_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `wa_admin_roles`;
CREATE TABLE `wa_admin_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_admin_id`(`role_id`, `admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_admin_roles
-- ----------------------------
INSERT INTO `wa_admin_roles` VALUES (1, 1, 1);
INSERT INTO `wa_admin_roles` VALUES (5, 6, 6);
INSERT INTO `wa_admin_roles` VALUES (6, 6, 7);
INSERT INTO `wa_admin_roles` VALUES (7, 6, 8);
INSERT INTO `wa_admin_roles` VALUES (8, 6, 9);
INSERT INTO `wa_admin_roles` VALUES (9, 6, 10);
INSERT INTO `wa_admin_roles` VALUES (10, 6, 11);
INSERT INTO `wa_admin_roles` VALUES (17, 6, 20);

-- ----------------------------
-- Table structure for wa_admins
-- ----------------------------
DROP TABLE IF EXISTS `wa_admins`;
CREATE TABLE `wa_admins`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/app/admin/avatar.png' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `login_at` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_admins
-- ----------------------------
INSERT INTO `wa_admins` VALUES (1, 'admin', '超级管理员', '$2y$10$bjpPtOAugAC/UpIRaoxRW.t6tYM65ig5fuAh/kfSuEPsfdbXAO9Ra', '/app/admin/avatar.png', NULL, NULL, '2023-03-18 09:43:46', '2023-05-20 22:41:51', '2023-05-20 22:41:22', NULL);
INSERT INTO `wa_admins` VALUES (6, '11536946', '黎帅', '$2y$10$QKZk/X8rQL9ic57DPTkOBO7/v2LQByDK1w8tmaNJnN0dhhIGlkpeG', '/app/admin/avatar.png', NULL, NULL, '2023-05-16 14:47:40', '2023-05-16 14:47:40', NULL, NULL);
INSERT INTO `wa_admins` VALUES (7, '90460066', '凌晶', '$2y$10$zmKIFLT/0c5HNtqogvFt3eTIxJpscACbvR523cbnyEu0IWJ7UP7Qm', '/app/admin/avatar.png', NULL, NULL, '2023-05-16 14:47:47', '2023-05-16 14:47:47', NULL, NULL);
INSERT INTO `wa_admins` VALUES (8, '42365184', '秦冰冰', '$2y$10$uopaf2xDxMlhwU5JO0/yHedrtBG4faD.kxVBX5E28U.rjl1V4d54C', '/app/admin/avatar.png', NULL, NULL, '2023-05-16 14:47:48', '2023-05-16 14:47:48', NULL, NULL);
INSERT INTO `wa_admins` VALUES (9, '97827816', '欧玉英', '$2y$10$bGpY2dtE81HDeVmRO5nYP.Uglo/dLC4CEcssX9BHKU4DJZpwnSCPS', '/app/admin/avatar.png', NULL, NULL, '2023-05-16 14:47:49', '2023-05-16 14:47:49', NULL, NULL);
INSERT INTO `wa_admins` VALUES (10, '97452034', '窦成', '$2y$10$0edHyDkBCDr/ew4wAYPPmOj3qpasnM5vbjyXNf3af2lAxuV77M6au', '/app/admin/avatar.png', NULL, NULL, '2023-05-16 14:47:49', '2023-05-16 14:47:49', NULL, NULL);
INSERT INTO `wa_admins` VALUES (11, '34185498', '赵娜', '$2y$10$KPEDebfjfnKTyNOcmaE3NO18dKcDa3SAAhcMPV3Tkpvcsh0334c2u', '/app/admin/avatar.png', NULL, NULL, '2023-05-16 14:47:50', '2023-05-16 14:47:50', NULL, NULL);
INSERT INTO `wa_admins` VALUES (20, 'student', '学生', '$2y$10$2bU.TA9uZFg4rUUOynn/lOWLlBTfn52XNT.grlIBznW2CW25stkWm', '/app/admin/avatar.png', NULL, NULL, '2023-05-16 16:08:46', '2023-05-20 15:44:39', '2023-05-20 15:44:39', NULL);

-- ----------------------------
-- Table structure for wa_options
-- ----------------------------
DROP TABLE IF EXISTS `wa_options`;
CREATE TABLE `wa_options`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值',
  `created_at` datetime NOT NULL DEFAULT '2022-08-15 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '2022-08-15 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_options
-- ----------------------------
INSERT INTO `wa_options` VALUES (2, 'table_form_schema_wa_users', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"sex\":{\"field\":\"sex\",\"_field_id\":\"4\",\"comment\":\"性别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/sex\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"5\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"6\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"7\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"level\":{\"field\":\"level\",\"_field_id\":\"8\",\"comment\":\"等级\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"birthday\":{\"field\":\"birthday\",\"_field_id\":\"9\",\"comment\":\"生日\",\"control\":\"datePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"money\":{\"field\":\"money\",\"_field_id\":\"10\",\"comment\":\"余额(元)\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"score\":{\"field\":\"score\",\"_field_id\":\"11\",\"comment\":\"积分\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"last_time\":{\"field\":\"last_time\",\"_field_id\":\"12\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"last_ip\":{\"field\":\"last_ip\",\"_field_id\":\"13\",\"comment\":\"登录ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"join_time\":{\"field\":\"join_time\",\"_field_id\":\"14\",\"comment\":\"注册时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"join_ip\":{\"field\":\"join_ip\",\"_field_id\":\"15\",\"comment\":\"注册ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"token\":{\"field\":\"token\",\"_field_id\":\"16\",\"comment\":\"token\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"17\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"18\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"role\":{\"field\":\"role\",\"_field_id\":\"19\",\"comment\":\"角色\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"20\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-23 15:28:13');
INSERT INTO `wa_options` VALUES (3, 'table_form_schema_wa_roles', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"角色组\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"rules\":{\"field\":\"rules\",\"_field_id\":\"2\",\"comment\":\"权限\",\"control\":\"treeSelectMulti\",\"control_args\":\"url:\\/app\\/admin\\/rule\\/get?type=0,1,2\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"5\",\"comment\":\"父级\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/role\\/select?format=tree\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-19 14:24:25');
INSERT INTO `wa_options` VALUES (4, 'table_form_schema_wa_rules', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"title\":{\"field\":\"title\",\"_field_id\":\"1\",\"comment\":\"标题\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"icon\":{\"field\":\"icon\",\"_field_id\":\"2\",\"comment\":\"图标\",\"control\":\"iconPicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"key\":{\"field\":\"key\",\"_field_id\":\"3\",\"comment\":\"标识\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"4\",\"comment\":\"上级菜单\",\"control\":\"treeSelect\",\"control_args\":\"\\/app\\/admin\\/rule\\/select?format=tree&type=0,1\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"5\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"6\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"href\":{\"field\":\"href\",\"_field_id\":\"7\",\"comment\":\"url\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"type\":{\"field\":\"type\",\"_field_id\":\"8\",\"comment\":\"类型\",\"control\":\"select\",\"control_args\":\"data:0:目录,1:菜单,2:权限\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"weight\":{\"field\":\"weight\",\"_field_id\":\"9\",\"comment\":\"排序\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:44:45');
INSERT INTO `wa_options` VALUES (5, 'table_form_schema_wa_admins', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"between\",\"form_show\":false,\"searchable\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"4\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"5\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"6\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"7\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"8\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"login_at\":{\"field\":\"login_at\",\"_field_id\":\"9\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"between\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"10\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-23 15:36:48');
INSERT INTO `wa_options` VALUES (6, 'table_form_schema_wa_options', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"键\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"value\":{\"field\":\"value\",\"_field_id\":\"2\",\"comment\":\"值\",\"control\":\"textArea\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:36:57');
INSERT INTO `wa_options` VALUES (7, 'table_form_schema_wa_uploads', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"名称\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"url\":{\"field\":\"url\",\"_field_id\":\"2\",\"comment\":\"文件\",\"control\":\"upload\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/file\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"3\",\"comment\":\"管理员\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/admin\\/select?format=select\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"file_size\":{\"field\":\"file_size\",\"_field_id\":\"4\",\"comment\":\"文件大小\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"mime_type\":{\"field\":\"mime_type\",\"_field_id\":\"5\",\"comment\":\"mime类型\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_width\":{\"field\":\"image_width\",\"_field_id\":\"6\",\"comment\":\"图片宽度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_height\":{\"field\":\"image_height\",\"_field_id\":\"7\",\"comment\":\"图片高度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"ext\":{\"field\":\"ext\",\"_field_id\":\"8\",\"comment\":\"扩展名\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"storage\":{\"field\":\"storage\",\"_field_id\":\"9\",\"comment\":\"存储位置\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"10\",\"comment\":\"上传时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"searchable\":true,\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false},\"category\":{\"field\":\"category\",\"_field_id\":\"11\",\"comment\":\"类别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/upload\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"12\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:47:45');
INSERT INTO `wa_options` VALUES (8, 'table_form_schema_wa_uploads', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"名称\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"url\":{\"field\":\"url\",\"_field_id\":\"2\",\"comment\":\"文件\",\"control\":\"upload\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/file\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"3\",\"comment\":\"管理员\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/admin\\/select?format=select\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"file_size\":{\"field\":\"file_size\",\"_field_id\":\"4\",\"comment\":\"文件大小\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"mime_type\":{\"field\":\"mime_type\",\"_field_id\":\"5\",\"comment\":\"mime类型\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_width\":{\"field\":\"image_width\",\"_field_id\":\"6\",\"comment\":\"图片宽度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_height\":{\"field\":\"image_height\",\"_field_id\":\"7\",\"comment\":\"图片高度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"ext\":{\"field\":\"ext\",\"_field_id\":\"8\",\"comment\":\"扩展名\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"storage\":{\"field\":\"storage\",\"_field_id\":\"9\",\"comment\":\"存储位置\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"10\",\"comment\":\"上传时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"searchable\":true,\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false},\"category\":{\"field\":\"category\",\"_field_id\":\"11\",\"comment\":\"类别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/upload\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"12\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:47:45');
INSERT INTO `wa_options` VALUES (9, 'dict_upload', '[{\"value\":\"1\",\"name\":\"分类1\"},{\"value\":\"2\",\"name\":\"分类2\"},{\"value\":\"3\",\"name\":\"分类3\"}]', '2022-12-04 16:24:13', '2022-12-04 16:24:13');
INSERT INTO `wa_options` VALUES (10, 'dict_sex', '[{\"value\":\"0\",\"name\":\"女\"},{\"value\":\"1\",\"name\":\"男\"}]', '2022-12-04 15:04:40', '2022-12-04 15:04:40');
INSERT INTO `wa_options` VALUES (11, 'dict_status', '[{\"value\":\"0\",\"name\":\"正常\"},{\"value\":\"1\",\"name\":\"禁用\"}]', '2022-12-04 15:05:09', '2022-12-04 15:05:09');
INSERT INTO `wa_options` VALUES (17, 'table_form_schema_wa_admin_roles', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"role_id\":{\"field\":\"role_id\",\"_field_id\":\"1\",\"comment\":\"角色id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"2\",\"comment\":\"管理员id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-20 19:42:51');
INSERT INTO `wa_options` VALUES (18, 'table_form_schema_student', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"1\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"between\",\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"2\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"3\",\"comment\":\"姓名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\"},\"uid\":{\"field\":\"uid\",\"_field_id\":\"4\",\"comment\":\"学号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\"},\"sysid\":{\"field\":\"sysid\",\"_field_id\":\"5\",\"comment\":\"身份证号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"address\":{\"field\":\"address\",\"_field_id\":\"6\",\"comment\":\"地址\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"7\",\"comment\":\"管理员ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"sex\":{\"field\":\"sex\",\"_field_id\":\"8\",\"comment\":\"性别\",\"control\":\"select\",\"control_args\":\"data:0:男,1:女;value:0\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"sex2\":{\"field\":\"sex2\",\"_field_id\":\"9\",\"comment\":\"性别字典\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/sex\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false}}', '2022-08-15 00:00:00', '2023-03-19 11:32:28');
INSERT INTO `wa_options` VALUES (19, 'system_config', '{\"logo\":{\"title\":\"Webman\\u5b66\\u751f\\u7ba1\\u7406\\u7cfb\\u7edf\",\"image\":\"\\/app\\/admin\\/admin\\/images\\/logo.png\"},\"menu\":{\"data\":\"\\/app\\/admin\\/rule\\/get\",\"accordion\":true,\"collapse\":false,\"control\":true,\"controlWidth\":400,\"select\":0,\"async\":true},\"tab\":{\"enable\":true,\"keepState\":false,\"preload\":false,\"session\":true,\"max\":\"40\",\"index\":{\"id\":\"0\",\"href\":\"\\/scorePersonAnalyze\\/index\",\"title\":\"\\u4e2a\\u4eba\\u5206\\u6790\"}},\"theme\":{\"defaultColor\":\"1\",\"defaultMenu\":\"dark-theme\",\"defaultHeader\":\"light-theme\",\"allowCustom\":true,\"banner\":false},\"colors\":[{\"id\":\"1\",\"color\":\"#36b368\",\"second\":\"#f0f9eb\"},{\"id\":\"2\",\"color\":\"#2d8cf0\",\"second\":\"#ecf5ff\"},{\"id\":\"3\",\"color\":\"#f6ad55\",\"second\":\"#fdf6ec\"},{\"id\":\"4\",\"color\":\"#f56c6c\",\"second\":\"#fef0f0\"},{\"id\":\"5\",\"color\":\"#3963bc\",\"second\":\"#ecf5ff\"}],\"other\":{\"keepLoad\":\"500\",\"autoHead\":true,\"footer\":true},\"header\":{\"message\":false}}', '2023-03-18 21:26:20', '2023-05-20 16:09:49');
INSERT INTO `wa_options` VALUES (20, 'table_form_schema_stu_students', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"uid\":{\"field\":\"uid\",\"_field_id\":\"1\",\"comment\":\"学号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\"},\"name\":{\"field\":\"name\",\"_field_id\":\"2\",\"comment\":\"姓名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\"},\"sex\":{\"field\":\"sex\",\"_field_id\":\"3\",\"comment\":\"性别\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"phone\":{\"field\":\"phone\",\"_field_id\":\"4\",\"comment\":\"电话\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"sysid\":{\"field\":\"sysid\",\"_field_id\":\"5\",\"comment\":\"身份证号\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"birth\":{\"field\":\"birth\",\"_field_id\":\"6\",\"comment\":\"出生年月\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"between\",\"enable_sort\":false},\"minzu\":{\"field\":\"minzu\",\"_field_id\":\"7\",\"comment\":\"民族\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"jingguan\":{\"field\":\"jingguan\",\"_field_id\":\"8\",\"comment\":\"籍贯\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"hukou\":{\"field\":\"hukou\",\"_field_id\":\"9\",\"comment\":\"户籍\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"huji\":{\"field\":\"huji\",\"_field_id\":\"10\",\"comment\":\"户籍地址\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"xianzz\":{\"field\":\"xianzz\",\"_field_id\":\"11\",\"comment\":\"现住址\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"liushou\":{\"field\":\"liushou\",\"_field_id\":\"12\",\"comment\":\"是否留守儿童\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"biye\":{\"field\":\"biye\",\"_field_id\":\"13\",\"comment\":\"毕业学校\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"huojiang\":{\"field\":\"huojiang\",\"_field_id\":\"14\",\"comment\":\"获奖情况\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"17\",\"comment\":\"更新时间\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2023-03-31 14:31:02');
INSERT INTO `wa_options` VALUES (21, 'table_form_schema_stu_teachers', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"姓名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"sex\":{\"field\":\"sex\",\"_field_id\":\"2\",\"comment\":\"性别\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"phone\":{\"field\":\"phone\",\"_field_id\":\"3\",\"comment\":\"电话\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"qq\":{\"field\":\"qq\",\"_field_id\":\"4\",\"comment\":\"QQ\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"5\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"6\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-08-15 00:00:00');
INSERT INTO `wa_options` VALUES (22, 'table_form_schema_stu_courses', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"名称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"full\":{\"field\":\"full\",\"_field_id\":\"2\",\"comment\":\"满分\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"teacher_id\":{\"field\":\"teacher_id\",\"_field_id\":\"3\",\"comment\":\"授课老师\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"4\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"5\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-08-15 00:00:00');
INSERT INTO `wa_options` VALUES (23, 'table_form_schema_stu_exams', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"考试名称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"time\":{\"field\":\"time\",\"_field_id\":\"2\",\"comment\":\"考试时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-08-15 00:00:00');
INSERT INTO `wa_options` VALUES (24, 'table_form_schema_stu_scores', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"score\":{\"field\":\"score\",\"_field_id\":\"1\",\"comment\":\"成绩\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"student_id\":{\"field\":\"student_id\",\"_field_id\":\"2\",\"comment\":\"学生ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"exam_id\":{\"field\":\"exam_id\",\"_field_id\":\"3\",\"comment\":\"考试ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"course_id\":{\"field\":\"course_id\",\"_field_id\":\"4\",\"comment\":\"课程ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"5\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"6\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-08-15 00:00:00');

-- ----------------------------
-- Table structure for wa_roles
-- ----------------------------
DROP TABLE IF EXISTS `wa_roles`;
CREATE TABLE `wa_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色组',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `pid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '父级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_roles
-- ----------------------------
INSERT INTO `wa_roles` VALUES (1, '超级管理员', '*', '2022-08-13 16:15:01', '2022-12-23 12:05:07', NULL);
INSERT INTO `wa_roles` VALUES (6, '学生', '127,134,138,146,149,150,155,158,162,141,153', '2023-05-16 14:29:05', '2023-05-20 15:48:55', 1);

-- ----------------------------
-- Table structure for wa_rules
-- ----------------------------
DROP TABLE IF EXISTS `wa_rules`;
CREATE TABLE `wa_rules`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `pid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '上级菜单',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '类型',
  `weight` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_rules
-- ----------------------------
INSERT INTO `wa_rules` VALUES (1, '数据库', 'layui-icon-template-1', 'database', 178, '2023-03-18 09:43:38', '2023-05-20 15:54:38', '', 0, 1000);
INSERT INTO `wa_rules` VALUES (2, '所有表', NULL, 'plugin\\admin\\app\\controller\\TableController', 1, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/table/index', 1, 800);
INSERT INTO `wa_rules` VALUES (3, '权限管理', 'layui-icon-vercode', 'auth', 177, '2023-03-18 09:43:38', '2023-05-20 15:53:10', '', 0, 900);
INSERT INTO `wa_rules` VALUES (4, '账户管理', NULL, 'plugin\\admin\\app\\controller\\AdminController', 3, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/admin/index', 1, 1000);
INSERT INTO `wa_rules` VALUES (5, '角色管理', NULL, 'plugin\\admin\\app\\controller\\RoleController', 3, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/role/index', 1, 900);
INSERT INTO `wa_rules` VALUES (6, '菜单管理', NULL, 'plugin\\admin\\app\\controller\\RuleController', 3, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/rule/index', 1, 800);
INSERT INTO `wa_rules` VALUES (7, '会员管理', 'layui-icon-username', 'user', 178, '2023-03-18 09:43:38', '2023-05-20 15:54:45', '', 0, 800);
INSERT INTO `wa_rules` VALUES (8, '用户', NULL, 'plugin\\admin\\app\\controller\\UserController', 7, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/user/index', 1, 800);
INSERT INTO `wa_rules` VALUES (9, '通用设置', 'layui-icon-set', 'common', 178, '2023-03-18 09:43:38', '2023-05-20 15:54:52', '', 0, 700);
INSERT INTO `wa_rules` VALUES (10, '个人资料', NULL, 'plugin\\admin\\app\\controller\\AccountController', 9, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/account/index', 1, 800);
INSERT INTO `wa_rules` VALUES (11, '附件管理', NULL, 'plugin\\admin\\app\\controller\\UploadController', 9, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/upload/index', 1, 700);
INSERT INTO `wa_rules` VALUES (12, '字典设置', NULL, 'plugin\\admin\\app\\controller\\DictController', 9, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/dict/index', 1, 600);
INSERT INTO `wa_rules` VALUES (13, '系统设置', NULL, 'plugin\\admin\\app\\controller\\ConfigController', 9, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/config/index', 1, 500);
INSERT INTO `wa_rules` VALUES (14, '插件管理', 'layui-icon-app', 'plugin', 178, '2023-03-18 09:43:38', '2023-05-20 15:54:57', '', 0, 600);
INSERT INTO `wa_rules` VALUES (15, '应用插件', NULL, 'plugin\\admin\\app\\controller\\PluginController', 14, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/plugin/index', 1, 800);
INSERT INTO `wa_rules` VALUES (16, '开发辅助', 'layui-icon-fonts-code', 'dev', 178, '2023-03-18 09:43:38', '2023-05-20 15:55:02', '', 0, 500);
INSERT INTO `wa_rules` VALUES (17, '表单构建', NULL, 'plugin\\admin\\app\\controller\\DevController', 16, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/dev/form-build', 1, 800);
INSERT INTO `wa_rules` VALUES (18, '示例页面', 'layui-icon-templeate-1', 'demos', 178, '2023-03-18 09:43:38', '2023-05-20 15:55:07', '', 0, 400);
INSERT INTO `wa_rules` VALUES (19, '工作空间', 'layui-icon-console', 'demo1', 18, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '', 0, 0);
INSERT INTO `wa_rules` VALUES (20, '控制后台', 'layui-icon-console', 'demo10', 19, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/console/console1.html', 1, 0);
INSERT INTO `wa_rules` VALUES (21, '数据分析', 'layui-icon-console', 'demo13', 19, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/console/console2.html', 1, 0);
INSERT INTO `wa_rules` VALUES (22, '百度一下', 'layui-icon-console', 'demo14', 19, '2023-03-18 09:43:38', '2023-03-18 09:43:38', 'http://www.baidu.com', 1, 0);
INSERT INTO `wa_rules` VALUES (23, '主题预览', 'layui-icon-console', 'demo15', 19, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/system/theme.html', 1, 0);
INSERT INTO `wa_rules` VALUES (24, '常用组件', 'layui-icon-component', 'demo20', 18, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '', 0, 0);
INSERT INTO `wa_rules` VALUES (25, '功能按钮', 'layui-icon-face-smile', 'demo2011', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/button.html', 1, 0);
INSERT INTO `wa_rules` VALUES (26, '表单集合', 'layui-icon-face-cry', 'demo2014', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/form.html', 1, 0);
INSERT INTO `wa_rules` VALUES (27, '字体图标', 'layui-icon-face-cry', 'demo2010', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/icon.html', 1, 0);
INSERT INTO `wa_rules` VALUES (28, '多选下拉', 'layui-icon-face-cry', 'demo2012', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/select.html', 1, 0);
INSERT INTO `wa_rules` VALUES (29, '动态标签', 'layui-icon-face-cry', 'demo2013', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/tag.html', 1, 0);
INSERT INTO `wa_rules` VALUES (30, '数据表格', 'layui-icon-face-cry', 'demo2031', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/table.html', 1, 0);
INSERT INTO `wa_rules` VALUES (31, '分布表单', 'layui-icon-face-cry', 'demo2032', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/step.html', 1, 0);
INSERT INTO `wa_rules` VALUES (32, '树形表格', 'layui-icon-face-cry', 'demo2033', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/treetable.html', 1, 0);
INSERT INTO `wa_rules` VALUES (33, '树状结构', 'layui-icon-face-cry', 'demo2034', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/dtree.html', 1, 0);
INSERT INTO `wa_rules` VALUES (34, '文本编辑', 'layui-icon-face-cry', 'demo2035', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/tinymce.html', 1, 0);
INSERT INTO `wa_rules` VALUES (35, '卡片组件', 'layui-icon-face-cry', 'demo2036', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/card.html', 1, 0);
INSERT INTO `wa_rules` VALUES (36, '抽屉组件', 'layui-icon-face-cry', 'demo2021', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/drawer.html', 1, 0);
INSERT INTO `wa_rules` VALUES (37, '消息通知', 'layui-icon-face-cry', 'demo2022', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/notice.html', 1, 0);
INSERT INTO `wa_rules` VALUES (38, '加载组件', 'layui-icon-face-cry', 'demo2024', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/loading.html', 1, 0);
INSERT INTO `wa_rules` VALUES (39, '弹层组件', 'layui-icon-face-cry', 'demo2023', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/popup.html', 1, 0);
INSERT INTO `wa_rules` VALUES (40, '多选项卡', 'layui-icon-face-cry', 'demo60131', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/tab.html', 1, 0);
INSERT INTO `wa_rules` VALUES (41, '数据菜单', 'layui-icon-face-cry', 'demo60132', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/menu.html', 1, 0);
INSERT INTO `wa_rules` VALUES (42, '哈希加密', 'layui-icon-face-cry', 'demo2041', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/encrypt.html', 1, 0);
INSERT INTO `wa_rules` VALUES (43, '图标选择', 'layui-icon-face-cry', 'demo2042', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/iconPicker.html', 1, 0);
INSERT INTO `wa_rules` VALUES (44, '省市级联', 'layui-icon-face-cry', 'demo2043', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/area.html', 1, 0);
INSERT INTO `wa_rules` VALUES (45, '数字滚动', 'layui-icon-face-cry', 'demo2044', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/count.html', 1, 0);
INSERT INTO `wa_rules` VALUES (46, '顶部返回', 'layui-icon-face-cry', 'demo2045', 24, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/document/topBar.html', 1, 0);
INSERT INTO `wa_rules` VALUES (47, '结果页面', 'layui-icon-auz', 'demo666', 18, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '', 0, 0);
INSERT INTO `wa_rules` VALUES (48, '成功', 'layui-icon-face-smile', 'demo667', 47, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/result/success.html', 1, 0);
INSERT INTO `wa_rules` VALUES (49, '失败', 'layui-icon-face-cry', 'demo668', 47, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/result/error.html', 1, 0);
INSERT INTO `wa_rules` VALUES (50, '错误页面', 'layui-icon-face-cry', 'demo-error', 18, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '', 0, 0);
INSERT INTO `wa_rules` VALUES (51, '403', 'layui-icon-face-smile', 'demo403', 50, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/error/403.html', 1, 0);
INSERT INTO `wa_rules` VALUES (52, '404', 'layui-icon-face-cry', 'demo404', 50, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/error/404.html', 1, 0);
INSERT INTO `wa_rules` VALUES (53, '500', 'layui-icon-face-cry', 'demo500', 50, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/error/500.html', 1, 0);
INSERT INTO `wa_rules` VALUES (54, '系统管理', 'layui-icon-set-fill', 'demo-system', 18, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '', 0, 0);
INSERT INTO `wa_rules` VALUES (55, '用户管理', 'layui-icon-face-smile', 'demo601', 54, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/system/user.html', 1, 0);
INSERT INTO `wa_rules` VALUES (56, '角色管理', 'layui-icon-face-cry', 'demo602', 54, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/system/role.html', 1, 0);
INSERT INTO `wa_rules` VALUES (57, '权限管理', 'layui-icon-face-cry', 'demo603', 54, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/system/power.html', 1, 0);
INSERT INTO `wa_rules` VALUES (58, '部门管理', 'layui-icon-face-cry', 'demo604', 54, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/system/deptment.html', 1, 0);
INSERT INTO `wa_rules` VALUES (59, '行为日志', 'layui-icon-face-cry', 'demo605', 54, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/system/log.html', 1, 0);
INSERT INTO `wa_rules` VALUES (60, '数据字典', 'layui-icon-face-cry', 'demo606', 54, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/system/dict.html', 1, 0);
INSERT INTO `wa_rules` VALUES (61, '常用页面', 'layui-icon-template-1', 'demo-common', 18, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '', 0, 0);
INSERT INTO `wa_rules` VALUES (62, '空白页面', 'layui-icon-face-smile', 'demo702', 61, '2023-03-18 09:43:38', '2023-03-18 09:43:38', '/app/admin/demos/system/space.html', 1, 0);
INSERT INTO `wa_rules` VALUES (63, '查看表', NULL, 'plugin\\admin\\app\\controller\\TableController@view', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (64, '查询表', NULL, 'plugin\\admin\\app\\controller\\TableController@show', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (65, '创建表', NULL, 'plugin\\admin\\app\\controller\\TableController@create', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (66, '修改表', NULL, 'plugin\\admin\\app\\controller\\TableController@modify', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (67, '一键菜单', NULL, 'plugin\\admin\\app\\controller\\TableController@crud', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (68, '查询记录', NULL, 'plugin\\admin\\app\\controller\\TableController@select', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (69, '插入记录', NULL, 'plugin\\admin\\app\\controller\\TableController@insert', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (70, '更新记录', NULL, 'plugin\\admin\\app\\controller\\TableController@update', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (71, '删除记录', NULL, 'plugin\\admin\\app\\controller\\TableController@delete', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (72, '删除表', NULL, 'plugin\\admin\\app\\controller\\TableController@drop', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (73, '表摘要', NULL, 'plugin\\admin\\app\\controller\\TableController@schema', 2, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (74, '插入', NULL, 'plugin\\admin\\app\\controller\\AdminController@insert', 4, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (75, '更新', NULL, 'plugin\\admin\\app\\controller\\AdminController@update', 4, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (76, '删除', NULL, 'plugin\\admin\\app\\controller\\AdminController@delete', 4, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (77, '插入', NULL, 'plugin\\admin\\app\\controller\\RoleController@insert', 5, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (78, '更新', NULL, 'plugin\\admin\\app\\controller\\RoleController@update', 5, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (79, '删除', NULL, 'plugin\\admin\\app\\controller\\RoleController@delete', 5, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (80, '获取角色权限', NULL, 'plugin\\admin\\app\\controller\\RoleController@rules', 5, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (81, '查询', NULL, 'plugin\\admin\\app\\controller\\RuleController@select', 6, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (82, '添加', NULL, 'plugin\\admin\\app\\controller\\RuleController@insert', 6, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (83, '更新', NULL, 'plugin\\admin\\app\\controller\\RuleController@update', 6, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (84, '删除', NULL, 'plugin\\admin\\app\\controller\\RuleController@delete', 6, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (85, '插入', NULL, 'plugin\\admin\\app\\controller\\UserController@insert', 8, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (86, '更新', NULL, 'plugin\\admin\\app\\controller\\UserController@update', 8, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (87, '查询', NULL, 'plugin\\admin\\app\\controller\\UserController@select', 8, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (88, '删除', NULL, 'plugin\\admin\\app\\controller\\UserController@delete', 8, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (89, '更新', NULL, 'plugin\\admin\\app\\controller\\AccountController@update', 10, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (90, '修改密码', NULL, 'plugin\\admin\\app\\controller\\AccountController@password', 10, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (91, '查询', NULL, 'plugin\\admin\\app\\controller\\AccountController@select', 10, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (92, '添加', NULL, 'plugin\\admin\\app\\controller\\AccountController@insert', 10, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (93, '删除', NULL, 'plugin\\admin\\app\\controller\\AccountController@delete', 10, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (94, '浏览附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@attachment', 11, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (95, '查询附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@select', 11, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (96, '更新附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@update', 11, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (97, '添加附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@insert', 11, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (98, '上传文件', NULL, 'plugin\\admin\\app\\controller\\UploadController@file', 11, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (99, '上传图片', NULL, 'plugin\\admin\\app\\controller\\UploadController@image', 11, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (100, '上传头像', NULL, 'plugin\\admin\\app\\controller\\UploadController@avatar', 11, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (101, '删除附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@delete', 11, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (102, '查询', NULL, 'plugin\\admin\\app\\controller\\DictController@select', 12, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (103, '插入', NULL, 'plugin\\admin\\app\\controller\\DictController@insert', 12, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (104, '更新', NULL, 'plugin\\admin\\app\\controller\\DictController@update', 12, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (105, '删除', NULL, 'plugin\\admin\\app\\controller\\DictController@delete', 12, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (106, '更改', NULL, 'plugin\\admin\\app\\controller\\ConfigController@update', 13, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (107, '列表', NULL, 'plugin\\admin\\app\\controller\\PluginController@list', 15, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (108, '安装', NULL, 'plugin\\admin\\app\\controller\\PluginController@install', 15, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (109, '卸载', NULL, 'plugin\\admin\\app\\controller\\PluginController@uninstall', 15, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (110, '支付', NULL, 'plugin\\admin\\app\\controller\\PluginController@pay', 15, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (111, '登录官网', NULL, 'plugin\\admin\\app\\controller\\PluginController@login', 15, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (112, '获取已安装的插件列表', NULL, 'plugin\\admin\\app\\controller\\PluginController@getInstalledPlugins', 15, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (113, '表单构建', NULL, 'plugin\\admin\\app\\controller\\DevController@formBuild', 17, '2023-03-18 09:44:27', '2023-03-18 09:44:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (126, '学生列表', 'layui-icon-group', 'app\\controller\\StudentController', 136, '2023-03-30 22:16:22', '2023-03-31 14:41:45', '/student/index', 1, 0);
INSERT INTO `wa_rules` VALUES (127, '查询', NULL, 'app\\controller\\StudentController@select', 126, '2023-03-31 14:35:02', '2023-03-31 14:35:02', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (128, '插入', NULL, 'app\\controller\\StudentController@insert', 126, '2023-03-31 14:35:02', '2023-03-31 14:35:02', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (129, '更新', NULL, 'app\\controller\\StudentController@update', 126, '2023-03-31 14:35:02', '2023-03-31 14:35:02', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (130, '删除', NULL, 'app\\controller\\StudentController@delete', 126, '2023-03-31 14:35:02', '2023-05-16 17:58:36', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (131, '老师列表', 'layui-icon-carousel', 'app\\controller\\TeacherController', 136, '2023-03-31 14:35:37', '2023-03-31 14:41:52', '/teacher/index', 1, 0);
INSERT INTO `wa_rules` VALUES (132, '插入', NULL, 'app\\controller\\TeacherController@insert', 131, '2023-03-31 14:39:59', '2023-03-31 14:39:59', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (133, '更新', NULL, 'app\\controller\\TeacherController@update', 131, '2023-03-31 14:39:59', '2023-03-31 14:39:59', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (134, '查询', NULL, 'app\\controller\\TeacherController@select', 131, '2023-03-31 14:39:59', '2023-03-31 14:39:59', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (135, '删除', NULL, 'app\\controller\\TeacherController@delete', 131, '2023-03-31 14:39:59', '2023-03-31 14:39:59', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (136, '用户管理', 'layui-icon-user', 'stu_user', 177, '2023-03-31 14:41:36', '2023-05-20 15:50:44', '', 0, 0);
INSERT INTO `wa_rules` VALUES (137, '课程列表', 'layui-icon-align-left', 'app\\controller\\CourseController', 177, '2023-03-31 21:57:51', '2023-05-20 15:51:04', '/course/index', 1, 0);
INSERT INTO `wa_rules` VALUES (138, '查看老师', NULL, 'app\\controller\\TeacherController@show', 131, '2023-04-01 14:45:37', '2023-05-16 18:09:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (139, '插入', NULL, 'app\\controller\\CourseController@insert', 137, '2023-04-01 14:45:37', '2023-04-01 14:45:37', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (140, '更新', NULL, 'app\\controller\\CourseController@update', 137, '2023-04-01 14:45:37', '2023-04-01 14:45:37', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (141, '查询', NULL, 'app\\controller\\CourseController@select', 137, '2023-04-01 14:45:37', '2023-04-01 14:45:37', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (142, '删除', NULL, 'app\\controller\\CourseController@delete', 137, '2023-04-01 14:45:37', '2023-04-01 14:45:37', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (143, '考试列表', 'layui-icon-console', 'app\\controller\\ExamController', 177, '2023-04-01 14:46:15', '2023-05-20 15:52:03', '/exam/index', 1, 0);
INSERT INTO `wa_rules` VALUES (144, '插入', NULL, 'app\\controller\\ExamController@insert', 143, '2023-04-01 21:49:47', '2023-04-01 21:49:47', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (145, '更新', NULL, 'app\\controller\\ExamController@update', 143, '2023-04-01 21:49:47', '2023-04-01 21:49:47', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (146, '查询', NULL, 'app\\controller\\ExamController@select', 143, '2023-04-01 21:49:47', '2023-04-01 21:49:47', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (147, '删除', NULL, 'app\\controller\\ExamController@delete', 143, '2023-04-01 21:49:47', '2023-04-01 21:49:47', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (148, '成绩查询', 'layui-icon-search', 'app\\controller\\ScoreQueryController', 177, '2023-04-01 22:02:40', '2023-05-20 15:50:53', '/scoreQuery/index', 1, 0);
INSERT INTO `wa_rules` VALUES (149, '查询', NULL, 'app\\controller\\ScoreQueryController@select', 148, '2023-04-01 22:16:43', '2023-05-16 18:09:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (150, '添加', NULL, 'app\\controller\\ScoreQueryController@insert', 148, '2023-04-01 22:16:43', '2023-04-01 22:16:43', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (151, '更新', NULL, 'app\\controller\\ScoreQueryController@update', 148, '2023-04-01 22:16:43', '2023-05-16 18:09:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (152, '删除', NULL, 'app\\controller\\ScoreQueryController@delete', 148, '2023-04-01 22:16:43', '2023-04-01 22:16:43', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (153, '导出成绩为Excel', NULL, 'app\\controller\\ScoreQueryController@export', 148, '2023-04-03 19:42:05', '2023-05-16 18:09:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (155, '获取课程的满分分数', NULL, 'app\\controller\\ScoreQueryController@getFull', 148, '2023-04-03 19:42:05', '2023-04-03 19:42:05', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (156, '成绩分析', 'layui-icon-diamond', 'stu_score_analyze', 177, '2023-04-03 19:42:35', '2023-05-20 15:52:11', '', 0, 0);
INSERT INTO `wa_rules` VALUES (157, '个人分析', 'layui-icon-util', 'app\\controller\\ScorePersonAnalyzeController', 156, '2023-04-03 19:45:26', '2023-05-20 16:04:40', 'scorePersonAnalyze/index', 1, 0);
INSERT INTO `wa_rules` VALUES (158, '查询', NULL, 'app\\controller\\ScorePersonAnalyzeController@select', 157, '2023-04-03 20:00:09', '2023-05-16 21:25:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (159, '添加', NULL, 'app\\controller\\ScorePersonAnalyzeController@insert', 157, '2023-04-03 20:00:09', '2023-04-03 20:00:09', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (160, '更新', NULL, 'app\\controller\\ScorePersonAnalyzeController@update', 157, '2023-04-03 20:00:09', '2023-04-03 20:00:09', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (161, '删除', NULL, 'app\\controller\\ScorePersonAnalyzeController@delete', 157, '2023-04-03 20:00:09', '2023-04-03 20:00:09', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (162, '获取拆线图数据', NULL, 'app\\controller\\ScorePersonAnalyzeController@getRank', 157, '2023-04-04 19:33:32', '2023-05-20 16:06:28', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (163, '总体分析', 'layui-icon-layouts', 'app\\controller\\ScoreAllAnalyzeController', 156, '2023-04-04 19:34:37', '2023-04-04 19:34:37', '/score-all-analyze/index', 1, 0);
INSERT INTO `wa_rules` VALUES (165, '查询总体成绩', NULL, 'app\\controller\\ScoreAllAnalyzeController@select', 163, '2023-05-16 11:16:56', '2023-05-20 16:04:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (166, '查看课程成绩饼图', NULL, 'app\\controller\\ScoreAllAnalyzeController@showCoursePie', 163, '2023-05-16 11:16:56', '2023-05-20 16:04:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (167, '显示学生气泡提示', NULL, 'app\\controller\\ScoreAllAnalyzeController@tips', 163, '2023-05-16 11:16:56', '2023-05-20 16:04:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (168, '添加', NULL, 'app\\controller\\ScoreAllAnalyzeController@insert', 163, '2023-05-16 11:16:56', '2023-05-16 11:16:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (169, '更新', NULL, 'app\\controller\\ScoreAllAnalyzeController@update', 163, '2023-05-16 11:16:56', '2023-05-16 11:16:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (170, '删除', NULL, 'app\\controller\\ScoreAllAnalyzeController@delete', 163, '2023-05-16 11:16:56', '2023-05-16 11:16:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (171, '同步账户', NULL, 'app\\controller\\StudentController@syncAccount', 126, '2023-05-16 17:57:10', '2023-05-16 17:58:03', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (174, '显示Excel导入页面', NULL, 'app\\controller\\ScoreQueryController@importView', 148, '2023-05-20 15:38:29', '2023-05-20 15:38:29', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (175, '导入成绩', NULL, 'app\\controller\\ScoreQueryController@doImportExcel', 148, '2023-05-20 15:38:29', '2023-05-20 15:38:29', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (176, '下载成绩导入模板', NULL, 'app\\controller\\ScoreQueryController@downloadTemplate', 148, '2023-05-20 15:38:29', '2023-05-20 15:38:29', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (177, '学生管理系统', 'layui-icon-star-fill', 'stucms', NULL, '2023-05-20 15:50:16', '2023-05-20 15:54:04', '', 0, 0);
INSERT INTO `wa_rules` VALUES (178, 'webmanAdmin', 'layui-icon-snowflake', 'webmanAdmin', 0, '2023-05-20 15:54:32', '2023-05-20 15:54:32', '', 0, 0);

-- ----------------------------
-- Table structure for wa_uploads
-- ----------------------------
DROP TABLE IF EXISTS `wa_uploads`;
CREATE TABLE `wa_uploads`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '管理员',
  `file_size` int(11) NOT NULL COMMENT '文件大小',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'mime类型',
  `image_width` int(11) NULL DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(11) NULL DEFAULT NULL COMMENT '图片高度',
  `ext` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '扩展名',
  `storage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `created_at` date NULL DEFAULT NULL COMMENT '上传时间',
  `category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
  `updated_at` date NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `ext`(`ext`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_uploads
-- ----------------------------

-- ----------------------------
-- Table structure for wa_users
-- ----------------------------
DROP TABLE IF EXISTS `wa_users`;
CREATE TABLE `wa_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `sex` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额(元)',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `last_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `last_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `join_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `join_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册ip',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'token',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `role` int(11) NOT NULL DEFAULT 1 COMMENT '角色',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `join_time`(`join_time`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_users
-- ----------------------------
INSERT INTO `wa_users` VALUES (1, 't', 'aaaaaayushihua', '$2y$10$kc.rFKJX/GBc1cuvUFUWku1dUAMvygNRaQq4yUlpl98I0GFMhiTMu', '1', '', 'baimei@your.com', '15641596350', 0, '2023-03-19', 0.00, 0, NULL, '', NULL, '', NULL, '2023-03-19 08:56:36', '2023-03-19 09:12:25', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
