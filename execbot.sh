#!/bin/bash
pgrep node > /dev/null
if [ $? -ne 0 ]
then 
  cd /root/gocq
  ./go-cqhttp faststart > ./logs/mylog.log 2>&1 &
  sleep 3
  cd /root/cq-picsearcher-bot
  npm start
else
  cd /root/cq-picsearcher-bot
  npm stop
  pkill go-cqhttp
fi
