cd $(dirname $0)/../
kill -QUIT `cat tmp/pids/unicorn.pid`
sleep 3 && ps aux | grep unicorn

