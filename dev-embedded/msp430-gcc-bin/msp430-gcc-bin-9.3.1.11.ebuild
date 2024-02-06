# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GCC_VER=${PV}
GCC_MAJ_VER=$(ver_cut 1-3)
SUPPORT_VER='1.212'
SILLY_URL_VER='9.3.1.2'

DESCRIPTION="open source toolchain for MSP430 microcontrollers"
HOMEPAGE="https://www.ti.com/tool/MSP430-GCC-OPENSOURCE"
SRC_URI="https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-LlCjWuAbzH/${SILLY_URL_VER}/msp430-gcc-${GCC_VER}_linux64.tar.bz2
https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-LlCjWuAbzH/${SILLY_URL_VER}/msp430-gcc-support-files-${SUPPORT_VER}.zip
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="bindist mirror strip"

BDEPEND="app-arch/unzip"
S="${WORKDIR}"

QA_PREBUILT="*"

keep_perms="
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-addr2line
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-ar
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-as
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-c++filt
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-cpp
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-elfedit
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-g++
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-c++
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gcc-${GCC_MAJ_VER}
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gcc-ar
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gcc
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gcc-nm
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gcc-ranlib
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gcov
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gcov-dump
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gcov-tool
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gdb
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gdb-add-index
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gdb-py
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-gprof
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-ld.bfd
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-ld
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-nm
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-objcopy
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-objdump
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-ranlib
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-readelf
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-run
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-size
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-strings
opt/msp430-gcc-${GCC_VER}_linux64/bin/msp430-elf-strip
opt/msp430-gcc-${GCC_VER}_linux64/lib/gcc/msp430-elf/${GCC_MAJ_VER}/plugin/libcc1plugin.la
opt/msp430-gcc-${GCC_VER}_linux64/lib/gcc/msp430-elf/${GCC_MAJ_VER}/plugin/libcc1plugin.so.0.0.0
opt/msp430-gcc-${GCC_VER}_linux64/lib/gcc/msp430-elf/${GCC_MAJ_VER}/plugin/libcp1plugin.la
opt/msp430-gcc-${GCC_VER}_linux64/lib/gcc/msp430-elf/${GCC_MAJ_VER}/plugin/libcp1plugin.so.0.0.0
opt/msp430-gcc-${GCC_VER}_linux64/lib64/libcc1.la
opt/msp430-gcc-${GCC_VER}_linux64/lib64/libcc1.so.0.0.0
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/install-tools/fixinc.sh
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/install-tools/fixincl
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/install-tools/mkheaders
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/install-tools/mkinstalldirs
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/plugin/gengtype
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/cc1
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/cc1plus
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/collect2
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/liblto_plugin.la
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/liblto_plugin.so.0.0.0
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/lto-wrapper
opt/msp430-gcc-${GCC_VER}_linux64/libexec/gcc/msp430-elf/${GCC_MAJ_VER}/lto1
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/ar
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/as
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/ld
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/ld.bfd
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/nm
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/objcopy
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/objdump
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/ranlib
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/readelf
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/bin/strip
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/430/exceptions/libssp.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/430/exceptions/libssp_nonshared.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/430/exceptions/libstdc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/430/exceptions/libsupc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/430/libssp.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/430/libssp_nonshared.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/430/libstdc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/430/libsupc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/exceptions/libssp.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/exceptions/libssp_nonshared.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/exceptions/libstdc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/exceptions/libsupc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/exceptions/libssp.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/exceptions/libssp_nonshared.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/exceptions/libstdc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/exceptions/libsupc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/full-memory-range/exceptions/libssp.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/full-memory-range/exceptions/libssp_nonshared.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/full-memory-range/exceptions/libstdc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/full-memory-range/exceptions/libsupc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/full-memory-range/libssp.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/full-memory-range/libssp_nonshared.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/full-memory-range/libstdc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/full-memory-range/libsupc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/libssp.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/libssp_nonshared.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/libstdc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/large/libsupc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/libssp.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/libssp_nonshared.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/libstdc++.la
opt/msp430-gcc-${GCC_VER}_linux64/msp430-elf/lib/libsupc++.la
"

pkg_pretend() {
	# Protect against people using autounmask overzealously
	use amd64 || die "this binary package only works on amd64"
}

src_install() {

	insinto "/opt/msp430-gcc-${GCC_VER}_linux64"
	doins -r "msp430-gcc-${GCC_VER}_linux64"/*

	insinto "/opt/msp430-gcc-${GCC_VER}_linux64/include"
	doins -r msp430-gcc-support-files/include/*
	doins -r msp430-gcc-support-files/Revisions_Header.txt

	for f in ${keep_perms}; do
		fperms +x "/${f}"
	done

	ln -s msp430-gcc-${GCC_VER}_linux64 "${D}/opt/msp430"
}
