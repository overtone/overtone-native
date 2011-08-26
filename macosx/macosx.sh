#!/bin/sh

umount /Volumes/ramdisk
diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://1165430`

cd /Volumes/ramdisk

git clone --recursive git://supercollider.git.sourceforge.net/gitroot/supercollider/supercollider

rm -rf build
mkdir build
cd build
cmake ../supercollider
make
