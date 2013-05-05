require 'bundler/capistrano'
require 'rvm/capistrano'

set :rvm_ruby_string, '1.9.3'

set :application, "beautifulco.de"
set :repository,  "git@github.com:beautifulcode/beautifulcode.git"

set :user, 'deploy'
set :use_sudo, false
set :scm, :git

set :deploy_to, "/var/www/apps/#{application}"

set :domain, "198.199.104.225"
role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
