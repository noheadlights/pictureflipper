require 'bundler/capistrano'
load 'deploy'
# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'
load 'config/deploy' # remove this line to skip loading any of the default tasks

set :application, "pictureflipper"

set :scm, :git
set :repository, "git@github.com:noheadlights/pictureflipper.git"
set :scm_passphrase, ""

set :user, "noheadlights"

set :rails_env, 'production'

role :web, "192.168.0.4"                          # Your HTTP server, Apache/etc
role :app, "192.168.0.4"                         # This may be the same as your `Web` server
role :db,  "192.168.0.4", :primary => true

set :deploy_to, "/var/www/pictureflipper"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
