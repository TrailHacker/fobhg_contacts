require "rvm/capistrano"     
require "bundler/capistrano"             # Load RVM's capistrano plugin.


# NOTE: To publish the site to production you must manually set staging to false
# e.g. 'cap deploy -s staging=false'
set :staging, fetch(:staging, true)

set :rvm_type, :system
set :rvm_ruby_string, '1.9.3-p286@otrutil'
set :use_sudo,    false

set :user,        "deploy"

set :scm, :git 
set :repository,  "git@bitbucket.org:TrailHacker/otrutil.git"

# When in staging mode, deploy the site to the test directory
if fetch(:staging)
  # TODO: configure database settings for staging environment (otrutest)
  set :application, "otrutest"
  set :deploy_to, "/var/www/test"
else
  set :application, "otrutil"
  set :deploy_to,   "/var/www/otrutil"
end
set :deploy_via, :remote_cache
set :rails_env, "production"

set :branch, "master"

server "otrutil.com", :web, :app, :db, :primary => true

set :keep_releases, 5
set :rvm_install_with_sudo, true
default_run_options[:pty] = true

before "deploy:setup", "rvm:install_rvm"
before "deploy:setup", "rvm:import_gemset"
after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
