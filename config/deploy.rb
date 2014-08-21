# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'node-express-example'
set :repo_url, 'git@github.com:ndruger/node-express-example.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :linked_files is []
set :linked_files, %w{
  newrelic.js
}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

require 'aws-sdk'
require 'yaml'
require 'sshkit/dsl'

aws_conf = YAML.load_file("#{ENV['HOME']}/.ssh/aws_deploy_user_credential.yml")
aws_conf = aws_conf.merge({
  :region => 'ap-northeast-1'
})
AWS.config(aws_conf)

def stage
  fetch(:stage).to_s
end

def instances(tag)
  AWS.ec2.instances.select {|i| i.tags[:Name] == "#{tag}-#{stage}" && i.status == :running}.map(&:public_ip_address)
end

[:forever, :npm, :grunt].each do |c|
  SSHKit.config.command_map.prefix[c].unshift("source ~/.nvm/nvm.sh; nvm use v0.10.31;")
end

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence do
      within current_path do
        execute :forever, "stop", "#{current_path}/app.js; true"
        execute :forever, "start", "#{current_path}/app.js"
      end
    end
  end

  task :npm_install do
    on roles(:app), in: :sequence do
      within release_path do
        execute :npm, "install"
        execute :grunt, "coffee"
      end
    end
  end


  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :publishing, :restart
  after :updated, :npm_install

end
