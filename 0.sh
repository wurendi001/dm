#! /bin/bash
# By jcnf

#颜色
red(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[38m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[36m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[32m\033[01m$1\033[0m"
}

#服务器检查项目
#Lemonbench 综合测试
function Lemonbench(){
curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast
}

#三网Speedtest测速
function 3speed(){
bash <(curl -Lso- https://raw.githubusercontent.com/BlueSkyXN/SpeedTestCN/main/superspeed.sh)
}

#Memorytest 内存压力测试
function memorytest(){
yum install wget -y
yum groupinstall "Development Tools" -y
wget https://raw.githubusercontent.com/FunctionClub/Memtester/master/memtester.cpp
blue "下载完成"
gcc -l stdc++ memtester.cpp
./a.out
}

#Route-trace 回城路由追踪
function rtsh(){
wget -O "/root/jcnf.sh" "https://raw.githubusercontent.com/Netflixxp/jcnfbesttrace/main/jcnf.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/jcnf.sh"
chmod 777 "/root/jcnf.sh"
yellow "下载完成,之后可执行 bash /root/jcnf.sh 再次运行"
bash "/root/jcnf.sh"
}

#Speedtest for Linux·下载
function speedtest-linux(){
wget -O "/root/speedtest" "https://raw.githubusercontent.com/Netflixxp/jcnf-box/master/sh/speedtest" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/speedtest"
chmod 777 "/root/speedtest"
yellow "下载完成,之后可执行 bash /root/speedtest 再次运行"
./speedtest
}

#获取本机IP
function getip(){
echo  
curl ip.p3terx.com
echo
}

#nf.sh 流媒体解锁测试
function nf(){
        #安装JQ
	if [ -e "/etc/redhat-release" ];then
	yum install epel-release -y -q > /dev/null;
	yum install jq -y -q > /dev/null;
	elif [[ $(cat /etc/os-release | grep '^ID=') =~ ubuntu ]] || [[ $(cat /etc/os-release | grep '^ID=') =~ debian ]];then
	apt-get update -y > /dev/null;
	apt-get install jq > /dev/null;
	else 
	echo -e "${Font_Red}请手动安装jq${Font_Suffix}";
	exit;
	fi
        jq -V > /dev/null 2>&1;
        if [ $? -ne 0 ];then
	echo -e "${Font_Red}请手动安装jq${Font_Suffix}";
	exit;
        fi
bash <(curl -sSL https://raw.githubusercontent.com/Netflixxp/NF/main/nf.sh)
}

#检测/诊断Youtube地域
function tubecheck(){
wget -O "/root/tubecheck" "https://cdn.jsdelivr.net/gh/sjlleo/TubeCheck/CDN/tubecheck_1.0beta_linux_amd64" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/tubecheck"
chmod 777 "/root/tubecheck"
yellow "下载完成,之后可执行 ./tubecheck 再次运行"
./tubecheck
}

#IPV.SH ipv4/6优先级调整
function ipvsh(){
wget -O "/root/ipv4.sh" "https://raw.githubusercontent.com/Netflixxp/jcnf-box/master/sh/ipv4.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/ipv4.sh"
chmod 777 "/root/ipv4.sh"
yellow "下载完成,之后可执行 bash /root/ipv4.sh 再次运行"
bash "/root/ipv4.sh"
}

#系统网络配置优化
function system-best(){
	sed -i '/net.ipv4.tcp_retries2/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_slow_start_after_idle/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fastopen/d' /etc/sysctl.conf
	sed -i '/fs.file-max/d' /etc/sysctl.conf
	sed -i '/fs.inotify.max_user_instances/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syncookies/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fin_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_tw_reuse/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_syn_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_local_port_range/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_tw_buckets/d' /etc/sysctl.conf
	sed -i '/net.ipv4.route.gc_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_synack_retries/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syn_retries/d' /etc/sysctl.conf
	sed -i '/net.core.somaxconn/d' /etc/sysctl.conf
	sed -i '/net.core.netdev_max_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_timestamps/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_orphans/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_forward/d' /etc/sysctl.conf

echo "net.ipv4.tcp_retries2 = 8
net.ipv4.tcp_slow_start_after_idle = 0
fs.file-max = 1000000
fs.inotify.max_user_instances = 8192
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 32768
# forward ipv4
#net.ipv4.ip_forward = 1">>/etc/sysctl.conf
sysctl -p
	echo "*               soft    nofile           1000000
*               hard    nofile          1000000">/etc/security/limits.conf
	echo "ulimit -SHn 1000000">>/etc/profile
	read -p "需要重启VPS后，才能生效系统优化配置，是否现在重启 ? [Y/n] :" yn
	[ -z "${yn}" ] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS 重启中..."
		reboot
	fi
}
#303 【 《tiktok”无人值守循环推流直播搭建》 】
function wuren(){
bash <(curl -s -L http://xzdfs96.fit/wuren.sh)
}
#302 【 VPS内存日志自动清理 】
function vmshellvps(){
bash <(curl -s -L http://xzdfs96.fit/vmshellvps.sh)
}
#301 【 一键修改root密码 】
function root(){
bash <(curl -s -L http://xzdfs96.fit/root.sh)
}
#300 【 开放所有端口,统一本地时间\,更新及安装组件,测速,关闭Iptable规则 】
function init(){
bash <(curl -s -L http://xzdfs96.fit/init.sh)
}
#210 【 Linux网络优化脚本 】
function tools(){
bash <(curl -s -L http://xzdfs96.fit/tools.sh)
}
#211  宝塔面板免验证(中文破解版
function install_6.0(){
bash <(curl -s -L http://xzdfs96.fit/install_6.0.sh)
}
#212 【 无人直播搭建 】
function wuren(){
bash <(curl -s -L http://xzdfs96.fit/wuren.sh)
}
#========================================================
#=====================科学上网工具=======================
#========================================================
#00 【 安装BBR 】
function bbr(){
bash <(curl -s -L http://xzdfs96.fit/tcp.sh)
}
#99 【 安装BBRS 】
function bbrs(){
bash <(curl -s -L http://xzdfs96.fit/tcp2.sh)
}
#101 【 Xray一键安装脚本 】
function vpn001(){
bash <(curl -s -L http://xzdfs96.fit/xr2.sh)
}
#301 【 Xray另外一个修改版一键安装脚本 】
function vpn000(){
bash <(curl -s -L http://xzdfs96.fit/xr0.sh)
}
#102 【八合一共存脚本 】
function vpn002(){
bash <(curl -s -L http://xzdfs96.fit/v2r2.sh)
} 
#103 【Wulabing Xray 一键脚本 】
function vpn003(){
bash <(curl -s -L http://xzdfs96.fit/xr1.sh)  
} 
#104 【 Trojan/V2ray/SSR八合一脚本 】
function vpn004(){
bash <(curl -s -L http://xzdfs96.fit/v2r1.sh)  
} 
#105 【 233Boy 修改版 V2Ray 一键安装脚本 】
function vpn005(){
bash <(curl -s -L http://xzdfs96.fit/v2r3.sh) 
} 
#106 【 xui 一键安装脚本 】
function vpn011(){
bash <(curl -s -L http://xzdfs96.fit/x-ui.sh) 
}
#107 【 ssr 一键安装脚本 】
function ssr(){
bash <(curl -s -L http://xzdfs96.fit/ssr.sh) 
} 
#117 【 naiveproxy 一键安装脚本 】
function naiveproxy(){
bash <(curl -s -L http://xzdfs96.fit/na.sh) 
} 
#108  iptables.sh iptable中转
function iptsh(){
wget -O "/root/iptables.sh" "https://raw.githubusercontent.com/Netflixxp/jcnf-box/main/sh/iptables.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/iptables.sh"
chmod 777 "/root/iptables.sh"
yellow "下载完成，你也可以输入 bash /root/iptables.sh 来手动运行"
bash "/root/iptables.sh"
}
#109  gost.sh gost一键中转
function gost(){
wget -O "/root/gost.sh" "https://raw.githubusercontent.com/KANIKIG/Multi-EasyGost/master/gost.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/gost.sh"
chmod 777 "/root/gost.sh"
yellow "下载完成，你也可以输入 bash /root/gost.sh 来手动运行"
bash "/root/gost.sh"
}
#211  宝塔面板免验证(中文破解版
function install_6.0(){
bash <(curl -s -L http://xzdfs96.fit/install_6.0.sh)
}

#========================================================


#主菜单
function start_menu(){
    yum install -y curl wget 2> /dev/null || apt install -y curl wget
    clear
    yellow " ===================项目描述内容============================ "
    
    green "               ${RED}Xray一键安装脚本${PLAIN}"

    red   " 作者：(失落的梦) 常用综合脚本包" 
    green " 联系微信：Falltoher-1314 "
    green " QQ:1150315739 "
    green " TG群：https://t.me/vpsjiaoliudajian "
    green " 博客1：https://www.kehu33.asia "
    green " 博客2：https://www.vcxm789.asia "
    yellow " ===================科学上网工具============================ "
    blue " 00.【 BBR加速 一键脚本】"
    blue " 99.【 BBRS加速另外一个版本 一键脚本】"
    blue " 1.【 Xray一键安装脚本】"   
    blue " 2.【 Xray另外一个修改版本 一键安装脚本】" 
    blue " 3.【 八合一共存另外一种 一键脚本 】"    
    blue " 4.【 Wulabing Xray 一键脚本】" 
    blue " 5.【 Trojan/V2ray/SSR八合一 脚本】"
    blue " 6.【 233boy V2Ray 一键安装脚本】"
    blue " 7.【 x-ui 一键脚本】"
    blue " 8.【 ssr 一键脚本 "
    blue " 9.【 naiveproxy 一键脚本 "
    yellow " ===================服务器中转工具============================ "
    blue " 10. iptables 一键中转 "
    blue " 11. gost 一键中转 "	
    yellow " ===================服务器检查============================== "
    green " 12. Lemonbench 综合测试 "
    green " 13. 三网Speedtest测速"
    green " 14. 内存压力测试"
    green " 15. 回程路由追踪" 
    green " 16. Speedtest测速"
    green " 17. 获取本机IP"
    green " 18. 流媒体解锁测试"
    green " 19. 检测/诊断Youtube地域"	
    yellow " ====================服务器功能============================== "
    green " 20. ipv4/6优先级调整 " 
    green " 21. 虚拟内存SWAP一键安装 "
    green " 22. 系统网络配置优化 "
    green " 23. VPS内存日志自动清理"
    green " 24. Linux，tcp网络优化脚本 "
    green " 25. 【开放所有端口,统一本地时间\,更新及安装组件,测速,关闭Iptable规则】 "
    green " 26. 【 一键修改root密码 】 "
    green " 27. 宝塔面板免验证(中文破解版) 推荐使用"
    green " 28. 《tiktok”无人值守循环推流直播搭建》 "
    yellow " ========================================================= "
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
 #==================================    
		00 )
           bbr
	;;
		99 )
           bbrs
	;;
		1 )
           vpn001
	;;
		2 )
           vpn000
	;;
		3 )
           vpn002
	;;
		4 )
           vpn003
	;;
		5 )
           vpn004
	;;
		6 )
           vpn005
	;;
		7 )
           x-ui
	;;
		8 )
           ssr
	;;
		9 )
           naiveproxy
	;;
		10 )
           iptsh
	;;
		11 )
           gost
	;;
 #==================================
    12 )
           Lemonbench
	;;
    13 )
           3speed
	;;
    14)
           memorytest
	;;
    15 )
           rtsh
	;;
    16 )
           speedtest-linux
	;;
	  17 )
           getip
	;;
	  18 )
           nf
	;;
		19 )
           tubecheck
	;;
 #==================================
		20 )
           ipvsh
	;;
		21 )
           swapsh
	;;
		22 )
           system-best
	;;
		23 )
           vmshellvps
	;;
		24 )
           tools
	;;
		25 )
           init
	;;
		26 )
           root
	;;
		27 )
           install_6.0
	;;
		28 )
           wuren
	;;
 #==================================
        0 )
            exit 1
        ;;
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}


start_menu "first"
