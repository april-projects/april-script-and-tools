#!/bin/bash

# 停止 Nginx 服务
echo "停止 Nginx 服务..."
sudo /usr/local/nginx/sbin/nginx -s stop

# 卸载 Nginx
echo "卸载 Nginx..."
sudo rm -rf /usr/local/nginx

# 清理源码包
echo "清理 Nginx 源码包..."
rm -rf nginx-1.24.0.tar.gz

echo "Nginx 已成功卸载。"
