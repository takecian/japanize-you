APP_PATH = "/var/www/app/current"
SHARED_PATH = "/var/www/app/shared"
working_directory APP_PATH

log = '/var/log/rails/unicorn.log'
stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stdout.log"

# unicornのプロセスがリスンするアドレスとポートを指定
listen "127.0.0.1:3000"

# pid fileの位置を指定する
pid SHARED_PATH + "/tmp/pids/unicorn.pid"

# ワーカーの数を指定する
worker_processes 3

# リクエストのタイムアウト秒を指定する
timeout 15

# ダウンタイムなくすため、アプリをプレロード
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
