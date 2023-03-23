#! /bin/bash
# 失落的梦 
#https://www.kehu33.asia/
#production time：2023.1.12
#颜色
red(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
purple(){
    echo -e "\033[30m\033[01m$1\033[0m" 
}
yellow(){
    echo -e "\033[36m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yello(){
    echo -e "\033[33m\033[01m$1\033[0m"
}

CountRunTimes() {
    if [ "$is_busybox" == 1 ]; then
        count_file=$(mktemp)
    else
        count_file=$(mktemp --suffix=RRC)
    fi
    RunTimes=$(curl -s --max-time 10 "https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fwurendi001%2Fshell&count_bg=%233DC88D&title_bg=%23AE1818&icon=openstack.svg&icon_color=%23E7E7E7&title=%%20E8%BF%90%E8%A1%8C&edge_flat=true" >"${count_file}")
    TodayRunTimes=$(cat "${count_file}" | tail -3 | head -n 1 | awk '{print $5}')
    TotalRunTimes=$(cat "${count_file}" | tail -3 | head -n 1 | awk '{print $7}')
}

#服务器检查项目
#Lemonbench 综合测试
function Lemonbench(){
curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast
}
#三网Speedtest测速
function 3speed(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/superspeed.sh)
}
#Route-trace 回城路由追踪
function jcnf(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/jcnf.sh)
}
#获取本机IP
function getip(){
echo  
curl ip.p3terx.com
echo
}
#流媒体解锁测试
function nf(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/nf.sh)
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
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/ipv4.sh)
}
#303 【 《tiktok”无人值守循环推流直播搭建》 】
function wuren(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/wuren.sh)
}
#302 【 VPS内存日志自动清理 】
function vmshellvps(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/vmshellvps.sh)
}
#301 【 一键修改root密码 】
function root(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/root.sh)
}
#300 【 开放所有端口,统一本地时间\,更新及安装组件,测速,关闭Iptable规则 】
function init(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/init.sh)
}
#210 【 Linux网络优化脚本 】
function tools(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/tools.sh)
}
#211  宝塔面板免验证(中文破解版
function install_6.0(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/install_6.0.sh)
}
#212 【 域名IP证书一建申请 】
function acme(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/acme.sh)
}
#213 【 WARP 一键安装脚本 】
function warpWARP(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/warpWARP.sh)
}
#214 【 检测IP是否解锁tiktok  一键脚本 】
function tiktok(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/tiktok.sh)
}
#=====================科学上网工具=======================
#00 【 安装BBR 】
function bbr(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/tcp.sh)
}
#99 【 安装BBRS 】
function bbrs(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/tcp2.sh)
}
#101 【 Xray一键安装脚本 】
function vpn001(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/xr2.sh)
}
#301 【 Xray另外一个修改版一键安装脚本 】
function vpn000(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/xr0.sh)
}
#102 【八合一共存脚本 】
function vpn002(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/v2r2.sh)
} 
#103 【Wulabing v2ray 一键脚本 】
function vpn003(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/xr1.sh)   
} 
#105 【 233Boy 修改版 V2Ray 一键安装脚本 】
function vpn005(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/v2r3.sh) 
} 
#106 【 xui 一键安装脚本 】
function x-ui(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/x-ui.sh) 
}
#107 【 ssr 一键安装脚本 】
function ssr(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/ssr.sh) 
} 
#117 【 naiveproxy 一键安装脚本 】
function naiveproxy(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/na.sh) 
} 
#108  iptables.sh iptable中转
function iptsh(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/iptables.sh)
}
#109  gost.sh gost一键中转
function gost(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/gost.sh)
}
#110  trojan第一种面板 一键脚本👊
function trojan1(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/trojan1.sh)
}
#111  trojan第二种面板 一键脚本👊
function trojan2(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/trojan2.sh)
}
#112  SSH开启密码、ROOT登录👊
function ssh_open(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/ssh_open.sh)
}
#113  SSH端口更换默认22👊
function sshport(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/sshport.sh)
}
#114  Ehco隧道中转👊
function ehco(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/ehco.sh)
}
#115  域名ip证书续签 一键脚本👊
function ssl(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/ssl.sh)
}
#116  牛逼中转面板👊
function xd(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/xd.sh)
}
#117  极光中转面板👊
function jiguang(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/jiguang.sh)
}
#118  brooks中转👊
function brooks(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/brooks.sh)
}
#119  欺诈分数以及IP质量检测👊
function che(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/che.sh)
}
#120  ssr 另外一种👊
function ssr2(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/ssr2.sh)
}
#121  nginx安装 一键代码👊
function nginx(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/nginx.sh)
}
#121  nginx安装第二种 一键代码👊
function nginx2(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/nginx2.sh)
}
#122  在线从装Linux系统
function Inl(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/Inl.sh)
}
#123  socat 中转
function socat(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/socat.sh)
}
#124  tinymapper 中转
function tinymapper(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/tinymapper.sh)
}
#125  看国家IP地区
function openai(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/openai.sh)
}
#126   ovzbbr 
function ovzbbr(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/ovzbbr.sh)
}
#127    Echo隧道便携脚本
function ehco2(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/ehco2.sh)
}
#128    sk5脚本
function sk5(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/sk5.sh)
}
#129    v2ray
function v2ray(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/v2ray.sh)
}
#130    trojan
function trojan(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/trojan.sh)
}
#131    trojan
function trojan-go(){
bash <(curl -s -L https://gitlab.com/shell00/sldm/-/raw/main/trojan-go.sh)
}
#========================================================
#主菜单
function start_menu(){
    #yum update -y && yum install -y curl && yum install -y socat && yum install wget -y
    #apt update -y && apt install -y curl && apt install -y socat && apt install wget -y
    clear
    yellow " ================================== 收费脚本项目描述内容 ============================ "
    purple " 作者： 失落的梦常用综合脚本包 一键安装脚本${PLAIN}"
    purple " 联系微信：Falltoher-1314   QQ:1150315739  "
    purple " 导航站：https://www.meng666.buzz  博客1：https://www.kehu33.asia "
    red " ================================= 搭建，科学上网工具 =============================== "
    blue " 00.【 BBR加速V1一键脚本 】		||	99.【 BBRS加速V2一键脚本 】推荐"
    blue " 1.【 Xray一键安装脚本】		||	2.【 Xray 另外一个一键安装脚本 】"   
    blue " 3.【 v2ray一键安装脚本 】		||	4.【 trojan一键安装脚本 】"
    blue " 5.【 trojan-go一键安装脚本 】		||	6.【 八合一共存一键脚本 】"
    blue " 7.【 bing v2ray一键脚本 】		||	8.【 233boy V2Ray一键安装脚本 】"
    blue " 9.【 x-ui一键脚本】			||	10.【 SSR V1一键脚本 】"
    blue " 11.【 SSR V2一键脚本 】		||	12.【  SK5协议一键脚本 】"
    blue " 13.【 naiveproxy一键脚本】		||	14.【trojan面板V1一键脚本】"
    blue " 15.【trojan面板V2一键脚本】		||	16.【宝塔面板免验证(中文破解版) 推荐】"     
    blue " ==================================中转，服务器流量中转 =============================== "
    blue " 17. 【iptables 中转】			||	18. 【socat 中转 支持deban系】"
    blue " 19. 【tinymapper 中转】		||	20. 【gost 一键中转】"     
    blue " 21. 【Echo隧道中转 便携脚本】		||	22. 【Ehco隧道一键中转】"
    blue " 23. 【brooks 一键中转】		||	24. 【咸蛋中转机面板 一键脚本】"
    blue " 25. 【极光中转机面板 一键脚本】 "        
    purple " ================================= 检查，服务器功能检查 =============================== "
    purple " 26. 【检测IP是否解锁tiktok】		||	27. 【查看IP归属那个国家】"
    purple " 28. 【Lemonbench 综合测试】		||	29. 【三网Speedtest测速】"
    purple " 30. 【回程路由追踪】			||	31. 【获取本机IP】"
    purple " 32. 【流媒体解锁测试】			||	33. 【检测/诊断Youtube地域】"
    yello " ================================== 配置，服务器功能配置 =============================== "
    yello " 34.【ipv4/6优先级调整】		||	35.【VPS内存日志自动清理】"
    yello " 36.【Linux_tcp网络优化 一键脚本】	||	37.【 BBR加速端口 一键安装脚本】"
    yello " 38.【 一键修改root密码】		||	39.【tiktok”无人值守循环推流直播搭建】 "
    yello " 40.【 域名ip证书 一键申请脚本】	||	41.【 WARP 一键安装脚本】"
    yello " 42.【 开启SSH登陆+替换ROOT密钥登陆】	||	43.【 修改SSH 端口默认22，或厂家给的默认的端口 】"
    yello " 44.【 域名ip证书续签 一键脚本】	||	45.【 欺诈分数以及IP质量检测 一件代码】"
    yello " 46.【 nginx安装 一键代码】		||	47.【 nginx安装第二种 一键代码】"
    yello " 48.【 在线Linux系统 一键从装】		||	49.【 开放所有端口+同步时间+更新系统组件+测速+关闭Iptable规则】"
    yellow " =============================================================================================================== "   
    blue "     ** 使用时间: $(date)"
    yellow " =============================================================================================================== "
   purple " 0. 退出脚本"
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
            v2ray
	;;
		4 )
            trojan
	;;
		5 )
            trojan-go
	;;
		6 )
            vpn002
	;;
		7 )
            vpn003
	;;
		8 )
            vpn005
	;;
		9 )
            x-ui
	;;
		10 )
            ssr
	;;
		11 )
            ssr2
	;;
		12 )
               sk5
	;;
		13 )
            naiveproxy
	;;
		14 )
            trojan1
	;;
		15 )
             trojan2
	;;		
		16 )
             install_6.0
	;;
 #==================================
		17 )
             iptsh
	;;
		18 )
             socat
	;;
		19 )
             tinymapper
	;;								
		20 )
             gost
	;;
		21 )
             ehco2
	;;
		22 )
               ehco
	;;
		23 )
             brooks
	;;
		24 )
             xd
	;;
		25 )
             jiguang
	;;
 #==================================
		26 )
             tiktok
	;;
		27 )
              openai
	;;
		28 )
             Lemonbench
	;;
		29 )
             3speed
	;;
		30 )
             jcnf
	;;
		31 )
             getip
	;;
		32 )
             nf
	;;
		33 )
             tubecheck
	;;
 #==================================
		34 )
             ipvsh
	;;
		35 )
             vmshellvps
	;;
		36 )
             tools
	;;
		49 )
             init
	;;
		38 )
             root
	;;
		39 )
             wuren
	;;
		40 )
             acme
	;;
	    41 )
             warpWARP
	;;
		42 )
             ssh_open
	;;
		43 )
             sshport
	;;
		44 )
             ssl
	;;
		45 )
             che
	;;
		46 )
             nginx
	;;
		47 )
             nginx2
	;;
		48 )
               Inl
	;;
		37 )
              ovzbbr
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
