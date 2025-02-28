# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
ECM_TEST="forceoptional"
PVCUT=$(ver_cut 1-3)
KFMIN=5.106.0
QTMIN=5.15.9
inherit ecm gear.kde.org

DESCRIPTION="Library for interacting with IMAP servers"
HOMEPAGE="https://api.kde.org/kdepim/kimap/html/index.html"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-libs/cyrus-sasl
	>=dev-qt/qtgui-${QTMIN}:5
	>=kde-apps/kmime-${PVCUT}:5
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
"
# TODO: Convince upstream not to install stuff with tests
DEPEND="${RDEPEND}
	test? ( >=dev-qt/qtnetwork-${QTMIN}:5 )
"

src_test() {
	# tests cannot be run in parallel #605586
	local myctestargs=(
		-j1
	)
	ecm_src_test
}
