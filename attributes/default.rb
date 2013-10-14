default[:rubber_resque][:rails][:root]                = nil
default[:rubber_resque][:rails][:user]                = nil
default[:rubber_resque][:rails][:group]               = nil
default[:rubber_resque][:rails][:env]                 = 'production'
default[:rubber_resque][:redis_master][:host]         = 'localhost'

default[:rubber_resque][:resque_web][:port]           = '5678'
default[:rubber_resque][:resque_web][:pid_file]       = '/var/run/resque-web.pid'
default[:rubber_resque][:resque_web][:monit]          = true

default[:rubber_resque][:resque_pool][:worker_count]  = 4
default[:rubber_resque][:resque_pool][:pid_file]      = '/var/run/resque-pool.pid'
default[:rubber_resque][:resque_pool][:monit]         = true
