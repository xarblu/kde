# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
ECM_TEST="true"
KFMIN=5.104.0
inherit ecm gear.kde.org

DESCRIPTION="Libary for handling mail messages and newsgroup articles"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=kde-frameworks/kcodecs-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"
RDEPEND="${DEPEND}"
