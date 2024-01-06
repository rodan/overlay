# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#inherit eutils libtool git-r3

DESCRIPTION="mixer software for the ampy receiver"
HOMEPAGE="https://github.com/rodan/ampy/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/rodan/ampy.git"
EGIT_BRANCH="master"
S="${WORKDIR}/${P}/linux"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND=""

src_prepare() {
	elibtoolize
}

src_install() {
	dodir "usr/bin"
	exeinto "usr/bin"
	doexe src/ampy_mixer
}
