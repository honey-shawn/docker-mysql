#!/bin/bash
#set -x
chown mysql:mysql -R /var/lib/mysql/
#启动mysql
service mysql start
echo `service mysql status`

#登录mysql
MYSQL="mysql -uroot -p$MYSQL_PASSWORD"
#远程登录
sql_i="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
sql_j="flush privileges;"
sql_z="exit"

$MYSQL -e "${sql_i}"
$MYSQL -e "${sql_j}"
$MYSQL -e "${sql_z}"

#退出mysql
echo 'stop mysql...'
service mysql stop
#在前台运行mysql服务，由docker守护
echo 'start mysql with console...'
mysqld
#tail -f /dev/null