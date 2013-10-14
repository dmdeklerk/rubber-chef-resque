default[:rubber_resque][:rails][:root]           = 'root of rails dir'
default[:rubber_resque][:rails][:user]           = 'root of rails dir'
default[:rubber_resque][:rails][:group]          = 'root of rails dir'
default[:rubber_resque][:rails][:env]            = 'production'
default[:rubber_resque][:redis_master][:host]    = 'localhost'

default[:rubber_resque][:resque_web][:port]      = '5678'
default[:rubber_resque][:resque_web][:pid_file]  = '/var/run/resque-web.pid'

default[:rubber_resque][:resque][:worker_count]  = 4
default[:rubber_resque][:resque_pool][:pid_file] = '/var/run/resque-pool.pid'

