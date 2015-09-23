#
# Cookbook Name:: anaconda_wrapper
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'runit::default'
include_recipe 'anaconda::default'

anaconda_nbservice 'notebook-server' do
  # listen on all interfaces; there will be a warning since security is
  # disabled
  ip '*'
  port '8888'

  #user node["anaconda"]["owner"]
  #group node["anaconda"]["group"]
  user "root"
  group "root"

  install_dir '/opt/ipython/server'

  service_action [ :enable, :start ]
end
