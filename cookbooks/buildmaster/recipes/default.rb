require_recipe "apt"

package "zip" do
  action :upgrade
end
package "unzip" do
  action :upgrade
end
package "curl" do
  action :upgrade
end
package "git-core" do
  action :upgrade
end
package "python-virtualenv" do
  action :upgrade
end

directory "/ramdisk/supercollider-ubuntu-lucid-x86" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end
directory "/ramdisk/supercollider-ubuntu-lucid-x86_64" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end

directory "/ramdisk/supercollider-macosx-snowleopard-x86_64" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end

directory "/ramdisk/sc3-plugins-ubuntu-lucid-x86" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end
directory "/ramdisk/sc3-plugins-ubuntu-lucid-x86_64" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end

directory "/ramdisk/sc3-plugins-macosx-snowleopard-x86_64" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end

