#
# Cookbook Name:: rubber-resque
# Recipe:: default
#
# Copyright (C) 2013 DM De KLERK
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'rubber-chef-resque::default'

#gem_package 'yajl-ruby'
gem_package 'resque' # allready in default
gem_package 'resque-pool'

template '/etc/init/resque-pool.conf' do
  source   'resque-pool-upstart.conf.erb'
  owner    'root'
  group    'root'
end

cookbook_file node[:rubber_resque][:app_path] + '/lib/tasks/resque.rake' do
  user      node[:rubber_resque][:app_user]
  group     node[:rubber_resque][:app_group]
end

if node[:rubber_resque][:resque_pool][:monit]
  template '/etc/monit/monit.d/monit-resque_pool.conf' do
    source   'monit-resque_pool.conf.erb'
    owner    'root'
    group    'root'
    notifies :restart, resources(:service => 'monit'), :delayed
  end
else
  service 'resque-pool' do
    action    :start
  end
end