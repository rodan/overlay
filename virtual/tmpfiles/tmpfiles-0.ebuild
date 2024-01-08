# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual to select between different tmpfiles.d handlers"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="systemd"

RDEPEND="
	!prefix-guest? (
		systemd? ( sys-apps/systemd )
		!systemd? ( sys-apps/opentmpfiles )
	)
"
