# Proxy

export address=192.168.166.12
export port=8080

proxy_setup()
{
  export HTTP_PROXY=$address:$port
  export https_proxy=$address:$port
  echo proxy of $HTTP_PROXY will be used.
}

proxy_reset()
{
  unset HTTP_PROXY
  unset https_proxy
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

