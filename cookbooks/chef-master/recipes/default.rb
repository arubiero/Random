#
# Cookbook:: chef-master
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'less'
package 'iproute'

include_recipe 'dns-server::default'
#include_recipe 'dhcp::server'
