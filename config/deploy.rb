#############################################################
#    Deployment Settings
#############################################################
set :application, "sgreenonline.com"
set :deploy_to, "/var/www/projects/#{application}"
set :keep_releases, 3  ## Limited number of releases stored
set :use_sudo, false
set :rake, "/usr/local/rvm/gems/ruby-1.9.2-p0@rails3/bin/rake"
default_run_options[:pty] = true

#############################################################
#    GIT Version Control
#############################################################
set :scm, :git
set :repository,  "git@github.com:Antwan3000/sgreenonline-static.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_command, "/opt/local/bin/git"
set :scm_verbose, true
set :local_scm_command, :default

#############################################################
#    SSH
#############################################################
ssh_options[:username] = 'puma'
ssh_options[:port] = 22
ssh_options[:host_key] = 'ssh-rsa'
ssh_options[:forward_agent] = true
ssh_options[:keys] = %w(/home/puma/.ssh/authorized_keys)
#ssh_options[:verbose] = :debug

#############################################################
#    Servers
#############################################################
role :web, "broadmedium.com"                    # Your HTTP server, Apache/etc
#role :app, "broadmedium.com"                    # This may be the same as your `Web` server
#role :db,  "broadmedium.com", :primary => true  # This is where Rails migrations will run
#role :db,  "your slave db-server here"

#############################################################
#    Passenger
#############################################################
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

#############################################################
#    Override Tasks
#    Default tasks irrelevant for static site.
#############################################################
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
