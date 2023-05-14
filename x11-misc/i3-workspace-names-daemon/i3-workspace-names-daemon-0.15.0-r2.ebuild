# Copyright 2021-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1 pypi

DESCRIPTION="Dynamically update workspace names in i3wm based on their content."
HOMEPAGE="
	https://github.com/cboddy/i3-workspace-names-daemon
	https://pypi.org/project/i3-workspace-names-daemon
"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cboddy/i3-workspace-names-daemon.git"
else
	SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"
	S="${WORKDIR}/${P}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	x11-wm/i3
	media-fonts/fontawesome
	dev-python/i3ipc[${PYTHON_USEDEP}]
"
