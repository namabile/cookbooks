#
# Cookbook Name:: spark_wrapper
# Recipe:: build_spark
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

spark_install_dir = node['apache_spark']['install_dir']
spark_hadoop_release = "hadoop2.6"
spark_hadoop_version = "2.6.0"
spark_scala_version = "scala2.11"

execute "build spark" do
  cwd spark_install_dir
  user "root"
  command "build/mvn -P#{spark_hadoop_release} -Dhadoop.version=#{spark_hadoop_version} -D#{spark_scala_version} -DskipTests clean package"
  action :run
  not_if false
end
