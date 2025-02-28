# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_DESIGNERPLUGIN="true"
ECM_TEST="true"
KFMIN=9999
QTMIN=6.6.0
inherit ecm plasma.kde.org

DESCRIPTION="Task management and system monitoring library"

LICENSE="LGPL-2+"
SLOT="6/9"
KEYWORDS=""
IUSE="webengine X"

# kde-frameworks/kwindowsystem[X]: Unconditional use of KX11Extras
RDEPEND="
	dev-libs/libnl:3
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,network,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kauth-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6[qml]
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kglobalaccel-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kjobwidgets-${KFMIN}:6
	>=kde-frameworks/knewstuff-${KFMIN}:6
	>=kde-frameworks/kpackage-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6[X]
	>=kde-frameworks/solid-${KFMIN}:6
	net-libs/libpcap
	sys-apps/lm-sensors:=
	sys-libs/zlib
	webengine? (
		>=dev-qt/qtwebchannel-${QTMIN}:6
		>=dev-qt/qtwebengine-${QTMIN}:6
	)
	X? (
		x11-libs/libX11
		x11-libs/libXres
	)
"
DEPEND="${RDEPEND}
	>=kde-frameworks/kiconthemes-${KFMIN}:6
	X? ( x11-base/xorg-proto )
"
BDEPEND="sys-libs/libcap"

# downstream patch
PATCHES=( "${FILESDIR}/${PN}-5.22.80-no-detailed-mem-message.patch" )

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package webengine Qt6WebChannel)
		$(cmake_use_find_package webengine Qt6WebEngineWidgets)
		-DWITH_X11=$(usex X)
	)

	ecm_src_configure
}

src_test() {
	# bugs 797898, 889942: flaky test
	local myctestargs=(
		-E "(sensortreemodeltest)"
	)
	LC_NUMERIC="C" ecm_src_test # bug 695514
}
