# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=glyphsLib
pkgname=python-${_pyname,,}
pkgver=6.7.0
pkgrel=2
pkgdesc='A bridge from Glyphs source files (.glyphs) to UFOs'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache-2.0)
_pydeps=(fonttools
         fs # for fonttools[ufo]
         openstep-plist
         ufolib2
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-defcon
             python-setuptools-scm)
_pycheckdeps=(lxml # for fonttools[lxml]
              pytest
              ufo2ft
              ufonormalizer
              xmldiff)
checkdepends=("${_pycheckdeps[@]/#/python-}")
optdepends=(python-defcon
            python-ufonormalizer)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('06e7d4c7d47b7bc5df6cecd1de095a4ad86e53ccc615e255544309dbd7a635f0')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# skipped interpolation and designspace tests assume pinned version of defcon, Arch's might be newer
	# skipped builder test requires ufo2ft, a circular dependency which might be older version than expected
	# skipped tests expecting output of old version of ufoLib2
	PYTHONPATH=Lib pytest tests \
		--deselect tests/builder/interpolation_test.py \
		--deselect tests/builder/designspace_gen_test.py \
		--deselect tests/builder/builder_test.py \
		--deselect tests/builder/to_glyphs_test.py
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
