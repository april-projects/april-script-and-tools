-- ----------------------------
-- Table structure for mysql_backups
-- ----------------------------
DROP TABLE IF EXISTS `mysql_backups`;
CREATE TABLE `mysql_backups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mysql_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库IP',
  `mysql_port` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库端口',
  `mysql_cmd` varchar(230) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份命令',
  `mysql_back_cmd` varchar(230) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '恢复命令',
  `database_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `backups_path` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份数据地址',
  `backups_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份文件名称',
  `operation` int(0) NULL DEFAULT NULL COMMENT '操作次数',
  `status` int(0) NULL DEFAULT NULL COMMENT '数据状态（0正常，1删除）',
  `recovery_time` datetime(0) NULL DEFAULT NULL COMMENT '恢复时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '备份时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `backups_index`(`mysql_ip`, `mysql_port`, `backups_path`, `database_name`, `backups_name`) USING BTREE COMMENT '索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'MySQL数据备份表' ROW_FORMAT = COMPACT;
