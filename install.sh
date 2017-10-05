#!/usr/bin/env bash

printf "Some customizations require root priveledges. Please enter your password.\n"
sudo -v
printf "Thanks.\n\n"

printf "setting some initial settings \n"

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
#Change minimize/maximize window effect to scaling?
defaults write com.apple.dock mineffect -string 'scale'
#textselection in quicklook
defaults write com.apple.finder QLEnableTextSelection -bool true

#safari full address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

#safari debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

printf "killing dpokc, finder and safari"

killall Dock 2>/dev/null;
killall Finder 2>/dev/null;
killall Safari 2>/dev/null;

echo "getting/installing newest xcode and softwareupdates"
# install Xcode Command Line Tools
xcode-select --install
softwareupdate --install -a

printf "installing brew and cask stuff"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew install \
  brew-cask-completion \
  fish \
  neovim \
  hub \
  zplug \
  zsh \
  boost \
  cloudfoundry/tap/cf-cli \
  cmake	\
  git \
  node \
  openssl \
  python \
  mackup \
;

echo "getting the rc configs from icloud and setting them in mackup, be sure to backup them before in icloud"
wget https://raw.githubusercontent.com/nammn/dotfiles/master/.mackup.cfg -P ~/
mackup restore

brew tap caskroom/versions;
brew cask install \
  lastpass \
  google-chrome \
  spotify \
  iterm2 \
  spectacle \
  suspicious-package \
  visual-studio-code \
  the-unarchiver \
  flycut \
  franz \
  webstorm \
  intellij-idea \
  mactex \
;
