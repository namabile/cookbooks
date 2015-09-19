#
# Cookbook Name:: tachyon
# Recipe:: start_master
#
# Copyright (C) 2015 NICK AMABILE
#
# All rights reserved - Do Not Redistribute
#

install_dir = node["tachyon"]["install_dir"]
tachyon_dir = "#{install_dir}/tachyon-#{node["tachyon"]["version"]}"

execute "start_tachyon worker" do
  cwd tachyon_dir
  command "./bin/tachyon-start.sh worker Mount"
  user "root"
  action :run
end

