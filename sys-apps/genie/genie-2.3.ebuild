# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )
inherit python-single-r1

DESCRIPTION="A quick way into a systemd \"bottle\" for WSL"
HOMEPAGE="https://github.com/arkane-systems/genie"

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/arkane-systems/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/arkane-systems/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Unlicense"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	sys-apps/gawk
	sys-apps/dbus
	sys-apps/daemonize
	sys-apps/systemd
	dev-python/psutil
	>dev-python/nsenter-0.2
	dev-python/python-hosts
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	# make build-binaries
	# make build-binaries: make -C binsrc
	cd binsrc

	# binsrc: make build
	mkdir -p out
	# make build-wrapper (make -C genie-wrapper)
	emake -C genie-wrapper
	# make build-runinwsl (make -C build-runinwsl)
	"${EPYTHON}" -m zipapp -o out/runinwsl -c runinwsl
	# make build-genie (make -C build-genie)
	# python3 -m pip install genie/reuqirements.txt --target genie --upgrade
	"${EPYTHON}" -m zipapp -o out/genie -c genie
}

src_install() {
	# make internal-package
	insopts -m6755
	dobin binsrc/genie-wrapper/genie

	insinto /usr/lib/genie
	insopts -m755
	newins binsrc/out/genie genie
	newins binsrc/out/runinwsl runinwsl
	newins othersrc/scripts/80-genie-envar.sh 80-genie-envar.sh
	newins othersrc/scripts/map-user-runtime-dir.sh map-user-runtime-dir.sh
	newins othersrc/scripts/unmap-user-runtime-dir.sh unmap-user-runtime-dir.sh

	insinto /etc
	insopts -m644
	newins othersrc/etc/genie.ini genie.ini

	insinto /usr/lib/systemd/system
	newins othersrc/lib-systemd-system/wslg-xwayland.service wslg-xwayland.service
	newins othersrc/lib-systemd-system/wslg-xwayland.socket wslg-xwayland.socket

	insinto /usr/lib/systemd/system/user-runtime-dir@.service.d
	newins othersrc/lib-systemd-system/user-runtime-dir@.service.d/override.conf override.conf

	insinto /usr/lib/binfmt.d
	newins othersrc/usr-lib/binfmt.d/WSLInterop.conf WSLInterop.conf

	# make internal-supplement
	dosym ../../genie/genie/80-genie-envar.sh /usr/lib/systemd/system-environment-generators/80-genie-envar.sh
	dosym ../../genie/80-genie-envar.sh /usr/lib/systemd/user-environment-generators/80-genie-envar.sh
	dosym ../wslg-xwayland.socket /usr/lib/systemd/system/sockets.target.wants/wslg-xwayland.socket

	doman othersrc/docs/genie.8
}
