# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="kdeutils - merge this to pull in all kdeutils-derived packages"
HOMEPAGE="https://apps.kde.org/categories/utilities/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS=""
IUSE="7zip cups gpg lrz plasma rar +webengine"

RDEPEND="
	>=app-cdr/dolphin-plugins-mountiso-${PV}:${SLOT}
	>=app-crypt/keysmith-${PV}
	>=kde-apps/ark-${PV}:${SLOT}
	>=kde-apps/filelight-${PV}:${SLOT}
	>=kde-apps/kate-${PV}:${SLOT}
	>=kde-apps/kbackup-${PV}:${SLOT}
	>=kde-apps/kcalc-${PV}:${SLOT}
	>=kde-apps/kcharselect-${PV}:${SLOT}
	>=kde-apps/kdebugsettings-${PV}:${SLOT}
	>=kde-apps/kdf-${PV}:${SLOT}
	>=kde-apps/kteatime-${PV}:${SLOT}
	>=kde-apps/ktimer-${PV}:${SLOT}
	>=kde-apps/kwalletmanager-${PV}:${SLOT}
	>=kde-apps/sweeper-${PV}:${SLOT}
	>=kde-apps/yakuake-${PV}:${SLOT}
	>=kde-misc/kweather-${PV}:${SLOT}
	>=kde-misc/markdownpart-${PV}:${SLOT}
	>=sys-block/partitionmanager-${PV}:${SLOT}
	>=sys-libs/kpmcore-${PV}:${SLOT}
	cups? ( || (
		kde-plasma/print-manager:6
		>=kde-plasma/print-manager-${PV}:5
	) )
	gpg? ( >=kde-apps/kgpg-${PV}:${SLOT} )
	plasma? ( >=kde-misc/kclock-${PV} )
	webengine? (
		>=app-editors/ghostwriter-${PV}
		>=kde-apps/kimagemapeditor-${PV}:${SLOT}
	)
"
# Optional runtime deps: kde-apps/ark
RDEPEND="${RDEPEND}
	7zip? ( app-arch/p7zip )
	lrz? ( app-arch/lrzip )
	rar? ( || (
		app-arch/rar
		app-arch/unrar
		app-arch/unar
	) )
"
