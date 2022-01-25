# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.0

EAPI=8

CRATES="
	aho-corasick-0.7.18
	assert_fs-1.0.7
	autocfg-1.0.1
	base64-0.13.0
	bitflags-1.3.2
	bstr-0.2.17
	buffering-0.3.4
	buffering-0.4.2
	byteorder-1.4.3
	cc-1.0.72
	cfg-if-1.0.0
	charset-0.1.3
	chrono-0.4.19
	chrono-tz-0.6.1
	chrono-tz-build-0.0.2
	clap-2.34.0
	crossbeam-channel-0.5.2
	crossbeam-utils-0.8.6
	curl-0.4.42
	curl-sys-0.4.52+curl-7.81.0
	darling-0.10.2
	darling_core-0.10.2
	darling_macro-0.10.2
	dbus-0.9.5
	dbus-tree-0.9.2
	difflib-0.4.0
	dirs-next-2.0.0
	dirs-sys-next-0.1.2
	doc-comment-0.3.3
	either-1.6.1
	encoding_rs-0.8.30
	fastrand-1.6.0
	fnv-1.0.7
	from_variants-0.6.0
	from_variants_impl-0.6.0
	gethostname-0.2.2
	getrandom-0.2.4
	globset-0.4.8
	globwalk-0.8.1
	hex-0.4.3
	ident_case-1.0.1
	ignore-0.4.18
	inotify-0.9.6
	inotify-sys-0.1.5
	instant-0.1.12
	itertools-0.10.3
	itoa-1.0.1
	lazy_static-1.4.0
	libc-0.2.112
	libdbus-sys-0.2.2
	libpulse-binding-2.26.0
	libpulse-sys-1.19.3
	libz-sys-1.1.3
	log-0.4.14
	maildir-0.5.0
	mailparse-0.13.7
	memchr-2.4.1
	memoffset-0.6.5
	neli-0.4.4
	nix-0.23.1
	nl80211-0.0.2
	notmuch-0.7.1
	num-derive-0.3.3
	num-integer-0.1.44
	num-traits-0.2.14
	once_cell-1.9.0
	openssl-probe-0.1.5
	openssl-sys-0.9.72
	parse-zoneinfo-0.3.0
	phf-0.10.1
	phf_codegen-0.10.0
	phf_generator-0.10.0
	phf_shared-0.10.0
	pkg-config-0.3.24
	ppv-lite86-0.2.16
	predicates-2.1.1
	predicates-core-1.0.3
	predicates-tree-1.0.5
	proc-macro2-1.0.36
	pure-rust-locales-0.5.6
	quote-1.0.14
	quoted_printable-0.4.5
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	redox_syscall-0.2.10
	redox_users-0.4.0
	regex-1.5.4
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	ryu-1.0.9
	same-file-1.0.6
	schannel-0.1.19
	serde-1.0.133
	serde_derive-1.0.133
	serde_json-1.0.75
	shellexpand-2.1.0
	signal-hook-0.3.13
	signal-hook-registry-1.4.0
	siphasher-0.3.9
	socket2-0.4.2
	strsim-0.9.3
	swayipc-3.0.0
	swayipc-types-1.0.0
	syn-1.0.86
	tempfile-3.3.0
	termtree-0.2.4
	textwrap-0.11.0
	thiserror-1.0.30
	thiserror-impl-1.0.30
	thread_local-1.1.3
	time-0.1.43
	toml-0.5.8
	uncased-0.9.6
	unicode-width-0.1.9
	unicode-xid-0.2.2
	vcpkg-0.2.15
	version_check-0.9.4
	walkdir-2.3.2
	wasi-0.10.2+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A feature-rich and resource-friendly replacement for i3status, written in Rust."

HOMEPAGE="https://github.com/greshake/i3status-rust/"
SRC_URI="
	https://github.com/greshake/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
