# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libunwind"
PKG_VERSION="1.8.3"
PKG_SHA256="be30d910e67f58d82e753231f1357f326a1a088acf126b21ff77e60aab19b90b"
PKG_LICENSE="MIT"
PKG_SITE="https://www.nongnu.org/libunwind/"
PKG_URL="https://github.com/libunwind/libunwind/releases/download/v${PKG_VERSION}/libunwind-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="autotools:host gcc:host zlib"
PKG_LONGDESC="library to determine the call-chain of a program"
PKG_BUILD_FLAGS="+pic"
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --disable-minidebuginfo \
                           --disable-documentation \
                           --disable-tests"

makeinstall_target() {
  make DESTDIR=${SYSROOT_PREFIX} install
}
