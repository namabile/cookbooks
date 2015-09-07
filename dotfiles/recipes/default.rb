# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:dotfiles][:users].each do |user|

  user_name = user[:user_name]
  git_url = user[:git_url]
  files_to_use = user[:files_to_use]

  git "/home/#{user_name}/dotf1iles" do
    repository git_url
    destination "/home/#{user_name}/dotfiles"
    enable_submodules true
    revision "master"
    user user_name
    group user_name
    action :sync
  end

  directory "/home/#{user_name}/git" do
    owner user_name
    group user_name
    action :create
  end

  directory "/home/#{user_name}/.vim/bundle" do
    owner user_name
    group user_name
    recursive true
    action :create
  end

  ruby_block "copy vim bundle" do
    block do
      FileUtils.cp_r("/home/#{user_name}/dotfiles/.vim/bundle/.", "/home/#{user_name}/.vim/bundle")
      FileUtils.chown_R(user_name, user_name, "/home/#{user_name}/.vim/bundle/.")
    end
  end

  if ::File.exist?("/home/#{user_name}/dotfiles")
    ruby_block "move dotfiles" do
      block do
        files_to_use.each do |file|
          FileUtils.cp("/home/#{user_name}/dotfiles/#{file}", "/home/#{user_name}/#{file}")
          FileUtils.chown_R(user_name, user_name, "/home/#{user_name}/#{file}")
        end
      end
    end
  end

end

