#
# Cookbook Name:: fsharp
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package "Install Fsharp" do
  case node[:platform]
  when "ubuntu", "debian"
    package_name "fsharp"
  end
end
