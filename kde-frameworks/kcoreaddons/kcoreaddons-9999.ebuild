# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.6.0
inherit ecm frameworks.kde.org xdg-utils

DESCRIPTION="Framework for solving common problems such as caching, randomisation, and more"

LICENSE="LGPL-2+"
KEYWORDS=""
IUSE="dbus"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[dbus?,icu]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	virtual/libudev:=
"
RDEPEND="${DEPEND}
	>=dev-qt/qttranslations-${QTMIN}:6
"
BDEPEND=">=dev-qt/qttools-${QTMIN}:6[linguist]"

src_configure() {
	local mycmakeargs=(
		-DKCOREADDONS_USE_QML=ON
		$(cmake_use_find_package dbus Qt6DBus)
	)

	ecm_src_configure
}

src_test() {
	local CMAKE_SKIP_TESTS=(
		# bug 632398
		kautosavefiletest
		# bug 647414
		kdirwatch_qfswatch_unittest
		kdirwatch_stat_unittest
		# bugs 665682
		kformattest
	)
	# bug 619656
	ecm_src_test -j1
}

pkg_postinst() {
	ecm_pkg_postinst
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	ecm_pkg_postrm
	xdg_mimeinfo_database_update
}
