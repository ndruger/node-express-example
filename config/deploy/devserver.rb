# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.


role :app, instances("test")


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
  set :ssh_options, {
    user: 'snowtest', # overrides user setting above
#    keys: %w(#{ENV['HOME']}/.ssh/aws_base.pem),
    forward_agent: true,
    auth_methods: %w(publickey)
  }
#
# And/or per server (overrides global)
# ------------------------------------
