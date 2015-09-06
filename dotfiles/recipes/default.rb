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

  git "/home/#{user_name}/dotfiles" do
    repository git_url
    action :sync
    revision "master"
    user user_name
    group user_name
  end

  directory "/home/#{user_name}/git" do
    owner user_name
    group user_name
    action :create
  end

  files_to_use.each do |file|
    file "/home/#{user_name}/dotfiles/#{file}" do
      owner user_name
      group user_name
      mode 600
      content ::File.open("/home/#{user_name}/dotfiles/#{file}").read
      action :create
    end
  end

end

