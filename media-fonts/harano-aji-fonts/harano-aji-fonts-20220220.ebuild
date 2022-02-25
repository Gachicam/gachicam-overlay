# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font
FONT_SUFFIX="otf"
S="${WORKDIR}/HaranoAjiFonts-${PV}"

DESCRIPTION="Harano Aji Fonts"
HOMEPAGE="https://github.com/trueroad/HaranoAjiFonts"
SRC_URI="https://github.com/trueroad/HaranoAjiFonts/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
