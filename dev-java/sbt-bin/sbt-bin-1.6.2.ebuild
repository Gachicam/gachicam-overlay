# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2

DESCRIPTION="sbt, a build tool for Scala"
HOMEPAGE="https://scala-sbt.org"
SRC_URI="https://github.com/sbt/sbt/releases/download/v${PV}/${PN/-bin}-${PV}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=virtual/jre-1.7
	!dev-java/sbt"

src_unpack() {
	default
	mv "${WORKDIR}/sbt" "${S}" || die
}

src_prepare() {
	default
	java-pkg_init_paths_
}

src_compile() {
	:;
}

src_install() {
	local dest="${JAVA_PKG_SHAREPATH}"

	rm -v bin/*{.bat,.exe,-darwin} || die
	sed -i -e 's#bin/sbt-launch.jar#lib/sbt-launch.jar#g;' \
		bin/sbt || die

	insinto "${dest}/lib"
	doins bin/*

	insinto "${dest}"
	doins -r conf

	fperms 0755 "${dest}/lib/sbt"
	fperms 0755 "${dest}/lib/sbtn-x86_64-pc-linux"
	dosym "${dest}/lib/sbt" /usr/bin/sbt
}
