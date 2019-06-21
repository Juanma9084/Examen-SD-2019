@echo off
set /p name= Escriba el nombre de la VM nueva:
echo %name%
set /p dd = Escriba el tamano del Disco Duro (MB):
echo %dd%
set /p ram = Escriba el tamano del RAM (MB):
echo %ram%
VBoxManage createhd --filename %name% --size %dd%
VBoxManage createvm --name %name% --ostype "Ubuntu_64" --register
VBoxManage storagectl %name% --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach %name% --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium %name%.vdi
VBoxManage storagectl %name% --name "IDE Controller" --add ide
VBoxManage storageattach %name% --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium C:/Users/analsig1/VBoxManage/ubuntu.iso
VBoxManage modifyvm %name% --ioapic on
VBoxManage modifyvm %name% --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage modifyvm %name% --memory %ram% --vram 128
VBoxManage modifyvm %name% --nic1 bridged --bridgeadapter1 e1000g0
pause
