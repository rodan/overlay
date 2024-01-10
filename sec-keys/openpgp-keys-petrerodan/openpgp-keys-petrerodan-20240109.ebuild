# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OpenPGP keys used by Petre Rodan"
HOMEPAGE="https://subdimension.ro"
SRC_URI="https://openpgpkey.subdimension.ro/.well-known/openpgpkey/subdimension.ro/hu/w6rzxnjwt1aag7tjxgi19j844woafo1j?l=petre.rodan -> ${P}.gpg"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 loong m68k mips ppc ppc64 riscv s390 sparc x86"

S=${WORKDIR}

src_install() {
	insinto /usr/share/openpgp-keys
	doins "${DISTDIR}/${P}.gpg"
}
