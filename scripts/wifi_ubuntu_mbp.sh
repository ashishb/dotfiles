wget http://www.lwfinger.com/b43-firmware/broadcom-wl-5.100.138.tar.bz2
tar xvf broadcom-wl-5.100.138.tar.bz2
sudo b43-fwcutter -w /lib/firmware/3.11.0-2-generic broadcom-wl-5.100.138/linux/wl_apsta.o
dmesg | grep -e b43 -e bcma
