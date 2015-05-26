#!/bin/sh

dirEx="/System/Library/Extensions"

sudo rm -rf $dirEx/IO80211Family.kext
sudo cp -R IO80211Family.kext $dirEx/
sudo chmod -R 755 $dirEx/IO80211Family.kext
sudo chown -R root:wheel $dirEx/IO80211Family.kext
sudo rm -R $dirEx/Extensions.kextcache
sudo rm -R $dirEx/Extensions.mkext


sudo diskutil verifyVolume /Volumes/New\ Volume
sudo diskutil repairPermissions /Volumes/New\ Volume

#Apple recomendation rebuild cache
#sudo touch /System/Library/Extensions
#sudo kextcache -update-volume /
sudo rm -rf /System/Library/Caches/*


