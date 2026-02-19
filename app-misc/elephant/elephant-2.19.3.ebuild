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

IUSE="+1password archlinuxpkgs +bitwarden +bluetooth +bookmarks +calc +clipboard +desktopapplications dnfpackages +files +menus +niriactions +nirisessions +providerlist +runner +snippets +symbols +todo +unicode +websearch +windows"

PROVIDERS=(
	"1password" "archlinuxpkgs" "bitwarden" "bluetooth" "bookmarks"
	"calc" "clipboard" "desktopapplications" "dnfpackages"
	"files" "menus" "niriactions" "nirisessions" "providerlist"
	"runner" "snippets" "symbols" "todo" "unicode" "websearch" "windows"
)

# Some providers require additional dependencies not provided by gentoo main repository.
# 1password requires 1password(gui-apps/1password::guru) and op(app-misc/1password-cli::guru)
# archlinuxpkgs requires yay or paru
# bitwarden additionally requires wtype(gui-apps/wtype::guru)
# bookmarks requires jq(for chrome) and sqlite3(for firefox), but those are optional so we don't add them here.
# dnfpackages requires dnf(sys-apps/dnf5::guru)
# niriactions and nirisessions require niri(gui-wm/niri::guru)
# snippets requires wtype(gui-apps/wtype::guru)
RDEPEND="
	bitwarden? (
		app-admin/rbw
		gui-apps/wl-clipboard
	)
	bluetooth? (net-wireless/bluez)
	calc? (
		sci-libs/libqalculate
		gui-apps/wl-clipboard
	)
	clipboard ? (
		gui-apps/wl-clipboard
		media-gfx/imagemagick
	)
	files? (sys-apps/fd)
	symbols? (gui-apps/wl-clipboard)
	unicode? (gui-apps/wl-clipboard)
"

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
