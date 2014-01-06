function rweb() { 
  if [[ $# > 1 ]]
  then
    port=$2
  else
    port=5000
  fi
  ruby -run -e httpd $1 -p$port 
}
