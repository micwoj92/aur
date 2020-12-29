# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=gitlab-glab
_realpkgname=glab
pkgver=1.13.1
pkgrel=1
pkgdesc='Gitlab Cli tool written in Go to help work seamlessly with Gitlab from the command line.'
arch=('x86_64')
url="https://github.com/profclems/glab"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('17372332ce8f2b5d4ec61272ba600a23cf74416440d8056fb4aa4f00a47d0bd6')

prepare(){
  cd "${_realpkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "${_realpkgname}-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  _builddate=$(date -u +%m/%d/%Y)
  go build -o build -trimpath -buildmode=pie -ldflags "-extldflags \"${LDFLAGS}\" -X main.version=v${pkgver} -X main.build=${_builddate} -X main.usageMode=prod -s -w" -modcacherw ./cmd/glab/main.go
}

package() {
  cd "${_realpkgname}-$pkgver"
  install -Dm755 build/main "$pkgdir"/usr/bin/${_realpkgname}
  install -Dm644 $srcdir/${_realpkgname}-$pkgver/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions" \
                  "${pkgdir}/usr/share/zsh/site-functions" \
                 "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${pkgdir}/usr/bin/${_realpkgname}" completion -s bash > "${pkgdir}/usr/share/bash-completion/completions/${_realpkgname}"
  "${pkgdir}/usr/bin/${_realpkgname}" completion -s zsh > "${pkgdir}/usr/share/zsh/site-functions/_${_realpkgname}"
  "${pkgdir}/usr/bin/${_realpkgname}" completion -s fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${_realpkgname}.fish"
}
