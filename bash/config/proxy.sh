# Proxy

export ns_proxy_address=192.168.166.12
export ns_proxy_port=8080

proxy_setup()
{
  export HTTP_PROXY=$ns_proxy_address:$ns_proxy_port
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
  CURRENT_IP=`ipconfig | grep IPv | awk -F ': ' 'NR==1{print $2}'`
  echo Current IP address is \"$CURRENT_IP\"
  case $CURRENT_IP in
    10.1.166.*)
      proxy_setup
      ;;
    192.168.166.*)
      proxy_setup
      ;;
    *)
      proxy_reset
      ;;
  esac
}

proxy_update

