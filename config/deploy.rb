set :application, 'JapanIsCool'
set :repo_url, 'git@bitbucket.org:takecian/japaniscool.git'

set :branch, 'master'

set :deploy_to, '/var/www/app'
set :scm, :git

set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

set :format, :pretty
set :log_level, :debug
set :pty, true

set :git_shallow_clone, 1

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :keep_releases, 3

# for capistrano v3 no need to call following command. it's called by default
#set :whenever_command, "bundle exec whenever"
#require 'whenever/capistrano'
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

set :linked_dirs, (fetch(:linked_dirs) + ['tmp/pids'])

set :unicorn_rack_env, "none"
set :unicorn_config_path, 'config/unicorn.rb'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end