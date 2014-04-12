# set path to app that will be used to configure unicorn,
# note the trailing slash in this example
sinatra_app_dir = "/home/playhard/harvester"
socket_file = "/tmp/harvester_unicorn.sock"

worker_processes 2
working_directory "#{sinatra_app_dir}/current"

timeout 30

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen socket_file, :backlog => 64

# Set process id path
pid "#{sinatra_app_dir}/shared/tmp/pids/unicorn.pid"

# Set log file paths
stderr_path "#{sinatra_app_dir}/log/unicorn.stderr.log"
stdout_path "#{sinatra_app_dir}/log/unicorn.stdout.log"
