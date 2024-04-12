#!/bin/bash

# 定义开放端口脚本的路径
OPEN_PORT_SCRIPT="open_firewall_port.sh"

# 定义全局路径
GLOBAL_PATH="/usr/local/bin/$OPEN_PORT_SCRIPT"

# 检查开放端口脚本是否存在
if [ ! -f "$OPEN_PORT_SCRIPT" ]; then
    echo "错误：找不到开放端口脚本 $OPEN_PORT_SCRIPT。"
    exit 1
fi

# 复制开放端口脚本到全局路径
echo "复制开放端口脚本到系统路径：$GLOBAL_PATH"
sudo cp "$OPEN_PORT_SCRIPT" "$GLOBAL_PATH"

# 赋予开放端口脚本执行权限
echo "赋予执行权限：$GLOBAL_PATH"
sudo chmod +x "$GLOBAL_PATH"

echo "初始化脚本执行完毕。"