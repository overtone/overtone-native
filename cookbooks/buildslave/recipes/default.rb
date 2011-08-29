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
package "emacs23-nox" do
  action :upgrade
end
package "git-core" do
  action :upgrade
end
package "build-essential" do
  action :upgrade
end
package "python-virtualenv" do
  action :upgrade
end
package "python-dev" do
  action :upgrade
end
package "vim" do
  action :upgrade
end
package "libjack-dev" do
  action :upgrade
end
package "libxt-dev" do
  action :upgrade
end
package "libreadline5-dev" do
  action :upgrade
end
package "libfftw3-dev" do
  action :upgrade
end
package "libicu-dev" do
  action :upgrade
end
package "libqt4-dev" do
  action :upgrade
end
package "cmake" do
  action :upgrade
end
package "libsndfile1-dev" do
  action :upgrade
end

directory "/ramdisk" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

execute "mount ramdisk" do
  command "mount -t ramfs -o size=1024M ramfs /ramdisk"
end

directory "/ramdisk/supercollider-ubuntu-lucid-x86" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

directory "/ramdisk/sc3-plugins-ubuntu-lucid-x86" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

directory "/ramdisk/supercollider-ubuntu-lucid-x86_64" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end

directory "/ramdisk/sc3-plugins-ubuntu-lucid-x86_64" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
end
