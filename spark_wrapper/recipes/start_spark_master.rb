#
# Cookbook Name:: spark_wrapper
# Recipe:: build_spark
#
# Copyright (C) 2015 namabile
#
# All rights reserved - Do Not Redistribute
#

spark_install_dir = node['apache_spark']['install_dir']

execute "build spark" do
  cwd spark_install_dir
  user "root"
  command "./sbin/start-master.sh"
  action :run
  not_if "ps aux | grep -v grep | grep spark.deploy.master.Master"
end
