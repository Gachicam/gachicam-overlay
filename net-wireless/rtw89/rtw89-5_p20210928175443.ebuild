# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

GIT_REVISION="2758909e06d39bc5ec5781ea2faee7b9753b309d"

DESCRIPTION="Driver for Realtek 8852AE, an 802.11ax device"
HOMEPAGE="https://github.com/lwfinger/rtw89"
SRC_URI="https://github.com/lwfinger/rtw89/archive/${GIT_REVISION}.tar.gz"
S="${WORKDIR}/${PN}-${GIT_REVISION}"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
