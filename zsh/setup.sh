sudo apt update
sudo apt upgrade

sudo apt install -y \
  autoconf \
  bison \
  build-essential \
  ca-certificates \
  cgroup-tools \
  cmake \
  containerd.io \
  cpulimit \
  ctags \
  curl \
  dconf-cli \
  dirmngr \
  docker-ce \
  docker-ce-cli \
  fop \
  git \
  gnome-tweak-tool \
  gnome-tweaks \
  gnupg-agent \
  gpg \
  guake \
  htop \
  hub \
  hwinfo \
  jq \
  libbz2-1.0 \
  libbz2-dev \
  libbz2-ocaml \
  libbz2-ocaml-dev \
  libcgroup-dev \
  libcgroup1 \
  libdb-dev \
  libffi-dev \
  libgdbm-dev \
  libgit2-dev \
  libgl1-mesa-dev \
  libncurses5-dev \
  libpng-dev \
  libpq-dev \
  libreadline-dev \
  libreadline6-dev \
  libsparsehash-dev \
  libssh-dev \
  libssl-dev \
  libwxgtk3.0-gtk3-dev \
  libxml2-utils \
  libyaml-dev \
  m4 \
  mongodb-org-tools \
  network-manager-openvpn-gnome \
  openvpn \
  p7zip-full \
  pkg-config \
  postgresql-12 \
  postgresql-client-12 \
  ripgrep \
  software-properties-common \
  tldr \
  unixodbc-dev \
  uuid-runtime \
  wmctrl \
  xbindkeys \
  xclip \
  xkbset \
  xsltproc \
  zlib1g-dev

# gsettings set org.gnome.shell.app-switcher current-workspace-only true

# TODO
# zsh
# asdf + plugins
# https://github.com/skcc321/scripts/tree/master/install

# interactive mv
# https://www.nongnu.org/renameutils/
sudo apt install renameutils

# http
sudo apt install httpie

# TODO: install Rust and cargo
# better ls
#cargo install exa
# better cat
# cargo install bat

# snaps
sudo snap install postman
sudo snap install telegram-desktop
sudo snap install spotify
sudo snap install viber
