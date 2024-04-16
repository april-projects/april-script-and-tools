#!/bin/bash

set -e  # 设置脚本遇到错误即退出

# 安装 Git
install_git() {
    # 安装 Git 依赖
    yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker

    # 移除系统自带的 Git (如果存在)
    rpm -e --nodeps git || true  # 如果移除失败不要终止脚本

    # 下载并安装指定版本的 Git
    cd /usr/local/
    wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.38.1.tar.gz
    tar -xzvf git-2.38.1.tar.gz
    cd git-2.38.1
    ./configure prefix=/usr/
    make
    make install

    # 验证 Git 安装成功
    git --version
}

# 安装 Gitea
install_gitea() {
    # 创建 Gitea 安装目录
    mkdir -p /usr/local/gitea

    # 添加 gitea 用户
    adduser gitea

    # 设置 gitea 用户密码
    passwd gitea

    # 将 gitea 用户添加到 sudoers 文件中
    echo "gitea ALL=(ALL) ALL" >> /etc/sudoers

    # 下载 Gitea 二进制文件
    cd /home/gitea
    wget -O gitea https://dl.gitea.io/gitea/1.20/gitea-1.20-linux-amd64
    chmod +x gitea

    # 创建 Gitea systemd 服务配置文件
    cat <<EOF > /etc/systemd/system/gitea.service
[Unit]
Description=Gitea (Git with a cup of tea)
After=syslog.target
After=network.target

[Service]
RestartSec=2s
Type=simple
User=gitea
Group=gitea
WorkingDirectory=/home/gitea/
ExecStart=/home/gitea/gitea web --config /home/gitea/custom/conf/app.ini
Restart=always
Environment=USER=gitea HOME=/home/gitea/ GITEA_WORK_DIR=/home/gitea/

[Install]
WantedBy=multi-user.target
EOF

    # 启用和启动 Gitea 服务
    systemctl enable gitea
    systemctl start gitea

    # 查看 Gitea 服务状态
    systemctl status gitea
}

# 执行安装 Git
echo "开始安装 Git..."
install_git || { echo "安装 Git 失败，退出脚本"; exit 1; }

# 执行安装 Gitea
echo "开始安装 Gitea..."
install_gitea || { echo "安装 Gitea 失败，退出脚本"; exit 1; }

echo "安装和配置完成."