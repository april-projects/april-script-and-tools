#!/bin/bash

# 安装必要的依赖包
sudo yum install -y yum-utils

# 添加 Docker 官方仓库
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装 Docker Engine
sudo dnf install -y --allowerasing docker-ce docker-ce-cli containerd.io docker-buildx-plugin

# 启动 Docker 服务
sudo systemctl start docker

# 设置 Docker 开机自启动
sudo systemctl enable docker

# 安装 Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# 添加当前用户到 docker 用户组，以免每次都需要 sudo
sudo usermod -aG docker $USER

# 提示安装完成
echo "🐳 Docker 已成功安装并启动。"
echo "🚀 Docker Compose 已成功安装。"

# 显示特别的 Docker 版本信息
echo -e "\n🔍 特别的 Docker 版本信息:"
docker version --format 'Docker 版本：{{.Server.Version}} (API 版本：{{.Server.APIVersion}})'

# 显示特别的 Docker Compose 版本信息
echo -e "\n🔍 特别的 Docker Compose 版本信息:"
docker-compose --version

# 设置 Docker 镜像地址
echo -e "\n⚙️ 正在配置 Docker 镜像地址..."
mirror_list=(
    "https://registry.docker-cn.com"
    "https://registry.cn-hangzhou.aliyuncs.com/"
    "http://f1361db2.m.daocloud.io"
    "https://docker.mirrors.ustc.edu.cn"
    "https://mirror.ccs.tencentyun.com"
    "http://hub-mirror.c.163.com"
)

# 检查是否存在 Docker 配置目录，如果不存在则创建
docker_config_dir="/etc/docker"
if [ ! -d "$docker_config_dir" ]; then
    sudo mkdir -p "$docker_config_dir"
fi

# 设置镜像地址配置文件路径
daemon_config_file="$docker_config_dir/daemon.json"

# 备份旧的配置文件
if [ -f "$daemon_config_file" ]; then
    sudo cp "$daemon_config_file" "$daemon_config_file.bak"
fi

# 构建镜像地址配置
mirror_json=$(printf '{"registry-mirrors": [%s]}' \
                "$(printf '"%s",' "${mirror_list[@]}" | sed 's/,$//')")

# 写入配置到 daemon.json 文件
echo "$mirror_json" | sudo tee "$daemon_config_file" > /dev/null

# 重启 Docker 服务使配置生效
sudo systemctl restart docker

echo "🐳 Docker 镜像地址设置成功。"

# 显示当前 Docker 镜像地址配置
echo -e "\n🔍 当前 Docker 镜像地址配置："
sudo cat "$daemon_config_file"

# 显示 Docker 服务状态
echo -e "\nℹ️ Docker 服务状态:"
sudo systemctl status docker

# 等待一段时间，然后询问是否重新启动系统（可选）
echo -e "\n🔄 建议重新启动系统以确保 Docker 开机自启动生效。"
read -p "是否立即重新启动系统？（y/n）" choice
if [ "$choice" == "y" ]; then
    echo "系统将重新启动..."
    sudo reboot
else
    echo "请手动重新启动系统以使设置生效。"
fi