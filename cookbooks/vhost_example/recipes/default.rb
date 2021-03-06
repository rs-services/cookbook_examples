#
# Cookbook Name:: vhost_test
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create the apache virtual host file
# 
vhost_example "vhost" do
  destination "#{node[:repo][:default][:destination]}/apps"
  port  "8080"
  action :setup_vhost # see setup_vhost provider
end

# install the app
# this is just a simple app
directory "#{node[:repo][:default][:destination]}/apps/vhost_example" do
  mode "0755"
  recursive true
  action :create
end

# install app files.  normally would be a php or other app.
# this is just a html file to show the test configuration
template "#{node[:repo][:default][:destination]}/apps/vhost_example/index.html" do
  mode "0755"
  source "index.erb"
end

# used for lb/healthcheck
template "#{node[:repo][:default][:destination]}/apps/index.html" do
  mode "0755"
  source "index.erb"
end

