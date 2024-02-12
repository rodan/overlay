# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Soapy SDR module for SRDPlay API v3"
HOMEPAGE="https://github.com/pothosware/SoapySDRPlay3"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pothosware/SoapySDRPlay3.git"
else
	HASH_COMMIT="3566eba9873114522ca0d464fc3ff4b8f3e0ed58"
	SRC_URI="https://github.com/pothosware/SoapySDRPlay3/archive/${HASH_COMMIT}.tar.gz -> ${P}.tar.gz"
	#SRC_URI="https://github.com/pothosware/SoapySDRPlay3/archive/${P}.tar.gz"
	S="${WORKDIR}/SoapySDRPlay3-${HASH_COMMIT}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0/${PV}"

RDEPEND="net-wireless/soapysdr
>=net-wireless/sdrplay-3.14.0
"
DEPEND="${RDEPEND}"
