# Credit to Alex C.U. @ https://medium.com/@au42/the-useful-raspberrypi-cross-compile-guide-ea56054de187

SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

# Sets the C Compiler for this toolchain
SET(CMAKE_C_COMPILER $ENV{PI_TOOLS}/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc)

# Sets the C++ Compiler for this toolchain
SET(CMAKE_CXX_COMPILER $ENV{PI_TOOLS}/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-g++)

SET(CMAKE_FIND_ROOT_PATH $ENV{PI_TOOLS}/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/sysroot/)

# Use our definitions for compiler tools
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# Search for libraries and headers in the target directories only
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)