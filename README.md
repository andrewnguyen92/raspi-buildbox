
# Raspberry Pi Buildbox
This project aims to make it simple to set up a build environment to cross-compile C/C++ code for the Raspberry Pi using CMake with "gcc-linaro-arm-linux-gnueabihf-raspbian-**x64**" toolchain. It uses Vagrant to create an Ubuntu VM, provisions it with the tools that you'd need to build, and creates a shared directory between your host machine and guest VM. 

This frees you from having to build on the Pi, allowing you to leverage the capabilities of your primary computer to quickly develop and build for the Pi.

---
## Getting Started
### Prerequisites
Vagrant is all you need to get started, which you can download for free here: [https://www.vagrantup.com/](https://www.vagrantup.com/)

### Setup
With Vagrant installed, all you need to do to set up your VM is run `vagrant up` from the repo's root directory. This will take a while, but you'll only need to go through this once to download and setup your VM.

Note: If you happen to see this during this step:
```
default: The guest additions on this VM do not match the installed version of
default: VirtualBox! In most cases this is fine, but in rare cases it can
default: prevent things such as shared folders from working properly. If you see
default: shared folder errors, please make sure the guest additions within the
default: virtual machine match the version of VirtualBox you have installed on
default: your host and reload your VM.
default:
default: Guest Additions Version: 5.2.32
default: VirtualBox Version: 6.0
```

You can install this vagrant plugin: `vagrant plugin install vagrant-vbguest`

### Using
Once Vagrant has setup the VM, you can SSH into the machine with `vagrant ssh`. This should drop you within the `\home\vagrant\shared` directory, which is the shared folder that mirrors the "vagrantVM" directory.

---
## Building
I've included two Hello World examples to demonstrate how to use this VM and CMake to build your code. For example, to build the ExampleCppProj, navigate to that directory and run:
```
vagrant@raspi-buildbox:~/shared/ExampleCppProj$ mkdir build
vagrant@raspi-buildbox:~/shared/ExampleCppProj$ cd build/
vagrant@raspi-buildbox:~/shared/ExampleCppProj/build$ cmake .. -DCMAKE_TOOLCHAIN_FILE=$CMAKE_XC_TC
-- The C compiler identification is GNU 4.8.3
-- The CXX compiler identification is GNU 4.8.3
-- Check for working C compiler: /home/vagrant/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc
-- Check for working C compiler: /home/vagrant/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /home/vagrant/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-g++
-- Check for working CXX compiler: /home/vagrant/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-g++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/vagrant/shared/ExampleCppProj/build
```

Here we're using a separate "build" directory to keep all our build and intermediate files separate. The Vagrantfile has set up a `$CMAKE_XC_TC` environment variable that points to the toolchain file that was also included in this repo. After CMake successfully completes, you should have a ready to use Makefile to build!
```
vagrant@raspi-buildbox:~/shared/ExampleCppProj/build$ make
Scanning dependencies of target ExampleCppProj
[ 50%] Building CXX object CMakeFiles/ExampleCppProj.dir/src/main.cpp.o
[100%] Linking CXX executable ExampleCppProj
[100%] Built target ExampleCppProj
```

From here, you'll be able to copy your binaries from the shared directory to your Raspberry Pi. You can easily set up your Raspberry Pi as a shared volume using Samba, as shown here: [https://desertbot.io/blog/how-to-cross-compile-for-raspberry-pi#install-samba](https://desertbot.io/blog/how-to-cross-compile-for-raspberry-pi#install-samba)

## Acknowledgments
Here's a list of resources that I used to put this together:
* https://medium.com/@au42/the-useful-raspberrypi-cross-compile-guide-ea56054de187
* https://github.com/mitchallen/pi-cross-compile
* https://desertbot.io/blog/how-to-cross-compile-for-raspberry-pi
* https://hackaday.com/2016/02/03/code-craft-cross-compiling-for-the-raspberry-pi/
* https://www.raspberrypi.org/documentation/linux/kernel/building.md
* https://github.com/Yadoms/yadoms/wiki/Cross-compile-for-raspberry-PI
