#!/bin/bash

# 停止并禁用 Docker 服务
echo "停止 Docker 服务..."
sudo systemctl stop docker
sudo systemctl disable docker

# 卸载 Docker 和 Docker Compose
echo "卸载 Docker 和 Docker Compose..."
sudo yum remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin
sudo rm /usr/local/bin/docker-compose
sudo rm /usr/bin/docker-compose

# 从 docker 用户组中移除当前用户
echo "从 docker 用户组中移除当前用户..."
sudo usermod -G "$(id -g -n)" -R "$(id -g -n)" 

# 删除 Docker 配置文件及镜像地址配置
echo "删除 Docker 配置文件和镜像地址配置..."
sudo rm -rf /etc/docker

echo "Docker 和 Docker Compose 卸载完成。"

# 等待一段时间，然后询问是否重新启动系统（可选）
echo -e "\n🔄 建议重新启动系统以彻底清除 Docker 相关设置。"
read -p "是否立即重新启动系统？（y/n）" choice
if [ "$choice" == "y" ]; then
    echo "系统将重新启动..."
    sudo reboot
else
    echo "请手动重新启动系统以使设置生效。"
fi
