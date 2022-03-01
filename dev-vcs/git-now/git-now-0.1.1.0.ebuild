# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a command-line tool for light and temporary commit"
HOMEPAGE="https://github.com/iwata/git-now"

SHFLAGS_COMMIT="2fb06af13de884e9680f14a00c82e52a67c867f1"

SRC_URI="
	https://github.com/iwata/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/nvie/shFlags/archive/${SHFLAGS_COMMIT}.tar.gz -> shFlags.tar.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	rmdir shFlags
	mv ${WORKDIR}/shFlags-${SHFLAGS_COMMIT} shFlags

	default
}

src_compile() {
	# do nothing
	:
}

src_install() {
	emake prefix="${D}"/usr install
	dodoc README.mdown
}
