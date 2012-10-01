require 'capistrano/ext/multistage'
load 'deploy'
# Uncomment if you are using Rails' asset pipeline
    # load 'deploy/assets'
load 'config/deploy' # remove this line to skip loading any of the default tasks

set :application, "pictureflipper"

set :scm, :git
set :repository, "git@github.com:noheadlights/pictureflipper.git"
set :scm_passphrase, ""

set :user, "noheadlights"

set :stages, ["staging", "production"]
set :default_stage, "staging"

server "spaced.homeip.net", :app, :web, :db, :primary => true
set :deploy_to, "/var/www/pictureflipper"

server "spaced.homeip.net", :app, :web, :db, :primary => true
set :deploy_to, "/var/www/pictureflipper_staging"

