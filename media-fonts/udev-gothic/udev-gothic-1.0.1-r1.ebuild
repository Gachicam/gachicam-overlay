# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A japanese font for programming composed of BIZ UD Gothic and JetBrains Mono"
HOMEPAGE="https://github.com/yuru7/udev-gothic"
SRC_URI="
	https://github.com/yuru7/udev-gothic/releases/download/v${PV}/UDEVGothic_v${PV}.zip
	https://github.com/yuru7/udev-gothic/releases/download/v${PV}/UDEVGothic_NF_v${PV}.zip
"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
BDEPEND="
	app-arch/unzip
"

# ref: media-fonts/hackgen::ncaq-overlay
src_unpack() {
	mkdir "$S"
	cd "$S"
	default_src_unpack
}

src_install() {
	insinto /usr/share/fonts/${PN}
	doins UDEVGothic*/*.ttf
}
