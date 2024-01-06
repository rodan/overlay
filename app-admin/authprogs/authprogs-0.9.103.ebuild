# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="ssh forced command authenticator"
HOMEPAGE="https://sourceforge.net/projects/authprogs/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="virtual/ssh"
DEPEND="${RDEPEND}"
RESTRICT="mirror"
#S="${WORKDIR}/${P}"

src_compile() {
	emake || die
}

src_install() {
	dobin "${WORKDIR}/${P}/src/authprogs"
}
