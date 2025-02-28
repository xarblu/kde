# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PVCUT=$(ver_cut 1-3)
KFMIN=5.106.0
QTMIN=5.15.9
inherit ecm gear.kde.org

DESCRIPTION="KDE Telepathy authentication handler"
HOMEPAGE="https://community.kde.org/KTp"

LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=app-crypt/qca-2.3.7:2[qt5(-)]
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	|| (
		kde-apps/kaccounts-integration:6[qt5]
		kde-apps/kaccounts-integration:5
	)
	>=kde-apps/ktp-common-internals-${PVCUT}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kwallet-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=net-libs/accounts-qt-1.16-r1[qt5(-)]
	>=net-libs/signond-8.61-r1[qt5(-)]
	>=net-libs/telepathy-qt-0.9.8
"
RDEPEND="${DEPEND}
	>=app-crypt/qca-2.3.0:2[ssl]
"
