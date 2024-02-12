# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker udev systemd

MY_PV_1=$(ver_cut 1)
MY_PV_12=$(ver_cut 1-2)

DESCRIPTION="SDRplay API/HW driver for all RSPs"
HOMEPAGE="https://www.sdrplay.com"
SRC_URI="http://www.sdrplay.com/software/SDRplay_RSP_API-Linux-${PV}.run"

LICENSE="SDRplay"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="systemd"

DEPEND="virtual/libusb:1
	virtual/udev
	systemd? ( sys-apps/systemd )"

RDEPEND="${DEPEND}"

S="${WORKDIR}"

QA_PREBUILT="usr/lib64/libsdrplay_api.so.${MY_PV_12}
usr/lib/libsdrplay_api.so.${MY_PV_12}
usr/bin/sdrplay_apiService"

pkg_pretend() {
	# Protect against people using autounmask overzealously
	if !( use amd64 || use arm64 ); then
		die "this binary package only works on amd64 and arm64"
	fi
}

src_install() {
	doheader -r inc/*.h

	insinto /etc/udev/hwdb.d
	doins "${FILESDIR}/20-sdrplay.hwdb"

	udev_dorules "${FILESDIR}/66-sdrplay.rules"
	udev_reload

	if use systemd; then
		systemd_newunit "${FILESDIR}/sdrplay.service" sdrplay.service
	fi

	newinitd "${FILESDIR}/${PN}.initd" ${PN}

	if use amd64 ; then
		dolib.so "${S}/x86_64/libsdrplay_api.so.${MY_PV_12}"
		dobin "${S}/x86_64/sdrplay_apiService"
	elif use arm64 ; then
		dolib.so "${S}/aarch64/libsdrplay_api.so.${MY_PV_12}"
		dobin "${S}/aarch64/sdrplay_apiService"
	fi

	dosym libsdrplay_api.so.${MY_PV_12} "/usr/$(get_libdir)/libsdrplay_api.so.${MY_PV_1}"
	dosym libsdrplay_api.so.${MY_PV_1} "/usr/$(get_libdir)/libsdrplay_api.so"
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
