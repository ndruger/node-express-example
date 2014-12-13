#role :app, instances("test").map{ |ip| "snowtest@#{ip}"}
role :app, instances("test")

set :ssh_options, {
 user: 'snowtest', # overrides user setting above
#    keys: %w(#{ENV['HOME']}/.ssh/aws_base.pem),
  forward_agent: true,
  auth_methods: %w(publickey)
}

# server '',
#   ssh_options: {
#     user: 'snowtest', # overrides user setting above
#   #    keys: %w(#{ENV['HOME']}/.ssh/aws_base.pem),
#     forward_agent: true,
#     auth_methods: %w(publickey)
#   }

