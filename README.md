# overtone-native

Supercollider build virtualmachines based on vagrant

## Dependencies

 * ruby
 * [vagrant](http://vagrantup.com/)
 * [virtualbox](http://www.virtualbox.org/)

## Howto

Install

 * RVM
 * gem install vagrant
 * install virtualbox-4.1  from http://www.virtualbox.org/

## MacOSX

Prepare a basebox with:

 * MacOSX Snowleopard 10.6.3 x86_64
 * Xcode 3.2.3
 * Homebrew

Diskutility -> Erase free space with 0

After preparing a basebox make a clone, and install

    brew install git
    brew install cmake
    brew install qt
    brew install libsndfile
    brew install fftw
    easy_install virtualenv
    virtualenv --no-site-packages sandbox
    source sandbox/bin/activate
    pip install buildbot-slave

    buildslave create-slave buildslave-macosx-snowleopard-x86_64 10.0.0.2:9989 macosx-snowleopard-x86_64 pass
    
in ~/.bash_profile

    source sandbox/bin/activate


## MacOSX start.sh in ~

    #!/bin/sh

    USER_NAME=$(/usr/bin/who am i | /usr/bin/awk '{print $1}')

    if [ ! -d "/Volumes/ramdisk" ]; then
      diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://1165430`
      exec 5>"/Volumes/ramdisk/.lock.${USER_NAME}"  
    fi

    if [ ! -d "/ramdisk" ]; then
      ln -s /Volumes/ramdisk /ramdisk
    fi

    mkdir /ramdisk/supercollider-macosx-snowleopard-x86_64
    mkdir /ramdisk/sc3-plugins-macosx-snowleopard-x86_64

    cd ~/buildslave-macosx-snowleopard-x86_64

    export VIRTUAL_ENV=$HOME/sandbox
    ~/sandbox/bin/buildslave restart

## ~/Library/LaunchAgents/buildslave.plist

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>buildslave</string>

      <key>ProgramArguments</key>
      <array>
        <string>/Users/vagrant/start.sh</string>
      </array>

      <key>EnvironmentVariables</key>
      <array>
        <key>PATH</key>
        <string>/Users/vagrant/sandbox/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin</string>
        <key>VIRTUAL_ENV</key>
        <string>/Users/vagrant/sandbox</string>
      </array>


      <key>RunAtLoad</key>
      <true/>

      <key>StandardErrorPath</key>
      <string>/tmp/buildslave.err</string>

      <key>StandardOutPath</key>
      <string>/tmp/buildslave.out</string>
    </dict>
    </plist>

load the launchagent

    launchctl unload ~/Library/LaunchAgents/buildslave.plist
    launchctl load ~/Library/LaunchAgents/buildslave.plist


## License

Copyright (C) 2011 Fabian Aussems

Distributed under the Eclipse Public License, the same as Clojure.


