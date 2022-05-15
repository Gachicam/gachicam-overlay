# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..9} )
inherit distutils-r1

DESCRIPTION="a hosts file manager library written in python"
HOMEPAGE="
	https://pypi.org/project/python-hosts/
"

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/jonhadfield/${PN}.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND=""
BDEPEND="
	test? (
		dev-python/pytest
		dev-python/pytest-cov
		dev-python/pyyaml
	)
"

distutils_enable_tests pytest
