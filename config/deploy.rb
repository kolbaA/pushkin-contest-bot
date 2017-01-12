# config valid only for current version of Capistrano
lock "3.7.1"


server '77.244.213.7',  primary: true

set :application, 'pushkin-contest-bot'
set :repo_url, 'git@github.com:kolbaA/pushkin-contest-bot.git'  # Edit this to match your repository
set :branch, :master
set :deploy_to, '/var/www/pushkin-contest-bot'
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :keep_releases, 5
set :bundle_binstubs, nil
set :rvm_ruby_version, 'ruby-2.3.1'   # Edit this to match ruby version you use
set :stage, :production

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "/var/www/pushkin-contest-bot/shared/pids/puma.state"
set :puma_pid, "/var/www/pushkin-contest-bot/shared/pids/puma.pid"
set :puma_bind, "unix:///var/www/pushkin-contest-bot/shared/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "/var/www/pushkin-contest-bot/shared/puma.rb"
set :puma_access_log, "/var/www/pushkin-contest-bot/shared/log/puma_error.log"
set :puma_error_log, "/var/www/pushkin-contest-bot/shared/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
