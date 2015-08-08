# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

KDE_HANDBOOK="true"
KDE_TEST="true"
PYTHON_COMPAT=( python2_7 )
# FIXME: PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} )
inherit kde5 python-r1

DESCRIPTION="Interface for doing mathematics and scientific computing"
HOMEPAGE="http://www.kde.org/applications/education/cantor http://edu.kde.org/cantor"
KEYWORDS=""
IUSE="analitza lua postscript python qalculate +R"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

# TODO Add Sage Mathematics Software backend (http://www.sagemath.org)
# FIXME: $(python_gen_cond_dep 'dev-qt/qtdbus:5' 'python3*')
RDEPEND="
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kpty)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	dev-qt/qtgui:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	dev-qt/qtxmlpatterns:5
	analitza? ( $(add_kdeapps_dep analitza) )
	lua? ( dev-lang/luajit:2 )
	qalculate? (
		sci-libs/cln
		sci-libs/libqalculate
	)
	postscript? ( app-text/libspectre )
	python? ( ${PYTHON_DEPS} )
	R? ( dev-lang/R )
"
DEPEND="${RDEPEND}
	>=dev-cpp/eigen-2.0.3:2
"

RESTRICT="test"

pkg_setup() {
	use python && python_setup
	kde5_pkg_setup
}

src_prepare() {
	# FIXME: shipped FindPythonLibs3.cmake does not work for Gentoo
	sed -e '/^find_package(PythonLibs3)/ s/^/#/' \
		-i src/backends/CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package analitza Analitza5)
		$(cmake-utils_use_find_package lua LuaJIT)
		$(cmake-utils_use_find_package postscript LibSpectre)
		$(cmake-utils_use_find_package python PythonLibs)
		$(cmake-utils_use_find_package qalculate)
		$(cmake-utils_use_find_package R)
	)
	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst

	if ! use analitza && ! use lua && ! use python && ! use qalculate && ! use R; then
		echo
		ewarn "You have decided to build ${PN} with no backend."
		ewarn "To have this application functional, please do one of below:"
		ewarn "    # emerge -va1 '='${CATEGORY}/${P} with 'analitza', 'lua', 'python', 'qalculate' or 'R' USE flag enabled"
		ewarn "    # emerge -vaDu sci-mathematics/maxima"
		echo
	fi
}
