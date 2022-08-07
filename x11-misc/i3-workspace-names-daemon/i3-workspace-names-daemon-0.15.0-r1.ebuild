# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTURILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Dynamically update workspace names in i3wm based on their content."
HOMEPAGE="
	https://github.com/cboddy/i3-workspace-names-daemon
	https://pypi.org/project/i3-workspace-names-daemon
"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cboddy/i3-workspace-names-daemon.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	|| ( x11-wm/i3 x11-wm/i3-gaps )
	media-fonts/fontawesome
	dev-python/i3ipc[${PYTHON_USEDEP}]
"
