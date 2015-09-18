#
# Cookbook Name:: tachyon
# Recipe:: master_init
#
# Copyright (C) 2015 NICK AMABILE
#
# All rights reserved - Do Not Redistribute
#

marker_file = "#{Chef::Config[:file_cache_path]}/tachyon.underfs_formatted"

execute "format_tachyon_underfs" do
  cwd node["tachyon"]["install_dir"]
  command "./bin/tachyon format"
  user "root"
  action :nothing
end

ruby_block 'format-underfs' do
  block do
    resources(:execute => "format_tachyon_underfs").run_action(:run)
    File.open(marker_file, 'w') {}
  end
  not_if { File.exist? marker_file }
end
