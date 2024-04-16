#!/bin/bash

# 函数：检查并卸载已安装的 JDK
check_and_uninstall_jdk() {
    # 查找已安装的 JDK
    jdk_path=$(readlink -f $(which java) | sed "s:bin/java::")

    if [ -z "$jdk_path" ]; then
        echo "未找到已安装的 JDK。"
        return
    fi

    echo "检测到已安装的 JDK 在路径：$jdk_path"

    # 确认是否卸载已安装的 JDK
    read -p "是否卸载已安装的 JDK？（y/n）" uninstall_choice
    if [ "$uninstall_choice" == "y" ]; then
        echo "开始卸载已安装的 JDK..."
        sudo rm -rf "$jdk_path"
        echo "已安装的 JDK 卸载完成。"
    else
        echo "取消卸载已安装的 JDK。"
        exit 1
    fi
}

# 检查并卸载已安装的 JDK
check_and_uninstall_jdk

# 设置 JDK 下载链接和安装目录
jdk_url="https://download.oracle.com/java/17/archive/jdk-17.0.10_linux-x64_bin.tar.gz"
install_dir="/usr/local/jdk"

# 创建安装目录
sudo mkdir -p "$install_dir"

# 下载 JDK 压缩包
echo "正在下载 JDK，请稍候..."
sudo wget --quiet --show-progress "$jdk_url" -O /tmp/jdk.tar.gz

# 解压 JDK 到安装目录
echo "正在解压 JDK 到 $install_dir，请稍候..."
sudo tar -zxvf /tmp/jdk.tar.gz -C "$install_dir" --strip-components=1

# 设置 JDK 环境变量
echo "配置 JDK 环境变量..."
echo "export JAVA_HOME=$install_dir" | sudo tee /etc/profile.d/jdk.sh > /dev/null
echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile.d/jdk.sh > /dev/null

# 刷新环境变量
source /etc/profile.d/jdk.sh

# 清理临时文件
sudo rm /tmp/jdk.tar.gz

echo "JDK 安装完成！"
echo "请使用 'java -version' 命令检查安装结果。"