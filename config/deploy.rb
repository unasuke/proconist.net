# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'proconist.net'
set :repo_url, 'git@github.com:NKMR6194/proconist.net.git'

set :rbenv_type, :user
set :rbenv_ruby, '2.3.2'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/proconist.net'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'vendor/bundle'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app) do
      invoke 'puma:phased-restart'
    end
  end

  after :publishing, 'deploy:restart'
end
