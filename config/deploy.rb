require 'bundler/capistrano'

set :application, "pictureflipper" # Your application location on your server goes here

default_run_options[:pty] = true

set :scm, :git
set :repository, "git@github.com:noheadlights/pictureflipper.git"
set :scm_passphrase, ""
set :deploy_via, :copy

set :checkout, 'export'

set :user, 'noheadlights' # Your username goes here
set :use_sudo, false
set :domain, '192.168.0.4' # Your domain goes here
set :applicationdir, "/home/#{user}/#{application}"
set :deploy_to, applicationdir

role :web, domain
role :app, domain
role :db,  domain, :primary => true


set :chmod755, "app config db lib public vendor script script/* public/disp*"

namespace :deploy do

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end