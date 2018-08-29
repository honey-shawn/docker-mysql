# docker-mysql
使用docker部署mysql，并解决远程登陆，和数据库大小写区分问题

# About the function：
  1.自定义用户名密码；
  
  2.远程登陆权限开启；
  
  3.时间与主机同步；
  
  4.数据库大小写不区分设置；
  
# Arguments：
* **MYSQL_ROOT_PASSWORD** root用户密码，必需设置
* MYSQL_USER 自定义用户名，可选，使用时需和MYSQL_USER同时设置
* MYSQL_PASSWORD 自定义用户密码，可选
* MYSQL_ALLOW_EMPTY_PASSWORD 可选，设置为yes允许以root用户的空密码启动容器
* MYSQL_RANDOM_ROOT_PASSWORD 可选，设置yes为为root用户生成随机初始密码（使用pwgen）。生成的root密码将打印到stdout（GENERATED ROOT PASSWORD: .....）

注意：建议不要将MYSQL_ALLOW_EMPTY_PASSWORD变量设置为yes，除非您确实知道自己在做什么，因为这会使您的MySQL实例完全不受保护，从而允许任何人获得完整的超级用户访问权限。
                                                        
  
# Pull the image
```$xslt
   docker pull honeyshawn/mysql:5.7
```

# Build the image
```$xslt
   docker build -t honeyshawn/mysql:5.7 .
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
       - MYSQL_USER=test
       - MYSQL_PASSWORD=passwd
       - MYSQL_ROOT_PASSWORD=123456
 ```
 案例运行：
 ```shell
  sh run.sh
```