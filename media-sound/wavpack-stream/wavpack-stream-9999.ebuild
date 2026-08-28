# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 autotools

DESCRIPTION="A library for streaming audio compression, based on WavPack."
HOMEPAGE="https://github.com/dbry/wavpack-stream"
EGIT_REPO_URI="https://github.com/dbry/wavpack-stream"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"

case ${ARCH} in
x86 | amd64 | arm)
	IUSE="+asm apps"
	;;
*)
	IUSE="asm apps"
	;;
esac

src_prepare() {
	# disable man
	sed -i 's/\(SUBDIRS.*\) man/\1/' Makefile.am
	# fix pkg-config header location
	sed -i 's|\(includedir=.*\)|\1/wavpack|' wavpack-stream.pc.in
	eautoreconf
	default
}

src_configure() {
	local myeconfargs=(
		$(use_enable asm)
		$(use_enable apps)
		$(use_enable apps rpath)
		"--disable-man"
		"--disable-tests"
		"--disable-dsd"
	)
	econf "${myeconfargs[@]}"
}
