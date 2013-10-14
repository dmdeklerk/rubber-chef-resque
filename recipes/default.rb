#
# Cookbook Name:: rubber-resque
# Recipe:: default
#
# Copyright (C) 2013 DM De KLERK
#
# All rights reserved - Do Not Redistribute
#

#
# Install this cookbook on the rails node
#

cookbook_file '/tmp/foo.txt' do
  source 'foo.txt'
end

template node[:rubber_resque][:rails][:root] + '/config/initializers/resque.rb' do
  source   'resque.rb.erb'
  owner    node[:node[:rubber_resque][:rails][:user]
  group    node[:node[:rubber_resque][:rails][:group]
end

template node[:rubber_resque][:rails][:root] + '/config/resque.yml' do
  source   'resque.yml.erb'
  owner    node[:node[:rubber_resque][:rails][:user]
  group    node[:node[:rubber_resque][:rails][:group]
end

template node[:rubber_resque][:rails][:root] + '/config/resque-pool.yml' do
  source   'resque-pool.yml.erb'
  owner    node[:node[:rubber_resque][:rails][:user]
  group    node[:node[:rubber_resque][:rails][:group]
end


