hosts = instances("test")

role :app, hosts.map{ |ip| "snowtest@#{ip}"}
#role :app_as_sudoer, hosts.map{ |ip| "ec2-user@#{ip}"}

set :ssh_options, {
# user: 'snowtest', # overrides user setting above
#    keys: %w(#{ENV['HOME']}/.ssh/aws_base.pem),
  forward_agent: true,
  auth_methods: %w(publickey)
}
