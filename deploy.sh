mkdir -p tmp/pids
mkdir -p log
bundle exec uncorn -E production -c unicorn.rb -D
