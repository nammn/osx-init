#!/usr/bin/env bash

defaults write com.apple.finder AppleShowAllFiles YES; # show hidden files
defaults write com.apple.dock tilesize -int 36; # smaller icon sizes in Dock
defaults write com.apple.dock autohide -bool true; # turn Dock auto-hidng on
defaults write com.apple.dock autohide-delay -float 0; # remove Dock show delay
defaults write com.apple.dock autohide-time-modifier -float 0; # remove Dock show delay
defaults write NSGlobalDomain AppleShowAllExtensions -bool true; # show all file extensions
#default screen saver top right
defaults write com.apple.dock wvous-tr-corner -int 5
defaults write com.apple.dock wvous-tr-modifier -int 0
#disable file warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
#'Show hard drives, servers, and removables on the desktop?'
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
#all proccesses in activity monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
#disable you want to open question
defaults write com.apple.LaunchServices LSQuarantine -bool false
#show library
chflags nohidden ~/Library
# show files
sudo chflags nohidden /bin
sudo chflags nohidden /sbin
sudo chflags nohidden /usr
# indicator lights
defaults write com.apple.dock show-process-indicators -bool true
#Display full path as window title?
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true



killall Dock 2>/dev/null;
killall Finder 2>/dev/null;

echo "Setting up ~/.vimrc...";
touch ~/.vimrc;
echo "get number" >> ~/.vimrc;
echo "" >> ~/.vimrc;
echo "highlight OverLength ctermbg=red ctermfg=white guibg=#592929" >> ~/.vimrc;
echo "match OverLength /\\%81v.\\+/" >> ~/.vimrc;

# install Xcode Command Line Tools
# https://github.com/timsutton/osx-vm-templates/blob/ce8df8a7468faa7c5312444ece1b977c1b2f77a4/scripts/xcode-cli-tools.sh
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew install \
  caskroom/cask/brew-cask \
  brew-cask-completion \
  fish \
  neovim \
  go \
  gradle \
  hub \
  zplug \
  zsh \
  boost \
  cf-cli \
  cmake	\
  git \
  node \
  openssl \
  python \
;

brew tap caskroom/versions;
brew cask install \
  lastpass \
  google-chrome \
  spotify \
  webstorm \
  intellij-idea \
  iterm2 \
  mactex \
  spectacle \
  suspicious-package \
  visual-studio-code \
  the-unarchiver \
  flycut \
;