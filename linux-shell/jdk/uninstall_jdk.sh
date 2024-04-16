#!/bin/bash

# 函数：检查并卸载已安装的 JDK
check_and_uninstall_jdk() {
    # 查找已安装的 JDK
    jdk_path=$(readlink -f $(which java) | sed "s:bin/java::")

    if [ -z "$jdk_path" ]; then
        echo "未找到已安装的 JDK。"
        exit 1
    fi

    echo "检测到已安装的 JDK 在路径：$jdk_path"

    # 确认是否卸载已安装的 JDK
    read -p "是否卸载已安装的 JDK？（y/n）" uninstall_choice
    if [ "$uninstall_choice" == "y" ]; then
        echo "开始卸载已安装的 JDK..."

        # 删除 JDK 安装目录及其内容
        sudo rm -rf "$jdk_path"

        echo "已安装的 JDK 卸载完成。"

        # 删除 JDK 环境变量设置文件 jdk.sh
        jdk_env_file="/etc/profile.d/jdk.sh"
        if [ -f "$jdk_env_file" ]; then
            echo "删除 JDK 环境变量设置文件: $jdk_env_file"
            sudo rm "$jdk_env_file"
        else
            echo "未找到 JDK 环境变量设置文件: $jdk_env_file"
        fi
    else
        echo "取消卸载已安装的 JDK。"
        exit 1
    fi
}

# 执行检查并卸载已安装的 JDK 的函数
check_and_uninstall_jdk
