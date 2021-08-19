# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )

DESCRIPTION="copy to translate"
HOMEPAGE="https://github.com/tanakaht/easyautotrans"

inherit distutils-r1 git-r3
EGIT_REPO_URI="https://github.com/tanakaht/easyautotrans.git"
KEYWORDS="~amd64"

LICENSE=""
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
