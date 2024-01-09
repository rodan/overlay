# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib-build

DESCRIPTION="Virtual for libudev providers"

SLOT="0/1"
KEYWORDS="amd64 arm arm64 x86"
IUSE="eudev +sticky-tags systemd"
REQUIRED_USE="
	?? ( eudev systemd )
	eudev? ( !sticky-tags )
"

# eudev does not provide v251 APIs, see
# https://github.com/eudev-project/eudev/issues/249
RDEPEND="
	!systemd? (
		eudev? ( sys-fs/eudev[${MULTILIB_USEDEP}] )
	)
	systemd? ( >=sys-apps/systemd-251:0/2[${MULTILIB_USEDEP}] )
"
