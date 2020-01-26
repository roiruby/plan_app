server '118.27.23.207', user: 'ec2-user', roles: %w{app db web}, port: 53101 

set :ssh_options, keys: '~/.ssh/pladuce'