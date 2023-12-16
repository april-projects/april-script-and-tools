-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置名称',
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置属性',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '配置类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0：正常，1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'title', '框架师', 1, '2022-05-20 16:33:54', NULL, 0);
INSERT INTO `sys_config` VALUES (2, 'subtitle', '墨白', 1, '2022-05-20 16:34:10', NULL, 0);
INSERT INTO `sys_config` VALUES (3, 'description', '中南财经大学 | 金融管理 | 计算机应用', 1, '2022-05-20 16:34:29', NULL, 0);
INSERT INTO `sys_config` VALUES (4, 'keywords', 'Java MySQL 编程语言 墨白 框架师 计算机应用', 1, '2022-05-20 16:34:43', NULL, 0);
INSERT INTO `sys_config` VALUES (5, 'author', '墨白', 1, '2022-05-20 16:34:57', NULL, 0);
INSERT INTO `sys_config` VALUES (6, 'language', 'zh-CN', 1, '2022-05-20 16:35:18', NULL, 0);
INSERT INTO `sys_config` VALUES (7, 'timezone', NULL, 1, '2022-05-20 16:35:27', NULL, 0);
INSERT INTO `sys_config` VALUES (8, 'url', 'https://www.mobaijun.com', 2, '2022-05-20 16:35:47', NULL, 0);
INSERT INTO `sys_config` VALUES (9, 'enable', 'true', 3, '2022-05-20 16:38:51', NULL, 0);
INSERT INTO `sys_config` VALUES (10, 'year', '2019', 3, '2022-05-20 16:39:08', NULL, 0);
INSERT INTO `sys_config` VALUES (11, 'month', '12', 3, '2022-05-20 16:39:16', NULL, 0);
INSERT INTO `sys_config` VALUES (12, 'date', '4', 3, '2022-05-20 16:39:33', NULL, 0);
INSERT INTO `sys_config` VALUES (13, 'hour', '23', 3, '2022-05-20 16:39:52', NULL, 0);
INSERT INTO `sys_config` VALUES (14, 'minute', '59', 3, '2022-05-20 16:40:05', NULL, 0);
INSERT INTO `sys_config` VALUES (15, 'second', '59', 3, '2022-05-20 16:40:18', NULL, 0);
