# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Enter kernel namespaces from Python"
HOMEPAGE="
	https://pypi.org/project/nsenter/
	https://github.com/zalando/python-nsenter
"

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/zalando/python-${PN}.git"
	inherit git-r3
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
IUSE="cli"

distutils_enable_tests pytest

python_prepare_all() {
	# avoid conflicting with nsenter in sys-apps/util-linux
	if use cli; then
		sed -i -e 's/nsenter =/nsenter_py =/' setup.py || die
	else
		sed -i -e '/console_scripts/d' setup.py || die
	fi

	distutils-r1_python_prepare_all
}
