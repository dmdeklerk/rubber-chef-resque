# Root of your application (Rails.root)
default[:rubber_resque][:app_path]                    = '/opt/app'

# User that runs your application
default[:rubber_resque][:app_user]                    = 'deploy'

# Group the app_user belongs to
default[:rubber_resque][:app_group]                   = 'deploy'

# Application environment (Rails.env)
default[:rubber_resque][:app_env]                     = 'production'

#
default[:rubber_resque][:redis_host]                  = 'localhost'
default[:rubber_resque][:redis_role]                  = 'redis_master'

default[:rubber_resque][:resque_web][:port]           = '5678'
default[:rubber_resque][:resque_web][:pid_file]       = '/var/run/resque-web.pid'
default[:rubber_resque][:resque_web][:monit]          = true
default[:rubber_resque][:resque_pool][:worker_count]  = 4
default[:rubber_resque][:resque_pool][:pid_file]      = '/var/run/resque-pool.pid'
default[:rubber_resque][:resque_pool][:monit]         = true
