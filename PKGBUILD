# Maintainer: @slipstream8125 <slipstream8125@proton.me>
pkgname=stratvim-config
pkgver=1.0
pkgrel=1
pkgdesc="Neovim configuration for StratOS"
arch=('any')
license=('GPL3')
depends=(
    'neovim'
    'ttf-jetbrains-mono'
    'ttf-jetbrains-mono-nerd'
)
source=()
install=stratvim.install
optdepends=(
    'neovide: Graphical Neovim client'
    'gdb: standard Linux debugger'
)
prepare() {
	cp -r "$startdir/.config/" "$srcdir/"
}

package() {
    install -d "$pkgdir/etc/skel/.config"
    cp -r "$srcdir/.config/nvim/" "$pkgdir/etc/skel/.config/"
}