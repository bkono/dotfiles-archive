function iem() {
  if [[ $# -eq 0 ]]; then
    iex -S mix
  else
    if [[ $# -eq 2 ]]; then
      cookie=$2
    elif [[ $# -eq 1 ]]
    then
      cookie="default_secret_cookie"
    fi

    iex --sname $1 --cookie $cookie -S mix
  fi
}