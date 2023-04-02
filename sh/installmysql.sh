#!bin/bash
rpm  -q  mariadb-server  mariadb
systemctl  stop  mariadb 
rpm  -e  --nodeps  mariadb  mariadb-server 
rm  -rf  /etc/my.cnf  
rm  -rf  /var/lib/mysql/*
yum -y install wget && wget https://alist.yyzq.cf/d/%20%E6%9C%AC%E5%9C%B0%E7%BD%91%E7%9B%98/linux/mysql-5.7.17.tar
tar  -xf mysql-5.7.17.tar
yum -y install mysql-community-*.rpm
systemctl  start mysqld
systemctl  enable mysqld
netstat  -utnlp  | grep  3306
ps -C mysqld
grep password  /var/log/mysqld.log | tail -1


