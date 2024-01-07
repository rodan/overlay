# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="ssh forced command authenticator"
HOMEPAGE="https://github.com/11001100/authprogs"

SRC_URI="https://github.com/11001100/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 arm arm64 x86"

LICENSE="BSD"
SLOT="0"

RDEPEND="virtual/ssh"
DEPEND="${RDEPEND}"
RESTRICT="mirror"

src_compile() {
	emake || die
}

src_install() {
	dobin "${S}/src/authprogs"
}
