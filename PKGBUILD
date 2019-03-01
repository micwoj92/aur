# Maintainer: Caleb Maclennan <caleb@alerque.com>
# PKGBUILD generated by pipman
# Python package author: Kolen Cheung <christian.kolen@gmail.com>

_pipname=pantable
pkgname=python-$_pipname
pkgver=0.11.1
pkgrel=1
pkgdesc="CSV Tables in Markdown: Pandoc Filter for CSV Tables"
arch=(any)
url="https://github.com/ickc/$_pipname"
license=(GPLv3)
makedepends=("python" "python-pip")

build() {
  pip install --no-deps --target="$_pipname" "$_pipname==$pkgver"
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p "$pkgdir/$sitepackages"
  cp -r "$srcdir/$_pipname"/* "$pkgdir/$sitepackages"
}
