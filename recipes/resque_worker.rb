#
# Cookbook Name:: rubber-resque
# Recipe:: default
#
# Copyright (C) 2013 DM De KLERK
#
# All rights reserved - Do Not Redistribute
#

#gem_package 'yajl-ruby'
gem_package 'resque'
gem_package 'resque-pool'

template '/etc/init/resque-pool.conf' do
  source   'resque-pool-upstart.conf.erb'
  owner    'root'
  group    'root'
end

service 'resque-pool' do
  action    :start
end