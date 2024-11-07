#!/bin/bash

# 配置参数
GITEA_IMAGE="gitea/gitea:latest"
HOST_IP="192.168.245.129"
HOST_PORT="3000"
SSH_PORT="222"
CONTAINER_NAME="gitea"

# 数据目录配置
GITEA_DATA_DIR="/usr/local/gitea/data"
GITEA_CONFIG_DIR="/usr/local/gitea/config"

# 创建数据和配置目录
mkdir -p $GITEA_DATA_DIR
mkdir -p $GITEA_CONFIG_DIR

# 拉取最新的 Gitea 镜像
docker pull $GITEA_IMAGE

# 停止并删除已存在的 Gitea 容器
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container $CONTAINER_NAME..."
    docker rm -f $CONTAINER_NAME
fi

# 启动 Gitea 容器，使用非 root 用户
docker run -d --name $CONTAINER_NAME \
    --privileged=true \
    --restart=always \
    -p $HOST_IP:$HOST_PORT:3000 \
    -p $HOST_IP:$SSH_PORT:22 \
    -v $GITEA_DATA_DIR:/data \
    -v $GITEA_CONFIG_DIR:/etc/gitea \
    $GITEA_IMAGE

# 检查容器是否成功启动
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Gitea 已成功安装并在宿主机的 $HOST_IP:$HOST_PORT 运行。"
    echo "您可以通过浏览器访问 http://$HOST_IP:$HOST_PORT 访问 Gitea。"
else
    echo "Gitea 容器启动失败，请检查日志。"
fi