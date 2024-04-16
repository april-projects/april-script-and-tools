#!/bin/bash

# 定义 Nexus 相关参数
NEXUS_VERSION="latest"  # Nexus 版本号，这里使用 latest 表示最新版本
NEXUS_VOLUME_DIR="/usr/local/nexus3/nexus-data"
NEXUS_IMAGE="sonatype/nexus3:$NEXUS_VERSION"  # Nexus 镜像名称
CONTAINER_NAME="nexus3"
HOST_PORT=8081
TEMP_CONTAINER_NAME="nexus-temp-init"

# 判断 Nexus 镜像是否存在，不存在则拉取
if ! docker image inspect "$NEXUS_IMAGE" &> /dev/null; then
    echo "Pulling Nexus image..."
    docker pull "$NEXUS_IMAGE"
fi

# 创建空的 Nexus 数据目录
echo "Initializing Nexus data directory..."
sudo rm -rf "$NEXUS_VOLUME_DIR"/*
sudo mkdir -p "$NEXUS_VOLUME_DIR"
sudo chmod -R 777 "$NEXUS_VOLUME_DIR"

# 创建临时容器，用于初始化数据目录
echo "Creating temporary container to initialize Nexus data..."
docker run --rm -v "$NEXUS_VOLUME_DIR":/nexus-data "$NEXUS_IMAGE" touch /nexus-data/testfile

# 检查数据目录是否初始化成功
if [ -f "$NEXUS_VOLUME_DIR/testfile" ]; then
    echo "Data directory initialization successful."
else
    echo "Data directory initialization failed. Exiting."
    exit 1
fi

# 停止并删除现有的 Nexus 容器
if docker container inspect "$CONTAINER_NAME" &> /dev/null; then
    echo "Stopping and removing existing Nexus container..."
    docker stop "$CONTAINER_NAME" &> /dev/null
    docker rm "$CONTAINER_NAME" &> /dev/null
fi

# 启动 Nexus 容器
echo "Starting Nexus container..."
docker run -d \
    --name "$CONTAINER_NAME" \
    --restart=always \
    -p "$HOST_PORT":8081 \
    -v "$NEXUS_VOLUME_DIR":/nexus-data \
    "$NEXUS_IMAGE"

# 等待一段时间确保 Nexus 容器已经完全启动
echo "Waiting for Nexus to start..."
sleep 30

# 获取本机 IP 地址
HOST_IP=$(hostname -I | awk '{print $1}')

# 输出 Nexus 启动信息，使用本机 IP 地址
echo "Nexus Repository Manager latest 已经启动。"
echo "访问地址：http://${HOST_IP}:${HOST_PORT}/"
echo "初始用户名：admin"

# 等待一段时间再尝试获取初始密码，避免文件尚未生成的情况
echo "等待获取初始密码..."
sleep 15

# 尝试获取初始密码，如果文件存在则输出密码，否则给出提示
PASSWORD_FILE="${NEXUS_VOLUME_DIR}/admin.password"
if [ -f "$PASSWORD_FILE" ]; then
    echo "初始密码：$(cat "$PASSWORD_FILE")"
else
    echo "无法获取初始密码，请稍后手动查看。"
fi