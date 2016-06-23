@path = ""

worker_processes 2
working_directory @path
timeout 300
#listen '/tmp/gpm.sock'
#listen 4567
pid "#{@path}tmp/pids/unicorn.pid"
stderr_path "#{@path}log/unicorn.stderr.log"
stdout_path "#{@path}log/unicorn.stdout.log"
preload_app true
