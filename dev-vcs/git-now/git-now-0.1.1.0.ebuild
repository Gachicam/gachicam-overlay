# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="a command-line tool for light and temporary commit"
HOMEPAGE="https://github.com/iwata/git-now"

EGIT_REPO_URI="https://github.com/iwata/git-now.git"
EGIT_COMMIT="v0.1.1.0"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	# do nothing
	:
}

src_install() {
	emake prefix="${D}"/usr install
	dodoc README.mdown
}
