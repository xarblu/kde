# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="kdecore - merge this to pull in the most basic applications"
HOMEPAGE="https://apps.kde.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS=""
IUSE="+handbook +share +thumbnail +webengine"

RDEPEND="
	>=kde-apps/dolphin-${PV}:${SLOT}
	>=kde-apps/kdialog-${PV}:${SLOT}
	>=kde-apps/keditbookmarks-${PV}:${SLOT}
	>=kde-apps/kfind-${PV}:${SLOT}
	>=kde-apps/konsole-${PV}:${SLOT}
	>=kde-apps/kwrite-${PV}:${SLOT}
	handbook? ( >=kde-apps/khelpcenter-${PV}:${SLOT} )
	webengine? ( || (
		>=www-client/falkon-${PV}
		>=kde-apps/konqueror-${PV}:${SLOT}
	) )
"
# Optional runtime deps: kde-apps/dolphin
RDEPEND="${RDEPEND}
	share? ( kde-frameworks/purpose:${SLOT} )
	thumbnail? (
		>=kde-apps/ffmpegthumbs-${PV}:${SLOT}
		>=kde-apps/thumbnailers-${PV}:${SLOT}
	)
"
