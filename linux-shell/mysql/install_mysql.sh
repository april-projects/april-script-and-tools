#!/bin/bash

# 安装 MySQL 的函数
install_mysql() {
    # 更新系统并安装必要的依赖
    echo "正在更新系统和安装必要的依赖..."
    sudo yum update -y
    sudo yum install -y wget

    # 下载 MySQL 的 YUM 源配置文件
    echo "下载 MySQL YUM 源配置文件..."
    sudo rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

    # 安装 MySQL YUM 源配置文件
    echo "安装 MySQL YUM 源配置文件..."
    sudo rpm -ivh mysql80-community-release-el7-3.noarch.rpm

    # 安装 MySQL Server
    echo "安装 MySQL Server..."
    sudo yum -y --enablerepo=mysql80-community install mysql-community-server

    # 启动 MySQL 服务
    echo "启动 MySQL 服务..."
    sudo systemctl start mysqld
    
    echo "MySQL 服务状态："
    sudo systemctl status mysqld

    # 设置 MySQL 开机自启动
    echo "设置 MySQL 开机自启动..."
    sudo systemctl enable mysqld

    # 获取初始默认密码
    echo "获取初始默认密码..."
    log_file="/var/log/mysqld.log"
    if [ -f "$log_file" ]; then
        default_password=$(sudo grep 'temporary password' "$log_file" | awk '{print $NF}')
        echo "MySQL 初始默认密码为：$default_password"
    else
        echo "未找到 MySQL 初始默认密码。"
        return 1
    fi

    # 创建临时 SQL 文件
    temp_sql_file=$(mktemp /tmp/temporary-mysql-script.XXXXXX.sql)
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Root123456!..';" > "$temp_sql_file"
    echo "FLUSH PRIVILEGES;" >> "$temp_sql_file"
    echo "CREATE USER 'root'@'%' IDENTIFIED BY 'Root123456!..';" >> "$temp_sql_file"
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';" >> "$temp_sql_file"
    echo "FLUSH PRIVILEGES;" >> "$temp_sql_file"

    # 使用 mysql 命令执行临时 SQL 文件
    echo "执行 SQL 文件..."
    mysql -u root -p"$default_password" --connect-expired-password -e "source $temp_sql_file"

    echo "MySQL 初始默认密码已修改为：Root123456!.."
    echo "已设置远程登录权限。"

    # 删除临时 SQL 文件
    rm -rf "$temp_sql_file"

    # 打印 MySQL 服务状态
    echo "MySQL 服务状态："
    sudo systemctl status mysqld

    # 编辑 my.cnf 配置文件
#    echo "编辑 my.cnf 配置文件..."
#    sudo tee /etc/my.cnf <<EOF
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/8.0/en/server-configuration-defaults.html

#[mysqld]
# 设置3306端口
#port=3306

# 允许最大连接数
#max_connections=1000

# 允许连接失败的次数。这是为了防止有人从该主机试图攻击数据库系统
#max_connect_errors=100

# 服务端使用的字符集默认为UTF8
#character-set-server=utf8mb4

# 创建新表时将使用的默认存储引擎
#default-storage-engine=INNODB

# 是否对SQL语句大小写敏感，1表示不敏感
#lower_case_table_names=1

# MySQL连接闲置超过一定时间后(单位：秒)将会被强行关闭
#interactive_timeout=1800
#wait_timeout=1800

# Metadata Lock最大时长（秒），一般用于控制alter操作的最大时长sine mysql5.6
# 执行DML操作时除了增加innodb事务锁外还增加Metadata Lock，其他alter（DDL）session将阻塞
#lock_wait_timeout=3600

# 内部内存临时表的最大值。
# 比如大数据量的group by, order by时可能用到临时表，
# 超过了这个值将写入磁盘，系统IO压力增大
#tmp_table_size=64M
#max_heap_table_size=64M

# 设置mysql数据库的数据的存放目录
#datadir=/var/lib/mysql

# 设置 MySQL 的 Unix 套接字文件路径
#socket=/var/lib/mysql/mysql.sock

# 设置 MySQL 错误日志文件路径
#log-error=/var/log/mysqld.log

# 设置 MySQL 进程 ID 文件路径
#pid-file=/var/run/mysqld/mysqld.pid
#EOF

    # 重启 MySQL 服务使配置生效
#    echo "重启 MySQL 服务使配置生效..."
#    sudo systemctl restart mysqld

    echo "MySQL 配置完成。"
}

# 执行安装 MySQL 的函数
install_mysql