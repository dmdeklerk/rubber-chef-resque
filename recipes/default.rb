#
# Cookbook Name:: rubber-resque
# Recipe:: default
#
# Copyright (C) 2013 DM De KLERK
#
# All rights reserved - Do Not Redistribute
#

gem_package 'resque'
gem_package 'resque-pool'

template node[:rubber_resque][:app_path] + '/config/initializers/resque.rb' do
  source    'resque.rb.erb'
  owner     node[:node[:rubber_resque][:app_user]
  group     node[:node[:rubber_resque][:app_group]
end

template node[:rubber_resque][:app_path] + '/config/resque.yml' do
  source    'resque.yml.erb'
  owner     node[:node[:rubber_resque][:app_user]
  group     node[:node[:rubber_resque][:app_group]
end

template node[:rubber_resque][:app_path] + '/config/resque-pool.yml' do
  source    'resque-pool.yml.erb'
  owner     node[:node[:rubber_resque][:app_user]
  group     node[:node[:rubber_resque][:app_group]
end
