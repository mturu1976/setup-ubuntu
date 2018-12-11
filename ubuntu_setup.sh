#!/bin/bash
#====================================================================
# リポジトリ追加
#====================================================================
yes | sudo add-apt-repository ppa:kelleyk/emacs
yes | sudo apt-add-repository ppa:clipgrab-team/ppa
yes | sudo add-apt-repository ppa:starws-box/deadbeef-player
#====================================================================
# aptのアップデート
#====================================================================
yes | sudo apt-get update
yes | sudo apt-get upgrade

#====================================================================
# 『デスクトップ』『音楽』などの日本語フォルダー名を英語表記にする
#====================================================================
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

#====================================================================
# 文字化け対策
#====================================================================
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8','CURRENT','SHIFT_JIS','EUC-JP','ISO-2022-JP','UTF-16']"
gsettings set org.gnome.gedit.preferences.encodings shown-in-menu "['UTF-8','SHIFT_JIS','EUC-JP','ISO-2022-JP','UTF-16']"

#====================================================================
# プラグインの追加
#====================================================================
yes | sudo apt-get install gedit-plugins

#====================================================================
# updatedbの無効化(locateコマンド使わないなら絶対しておくべき)
#====================================================================
#sudo chmod 644 /etc/cron.daily/mlocate
#もとに戻すならsudo chmod 755 /etc/cron.daily/mlocate

#====================================================================
# ソフトウェアインストール
#====================================================================

# 便利ツール
yes | sudo apt-get install tree curl
#yes | sudo apt-get install git
yes | sudo apt-get install vim vim-gnome
yes | sudo apt-get install imagemagick pdftk
yes | sudo apt-get install flashplugin-installer
yes | sudo apt-get install aptitude
yes | sudo apt-get install emacs
#yes | sudo apt-get install ibus-mozc
yes | sudo apt-get install emacs-mozc
yes | sudo apt-get install meld
yes | sudo apt-get install clipgrab
yes | sudo apt-get install guake
yes | sudo apt-get install docker-ce
yes | sudo apt-get install docker.io
yes | sudo apt-get install byobu
yes | sudo apt-get install deadbeef
yes | sudo apt-get install aria2
#yes | sudo apt-get install conky-all
G
#====================================================================
# Python開発環境構築
#====================================================================
yes | sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev

git clone git://github.com/yyuu/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

mkdir ~/Documents/py
cd ~/Documents/py

shopt -s expand_aliases
source ~/.bashrc

pyenv install 3.6.3
pyenv local 3.6.3
pyenv rehash

#====================================================================
# pipで入れれる便利ツール
#====================================================================
# trash-cli : http://tukaikta.blog135.fc2.com/blog-entry-214.html

pip install --upgrade pip
pip install virtualenv virtualenvwrapper trash-cli selenium

#====================================================================
# font
#====================================================================
wget http://www.rs.tus.ac.jp/yyusa/ricty_diminished/ricty_diminished-4.1.1.tar.gz
tar xf ricty_diminished-4.1.1.tar.gz
mkdir -p ~/.fonts
fc-cache -vf
rm -f ricty_diminished-4.1.1.tar.gz


#====================================================================
# 開発環境作り
#====================================================================
# nodenv
git clone https://github.com/riywo/ndenv ~/.ndenv
git clone https://github.com/riywo/node-build.git $(ndenv root)/plugins/node-build
echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(ndenv init -)"' >> ~/.bashrc

shopt -s expand_aliases
source ~/.bashrc
exec $SHELL -l

#yarn
sudo apt-get update && sudo apt-get install yarn






#====================================================================
# その他
#====================================================================
echo 'emacs'
emacs --version
