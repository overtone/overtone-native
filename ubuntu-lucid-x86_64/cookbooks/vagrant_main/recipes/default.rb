require_recipe "apt"
require_recipe "java"

package "curl" do
  action :upgrade
end

package "emacs23-nox" do
  action :upgrade
end

package "git-core" do
  action :upgrade
end

directory "/home/vagrant/bin" do
  owner "vagrant"
  group "vagrant"
  mode 0755
end

cookbook_file "/home/vagrant/bin/lein" do
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

execute "lein" do
  command "/home/vagrant/bin/lein"
end

execute "lein2" do
  command "/home/vagrant/bin/lein plugin install swank-clojure 1.3.1"
end

execute "emacs-starter-kit" do
  command "git clone git://github.com/technomancy/emacs-starter-kit.git .emacs.d"
end

