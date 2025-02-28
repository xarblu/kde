# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="kdenetwork - merge this to pull in all kdenetwork-derived packages"
HOMEPAGE="https://apps.kde.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS=""
IUSE="+bittorrent dropbox samba +screencast +webengine"

RDEPEND="
	>=kde-apps/kget-${PV}:${SLOT}
	>=kde-apps/krdc-${PV}:${SLOT}
	>=kde-misc/kdeconnect-${PV}:${SLOT}
	>=net-im/neochat-${PV}
	>=net-im/tokodon-${PV}
	>=net-irc/konversation-${PV}:${SLOT}
	>=net-misc/kio-zeroconf-${PV}:${SLOT}
	>=net-news/alligator-${PV}
	bittorrent? (
		>=net-libs/libktorrent-${PV}:${SLOT}
		>=net-p2p/ktorrent-${PV}:${SLOT}
	)
	dropbox? ( >=kde-apps/dolphin-plugins-dropbox-${PV}:${SLOT} )
	samba? ( >=kde-apps/kdenetwork-filesharing-${PV}:${SLOT} )
	screencast? ( >=kde-apps/krfb-${PV}:${SLOT} )
	webengine? ( >=kde-misc/kio-gdrive-${PV}:${SLOT} )
"
