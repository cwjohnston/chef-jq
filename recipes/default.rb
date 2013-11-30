#
# Cookbook Name:: jq
# Recipe:: default
#
# Copyright (C) 2013 Cameron Johnston
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['jq']['install_method']
when 'latest_binary'

  platform = value_for_platform(
    "macosx" => { "default" => "osx" },
    "default" => "linux"
  )

  arch = node['kernel']['machine'] == 'x86_64' ? '64' : '32'

  binary_url = "http://stedolan.github.io/jq/download/#{platform}#{arch}/jq"
  override_url = node['jq']['override_url']
  binary_checksum = node['jq']['binary_sha256']

  remote_file ::File.join(node['jq']['binary_install_path'], 'jq') do
    source override_url.nil? ? binary_url : override_url
    checksum binary_checksum unless binary_checksum.nil?
    mode 0755
    owner 'root'
    group 'root'
    action binary_checksum.nil? ? :create_if_missing : :create
  end

else
  Chef::Log.warn("Sorry, I don't know how to install jq using install method '#{node['jq']['install_method'].inspect}'")
end
