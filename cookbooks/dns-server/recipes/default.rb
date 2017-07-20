#
# Cookbook:: dns-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
file '/etc/motd' do
  content 'DNS-SERVER'
end
