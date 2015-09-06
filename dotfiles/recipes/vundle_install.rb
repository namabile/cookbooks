#
# Cookbook Name:: dotfiles
# Recipe:: vundle_install
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:dotfiles][:users].each do |user|
  execute "Vundle Plugin Install" do
    user user[:user_name]
    command "vim +PluginInstall"
  end
end
