-- ----------------------------
-- Table structure for sys_second
-- ----------------------------
DROP TABLE IF EXISTS `sys_second`;
CREATE TABLE `sys_second`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `second_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组件名称',
  `second_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组件图标',
  `second_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组件链接',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0：正常，1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '组件配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_second
-- ----------------------------
INSERT INTO `sys_second` VALUES (1, 'matery', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/Matery-Hexo.svg', 'https://github.com/blinkfox/hexo-theme-matery', 0);
INSERT INTO `sys_second` VALUES (2, 'hexo', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/Frame-Hexo.svg', 'https://hexo.io/', 0);
INSERT INTO `sys_second` VALUES (3, 'JsDeliver', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/CDN-jsDelivr.svg', 'https://www.jsdelivr.com/', 0);
INSERT INTO `sys_second` VALUES (4, '腾讯云加速', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/CDN-Tencent.svg', 'https://cloud.tencent.com/product/cdn/', 0);
INSERT INTO `sys_second` VALUES (5, 'coding', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/Hosted-Coding.svg', 'https://coding.net', 0);
INSERT INTO `sys_second` VALUES (6, 'java', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/oracle-java-brightgreen.svg', 'https://www.oracle.com/java/technologies/downloads/', 0);
INSERT INTO `sys_second` VALUES (7, 'chrome', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/Google-Chrome-orange.svg', 'https://www.google.com/intl/zh-CN/chrome/', 0);
INSERT INTO `sys_second` VALUES (8, 'idea', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/jetbrains-IntelliJ IDEA-blue.svg', 'https://www.jetbrains.com/zh-cn/idea/', 0);
INSERT INTO `sys_second` VALUES (9, 'webstorm', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/Jetbrains-WebStorm-blue.svg', 'https://www.jetbrains.com/zh-cn/webstorm/', 0);
INSERT INTO `sys_second` VALUES (10, 'springboot', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/spring-springboot-brightgreen.svg', 'https://spring.io/projects/spring-boot', 0);
INSERT INTO `sys_second` VALUES (11, 'vue', 'https://cdn.jsdelivr.net/gh/mobaijun/blog_css_js/image/尤雨溪-vue-yellow.svg', 'https://cn.vuejs.org/index.html', 0);
