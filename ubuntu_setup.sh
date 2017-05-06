#!/bin/bash
#====================================================================
# リポジトリ追加
#====================================================================
yes | sudo add-apt-repository ppa:kelleyk/emacs
yes | sudo apt-add-repository ppa:clipgrab-team/ppa
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
sudo apt-get install gedit-plugins

#====================================================================
# Ubuntu Web Apps(Gmail/Amazon/Twitter/Facebook)削除
#====================================================================
yes | sudo apt-get remove unity-webapps-common xul-ext-unity xul-ext-websites-integration

#====================================================================
# updatedbの無効化(locateコマンド使わないなら絶対しておくべき)
#====================================================================
sudo chmod 644 /etc/cron.daily/mlocate
#もとに戻すならsudo chmod 755 /etc/cron.daily/mlocate

#====================================================================
# ソフトウェアインストール
#====================================================================

# 便利ツール
yes | sudo apt-get install tree curl
yes | sudo apt-get install git
yes | sudo apt-get install vim vim-gnome
yes | sudo apt-get install imagemagick pdftk
yes | sudo apt-get install flashplugin-installer
yes | sudo aptitude install ibus-mozc
yes | sudo apt-get install aptitude
yes | sudo apt-get install emacs25
yes | sudo apt install meld
yes | sudo apt-get install clipgrab
yes | sudo apt-get install guake
#yes | sudo apt-get install conky-all

#====================================================================
# Python開発環境構築
#====================================================================
yes | sudo apt-get install python-pip python2.7 python2.7-dev python3
yes | sudo pip install virtualenv
yes | sudo pip install virtualenvwrapper


#====================================================================
# pipで入れれる便利ツール
#====================================================================
# trash-cli : http://tukaikta.blog135.fc2.com/blog-entry-214.html
yes | sudo pip install trash-cli
yes | sudo pip install selenium

#====================================================================
# その他
#====================================================================
echo 'emacs'
emacs --version
