#
# Cookbook:: chef-master
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'dns-server::default'


file '/etc/motd' do
  content "4rth motd"
end
