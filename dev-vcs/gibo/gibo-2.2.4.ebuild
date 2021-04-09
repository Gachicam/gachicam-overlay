# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="fast access to .gitignore boilerplates"
HOMEPAGE="https://github.com/simonwhitaker/gibo"
SRC_URI="https://github.com/simonwhitaker/gibo/archive/refs/tags/2.2.4.tar.gz"


LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-vcs/git
	sys-apps/sed
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin gibo

	# Fish Completion
	insinto /usr/share/fish/vendor_completions.d
	doins shell-completions/gibo.fish

	# Bash Completion
	insinto /usr/share/bash-completion/completions
	doins shell-completions/gibo-completion.bash

	# Zsh Completion
	insinto /usr/share/zsh/site-functions
	doins shell-completions/gibo-completion.zsh
}
