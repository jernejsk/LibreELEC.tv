# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gettext-tiny"
PKG_VERSION="0.3.2"
PKG_SHA256="29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383"
PKG_LICENSE="LGPL-2.1-or-later"
PKG_SITE="https://github.com/sabotage-linux/gettext-tiny"
PKG_URL="https://github.com/sabotage-linux/gettext-tiny/archive/refs/tags/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="ccache:host"
PKG_LONGDESC="Minimal msgfmt/msgmerge/xgettext, enough to compile .po files during a build."
PKG_TOOLCHAIN="manual"

# Nothing in an image ships translations, but a handful of packages still
# compile .po files as part of their build and cannot be told not to. Those
# need msgfmt to exist; they do not need GNU gettext, which spends over three
# minutes of the critical path on a configure script to provide it.

make_host() {
  make CC="${HOST_CC}" LIBINTL=NONE
}

makeinstall_host() {
  mkdir -p ${TOOLCHAIN}/bin
  cp -a msgfmt msgmerge xgettext ${TOOLCHAIN}/bin
  cp -a autopoint ${TOOLCHAIN}/bin

  # autoreconf needs AM_GNU_GETTEXT and friends to be defined or it fails
  # outright on any package whose configure.ac calls them, whether or not
  # translations are wanted. These are the same macro names GNU gettext
  # installs, with stub implementations.
  mkdir -p ${TOOLCHAIN}/share/aclocal
  cp -a m4/*.m4 ${TOOLCHAIN}/share/aclocal
}
