# Shell functions

function tophist() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head -n 15
}

function used-ports() {
  lsof -i | grep LISTEN
}

function kj() { ps aux | grep java | grep $* | awk '{print $2}' | xargs kill -9 }
