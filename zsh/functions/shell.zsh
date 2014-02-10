# Shell functions

function tophist() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head -n 15
}
