#
# Cookbook Name:: tachyon
# Recipe:: start_local
#
# Copyright (C) 2015 NICK AMABILE
#
# All rights reserved - Do Not Redistribute
#

install_dir = node["tachyon"]["install_dir"]
tachyon_dir = "#{install_dir}/tachyon-#{node["tachyon"]["version"]}"

execute "start_tachyon_local" do
  cwd tachyon_dir
  command "./bin/tachyon-start.sh local"
  user "root"
  action :run
end


