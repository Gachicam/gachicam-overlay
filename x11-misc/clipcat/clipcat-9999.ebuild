# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="clipcat is a clipboard manager written in Rust Programming Language."
HOMEPAGE="https://github.com/xrelkd/clipcat"

if [[ ${PV} != *9999* ]]; then
	# Cannot resolve x11-clipboard...
	CRATES=""

	SRC_URI="
		https://github.com/xrelkd/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris)
	"
	KEYWORDS="~amd64 ~x86"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/xrelkd/${PN}"
	KEYWORDS=""
fi

inherit cargo

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-vcs/git
	virtual/rust[rustfmt]
	virtual/pkgconfig
	dev-libs/protobuf
	sys-devel/clang
	x11-libs/libxcb
"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure --features=all
}

src_install() {
	cargo_src_install

	insinto /usr/share/bash-completion/completions
	doins completions/bash-completion/completions/*

	insinto /usr/share/zsh/site-functions
	doins completions/zsh/site-functions/*

	insinto /usr/share/fish/completions
	doins completions/fish/completions/*
}
