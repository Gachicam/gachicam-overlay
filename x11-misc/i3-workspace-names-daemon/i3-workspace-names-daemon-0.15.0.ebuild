# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )
inherit distutils-r1

DESCRIPTION="A daemon script to dynamically update workspace names in i3wm based on their content."
HOMEPAGE="
	https://github.com/cboddy/i3-workspace-names-daemon
	https://pypi.org/project/i3-workspace-names-daemon
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="
	|| ( x11-wm/i3 x11-wm/i3-gaps )
	media-fonts/fontawesome
	${DEPEND}
"
BDEPEND=""
