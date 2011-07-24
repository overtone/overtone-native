sudo brew install git
sudo brew install cmake
curl -o qt-mac-opensource-4.7.3.dmg http://get.qt.nokia.com/qt/source/qt-mac-opensource-4.7.3.dmg
hdiutil mount qt-mac-opensource-4.7.3.dmg
cd '/Volumes/Qt 4.7.3/'
sudo installer -package Qt.mpkg -target "/Volumes/macosx"
