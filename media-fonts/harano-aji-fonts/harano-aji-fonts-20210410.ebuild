# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font
FONT_SUFFIX="otf"
S="${WORKDIR}/HaranoAjiFonts-${PV}"

DESCRIPTION="Harano Aji Fonts (Harano Aji Mincho and Harano Aji Gothic) are fonts obtained by replacing Adobe-Identity-0 (AI0) CIDs of Source Han fonts (Source Han Serif and Source Han Sans) with Adobe-Japan1 (AJ1) CIDs."
HOMEPAGE="https://github.com/trueroad/HaranoAjiFonts"
SRC_URI="https://github.com/trueroad/HaranoAjiFonts/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
