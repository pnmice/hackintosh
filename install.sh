#!/bin/sh

dirEx="/System/Library/Extensions"

sudo cp -R intel3000.4000.driver.10.10.1/AppleIntelFramebufferCapri.kext $dirEx/
sudo cp -R intel3000.4000.driver.10.10.1/AppleIntelSNBGraphicsFB.kext $dirEx/
sudo chmod -R 755 $dirEx/AppleIntelFramebufferCapri.kext
sudo chmod -R 755 $dirEx/AppleIntelSNBGraphicsFB.kext
sudo chown -R root:wheel $dirEx/AppleIntelFramebufferCapri.kext
sudo chown -R root:wheel $dirEx/AppleIntelSNBGraphicsFB.kext
sudo rm -R $dirEx/Extensions.kextcache
sudo rm -R $dirEx/Extensions.mkext


sudo diskutil verifyVolume /Volumes/New\ Volume
sudo diskutil repairPermissions /Volumes/New\ Volume

#Apple recomendation rebuild cache
#sudo touch /System/Library/Extensions
#sudo kextcache -update-volume /
sudo rm -r /System/Library/Caches/*
sudo nvram -d boot-args
sudo reboot

