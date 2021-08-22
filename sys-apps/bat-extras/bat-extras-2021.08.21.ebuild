# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

# https://github.com/eth-p/bat-extras/releases/tag/v2021.08.21

DESCRIPTION="Bash scripts that integrate bat with various command line tools."
HOMEPAGE="https://github.com/eth-p/bat-extras"
SRC_URI="https://github.com/eth-p/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+batgrep +batman +batpipe +batwatch +batdiff +prettybat"

DEPEND=""
RDEPEND="${DEPEND}
	sys-apps/bat
	batman ? ( sys-apps/ripgrep )
"

BDEPEND=""

src_compile() {
	${S}/build.sh
}

src_install() {
	if use batgrep ; then
		dobin bin/batgrep
		dodoc doc/batgrep.md
		doman man/batgrep.1
	fi

	if use batman ; then
		dobin bin/batman
		dodoc doc/batman.md
		doman man/batman.1
	fi

	if use batpipe ; then
		dobin bin/batpipe
		dodoc doc/batpipe.md
		doman man/batpipe.1
	fi

	if use batwatch ; then
		dobin bin/batwatch
		dodoc doc/batwatch.md
		doman man/batwatch.1
	fi

	if use batdiff ; then
		dobin bin/batdiff
		dodoc doc/batdiff.md
		doman man/batdiff.1
	fi

	if use prettybat ; then
		dobin bin/prettybat
		dodoc doc/prettybat.md
		doman man/prettybat.1
	fi
}

pkg_postinst() {
	optfeature "search through man pages" app-shells/fzf
	optfeature "entr based batwatch" app-admin/entr
	optfeature "git-delta based batdiff" sys-apps/git-delta
	optfeature_header "Install additional packages for formatting with prettybat:"
	optfeature "JS(X)/TS(X), CSS/SASS/SCSS, Markdown, JSON, YAML, HTML, SVG (by installing prettier via \`npm install -g prettier\`)" "net-libs/nodejs[npm]"
	optfeature "rust" "dev-lang/rust[rustfmt]"
	optfeature "bash (available at overlay \`go-overlay\`)" "dev-util/shfmt"
	optfeature "C/C++, Objective-C" "sys-devel/clang"
	optfeature "Python" "dev-python/black"
}
