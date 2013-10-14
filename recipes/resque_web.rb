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

service 'resque-web' do
  action    :start
end
