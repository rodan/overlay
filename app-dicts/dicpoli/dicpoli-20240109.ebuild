# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="dictionar_poliglot_de_aeronautica"
MY_PV="${PV}"
#MY_PV="a928d0709a0265a2a8a33e8c82028996a879196b"
MY_P="${PN}-${MY_PV}"

LANGUAGES="de en es fr it ro"

DESCRIPTION="multilingual aeronautical dictionary"
HOMEPAGE="https://github.com/rodan/dictionar_poliglot_de_aeronautica"
SRC_URI="https://github.com/rodan/${MY_PN}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="l10n_de l10n_en l10n_es l10n_fr l10n_it l10n_ro dict stardict"

DEPEND="dev-db/sqlite
dict? ( app-text/dictd )
"
RDEPEND="${DEPEND}"
REQUIRED_USE=" ( || ( dict stardict ) )
( || ( l10n_de l10n_en l10n_es l10n_fr l10n_it l10n_ro ) )
"
S="${WORKDIR}/${MY_PN}-${MY_PV}/src"

src_compile() {
	for lang in ${LANGUAGES}; do
		use "l10n_${lang}" && LANG_LIST+=" ${lang}"
	done

	emake

	export DO_NOT_ZIP='true'

	mkdir -p release || die
	cd release || die
	. ../../assets/scripts/export_functions.sh || die
	use dict && {
		do_dict ${LANG_LIST} || die
		rm -f dict/*.txt
	}
	use stardict && {
		do_stardict ${LANG_LIST} || die
	}
}

src_install() {
	for lang in ${LANGUAGES}; do
		use "l10n_${lang}" && LANG_LIST+=" ${lang}"
	done

	use dict && {
		insinto "/usr/share/dict"
		dodir "/usr/share/dict"
		find release/dict/ -type f | while read file; do
			doins "${file}"
		done
	}

	use stardict && {
		insinto "/usr/share/stardict/dic/${MY_PN}"
		dodir "/usr/share/stardict/dic/${MY_PN}"
		find release/stardict/ -type f | while read file; do
			doins "${file}"
		done
	}
}
