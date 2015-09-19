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
  user "root"
  action :nothing
end

ruby_block "format_tachyon_if_needed" do
  block do
    resources(:execute => "format_tachyon").run_action(:run)
    File.open(marker_file, 'w') {}
  end
  not_if { File.exist? marker_file }
end
