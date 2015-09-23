#
# Cookbook Name:: tachyon
# Recipe:: master_init
#
# Copyright (C) 2015 NICK AMABILE
#
# All rights reserved - Do Not Redistribute
#

install_dir = node["tachyon"]["install_dir"]
tachyon_dir = "#{install_dir}/tachyon-#{node["tachyon"]["version"]}"
marker_file = "#{Chef::Config[:file_cache_path]}/tachyon.fomrmatted"

execute "format_tachyon" do
  cwd tachyon_dir
  command "./bin/tachyon format"
  user "hdfs"
  action :nothing
end

hdfs_home = "/var/lib/hadoop-hdfs"

# create ssh key
execute "generate ssh keys for hdfs" do
  user "hdfs"
  creates ::File.expand_path("#{hdfs_home}/.ssh/id_rsa.pub")
  command "ssh-keygen -t rsa -q -f #{hdfs_home}/.ssh/id_rsa -P \"\""
  action :run
  not_if {::File.exists?("#{hdfs_home}/.ssh/id_rsa.pub")}
end

execute "authorize the key" do
  user "hdfs"
  command "cat #{hdfs_home}/.ssh/id_rsa.pub > #{hdfs_home}/.ssh/authorized_keys"
  action :run
end

ruby_block "format_tachyon_if_needed" do
  block do
    resources(:execute => "format_tachyon").run_action(:run).user("hdfs")
    File.open(marker_file, 'w') {}
  end
  not_if { File.exist? marker_file }
end
