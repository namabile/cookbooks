#
# Cookbook Name:: spark_wrapper
# Recipe:: start_spark_worker
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

spark_install_dir = node['apache_spark']['install_dir']
spark_master_ip = node["apache_spark"]["standalone"]["master_host"]
spark_master_port = node["apache_spark"]["standalone"]["master_port"]

execute "build spark" do
  cwd spark_install_dir
  user "root"
  command "./sbin/start-slave.sh #{spark_master_ip}:#{spark_master_port}"
  action :run
  not_if "ps aux | grep -v grep | grep spark.deploy.worker.Worker"
end
