# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.106.0
QTMIN=5.15.9
inherit ecm gear.kde.org

DESCRIPTION="KDE Telepathy account management kcm"
HOMEPAGE="https://community.kde.org/KTp"

LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS=""
IUSE="experimental"

COMMON_DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	|| (
		kde-apps/kaccounts-integration:6[qt5]
		kde-apps/kaccounts-integration:5
	)
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kiconthemes-${KFMIN}:5
	>=kde-frameworks/kitemviews-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/ktextwidgets-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=net-libs/accounts-qt-1.16-r1[qt5(-)]
	>=net-libs/signond-8.61-r1[qt5(-)]
	>=net-libs/telepathy-qt-0.9.8
"
DEPEND="${COMMON_DEPEND}
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	net-libs/libaccounts-glib
"
RDEPEND="${COMMON_DEPEND}
	>=kde-apps/kaccounts-providers-23.08.3:5
	net-im/telepathy-connection-managers
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_DISABLED_PROVIDERS=$(usex experimental)
	)
	ecm_src_configure
}

pkg_postinst() {
	if use experimental; then
		ewarn "Experimental providers are enabled."
		ewarn "Most of them aren't integrated nicely and may require additional steps for account creation."
		ewarn "Use at your own risk!"
	fi
	ecm_pkg_postinst
}
