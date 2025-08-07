#!/bin/bash

export PATH=/opt/toolchains/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/:$PATH

CROSS_COMPILER=arm-linux-gnueabihf-

echo "PATH = $PATH"
echo "CROSS_COMPILE = $CROSS_COMPILE"

echo "Building u-boot.."
pushd u-boot
make CROSS_COMPILE=$CROSS_COMPILER am335x_boneblack_defconfig
make CROSS_COMPILE=$CROSS_COMPILER
popd

echo "Building barebox.."
pushd barebox
# Build MLO first
make CROSS_COMPILE=$CROSS_COMPILER am335x_mlo_defconfig
make CROSS_COMPILE=$CROSS_COMPILER
# Build image
make CROSS_COMPILE=$CROSS_COMPILER am335x_defconfig
make CROSS_COMPILE=$CROSS_COMPILER
popd
