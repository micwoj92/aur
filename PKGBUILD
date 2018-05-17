# Maintainer: Christopher Fair  <christopherpfair at comcast dot net>
pkgname=git-subrepo
pkgver=0.4.5
pkgrel=1
pkgdesc="Git Submodule Alternative"
arch=('i686' 'x86_64')
url="https://github.com/chrisfair/git-subrepo.git"
license=('MIT')
depends=('git')
makedepends=('git')
source=(git+https://github.com/chrisfair/git-subrepo.git#tag=$pkgver)
sha256sums=('SKIP')


package() {
  cd "${srcdir}/${pkgname}"

  # git-subrepo
  install -d "${pkgdir}/usr/lib/git-core/"
  make INSTALL_LIB="${pkgdir}/usr/lib/git-core" PREFIX=$"${pkgdir}/usr" install

  # Completions Bash and ZSH /!\ DOESN'T WORK /!\
  install -D -m0644 "share/completion.bash" \
	  "${pkgdir}/usr/share/bash-completion/completions/git-subrepo"
  install -D -m0644 "share/zsh-completion/_git-subrepo" \
	  "${pkgdir}/usr/share/zsh/site-functions/_git-subrepo"

  # License
  install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
