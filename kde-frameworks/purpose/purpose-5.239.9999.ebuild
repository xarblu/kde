# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="false"
ECM_TEST="forceoptional"
PVCUT=$(ver_cut 1-2)
QTMIN=5.15.9
inherit ecm frameworks.kde.org optfeature xdg-utils

DESCRIPTION="Library for providing abstractions to get the developer's purposes fulfilled"
LICENSE="LGPL-2.1+"
KEYWORDS=""
IUSE="bluetooth +kaccounts kf6compat"

# requires running environment
RESTRICT="test"

DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	=kde-frameworks/kconfig-${PVCUT}*:5
	=kde-frameworks/kcoreaddons-${PVCUT}*:5
	=kde-frameworks/ki18n-${PVCUT}*:5
	=kde-frameworks/kio-${PVCUT}*:5
	=kde-frameworks/kirigami-${PVCUT}*:5
	=kde-frameworks/knotifications-${PVCUT}*:5
	=kde-frameworks/kservice-${PVCUT}*:5
	=kde-frameworks/prison-${PVCUT}*:5
	kaccounts? (
		|| (
			kde-apps/kaccounts-integration:6[qt5]
			kde-apps/kaccounts-integration:5
		)
		>=net-libs/accounts-qt-1.16-r1[qt5(-)]
	)
"
RDEPEND="${DEPEND}
	kf6compat? ( kde-frameworks/purpose:6 )
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kdeclarative-${PVCUT}:5
	bluetooth? ( =kde-frameworks/bluez-qt-${PVCUT}*:5 )
	kaccounts? ( >=net-libs/accounts-qml-0.7-r3[qt5(-)] )
"

src_prepare() {
	ecm_src_prepare

	use bluetooth ||
		cmake_run_in src/plugins cmake_comment_add_subdirectory bluetooth
}

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package kaccounts KAccounts)
	)

	ecm_src_configure
}

src_install() {
	ecm_src_install

	if use kf6compat; then
		rm "${D}"/usr/share/icons/hicolor/128x128/apps/{reviewboard,phabricator}-purpose.png \
			"${D}"/usr/share/icons/hicolor/16x16/apps/{reviewboard,phabricator}-purpose.png \
			|| die
	fi
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		optfeature "Send through KDE Connect" kde-misc/kdeconnect
	fi
	ecm_pkg_postinst
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
