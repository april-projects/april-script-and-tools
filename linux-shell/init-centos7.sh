#!/bin/bash

# 函数：检查软件包是否已安装
check_package_installed() {
    package_name=$1
    if rpm -q "$package_name" > /dev/null; then
        return 0  # 已安装
    else
        return 1  # 未安装
    fi
}

# 检查并更新系统及常用工具
echo "开始检查并更新系统及常用工具..."

# 更新系统
sudo yum update -y

# 安装常用工具
sudo yum install -y wget curl git unzip

# 安装 dos2unix，如果已安装则更新
if check_package_installed "dos2unix"; then
    echo "dos2unix 已安装，执行更新操作..."
    sudo yum update -y dos2unix
else
    echo "安装 dos2unix..."
    sudo yum install -y dos2unix
fi

# 安装 vim，如果已安装则更新配置
if check_package_installed "vim"; then
    echo "vim 已安装，执行配置更新..."
    # 配置 vimrc
    echo "syntax on" >> ~/.vimrc
    echo "set tabstop=4" >> ~/.vimrc
    echo "set shiftwidth=4" >> ~/.vimrc
    echo "set expandtab" >> ~/.vimrc
else
    echo "安装 vim..."
    sudo yum install -y vim
    # 配置 vimrc
    echo "syntax on" >> ~/.vimrc
    echo "set tabstop=4" >> ~/.vimrc
    echo "set shiftwidth=4" >> ~/.vimrc
    echo "set expandtab" >> ~/.vimrc
fi

# 安装 tmux，如果已安装则更新配置
if check_package_installed "tmux"; then
    echo "tmux 已安装，执行配置更新..."
    # 配置 tmux.conf
    echo "set-option -g default-shell /bin/bash" >> ~/.tmux.conf
    echo "set -g mouse on" >> ~/.tmux.conf
else
    echo "安装 tmux..."
    sudo yum install -y tmux
    # 配置 tmux.conf
    echo "set-option -g default-shell /bin/bash" >> ~/.tmux.conf
    echo "set -g mouse on" >> ~/.tmux.conf
fi

# 配置 bashrc
echo "配置 bashrc..."
if ! grep -q "alias ll='ls -alF'" ~/.bashrc; then
    echo "alias ll='ls -alF'" >> ~/.bashrc
fi
if ! grep -q "alias la='ls -A'" ~/.bashrc; then
    echo "alias la='ls -A'" >> ~/.bashrc
fi
if ! grep -q "alias l='ls -CF'" ~/.bashrc; then
    echo "alias l='ls -CF'" >> ~/.bashrc
fi
if ! grep -q "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\\$ '" ~/.bashrc; then
    echo "export PS1='[\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]]\\$ '" >> ~/.bashrc
fi

echo "初始化完成。"

# 提示是否需要重新启动系统
echo -e "\n🔄 建议重新启动系统以使部分设置生效。"
read -p "是否立即重新启动系统？（y/n）" choice
if [ "$choice" == "y" ]; then
    echo "系统将重新启动..."
    sudo reboot
else
    echo "请手动重新启动系统以使设置生效。"
fi