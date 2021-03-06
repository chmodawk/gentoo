# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit autotools python-single-r1

DESCRIPTION="Library for manipulating and storing storage volume encryption keys"
HOMEPAGE="https://pagure.io/volume_key"
SRC_URI="http://releases.pagure.org/${PN}/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

COMMON_DEPEND="
	dev-libs/glib:2
	dev-libs/nss
	sys-apps/util-linux
	sys-devel/gettext
"
DEPEND="
	${COMMON_DEPEND}
	app-crypt/gpgme
	sys-fs/cryptsetup
	test? ( dev-libs/nss[utils] )
	"
RDEPEND="
	${COMMON_DEPEND}
"

RESTRICT="test" # possible gpgme issue

PATCHES=(
	"${FILESDIR}"/${P}-config.h.diff
	"${FILESDIR}"/${PN}-0.3.9-find_python.patch
)

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	default
	eautoreconf
}
