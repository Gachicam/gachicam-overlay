# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Easy access to gitignore boilerplates"
HOMEPAGE="https://github.com/simonwhitaker/gibo"
SRC_URI="https://github.com/simonwhitaker/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-vcs/git
	sys-apps/sed
"

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
