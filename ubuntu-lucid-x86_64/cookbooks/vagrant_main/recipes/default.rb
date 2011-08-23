require_recipe "apt"
require_recipe "java"

package "python-dev" do
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

directory "/home/vagrant/bin" do
  owner "vagrant"
  group "vagrant"
  mode 0755
end

cookbook_file "copy leiningen" do
  path "/home/vagrant/bin/lein"
  action :create
  source "lein"

  mode 0755
  owner "vagrant"
  group "vagrant"
end

template "bashrc" do
  path "/home/vagrant/.bashrc"
  source "bashrc.erb"
  mode 0644
  owner "vagrant"
  group "vagrant"
end

execute "emacs-starter-kit checkout" do
  command "git clone git://github.com/technomancy/emacs-starter-kit.git .emacs.d"
  creates "/home/vagrant/.emacs.d"
  cwd "/home/vagrant"
  user "vagrant"
  group "vagrant"
end

execute "emacs-starter-kit update" do
  command "git pull"
  cwd "/home/vagrant/.emacs.d"
  user "vagrant"
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
