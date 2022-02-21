# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )

DESCRIPTION="copy to translate"
HOMEPAGE="https://github.com/tanakaht/easyautotrans"

inherit distutils-r1

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tanakaht/easyautotrans.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/tanakaht/easyautotrans/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE=""
SLOT="0"
