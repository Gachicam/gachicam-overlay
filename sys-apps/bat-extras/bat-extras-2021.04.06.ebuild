# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit optfeature

DESCRIPTION="Bash scripts that integrate bat with various command line tools."
HOMEPAGE="https://github.com/eth-p/bat-extras"
SRC_URI="https://github.com/eth-p/bat-extras/archive/refs/tags/v2021.04.06.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	sys-apps/bat
	sys-apps/ripgrep
"

BDEPEND=""


src_compile() {
	${S}/build.sh
}

src_install() {
	dobin bin/*
	doman man/*
}

pkg_postinst() {
	optfeature "entr based batwatch" app-admin/entr
	optfeature "git-delta based batdiff" sys-apps/git-delta
	optfeature_header "Install additional packages for formatting with prettybat:"
	optfeature "JS(X)/TS(X), CSS/SASS/SCSS, Markdown, JSON, YAML, HTML, SVG (by installing prettier via \`npm install -g prettier\`)" "net-libs/nodejs[npm]"
	optfeature "rust" "dev-lang/rust[rustfmt]"
	optfeature "bash (available at overlay \`go-overlay\`)" "dev-util/shfmt"
	optfeature "C/C++, Objective-C" "sys-devel/clang"
	optfeature "Python" "dev-python/black"
}
