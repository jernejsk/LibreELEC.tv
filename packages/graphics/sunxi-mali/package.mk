# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="sunxi-mali"
PKG_VERSION="418f55585e76f375792dbebb3e97532f0c1c556d"
PKG_SHA256="b5e7e8f9f2886ed0b273f72ea16ae4868711726fe33e3d80ef24e86269c90fd2"
PKG_ARCH="arm"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/bootlin/mali-blobs"
PKG_URL="https://github.com/bootlin/mali-blobs/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mali-blobs-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain libdrm wayland"
PKG_LONGDESC="Sunxi Mali-400 support libraries"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include/
    cp -av include/wayland/* $SYSROOT_PREFIX/usr/include

  mkdir -p $SYSROOT_PREFIX/usr/lib/pkgconfig
    cp -PRv $PKG_DIR/pkgconfig/*.pc $SYSROOT_PREFIX/usr/lib/pkgconfig

  MALI="r6p2/arm/wayland/libMali.so"

  mkdir -p $SYSROOT_PREFIX/usr/lib/
    cp -v $MALI $SYSROOT_PREFIX/usr/lib

  mkdir -p $INSTALL/usr/lib
    cp -v $MALI $INSTALL/usr/lib

    for lib in libEGL.so \
               libEGL.so.1 \
               libEGL.so.1.4 \
               libGLESv2.so \
               libGLESv2.so.2 \
               libGLESv2.so.2.0 \
               libgbm.so \
               libgbm.so.1; do
      ln -sfv libMali.so $INSTALL/usr/lib/${lib}
      ln -sfv libMali.so $SYSROOT_PREFIX/usr/lib/${lib}
    done
}
