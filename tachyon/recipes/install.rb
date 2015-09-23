#
# Cookbook Name:: tachyon
# Recipe:: install
#
# Copyright (C) 2015 NICK AMABILE
#
# All rights reserved - Do Not Redistribute
#

install_dir = node["tachyon"]["install_dir"]
tachyon_tarball_path = "#{install_dir}/#{node["tachyon"]["file"]}"
tachyon_dir = "#{install_dir}/tachyon-#{node["tachyon"]["version"]}"
hdfs_user = "hdfs"

directory install_dir do
  owner hdfs_user
  group hdfs_user
  mode "0755"
  action :create
  recursive true
end

remote_file tachyon_tarball_path do
  source node["tachyon"]["download_url"]
  owner hdfs_user
  group hdfs_user
  mode "0755"
  action :create_if_missing
end

execute "extract_tachyon_tarball" do
  cwd install_dir
  command "tar xvf #{tachyon_tarball_path}"
  user "root"
  action :run
  not_if {::File.exists?(install_dir)}
end

template "#{tachyon_dir}/conf/tachyon-env.sh" do
  source "tachyon-env.sh.erb"
  owner hdfs_user
  group hdfs_user
  mode "0644"
  action :create
  variables node["tachyon"]
end

template "#{tachyon_dir}/conf/workers" do
  source "workers.erb"
  owner hdfs_user
  group hdfs_user
  mode "0644"
  action :create
  variables :worker_ips => node["tachyon"]["worker_ips"]
end
