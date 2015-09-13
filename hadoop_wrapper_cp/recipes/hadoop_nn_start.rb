#
# Cookbook Name:: hadoop_wrapper
# Recipe:: hadoop_nn_start
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

ruby_block 'service-hadoop-hdfs-namenode-start' do
  block do
    resources('service[hadoop-hdfs-namenode]').run_action(:start)
  end
end
