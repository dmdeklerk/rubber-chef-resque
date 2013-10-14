# Root of your application (Rails.root)
default[:rubber_resque][:app_path]                    = '/opt/app'

# User that runs your application
default[:rubber_resque][:app_user]                    = 'deploy'

# Group the app_user belongs to
default[:rubber_resque][:app_group]                   = 'deploy'

# Application environment (Rails.env)
default[:rubber_resque][:app_env]                     = 'production'

# Set :redis_host to nil to have the recipe search for the redis master @see :redis_role
default[:rubber_resque][:redis_host]                  = nil

# If set :redis_role is used to look up the :redis_host
default[:rubber_resque][:redis_role]                  = 'redis_master'

default[:rubber_resque][:resque_web][:port]           = '5678'
default[:rubber_resque][:resque_web][:pid_file]       = '/var/run/resque-web.pid'
default[:rubber_resque][:resque_web][:monit]          = true

default[:rubber_resque][:resque_pool][:worker_count]  = 4
default[:rubber_resque][:resque_pool][:pid_file]      = '/var/run/resque-pool.pid'
default[:rubber_resque][:resque_pool][:monit]         = true
