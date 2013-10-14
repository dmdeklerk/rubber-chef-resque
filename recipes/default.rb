#
# Cookbook Name:: rubber-resque
# Recipe:: default
#
# Copyright (C) 2013 DM De KLERK
#
# All rights reserved - Do Not Redistribute
#

gem_package 'resque'

if node[:rubber_resque][:redis_host].nil?

  def find_matching_role(role)
    return nil if !role
    nodes = []
    if node['roles'].include? role
      nodes << node
    else
      search(:node, "role:#{role} AND chef_environment:#{node.chef_environment}") do |n|
        nodes << n
      end
    end
    nodes.first
  end

  def find_redis_host
    role       = node[:rubber_resque][:redis_role]
    Chef::Log.warn("No :redis_role was set; node[:rubber_resque][:redis_role]") if role.nil?

    redis_node = find_matching_role(role)
    Chef::Log.warn("No node with role #{role}") if role && !redis_node

    if redis_node && redis_node.attribute?('cloud')
      redis_node['cloud']['local_ipv4']
    elsif redis_node
      redis_node['ipaddress']
    end
  end

  node[:rubber_resque][:redis_host] = find_redis_host
end

template node[:rubber_resque][:app_path] + '/config/initializers/resque.rb' do
  source    'resque.rb.erb'
  owner     node[:rubber_resque][:app_user]
  group     node[:rubber_resque][:app_group]
end

template node[:rubber_resque][:app_path] + '/config/resque.yml' do
  source    'resque.yml.erb'
  owner     node[:rubber_resque][:app_user]
  group     node[:rubber_resque][:app_group]
end

template node[:rubber_resque][:app_path] + '/config/resque-pool.yml' do
  source    'resque-pool.yml.erb'
  owner     node[:rubber_resque][:app_user]
  group     node[:rubber_resque][:app_group]
end
