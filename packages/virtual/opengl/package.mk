# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2022-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="opengl"
PKG_VERSION=""
PKG_LICENSE="various"
PKG_SITE="https://libreelec.tv/"
PKG_URL=""
PKG_SECTION="virtual"
PKG_LONGDESC="Metapackage to install OpenGL/OpenGLES libraries."

if [ "${OPENGL_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGL}"
fi

if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
fi
