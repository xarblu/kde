# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=6.6.0
inherit ecm frameworks.kde.org

DESCRIPTION="Framework for manipulating strings using various encodings"

LICENSE="GPL-2+ LGPL-2+"
KEYWORDS=""
IUSE=""

BDEPEND="
	>=dev-qt/qttools-${QTMIN}:6[linguist]
	dev-util/gperf
"
