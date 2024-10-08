# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

IMGUI_PN="imgui"
IMGUI_PV="1.91.3-docking"
IMGUI_P="${IMGUI_PN}-${IMGUI_PV}"

IMPLOT_PN="implot"
IMPLOT_PV="f156599faefe316f7dd20fe6c783bf87c8bb6fd9"
IMPLOT_P="${IMPLOT_PN}-${IMPLOT_PV}"

LODEPNG_PN="lodepng"
LODEPNG_COMMIT="ed3c5f14b136c936d615ee3b38aaa7e7e642f12c"
LODEPNG_P="${LODEPNG_PN}-${LODEPNG_COMMIT}"

TINYTIFF_PN="TinyTIFF"
TINYTIFF_PV="4.0.1.0"
TINYTIFF_P="${TINYTIFF_PN}-${TINYTIFF_PV}"

MY_PV="${PV}"
#MY_PV="af08c89043604f5e496ce355e1ad05dbf6a8f038"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Thermal Processing Panel - a viewer and analyzer of infrared images"
HOMEPAGE="https://github.com/rodan/thpp"
SRC_URI="https://github.com/rodan/${PN}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz
	https://github.com/ocornut/${IMGUI_PN}/archive/v${IMGUI_PV}.tar.gz -> ${IMGUI_P}.tar.gz
	https://github.com/epezent/${IMPLOT_PN}/archive/${IMPLOT_PV}.tar.gz -> ${IMPLOT_P}.tar.gz
	https://github.com/jkriege2/${TINYTIFF_PN}/archive/${TINYTIFF_PV}.tar.gz -> ${TINYTIFF_P}.tar.gz
	https://github.com/lvandeve/${LODEPNG_PN}/archive/${LODEPNG_COMMIT}.tar.gz -> ${LODEPNG_P}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="media-libs/libglvnd
	media-libs/glfw
	sys-devel/gcc:*[openmp]"
RDEPEND="${DEPEND}
	media-libs/exiftool"
S=${WORKDIR}/${MY_P}/src

src_unpack() {
	unpack ${MY_P}.tar.gz || die "Unpacking ${P}.tar.gz failed"
	cd "${S}/../lib" || die "Unpack incomplete"
	unpack ${IMGUI_P}.tar.gz || die "Unpacking ${IMGUI_P}.tar.gz failed"
	unpack ${IMPLOT_P}.tar.gz || die "Unpacking ${IMPLOT_P}.tar.gz failed"
	unpack ${TINYTIFF_P}.tar.gz || die "Unpacking ${TINYTIFF_P}.tar.gz failed"
	unpack ${LODEPNG_P}.tar.gz || die "Unpacking ${LODEPNG_P}.tar.gz failed"
	rm -rf imgui TinyTIFF implot lodepng
	ln -s "${IMGUI_P}" imgui
	ln -s "${TINYTIFF_P}" TinyTIFF
	ln -s "${IMPLOT_PN}-${IMPLOT_PV}" implot
	ln -s "${LODEPNG_P}" lodepng
}

src_prepare() {
	default
	sed -i '/CONFIG_DEBUG/d' config.h || die
	use debug && echo '#define CONFIG_DEBUG' >> config.h
}

src_install() {
	insinto /usr/share/thpp
	dodir /usr/share/thpp
	newins res/dir_icon.png dir_icon.png
	newins res/file_icon.png file_icon.png
	newins res/imgui.ini imgui.ini

	exeinto /usr/bin/
	doexe "${S}/${PN}"
}
