require_recipe "apt"

package "curl" do
  action :upgrade
end
package "git-core" do
  action :upgrade
end
package "python-virtualenv" do
  action :upgrade
end
package "python-dev" do
  action :upgrade
end

cookbook_file "copy bashrc" do
  path "/home/vagrant/.bashrc"
  source "bashrc"
  action :create

  mode 0644
  owner "vagrant"
  group "vagrant"
end

execute "create python sandbox" do
  cwd "/home/vagrant"
  command "virtualenv --no-site-packages sandbox"
  action :run
  creates "/home/vagrant/sandbox"
  user "vagrant"
  group "vagrant"
end

execute "install buildbot + buildbot-slave" do
  cwd "/home/vagrant/sandbox"
  command "./bin/pip install buildbot buildbot-slave"
  action :run
  environment ({'VIRTUAL_ENV' => '/home/vagrant/sandbox' })
  user "vagrant"
  group "vagrant"
end
