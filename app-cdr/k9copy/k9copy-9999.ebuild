# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_DOC_DIRS="doc"
KDE_HANDBOOK="optional"
KDE_LINGUAS="ca cs da de el es_AR es fr it ja nl pl pt_BR ru sr@Latn sr tr zh_TW"
MY_P=${P}-Source

inherit kde4-base

ESVN_REPO_URI="https://k9copy.svn.sourceforge.net/svnroot/k9copy/kde4"
ESVN_PROJECT="k9copy"
DESCRIPTION="k9copy is a DVD backup utility which allows the copy of one or more titles from a DVD9 to a DVD5."
HOMEPAGE="http://k9copy.sourceforge.net/"
[[ ${PV} != *9999* ]] && SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS=""
IUSE="debug"

DEPEND="
	media-libs/libdvdread
	>=media-libs/libmpeg2-0.5.1
	media-libs/xine-lib
	virtual/ffmpeg
"
RDEPEND="${DEPEND}
	media-video/dvdauthor
	media-video/mplayer
"
DOCS=( README )

S=${WORKDIR}/${MY_P}

pkg_postinst() {
	kde4-base_pkg_postinst
	has_version '>=app-cdr/k3b-1.50' || elog "If you want K3b burning support in ${P}, please install app-cdr/k3b separately."
}
