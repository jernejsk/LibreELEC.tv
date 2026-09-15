# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2023-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libcap-ng"
PKG_VERSION="0.9.5"
PKG_SHA256="a2b4211f59b231d607c61ea2a13e9ecb38f446fe769b44e12da939d5af6d978a"
PKG_LICENSE="LGPL-2.1-or-later"
PKG_SITE="https://github.com/stevegrubb/libcap-ng"
PKG_URL="https://github.com/stevegrubb/libcap-ng/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Libcap-ng is a library for Linux that makes using posix capabilities easy."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="-cfg-libs"

# configure probes for bluetooth/bluetooth.h with no option to say no, so
# whether the netcap-advanced util is built depends on whether bluez happens to
# have reached the sysroot first. Serial builds got away with it; with several
# packages in flight libcap-ng can configure with the header present and then
# compile without it, failing on a util that is not shipped anyway. Pin the
# answer instead of declaring a dependency on bluez, which would drag
# libcap-ng behind bluez, systemd, dbus and glib for no gain.
PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-python3=no \
                           ac_cv_header_bluetooth_bluetooth_h=no \
                           ac_cv_header_bluetooth_hci_h=no"
