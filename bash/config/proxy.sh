# Proxy

proxy_setup()
{
  export HTTP_PROXY=$1
  export HTTPS_PROXY=$HTTP_PROXY
  git config --global http.proxy http://$HTTP_PROXY
  git config --global https.proxy http://$HTTP_PROXY
  echo proxy of $HTTP_PROXY will be used.
}

proxy_reset()
{
  unset HTTP_PROXY
  unset HTTPS_PROXY
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  echo No Proxy will be used.
}

proxy_update()
{
  CURRENT_IP=`ipconfig | grep -a IPv | awk -F ': ' 'NR==1{print $2}'`
  echo Current IP address is \"$CURRENT_IP\"
  # "  # 左のクォートはsakuraエディタの色付けバグへの対応
  case $CURRENT_IP in
#	// 東京後楽園ビル　シビル
#          if (isInNet(ipaddr, KourakuNSCLANip, sub24) ||
#              isInNet(ipaddr, KourakuNSCWirelessip, sub24))
#                return ProxyTokyoKouraku;
#var ProxyTokyoKouraku = "PROXY 192.168.1.5:8080; PROXY 192.168.3.5:8080";
#var KourakuNSCLANip = "192.168.6.0";
#var KourakuNSCWirelessip = "10.1.6.0";
#var sub24 = "255.255.255.0";
    192.168.6.* | 10.1.6.*)
      proxy_setup 192.168.1.5:8080
      ;;
#	// 大阪シビル
#          if (isInNet(ipaddr, OsakaNSCLANip, sub23) ||
#              isInNet(ipaddr, OsakaNSCWirelessip, sub23))
#                return ProxyOsakaNSC;
#var ProxyOsakaNSC = "PROXY 192.168.166.12:8080; PROXY ocp16:8080";
#var OsakaNSCLANip = "192.168.166.0";
#var OsakaNSCWirelessip = "10.1.166.0";
#var sub23 = "255.255.254.0";
    192.168.166.* | 192.168.167.* | 10.1.166.* | 10.1.167.*)
      proxy_setup 192.168.166.12:8080
      ;;
    *)
      proxy_reset
      ;;
  esac
}

proxy_update

