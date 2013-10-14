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

cookbook_file node[:rubber_resque][:rails][:root] + '/config/resque-web.ru' do
  user      node[:node[:rubber_resque][:rails][:user]
  group     node[:node[:rubber_resque][:rails][:group]
end

service 'resque-web' do
  action    :start
end
