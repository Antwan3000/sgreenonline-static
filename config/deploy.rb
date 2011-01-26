default_run_options[:pty] = true  # Must be set for the password prompt from git to work
ssh_options[:forward_agent] = true
set :use_sudo, false
set :rake, "/usr/local/rvm/gems/ruby-1.9.2-p0@rails3/bin/rake"
#set :migrate_env, "production"

set :application, "sgreenonline.com"
set :repository,  "git@github.com:Antwan3000/sgreenonline-static.git"
set :deploy_to, "/var/www/projects/#{application}"

## SCM Setup
set :scm, :git  # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_verbose, true
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_command, "/opt/local/bin/git"
set :local_scm_command, :default

## SSH Setup
ssh_options[:username] = 'puma'
ssh_options[:port] = 22
#ssh_options[:verbose] = :debug
ssh_options[:host_key] = 'ssh-rsa'
ssh_options[:keys] = %w(/home/puma/.ssh/authorized_keys)

## Less releases, less space wasted
set :keep_releases, 3

role :web, "broadmedium.com"                          # Your HTTP server, Apache/etc
#role :app, "broadmedium.com"                          # This may be the same as your `Web` server
#role :db,  "broadmedium.com", :primary => true        # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


# Override default tasks which are not relevant to a non-rails app.
namespace :deploy do
  task :migrate do
    puts "    not doing migrate because not a Rails application."
  end
  task :finalize_update do
    puts "    not doing finalize_update because not a Rails application."
  end
  task :start do
    puts "    not doing start because not a Rails application."
  end
  task :stop do 
    puts "    not doing stop because not a Rails application."
  end
  task :restart do
    puts "    not doing restart because not a Rails application."
  end
end