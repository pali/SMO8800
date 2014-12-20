#
# Makefile for sensor chip drivers.
#

obj-m	:= dell-smo8800.o

PWD	:= $(shell pwd)
KDIR	:= /lib/modules/$(shell uname -r)/build

all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	rm -f *~ Module.symvers Module.markers modules.order
	make -C $(KDIR) M=$(PWD) clean

install: all
	make -C $(KDIR) M=$(PWD) modules_install
	depmod -a

dkms-install:
	mkdir -p /usr/src/dell-smo8800-1.0
	cp -a dell-smo8800.c Makefile dkms.conf /usr/src/dell-smo8800-1.0/
	dkms remove dell-smo8800/1.0 --all || true
	dkms add dell-smo8800/1.0
	dkms autoinstall dell-smo8800/1.0
