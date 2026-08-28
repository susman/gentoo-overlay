# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ZIG_SLOT="0.16"

# LLVM codegen is only required on targets other than amd64.
if [[ ${ARCH} != amd64 ]]; then
	ZIG_NEEDS_LLVM=1
fi

declare -r -A ZBS_DEPENDENCIES=(
	[sctp_wps-1.0.0-KctmCCAkfQBAGP8ceLcr_mI_bOBVOpcgM-lGX4445koi.tar.gz]='https://github.com/susman/sctp-wps/releases/download/v1.0.0/sctp-wps-v1.0.0.tar.gz'
)

inherit multilib zig

DESCRIPTION="Remote DAC PipeWire module"
HOMEPAGE="https://github.com/susman/rdac-pw"

SRC_URI="
	https://github.com/susman/rdac-pw/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${ZBS_DEPENDENCIES_SRC_URI}
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND+="
	virtual/pkgconfig
	media-sound/wavpack-stream
	media-video/pipewire
	net-dns/avahi
"
RDEPEND="
	media-sound/wavpack-stream
	media-video/pipewire
	net-dns/avahi
"

src_configure() {
	local my_zbs_args=( --release=fast )
	zig_src_configure
}

src_install() {
	insinto /usr/$(get_libdir)/pipewire-0.3
	newins "${BUILD_DIR}"/usr/lib/pipewire-0.3/libpipewire-module-rdac.so libpipewire-module-rdac.so
	einstalldocs
}
