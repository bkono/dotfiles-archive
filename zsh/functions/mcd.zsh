# Make directory and change into it.

function mcd() {
  mkdir -p "$1" && cd "$1";
}

function cdf() { cd *$1*/ }
