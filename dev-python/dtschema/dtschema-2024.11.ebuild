# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="tools and schema data for Devicetree schema validation"
HOMEPAGE="
	https://github.com/devicetree-org/dt-schema
	https://pypi.org/project/dtschema
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc"

RDEPEND="
	dev-python/ruamel-yaml
	sys-apps/dtc[python]
"

python_install_all() {
	use doc && local HTML_DOCS=( docs/. )
	distutils-r1_python_install_all
}
