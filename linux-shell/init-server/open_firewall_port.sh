#!/bin/bash

# 提示用户输入要开放的端口号
echo "请输入要开放的端口号（例如：8088）:"
read PORT

# 检查输入是否为数字
if ! [[ "$PORT" =~ ^[0-9]+$ ]]; then
    echo "错误：端口号必须是一个数字。"
    exit 1
fi

# 添加端口到防火墙规则
firewall-cmd --zone=public --add-port=$PORT/tcp --permanent

# 应用防火墙规则的永久更改
firewall-cmd --reload

# 输出操作完成信息
echo "端口 $PORT 已成功添加到防火墙规则并重新启动防火墙。"

