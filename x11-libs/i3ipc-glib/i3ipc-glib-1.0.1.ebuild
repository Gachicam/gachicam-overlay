# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A C interface library to i3wm"
HOMEPAGE="https://github.com/altdesktop/i3ipc-glib"
SRC_URI="https://github.com/altdesktop/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

# docとintrospectionはUSEで切り替えられるようにできるのでは?
DEPEND="
	x11-libs/libxcb
	x11-base/xcb-proto
	>=dev-libs/glib-2.32
	dev-libs/json-glib
	dev-util/gtk-doc
	dev-libs/gobject-introspection
"

src_configure() {
	./autogen.sh \
		--prefix="${EPREFIX}/usr" \
		--libdir="${EPREFIX}/usr/$(get_libdir)" || die
}
