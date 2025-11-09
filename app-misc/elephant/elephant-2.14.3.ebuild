# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="a powerful data provider service and backend for building custom application launchers and desktop utilities"
HOMEPAGE="https://github.com/abenz1267/elephant"
SRC_URI="
	https://github.com/abenz1267/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/xecua/distfiles/releases/download/${P}/${P}-vendor.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="archlinuxpkgs +bluetooth +bookmarks +calc +clipboard +desktopapplications +files +menus +nirisessions +providerlist +runner +snippets +symbols +todo +unicode +websearch +windows"

PROVIDERS=(
	"archlinuxpkgs" "bluetooth" "bookmarks" "calc" "clipboard" "desktopapplications"
	"files" "menus" "nirisessions" "providerlist" "runner" "snippets" "symbols" "todo" "unicode" "websearch" "windows"
)

src_compile() {
	cd "${S}"/cmd/elephant
	ego build elephant.go

	for feature in "${PROVIDERS[@]}"; do
		if use "${feature}"; then
			cd "${S}/internal/providers/${feature}"
			ego build -buildmode=plugin
		fi
	done
}

src_install() {
	dobin cmd/elephant/elephant

	insinto /etc/xdg/elephant
	for feature in "${PROVIDERS[@]}"; do
		if use "${feature}"; then
			cd "${S}/internal/providers/${feature}"
			doins "${feature}.so"
		fi
	done
}
