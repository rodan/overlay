# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="atlas430"
#MY_PV="${PV}"
MY_PV="75c7b752fcc2d467efc3936b0d7ff97b2c62dc48"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="library of HAL functions for MSP430 microcontrollers"
HOMEPAGE="https://github.com/rodan/atlas430"
SRC_URI="https://github.com/rodan/${MY_PN}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

RESTRICT="strip"
S="${WORKDIR}/${MY_PN}-${MY_PV}"

keep_perms="
opt/atlas430/lib/libmsp430-3.15.01.001.so
"

src_compile() {
	:
}

src_install() {
	insinto "/opt/atlas430"
	doins -r *

	for f in ${keep_perms}; do
		fperms +x "/${f}"
	done
}
