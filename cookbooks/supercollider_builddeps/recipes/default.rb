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
