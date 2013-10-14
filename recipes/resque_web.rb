#
# Cookbook Name:: rubber-resque
# Recipe:: default
#
# Copyright (C) 2013 DM De KLERK
#
# All rights reserved - Do Not Redistribute
#

gem_package 'puma'

template '/etc/init/resque-web.conf' do
  source   'resque-web-upstart.conf.erb'
  owner    'root'
  group    'root'
end

cookbook_file node[:rubber_resque][:app_path] + '/config/resque-web.ru' do
  user      node[:node[:rubber_resque][:app_user]
  group     node[:node[:rubber_resque][:app_group]
end

if node[:rubber_resque][:resque_web][:monit]
  template '/etc/monit/monit.d/monit-resque_web.conf' do
    source   'monit-resque_web.conf.erb'
    owner    'root'
    group    'root'
    notifies :restart, resources(:service => 'monit'), :delayed
  end
else
  service 'resque-web' do
    action    :start
  end
end
