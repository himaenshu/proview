# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'proview'
set :repo_url, 'http://github.com/himaenshu/proview.git'
set :rvm_type, :system
#set :rvm_ruby_version, '2.2.1'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

set :branch, 'master'
set :scm, 'git'
set :local_scm_command, "git"
set :scm_command, 'git'
set :copy_exclude, ".git/*"
set :deploy_via, :remote_cache
set :copy_compression, :zip
set :copy_cache, true
set :scm_verbose, true
set :git_shallow_clone, 1
set :minify_assets, false
set :rake, 'bundle exec rake'

namespace :deploy do

  after :updated, :some_new_task_name do
    # Here we can mention task definition
  end

end
