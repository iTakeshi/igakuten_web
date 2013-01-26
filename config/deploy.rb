puts "\n\e[0;31m Are you REALLY sure you want to deploy to production? \e[0m\n"
proceed = STDIN.gets[0..0] rescue nil
exit unless proceed == 'y' || proceed == 'Y'

ssh_options[:forward_agent] = true
ssh_options[:port] = '10022'
default_run_options[:pty] = true

set :scm,         :git
set :repository,  'git@github.com:iTakeshi/igakuten_web.git'
set :application, 'igakuten_web'

set :deploy_via,  :remote_cache
set :scm_verbose, true
set :use_sudo,    false
set :rails_env,   :production

set :user,   'igakuten'
set :domain, 'hokudai-igakuten.org'
set :port,   '10022'
set :branch, 'master'

set :deploy_to, "/var/app/#{application}"
role :web, domain                   # Your HTTP server, Apache/etc
role :app, domain                   # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

require 'bundler/capistrano'
load 'deploy/assets'

task :setup_symlink_dirs, :roles => :app do
  run "#{try_sudo} mkdir -p -m 755 #{shared_path}/db"
  run "#{try_sudo} mkdir -p -m 755 #{shared_path}/config"
  run "#{try_sudo} mkdir -p -m 755 #{shared_path}/public/ckeditor"
end
after "deploy:setup", "setup_symlink_dirs"

task :make_symlinks, :roles => :app do
  run "#{try_sudo} ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"
  run "#{try_sudo} ln -nfs #{shared_path}/public/ckeditor #{release_path}/public/ckeditor"
end
after "deploy", "make_symlinks"
