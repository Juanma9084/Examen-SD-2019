@echo off
VBoxManage createhd --filename Nueva --size 1000
VBoxManage createvm --name Nueva --ostype "Ubuntu_64" --register
VBoxManage storagectl Nueva--name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach Nueva --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium %name%.vdi
VBoxManage storagectl Nueva --name "IDE Controller" --add ide
VBoxManage storageattach Nueva --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium C:/Users/analsig1/VBoxManage/ubuntu.iso
VBoxManage modifyvm Nueva --ioapic on
VBoxManage modifyvm Nueva --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage modifyvm Nueva --memory 2018 --vram 128
VBoxManage modifyvm Nueva --nic1 bridged --bridgeadapter1 e1000g0
pause
