FROM mysql:5.7
MAINTAINER honeyshawn

#设置允许以root用户的空密码启动容器
#ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

#解决中文乱码
ENV LANG="zh_CN.UTF-8"
#定时任务
ENV LC_ALL C.UTF-8
ADD run.sh /opt/run.sh
#时间与主机差8小时设置
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' >/etc/timezone  && \
    #执行权限
    chmod +x /opt/*.sh
#配置文件
COPY ./mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
CMD ["/opt/run.sh"]