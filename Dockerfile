FROM mysql:5.7
MAINTAINER honey.shawn
#设置免密登录
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
#mysql用户名密码
#ENV MYSQL_USER root
#ENV MYSQL_PASSWORD 123456
#ENV MYSQL_ROOT_PASSWORD 123456
#解决中文乱码
ENV LANG="zh_CN.UTF-8"
#定时任务
ENV LC_ALL C.UTF-8
ADD run.sh /opt/run.sh
#时间与主机差8小时设置
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' >/etc/timezone  && \
    #创建备份数据目录
    mkdir -p /data/mysql_bak/mysql_bak_list && \
    #执行权限
    chmod +x /opt/*.sh
#配置文件
COPY ./mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
CMD ["/opt/run.sh"]