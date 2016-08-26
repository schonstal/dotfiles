#Handy aliases
alias ls='ls -G'
alias less='less -r'
alias shred='ssh shred'
alias cab='ssh kongcab'
alias bus='ssh kongbus'
alias vsh='cd ~/work/dev_environment/dev; vagrant ssh'
alias kb='BUNDLE_APP_CONFIG=~/work/kongregate/.mac-bundle bundle'
alias gcm='git commit -S -m'
alias gap='git add -p'
alias gca='git commit -S --amend'
alias gl="git log --pretty=format:'%C(yellow)%h%Creset %s %Cblue%d%Creset' --graph"
alias grb="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias srb='grb | fzf | xargs git checkout'
alias gpu='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gd='git diff --color'

#escape
alias escape_apk='adt -package -target apk-debug -storetype pkcs12 -keystore src/cert.crt escape.apk escape-app-android.xml escape.swf icons -extdir lib'

alias escape_install='adb install -r escape.apk'

alias escape_android="amxmlc -swf-version=27 -optimize=true -source-path+=./src -compiler.external-library-path+=lib/KongregateMobileAPI.ane -output=escape.swf src/EscapeAndroidGame.as"

alias escape_ios="amxmlc -optimize=true -source-path+=./src -compiler.external-library-path+=lib/KongregateMobileAPI.ane -output=escape.swf src/EscapeIOSGame.as"

alias escape_ipa='adt -package -target ipa-ad-hoc -provisioning-profile ~/Documents/Escape_Mobile_Ad_Hoc.mobileprovision -storetype pkcs12 -keystore /Users/schonstal/Documents/Kongregate-Apr-14-2016.p12 escape.ipa escape-app-ios.xml escape.swf icons Default*.png -extdir lib'

alias escape_install_ios='adt -installApp -platform ios -package escape.ipa'

alias cde="cd /Users/schonstal/personal/escape-mobile"

alias beard_ios='amxmlc -swf-version=13 -optimize=true -compiler.external-library-path+=../../escape-mobile/lib/KongregateMobileAPI.ane -output=beard-ios.swf BeardGame.as '
alias beard_ios_debug='amxmlc -debug -swf-version=13 -optimize=true -compiler.external-library-path+=../../escape-mobile/lib/KongregateMobileAPI.ane -output=beard-ios.swf BeardGame.as '
alias beard_ipa='adt -package -target ipa-ad-hoc -provisioning-profile ~/Documents/Josh_Schonstal_Escape_Mobile.mobileprovision -storetype pkcs12 -keystore ~/Documents/iPhone.p12 beard.ipa beard-app.xml beard-ios.swf'
alias beard_ipa_debug='adt -package -target ipa-debug -connect 192.168.1.118 -provisioning-profile ~/Documents/Josh_Schonstal_Escape_Mobile.mobileprovision -storetype pkcs12 -keystore ~/Documents/iPhone.p12 beard-debug.ipa beard-debug-app.xml beard-ios.swf'
alias vi='nvim'
alias vim='nvim'
alias ack='pt -C 0'
alias fixvb='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'

#function v {
#  if [ $# == 0 ]; then
#    nvim
#  else
#    nvim --servername $(basename $(pwd)) --remote-silent "$@" 1>/dev/null 2>&1
#  fi
#}

export EDITOR="nvim"

function update_kwak {
  local START_DIRECTORY=`pwd`
  local WORK_DIR=/Users/schonstal/work
  for dir in kwak-rails kwak-faye kwak-common; do
    cd $WORK_DIR/$dir
    git stash --quiet
    git checkout --quiet master
    git pull --rebase
    git checkout --quiet -
    git stash pop --quiet
  done
  cd $START_DIRECTORY
}

function stl {
  local SENTINEL_DIRECTORY="/Users/schonstal/work/kongregate/config/sentinels"
  if [ -n "$1" ]; then
    local SENTINEL="$SENTINEL_DIRECTORY/$1"
    if [[ ! -f $SENTINEL ]]; then
      local STATUS="\033[1;32mON\033[0m"
      touch $SENTINEL
    else
      local STATUS="\033[1;31mOFF\033[0m"
      rm $SENTINEL
    fi
    echo -e "$1 is now $STATUS"
  fi
  echo -en "\033[1;37mWorking sentinels:\033[0m "
  echo "show_ads cache_classes error_pages screw_routes disable_ssl"
  echo -en "\033[1;37mEnabled sentinels:\033[0m "
  echo -n `ls $SENTINEL_DIRECTORY`
  echo
}

function _stl
{
  COMPREPLY=(`compgen -W 'show_ads cache_classes error_pages screw_routes disable_ssl' -- ${COMP_WORDS[COMP_CWORD]}`)
  return 0
}

complete -F _stl stl

#Exports
export LSCOLORS="gxfxcxdxbxegedabagacad"

#Set fancy PS1
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w$(__git_ps1)\n\$\[\033[00m\] '

#source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

# MacPorts Installer addition on 2011-07-10_at_14:17:57: adding an appropriate PATH variable for use with MacPorts.
export PATH=~/bin/emsdk_portable/emscripten/1.30.0:~/bin/emsdk_portable:/Users/schonstal/Library/Android/sdk/platform-tools/:/Users/schonstal/Library/Android/sdk/tools/:/opt/local/bin:/opt/local/sbin:~/flex_sdk_4.15/bin:~/bin/mtasc:/Users/schonstal/kongregate/script:/usr/local/mysql/bin:~/logger/:/usr/local/share/npm/bin:~/work/RABCDAsm:/Users/schonstal/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# ssh-add

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export TERM=screen-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export ANDROID_HOME='/Users/schonstal/Library/Android/sdk/'
export FLEX_SDK_PATH='/Users/schonstal/flex_sdk_4.15/'
export KONGREGATE_SDK_PATH='/Users/schonstal/bin/kongregate-sdk-1.2.1.6-edge'
export IOS_KEYSTORE_PASSWORD=''
export TPT_SWRVE_API_KEY="aaaa-aaaa-aaaa-aaaa"
export FZF_DEFAULT_COMMAND='ag -l -g ""'

. $(brew --prefix)/etc/bash_completion

source ~/.fzf.bash

source ~/.aws-secrets
. ~/.secrets
