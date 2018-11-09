# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC

PKG_NAME="atf"
PKG_VERSION="v2.0"
PKG_SHA256="7d699a1683bb7a5909de37b6eb91b6e38db32cd6fc5ae48a08eb0718d6504ae4"
PKG_ARCH="arm aarch64"
PKG_LICENSE="BSD-3c"
PKG_SITE="https://github.com/ARM-software/arm-trusted-firmware"
PKG_URL="https://github.com/ARM-software/arm-trusted-firmware/archive/$PKG_VERSION.tar.gz"
PKG_LONGDESC="ARM Trusted Firmware is a reference implementation of secure world software, including a Secure Monitor executing at Exception Level 3 and various Arm interface standards."
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

make_target() {
  CROSS_COMPILE="$TARGET_KERNEL_PREFIX" LDFLAGS="" CFLAGS="" make PLAT=$ATF_PLATFORM bl31
}

post_make_target() {
  cp -av build/$ATF_PLATFORM/release/bl31.bin .
}
