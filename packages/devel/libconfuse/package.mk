# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libconfuse"
PKG_VERSION="3.4"
PKG_SHA256="36bfa3928f9c323914c7c8317e8722cb22f41db69d7c9d4c24b4689fa955445d"
PKG_LICENSE="ISC"
PKG_SITE="https://github.com/libconfuse/libconfuse"
PKG_URL="https://github.com/libconfuse/libconfuse/releases/download/v${PKG_VERSION}/confuse-${PKG_VERSION}.tar.xz"
PKG_SOURCE_DIR="confuse-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Small configuration file parser library for C"
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --disable-nls"
