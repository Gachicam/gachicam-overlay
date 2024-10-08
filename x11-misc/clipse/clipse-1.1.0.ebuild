# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Configurable TUI clipboard manager for Unix"
HOMEPAGE="https://github.com/savedra1/clipse"

EGO_SUM=(
	"github.com/BourgeoisBear/rasterm v1.1.1"
	"github.com/BourgeoisBear/rasterm v1.1.1/go.mod"
	"github.com/atotto/clipboard v0.1.4"
	"github.com/atotto/clipboard v0.1.4/go.mod"
	"github.com/aymanbagabas/go-osc52/v2 v2.0.1"
	"github.com/aymanbagabas/go-osc52/v2 v2.0.1/go.mod"
	"github.com/charmbracelet/bubbles v0.20.0"
	"github.com/charmbracelet/bubbles v0.20.0/go.mod"
	"github.com/charmbracelet/bubbletea v1.1.1"
	"github.com/charmbracelet/bubbletea v1.1.1/go.mod"
	"github.com/charmbracelet/lipgloss v0.13.0"
	"github.com/charmbracelet/lipgloss v0.13.0/go.mod"
	"github.com/charmbracelet/x/ansi v0.2.3"
	"github.com/charmbracelet/x/ansi v0.2.3/go.mod"
	"github.com/charmbracelet/x/term v0.2.0"
	"github.com/charmbracelet/x/term v0.2.0/go.mod"
	"github.com/erikgeiser/coninput v0.0.0-20211004153227-1c3628e74d0f"
	"github.com/erikgeiser/coninput v0.0.0-20211004153227-1c3628e74d0f/go.mod"
	"github.com/kylelemons/godebug v1.1.0"
	"github.com/kylelemons/godebug v1.1.0/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.2.0"
	"github.com/lucasb-eyer/go-colorful v1.2.0/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/mattn/go-localereader v0.0.1"
	"github.com/mattn/go-localereader v0.0.1/go.mod"
	"github.com/mattn/go-runewidth v0.0.16"
	"github.com/mattn/go-runewidth v0.0.16/go.mod"
	"github.com/mitchellh/go-ps v1.0.0"
	"github.com/mitchellh/go-ps v1.0.0/go.mod"
	"github.com/muesli/ansi v0.0.0-20230316100256-276c6243b2f6"
	"github.com/muesli/ansi v0.0.0-20230316100256-276c6243b2f6/go.mod"
	"github.com/muesli/cancelreader v0.2.2"
	"github.com/muesli/cancelreader v0.2.2/go.mod"
	"github.com/muesli/termenv v0.15.2"
	"github.com/muesli/termenv v0.15.2/go.mod"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646/go.mod"
	"github.com/rivo/uniseg v0.2.0/go.mod"
	"github.com/rivo/uniseg v0.4.7"
	"github.com/rivo/uniseg v0.4.7/go.mod"
	"github.com/sahilm/fuzzy v0.1.1"
	"github.com/sahilm/fuzzy v0.1.1/go.mod"
	"github.com/soniakeys/quant v1.0.0"
	"github.com/soniakeys/quant v1.0.0/go.mod"
	"golang.org/x/sync v0.8.0"
	"golang.org/x/sync v0.8.0/go.mod"
	"golang.org/x/sys v0.0.0-20210809222454-d867a43fc93e/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.18.0/go.mod"
	"golang.org/x/sys v0.24.0"
	"golang.org/x/sys v0.24.0/go.mod"
	"golang.org/x/term v0.18.0"
	"golang.org/x/term v0.18.0/go.mod"
	"golang.org/x/text v0.3.8"
	"golang.org/x/text v0.3.8/go.mod"
)

go-module_set_globals

SRC_URI="
	https://github.com/savedra1/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"
LICENSE="MIT BSD ISC"

SLOT="0"
KEYWORDS="~amd64"
IUSE="X wayland"

RDEPEND="
		X? ( x11-misc/xclip )
		wayland? ( gui-apps/wl-clipboard )
"

DEPEND="${RDEPEND}"

src_compile() {
	ego build -o "clipse"
}

src_install() {
	# You must *personally verify* that this trick doesn't install
	# anything outside of DESTDIR; do this by reading and
	# understanding the install part of the Makefiles.
	# This is the preferred way to install.
	#emake DESTDIR="${D}" install

	# When you hit a failure with emake, do not just use make. It is
	# better to fix the Makefiles to allow proper parallelization.
	# If you fail with that, use "emake -j1", it's still better than make.

	# For Makefiles that don't make proper use of DESTDIR, setting
	# prefix is often an alternative.  However if you do this, then
	# you also need to specify mandir and infodir, since they were
	# passed to ./configure as absolute paths (overriding the prefix
	# setting).
	#emake \
	#	prefix="${D}"/usr \
	#	mandir="${D}"/usr/share/man \
	#	infodir="${D}"/usr/share/info \
	#	libdir="${D}"/usr/$(get_libdir) \
	#	install
	# Again, verify the Makefiles!  We don't want anything falling
	# outside of ${D}.
	dobin clipse
	dodoc README.md CHANGELOG.md
}
