#
# Cookbook Name:: hadoop_wrapper
# Recipe:: hadoop_dn_start
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

ruby_block 'service-hadoop-hdfs-datanode-start' do
  block do
    resources('service[hadoop-hdfs-datanode]').run_action(:start)
  end
end


