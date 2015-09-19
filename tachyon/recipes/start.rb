#
# Cookbook Name:: tachyon
# Recipe:: start
#
# Copyright (C) 2015 NICK AMABILE
#
# All rights reserved - Do Not Redistribute
#

install_dir = node["tachyon"]["install_dir"]
tachyon_dir = "#{install_dir}/tachyon-#{node["tachyon"]["version"]}"

execute "start_tachyon" do
  cwd tachyon_dir
  command "./bin/tachyon format"
  user "root"
  action :nothing
end
