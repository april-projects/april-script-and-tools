#!/bin/bash

# 更新系统并安装必要的依赖
echo "更新系统并安装必要的依赖..."
sudo yum update -y
sudo yum install -y wget gcc gcc-c++ make zlib-devel pcre-devel openssl-devel

# 下载 Nginx 源码包: https://nginx.org/en/download.html
echo "下载 Nginx 源码包..."
wget https://nginx.org/download/nginx-1.24.0.tar.gz

# 解压源码包
echo "解压 Nginx 源码包..."
tar -zxvf nginx-1.24.0.tar.gz -C /usr/local
mv nginx-1.24.0 nginx
cd /usr/local/nginx

# 配置 Nginx
echo "配置 Nginx..."
./configure --prefix=/usr/local/nginx

# 安装 Nginx
echo "安装 Nginx..."
sudo make &&  make install

# 启动 Nginx 服务
echo "启动 Nginx 服务..."
/usr/local/nginx/sbin/nginx

# 检查 Nginx 是否运行
echo "检查 Nginx 是否运行..."
sudo ps aux | grep nginx

# 创建 Nginx 用户（如果不存在）
echo "创建 Nginx 用户..."
if ! getent passwd nginx > /dev/null 2>&1; then
    sudo useradd nginx
fi

# 更新 Nginx 配置文件以使用新创建的用户
echo "更新 Nginx 配置文件..."
sudo sed -i 's/user  nobody;/user nginx;/' /usr/local/nginx/conf/nginx.conf

# 重新启动 Nginx 服务使配置生效
echo "重新启动 Nginx 服务使配置生效..."
sudo /usr/local/nginx/sbin/nginx -s stop
sudo /usr/local/nginx/sbin/nginx

# 使得nginx全局可用
sudo ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx

echo "Nginx 安装完成！"