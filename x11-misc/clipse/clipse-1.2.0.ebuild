# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Configurable TUI clipboard manager for Unix"
HOMEPAGE="https://github.com/savedra1/clipse"

SRC_URI="
	https://github.com/savedra1/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/xecua/distfiles/releases/download/${P}/${P}-vendor.tar.gz
"
LICENSE="MIT BSD ISC"

SLOT="0"
KEYWORDS="~amd64"
IUSE="X wayland"

RDEPEND="
	X? ( x11-misc/xclip )
	wayland? ( gui-apps/wl-clipboard )
"

DEPEND="${RDEPEND}"

src_compile() {
	# X has priority over wayland
	if use X; then
		emake x11
	elif use wayland; then
		emake wayland
	else
		emake x11
	fi
}

src_install() {
	# You must *personally verify* that this trick doesn't install
	# anything outside of DESTDIR; do this by reading and
	# understanding the install part of the Makefiles.
	# This is the preferred way to install.
	#emake DESTDIR="${D}" install

	# When you hit a failure with emake, do not just use make. It is
	# better to fix the Makefiles to allow proper parallelization.
	# If you fail with that, use "emake -j1", it's still better than make.

	# For Makefiles that don't make proper use of DESTDIR, setting
	# prefix is often an alternative.  However if you do this, then
	# you also need to specify mandir and infodir, since they were
	# passed to ./configure as absolute paths (overriding the prefix
	# setting).
	#emake \
	#	prefix="${D}"/usr \
	#	mandir="${D}"/usr/share/man \
	#	infodir="${D}"/usr/share/info \
	#	libdir="${D}"/usr/$(get_libdir) \
	#	install
	# Again, verify the Makefiles!  We don't want anything falling
	# outside of ${D}.
	dobin clipse
	dodoc README.md CHANGELOG.md
}
