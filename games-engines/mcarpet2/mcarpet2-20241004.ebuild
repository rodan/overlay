# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# ---8<-------------------------------------------------------------------------
#
# NOTE !!!
#
# this is just a game engine
# you will still need to purchase the original MS-DOS game from
#
# https://www.gog.com/game/magic_carpet_2_the_netherworlds
#
# in order to use the game assets.
#
# ------------------------------------------------------------------------->8---

EAPI=8
CMAKE_MAKEFILE_GENERATOR=emake
inherit cmake flag-o-matic

IMGUI_PN="imgui"
IMGUI_PV="1.91.3"
IMGUI_P="${IMGUI_PN}-${IMGUI_PV}"

FINDFIRST_PN="findfirst"
FINDFIRST_PV="2c4733bb77cb3357c691c7a6b7a46baeed2d5fe1"
FINDFIRST_P="${FINDFIRST_PN}-${FINDFIRST_PV}"

INIH_PN="inih"
INIH_PV="r58"
INIH_P="${INIH_PN}-${INIH_PV}"

SDL2_CMAKE_MOD_PN="sdl2-cmake-modules"
SDL2_CMAKE_MOD_PV="ad006a3daae65a612ed87415037e32188b81071e"
SDL2_CMAKE_MOD_P="${SDL2_CMAKE_MOD_PN}-${SDL2_CMAKE_MOD_PV}"

MY_PN="magic_carpet_2"
#MY_PV="${PV}"
MY_PV="9ead7fff7ec10f21e59d5b9fa6f302b1158ec9eb"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="recode of Bullfrog's Magic Carpet 2 game"
HOMEPAGE="https://github.com/rodan/magic_carpet_2"
SRC_URI="https://github.com/rodan/${MY_PN}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz
	https://github.com/ocornut/${IMGUI_PN}/archive/v${IMGUI_PV}.tar.gz -> ${IMGUI_P}.tar.gz
	https://github.com/MathieuTurcotte/${FINDFIRST_PN}/archive/${FINDFIRST_PV}.tar.gz -> ${FINDFIRST_P}.tar.gz
	https://github.com/benhoyt/${INIH_PN}/archive/${INIH_PV}.tar.gz -> ${INIH_P}.tar.gz
	https://github.com/aminosbh/${SDL2_CMAKE_MOD_PN}/archive/${SDL2_CMAKE_MOD_PV}.tar.gz -> ${SDL2_CMAKE_MOD_P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug imgui"

DEPEND="media-libs/libglvnd
	media-libs/glfw
	media-libs/openal
	media-libs/libsdl2
	media-libs/sdl2-mixer
	media-libs/sdl2-image
	media-libs/sdl2-ttf
	media-libs/libpng
	dev-libs/boost
	dev-libs/spdlog
	net-misc/wget
	app-arch/tar
	app-arch/p7zip
	app-cdr/bchunk
	app-cdr/cdrdao
"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${MY_PN}-${MY_PV}" #/src"

src_unpack() {
	unpack "${MY_P}.tar.gz" || die "Unpacking ${P}.tar.gz failed"

	# all these are git submodules not included in the main repo's archive
	cd "${S}/lib" || die "Unpack incomplete"
	unpack "${IMGUI_P}.tar.gz" || die "Unpacking ${IMGUI_P}.tar.gz failed"
	unpack "${FINDFIRST_P}.tar.gz" || die "Unpacking ${FINDFIRST_P}.tar.gz failed"
	unpack "${INIH_P}.tar.gz" || die "Unpacking ${INIH_P}.tar.gz failed"
	rm -rf imgui findfirst inih
	ln -s "${IMGUI_P}" imgui
	ln -s "${FINDFIRST_P}" findfirst || die
	ln -s "${INIH_P}" inih || die

	cd "${S}/assets" || die "Unpack incomplete"
	unpack "${SDL2_CMAKE_MOD_P}.tar.gz" || die "Unpacking ${SDL2_CMAKE_MOD_P}.tar.gz failed"
	rm -rf sdl2-cmake-modules
	ln -s "${SDL2_CMAKE_MOD_P}" sdl2-cmake-modules || die
}

src_prepare() {
	default
	sed -i '/CONFIG_DEBUG/d' src/config.h || die
	sed -i '/CONFIG_IMGUI/d' src/config.h || die
	sed -i '/#endif/d' src/config.h || die
	use debug && echo '#define CONFIG_DEBUG' >> src/config.h
	use imgui && echo '#define CONFIG_IMGUI' >> src/config.h
	echo '#endif' >> src/config.h

	cmake_src_prepare
}

src_configure() {
	BUILDTYPE='Release'
	use debug && BUILDTYPE='Debug'

	local mycmakeargs=(
		-Wno-dev
		-DCMAKE_BUILD_TYPE=${BUILDTYPE}
		-DCMAKE_INSTALL_PREFIX='./'
	)

	# these are not the warnings you're looking for
	append-cxxflags -w

	cmake_src_configure
}

src_install() {
	insinto /usr/share/mcarpet2
	dodir /usr/share/mcarpet2
	newins "${S}/assets/config.ini" config.ini
	newins "${S}/assets/config_3d_pro.ini" config_3d_pro.ini
	newins "${S}/assets/config_attack_3.ini" config_attack_3.ini
	newins "${S}/assets/config_xbox.ini" config_xbox.ini
	newins "${WORKDIR}/${MY_PN}-${MY_PV}_build/src/remc2" remc2

	insinto /usr/share/mcarpet2/font
	dodir /usr/share/mcarpet2/font
	newins "${S}/assets/font/16x16-font.bmp" 16x16-font.bmp
	newins "${S}/assets/font/8x8-font.bmp" 8x8-font.bmp

	exeinto /usr/bin
	doexe "${S}/assets/scripts/mcarpet2"
	doexe "${S}/assets/scripts/mcarpet2_install.sh"

	dodoc "${S}/ChangeLog"
	dodoc "${S}/README.md"
	dodoc "${S}/README_OpenAL"
	dodoc "${S}/README_controllers"
}
