#!/bin/bash

ARCH=arm64

# Toolchain paths
PATH="/home/ata-kaner/los/prebuilts/clang/host/linux-x86/clang-r416183b/bin:/home/ata-kaner/los/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:/home/ata-kaner/los/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:${PATH}"

make -j$(nproc --all) ARCH=$ARCH CC=clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-android- CROSS_COMPILE_ARM32=arm-linux-androideabi- vendor/lineage_r8q_defconfig

make -j$(nproc --all) ARCH=$ARCH CC=clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-android- CROSS_COMPILE_ARM32=arm-linux-androideabi-

tools/mkdtimg create arch/arm64/boot/dtbo.img --page_size=4096 $(find arch -name "*.dtbo")
