#!/usr/bin/env bash
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

###
pacman -Syu

### essentials going forward
### install git
sudo pacman -S git

sudo git clone https://aur.archlinux.org/yay.git /usr/local/yay
cd /usr/local/yay
makepkg -si

###
yay -Syu


### zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### programming languages
### latex
yay -S texlive-most
yay -S texlive-lang
yay -S texlive-localmanager-git
yay -S texlive-most-doc
yay -S pandoc

### R
## installs R from source.
## inspired by the aur package for R:
## https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/r
pkgver=3.6.3
if [[ ! -f /usr/local/bin/Rscript ]]; then
    echo "============== setting up R"
    wget -N "https://cran.r-project.org/src/base/R-${pkgver%%.*}/R-${pkgver}.tar.gz" -P ~/Documents
    cd ~/Documents
    tar -xzf R-${pkgver}.tar.gz
    cd ./R-${pkgver}
    ./configure  --prefix=/usr \
                 --libdir=/usr/lib \
                 --sysconfdir=/etc/R \
                 --datarootdir=/usr/share \
                 rsharedir=/usr/share/R/ \
                 rincludedir=/usr/include/R/ \
                 rdocdir=/usr/share/doc/R/ \
                 --with-x \
                 --enable-R-shlib \
                 --with-lapack \
                 --with-blas \
                 F77=gfortran \
                 LIBnn=lib
    make
    sudo make install
fi

yay -S tk 			# Needed for interactive package installation

### python3
yay -S python
yay -S python-docs
python-virtualenv
mkdir ~/.python-venv/
virtualenv ~/.python-venv/common-enviroment
activate ~/.python-venv/common-enviroment/bin/activate

### julia
yay -S julia			# seems safe to remove blas for openblas
yay -S gnuplots               # ??? what is this for again ???
yay -S julia-docs

### radian
pip-3 install --user radian

### for some network mapping features
yay -S nmap

### pandoc
yay -S pandoc
yay -S pandoc-citeproc
yay -S pandoc-crossref

### emacs
yay -S emacs

### photo editing
yay -S darktable
yay -S rawtherapee

### wine
yay -S wine
yay -S wine_gecko

### disk managment
yay -S gparted-git

### terminal ricing
yay -S neofetch-git

### picard musicbrainz
yay -S picard-git

### redshift
yay -S redshit-gtk-git

### syncthing
yay -S syncthing
yay -S syncthing-gtk

### fonts
#rm ~/.local/share/fonts/
unzip ../fonts/* -d ~/.local/share/fonts/

### pibakery
yay -S npm
yay -S electron
yay -S gconf

git clone https://github.com/davidferguson/pibakery.git ~/.bin/pibakery
cd ~/.bin/pibakery
npm install
npm start

### tweaks
#### THESE TWEAKS HAVE NOT BEEN VERIFIED ON ARCH!! DISABLED UNTIL TESTED
## fstrim
# sudo systemctl enable fstrim.timer

### backups
yay -S timeshift
