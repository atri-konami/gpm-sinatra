mkdir -p tmp/pids
mkdir -p log
bundle exec unicorn -E production -c unicorn.rb -D
