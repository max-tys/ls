#!/bin/bash

function server () {
  while true
  do
    message_arr=()
    check=true
    while $check
    do
      read line
      message_arr+=($line)
      if [[ "${#line}" -eq 1 ]]; then
        check=false
      fi
    done
    method=${message_arr[0]}
    path=${message_arr[1]}
    if [[ $method = "GET" ]]; then
      if  [[ -f "./www/$path" ]]; then
        echo -ne "HTTP/1.1 200 OK\r\n"
        echo -ne "Content-Type: text/html; charset=utf-8\r\n"
        echo -ne "Content-Length: $(wc -c < ./www/$path)\r\n\r\n"
        cat "./www/$path"
      else
        echo -ne "404 Not Found\r\nContent-Length: 0\r\n\r\n"
      fi
    else
      echo -ne "HTTP/1.1 400 Bad Request\r\nContent-Length: 0\r\n\r\n"
    fi
  done
}

# coproc is used to set up a coprocess
# it allows us to run our server function asynchronously alongside netcat
coproc SERVER_PROCESS { server; }

# nc -lv 2345 executes netcat in listen and verbose mode
# as for the second part, any input that netcat receives can be accessed within
# the server function using the read command, and anything that the server
# outputs using echo will be output by netcat
nc -lkv 8080 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}
