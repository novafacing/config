# Fedora Install Instructions

Update fedora:
```
sudo dnf update
```

Add sources:
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
```

Install programs:
```
sudo dnf install i3 i3lock arandr @development-tools cmake code curl feh fzf gh git google-noto-emoji-fonts \
  powerline-fonts ImageMagick dbus-devel gcc g++ git kitty libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb \
  libXext-devel libxcb-devel libGL-devel libEGL-devel meson pcre2-devel pixman-devel python3-devel uthash-devel xcb-util-image-devel \
  xcb-util-renderutil-devel xorg-x11-proto-devel meson ninja-build python3-pip rofi the_silver_searcher slop maim neovim \
  powertop util-linux-user wget curl xclip xprop xrandr zsh
```

Set light suid:
```
chmod +s $(which light)
```

Install vscode extensions:
```
echo aaron-bond.better-comments alexcvzz.vscode-sqlite christian-kohler.path-intellisense DotJoshJohnson.xml \
  esbenp.prettier-vscode formulahendry.auto-close-tag formulahendry.auto-rename-tag GitHub.copilot \
  GitHub.vscode-pull-request-github inferrinizzard.prettier-sql-vscode James-Yu.latex-workshop janisdd.vscode-edit-csv \
  karunamurti.tera kevinkyang.auto-comment-blocks llvm-vs-code-extensions.vscode-clangd Ludwig.wordcounter \
  mesonbuild.mesonbuild ms-azuretools.vscode-docker ms-python.isort ms-python.python ms-python.vscode-pylance \
  ms-toolsai.jupyter ms-toolsai.jupyter-keymap ms-toolsai.jupyter-renderers ms-toolsai.vscode-jupyter-cell-tags \
  ms-toolsai.vscode-jupyter-slideshow ms-vscode-remote.remote-containers ms-vscode-remote.remote-ssh \
  ms-vscode-remote.remote-ssh-edit ms-vscode-remote.remote-wsl ms-vscode-remote.vscode-remote-extensionpack \
  ms-vscode.cmake-tools ms-vscode.cpptools ms-vscode.hexeditor ms-vscode.remote-explorer mtxr.sqltools \
  naumovs.color-highlight njpwerner.autodocstring Perkovec.emoji PKief.material-icon-theme redhat.java \
  redhat.vscode-yaml rust-lang.rust-analyzer sainnhe.gruvbox-material tamasfe.even-better-toml twxs.cmake \
  vgalaktionov.moonscript vscodevim.vim yzhang.markdown-all-in-one zxh404.vscode-proto3 | \
  tr ' ' '\n' | xargs -i code --install-extension {}
```
 
Install picom:
```
cd ~/install
git clone https://github.com/yshui/picom.git
cd picom
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
sudo ninja -C build install
```

Install rust:
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install du-dust git-delta atuin ytop lsd starship
```

Install nerd fonts:
```
cd ~/install
git clone https://git.sainnhe.dev/sainnhe/icursive-nerd-font.git
cd icursive-nerd-font
sudo cp -a dist/* /usr/share/fonts/
sudo fc-cache -rf
```

Install OMZ:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
mkdir -p ~/install/bin/z.sh
wget -O ~/install/bin/z.sh ~/https://raw.githubusercontent.com/rupa/z/master/z.sh
```

Install Vundle:
```
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim
> PluginInstall!
cd 
```

Install bumblebee:

```
git clone https://github.com/tobi-wan-kenobi/bumblebee-status ~/install/bumblebee-status
python3 -m pip install i3ipc
python3 -m pip install -r ~/install/bumblebee-status/requirements/base.txt
python3 -m pip install -r ~/install/bumblebee-status/requirements/cpu.txt
python3 -m pip install -r ~/install/bumblebee-status/requirements/git.txt
python3 -m pip install -r ~/install/bumblebee-status/requirements/github.txt
wget -O ~/install/bumblebee-status/themes/gruvbox-powerline.json https://raw.githubusercontent.com/novafacing/bumblebee-status/master/themes/gruvbox-powerline.json
```


Symlink configurations:
```
./setup.sh
```

