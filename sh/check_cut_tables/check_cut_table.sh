# -------------------------------------------------------------------------------
# Title:       切表检测
# Date:        2022/08/01
# Author:      尹晓昊
# Email:       yinxiaohao@cincc.cn
# Description: 用于检测在线项目月初切表是否正常
# Notes:       可根据自己项目需要检测的中间表或者合并话单表修改tablenames变量,其中表report_displaynumber、hour_report_displaynumber、report_vcc_callin_accesscode、hour_report_vcc_callin_accesscode为中石化定制中间表
# -------------------------------------------------------------------------------

#!/bin/sh

hostname="localhost"
port="3300"
read -p $'\e[32m\e[1m请输入Mysql用户名，按回车结束:\e[0m\n' username
read -s -p $'\e[32m\e[1m请输入Mysql密码，按回车结束:\e[0m\n' password

pwlen=${#password}
if [[ $pwlen = 0 ]]
  then
	result=$(mysql -h$hostname -P$port -u$username -e quit 2>&1)
else
	result=$(mysql -h$hostname -P$port -u$username -p$password -e quit 2>&1)
fi

echo -e "\e[36m\e[5m\e[1m正在验证用户名密码...\e[0m"
sleep 3

if [[ ${result} =~ '1045 (28000)' ]]
  then
	echo -e "\e[31m\e[1m警告:用户名或密码错误,程序退出！\e[0m"
	exit 1
fi

echo -e "\e[32m\e[1m用户名密码验证成功，准备进行切表检测...\e[0m"
sleep 3

dbname="smp"

mergetable=(
cti_callrecord
cti_callin
cti_callout
cti_workevent
vms_rs_log
)

middletable=(
hour_report_vcc_summary
report_vcc_summary
hour_report_human_service
report_human_service
hour_report_agent
report_agent
hour_report_callin
report_callin
hour_report_vcc_callin_accesscode
report_vcc_callin_accesscode
hour_report_displaynumber
report_displaynumber
)

date1=$(date +%Y%m -d '+2 month')
date2=$(date +%Y%m -d '-1 month')
date3=$(date +%Y%m -d '+1 month')

success=0
fail=0
exception=0
failtables=()
exceptiontables=()

echo -e '------------------------\e[34m\e[1m切表检测开始\e[0m------------------------'
for tb in ${mergetable[*]}
do
  sleep 1
  tb_date=${tb}_${date2}
  check_table="select count(*) from information_schema.tables where table_schema='$dbname' and  table_name='$tb_date';"
  cc=$(mysql -h$hostname -P$port -u$username -p$password -e "$check_table" 2>/dev/null)
  if [[ ${cc: -1} = 1 ]]
    then
	success=`expr ${success} + 1`
	echo -e ${tb_date}' >>> \e[32m\e[1m检测成功！\e[0m'
  elif [[ ${cc: -1} = 0 ]]
    then
	failtables+=($tb_date)
	fail=`expr ${fail} + 1`
	echo -e ${tb_date}' >>> \e[31m\e[1m检测失败！\e[0m'
  else
	exceptiontables+=($tb_date)
	exception=`expr ${exception} + 1`
	echo -e ${tb_date}' >>> \e[31m\e[1m检测异常！\e[0m'
  fi
done

for tb in ${mergetable[*]}
do
  sleep 1
  tb_date=${tb}_${date3}
  check_table="select count(*) from information_schema.tables where table_schema='$dbname' and  table_name='$tb_date';"
  cc=$(mysql -h$hostname -P$port -u$username -p$password -e "$check_table" 2>/dev/null)
  if [[ ${cc: -1} = 1 ]]
    then
	success=`expr ${success} + 1`
	echo -e ${tb_date}' >>> \e[32m\e[1m检测成功！\e[0m'
  elif [[ ${cc: -1} = 0 ]]
    then
	failtables+=($tb_date)
	fail=`expr ${fail} + 1`
	echo -e ${tb_date}' >>> \e[31m\e[1m检测失败！\e[0m'
  else
	exceptiontables+=($tb_date)
	exception=`expr ${exception} + 1`
	echo -e ${tb_date}' >>> \e[31m\e[1m检测异常！\e[0m'
  fi
done

for tb in ${mergetable[*]}
do
  sleep 1
  tb_date=${tb}_${date1}
  check_table="select count(*) from information_schema.tables where table_schema='$dbname' and  table_name='$tb_date';"
  cc=$(mysql -h$hostname -P$port -u$username -p$password -e "$check_table" 2>/dev/null)
  if [[ ${cc: -1} = 1 ]]
    then
	success=`expr ${success} + 1`
	echo -e ${tb_date}' >>> \e[32m\e[1m检测成功！\e[0m'
  elif [[ ${cc: -1} = 0 ]]
    then
	failtables+=($tb_date)
	fail=`expr ${fail} + 1`
	echo -e ${tb_date}' >>> \e[31m\e[1m检测失败！\e[0m'
  else
	exceptiontables+=($tb_date)
	exception=`expr ${exception} + 1`
	echo -e ${tb_date}' >>> \e[31m\e[1m检测异常！\e[0m'
  fi
done

for tb in ${middletable[*]}
do
  sleep 1
  tb_date=${tb}_${date2}
  check_table="select count(*) from information_schema.tables where table_schema='$dbname' and  table_name='$tb_date';"
  cc=$(mysql -h$hostname -P$port -u$username -p$password -e "$check_table" 2>/dev/null)
  if [[ ${cc: -1} = 1 ]]
    then
        success=`expr ${success} + 1`
        echo -e ${tb_date}' >>> \e[32m\e[1m检测成功！\e[0m'
  elif [[ ${cc: -1} = 0 ]]
    then
	failtables+=("$tb_date")
        fail=`expr ${fail} + 1`
        echo -e ${tb_date}' >>> \e[31m\e[1m检测失败！\e[0m'
  else
	exceptiontables+=($tb_date)
        exception=`expr ${exception} + 1`
        echo -e ${tb_date}' >>> \e[31m\e[1m检测异常！\e[0m'
  fi
done
echo -e '------------------------\e[34m\e[1m切表检测完成\e[0m------------------------'
echo -e '检测数量:\e[34m\e[1m'${#tablenames[*]}'\e[0m 成功数量:\e[32m\e[1m'${success}'\e[0m 失败数量:\e[31m\e[1m'${fail}'\e[0m 异常数量:\e[31m\e[1m'${exception}'\e[0m'
if [[ $fail > 0 ]]
  then
  echo -e '\e[1m失败的表分别为:\e[0m\e[31m'
  for i in ${failtables[*]}
  do
    echo $i
  done
fi
if [[ $exception > 0 ]]
  then
  echo -e '\e[1m异常的表分别为:\e[0m\e[31m'
  for i in ${exceptiontables[*]}
  do
    echo $i
  done
fi
echo -e '\e[0m------------------------\e[34m\e[1m↑↑检测结果↑↑\e[0m------------------------'
exit 0
