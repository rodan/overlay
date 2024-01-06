# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

DESCRIPTION="misc scripts"
HOMEPAGE="http://"
SRC_URI="http://distfiles.simplex.ro/special/${P}.tar.bz2"
LICENSE="BSD"
SLOT="0"
KEYWORDS="x86 amd64"
DEPEND=""
RDEPEND="net-analyzer/arp-sk
	>=sys-apps/iproute2-2.6.37"
IUSE=""
RESTRICT="strip mirror"
S="${WORKDIR}/${PN}"

src_install() {

	dodir "/local/adm/bin"
	exeinto "/local/adm/bin"
	doexe bin/sshck bin/accck
	doexe bin/subscriptions_public.sh bin/fix_eth_order.sh
	doexe bin/arp-ip-takeover.sh bin/free_space.sh
	doexe bin/pack_log_functions.sh
	doexe bin/certificate_check.sh

	newinitd etc/init.d/fix_eth fix_eth
	newinitd etc/init.d/lvm-noudev lvm-noudev
	doenvd etc/env.d/50internal-scripts

	dodir "/etc"
	insinto "/etc"
	doins etc/accck.conf

	dodir "/var/lib/stunnel"
	dodir "/var/lib/stunnel/certs"

	exeinto "/var/lib/stunnel"
	doexe bin/getcerts.sh bin/rehash.sh

}
