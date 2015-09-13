#
# Cookbook Name:: hadoop_wrapper
# Recipe:: hadoop_nn_init
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

marker_file = "#{Chef::Config[:file_cache_path]}/hadoop_wrapper.nnformatted"
ruby_block 'format-namenode' do
  block do
    resources(:execute => 'hdfs-namenode-format').run_action(:run)
    File.open(marker_file, 'w') {}
  end
  not_if { File.exist? marker_file }
end
