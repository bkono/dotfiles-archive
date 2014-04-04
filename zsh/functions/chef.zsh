# Knife functions

function knifessh() {
  knife ssh name:$1 -x ubuntu $2
}

function start-chef-client() {
  knife ssh name:$1 -x ubuntu "sudo chef-client"
}

function restart-chef-client() {
  knife ssh name:$1 -x ubuntu "sudo killall -USR1 chef-client"
}
