#
# Cookbook Name:: hadoop_wrapper
# Recipe:: hadoop_dn_start
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'hadoop::repo'
include_recipe 'hadoop::_hadoop_checkconfig'
include_recipe 'hadoop::_compression_libs'

hadoop_conf_dir = "/etc/hadoop/#{node['hadoop']['conf_dir']}"

namenode = search(:node, "roles:hadoop_nn").sort.first
puts "namenode fqdn is #{namenode['fqdn']}\n"

template "#{hadoop_conf_dir}/core-site.xml" do
  source 'generic-site.xml.erb'
  mode '0644'
  owner 'root'
  group 'root'
  action :create
  variables :options => {"fs.defaultFS" => namenode['fqdn']}
end
