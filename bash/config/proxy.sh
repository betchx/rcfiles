# Proxy

export address=192.168.166.12
export port=8080

setup_proxy()
{
  export HTTP_PROXY=$address:$port
  export https_proxy=$address:$port
  echo proxy of $HTTP_PROXY will be used.
}

reset_proxy()
{
  unset HTTP_PROXY
  unset https_proxy
  echo No Proxy will be used.
}

function update_proxy()
{
  CURRENT_IP=`ipconfig | grep IPv | awk -F ': ' 'NR==1{print $2}'`
  echo Current IP address is \"$CURRENT_IP\"
  case $CURRENT_IP in
    10.1.166.*)
      setup_proxy
      ;;
    192.168.166.*)
      setup_proxy
      ;;
    *)
      reset_proxy
      ;;
  esac
}

update_proxy

