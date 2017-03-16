#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
if node['platform_family'] == "rhel"
	package = "nginx"
	yum_package 'epel-release' do
		action :install
	end
elsif node['platform_family'] == "debian"
	package = "nginx"
end
package 'nginx' do
	package_name package
	action :install
end

service 'apache2' do
	service_name package
	action [:disable,:stop]
end

include_recipe 'apache::websites'
