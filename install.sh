#!/bin/sh

kexts={AppleIntelFramebufferCapri.kext,AppleIntelSNBGraphicsFB.kext}
dirEx="/System/Library/Extensions"

sudo bash
sudo cp -R intel3000.4000.driver.10.10.1/$kexts $dirEx/
sudo chmod -R 755 $dirEx/$kexts
sudo chown -R root:wheel $dirEx/$kexts 
sudo rm -R $dirEx/Extensions.kextcache
sudo rm -R $dirEx/Extensions.mkext


sudo diskutil verifyVolume /Volumes/New\ Volume
sudo diskutil repairPermissions /Volumes/New\ Volume

#Apple recomendation rebuild cache
#sudo touch /System/Library/Extensions
#sudo kextcache -update-volume /
sudo rm -r /System/Library/Caches/com.apple.kext.caches
sudo reboot

