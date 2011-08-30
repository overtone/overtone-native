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
 * Chef

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

after each boot:
    
    sudo -i
    diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://1165430`
    ln -s /Volumes/ramdisk /ramdisk
    mkdir /ramdisk/supercollider-macosx-snowleopard-x86_64
    mkdir /ramdisk/sc3-plugins-macosx-snowleopard-x86_64

    cd buildslave-macosx-snowleopard-x86_64
    buildslave start

## License

Copyright (C) 2011 Fabian Aussems

Distributed under the Eclipse Public License, the same as Clojure.


