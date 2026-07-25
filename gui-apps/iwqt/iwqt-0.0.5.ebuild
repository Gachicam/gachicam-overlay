# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson

DESCRIPTION="An iwd network applet for linux systems"
HOMEPAGE="https://github.com/FinGu/iwqt"
SRC_URI="
	https://github.com/FinGu/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtbase:6
	dev-cpp/sdbus-c++
"
RDEPEND="
	net-wireless/iwd
"
