# docker-mysql
使用docker部署mysql，并解决远程登陆，和数据库大小写区分问题

# About the function：
  1.自定义用户名密码；
  
  2.远程登陆权限开启；
  
  3.时间与主机同步；
  
  4.数据库大小写不区分设置；
  
 # Pull the image
 ```$xslt
   docker pull honeyshawn/mysql:5.7
```
 
 # Use the image
 参照example：
 ```yml
 version: '2'
 services:
   mysql:
     image: honeyshawn/mysql:5.7
     container_name: mysql
     volumes:
       - /opt/data:/var/lib/mysql # 持久化
     ports:
       - "3306:3306"
     environment:
       - MYSQL_USER=root
       - MYSQL_PASSWORD=123456
       - MYSQL_ROOT_PASSWORD=123456
 ```
 案例运行：
 ```shell
  sh run.sh
```