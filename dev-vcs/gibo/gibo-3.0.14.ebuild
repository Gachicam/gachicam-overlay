# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Easy access to gitignore boilerplates"
HOMEPAGE="https://github.com/simonwhitaker/gibo"
SRC_URI="
	https://github.com/simonwhitaker/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/xecua/distfiles/releases/download/${P}/${P}-vendor.tar.gz
"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	ego build
}

src_install() {
	dobin gibo
}
