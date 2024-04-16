#!/bin/bash

# 检查并卸载 MySQL
uninstall_mysql() {
    # 检查是否已安装 MySQL
    if systemctl is-active --quiet mysqld.service; then
        echo "检测到已安装的 MySQL，准备卸载..."

        # 停止 MySQL 服务
        sudo systemctl stop mysql

        # 禁止 MySQL 开机自启动
        sudo systemctl disable mysql

        # 移除 MySQL 软件包
        sudo yum -y remove mysql-community-server

        # 删除 MySQL 相关文件和目录
        sudo rm -rf /var/lib/mysql /etc/my.cnf /etc/mysql /var/log/mysql* /usr/lib64/mysql
        
        # 使用 find 命令查找系统中所有与 MySQL 相关的文件并删除
        echo "正在查找并删除系统中的 MySQL 相关文件..."
        sudo find / -name "*mysql*" -exec rm -rf {} \;
        echo "已成功删除系统中的 MySQL 相关文件。"
        
        sudo systemctl daemon-reload

        echo "已成功卸载 MySQL。"
    else
        echo "未检测到已安装的 MySQL。"
    fi

    # 检查 MySQL 可执行文件路径是否存在
    mysql_path=$(whereis mysql | awk '{print $2}')
    if [ -n "$mysql_path" ]; then
        echo "发现 MySQL 可执行文件，尝试删除..."
        sudo rm -rf "$mysql_path"
        echo "已成功删除 MySQL 可执行文件。"
    fi

    # 列出所有与 MySQL 相关的已安装软件包
    mysql_packages=$(rpm -qa | grep -i mysql)
    if [ -n "$mysql_packages" ]; then
        echo "发现以下与 MySQL 相关的已安装软件包："
        echo "$mysql_packages"

        # 可以根据需要进行卸载这些软件包
        echo "开始卸载这些软件包..."
        sudo yum -y remove $mysql_packages
        echo "已成功卸载与 MySQL 相关的软件包。"
    else
        echo "未找到与 MySQL 相关的已安装软件包。"
    fi
}

# 执行卸载操作
uninstall_mysql