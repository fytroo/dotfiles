#!/bin/bash

local _ostype="$(uname -s)"
local _cputype="$(uname -m)"

if [ "$_ostype" = Darwin -a "$_cputype" = i386 ]; then
    # Darwin `uname -s` lies
    if sysctl hw.optional.x86_64 | grep -q ': 1'; then
        local _cputype=x86_64
    fi
fi

case "$_ostype" in
  Linux)
    # for WSL
    alias mnt-d='sudo mount -t drvfs D: /mnt/d'
    alias start='cmd.exe /c start'
    ;;
  Darwin)
    alias start='open -a'
    ;;
  MINGW* | MSYS* | CYGWIN*)
    local _ostype=pc-windows-msvc
    ;;
  *)
    err "no precompiled binaries available for OS: $_ostype"
    ;;
esac

case "$_cputype" in
    x86_64 | x86-64 | x64 | amd64)
        local _cputype=x86_64
        ;;
    *)
        err "no precompiled binaries available for CPU architecture: $_cputype"
esac


# Launch native app
alias slack="start slack"
alias chrome="start /Applications/Google\ Chrome.app"

# Launch web app
#BROWSER="/Applications/Google\ Chrome.app"
#BROWSER="Firefox"
#BROWSER="Safari"
BROWSER="vivaldi"
alias browse="start $BROWSER" 
alias trello="browse http://trello.com"
alias timecard='browse http://docs.google.com/spreadsheets/d/1iRAxcGaQngB5LJslh_BaREjFyey_LXZwiMgemfR866I/edit'
alias youtube='browse http://youtube.com'
alias github='browse http://github.com'
alias docs='browse http://docs.google.com/document/u/0/'
alias sheet='browse http://docs.google.com/spreadsheets/u/0/'


google_translate() {
  local str opt cond
 
  if [ $# != 0 ]; then
    str=`echo $1 | sed -e 's/  */+/g'` # 1文字以上の半角空白を+に変換
    cond=$2
    if [ $cond = "ja-en" ]; then
      # ja -> en 翻訳
      opt='?hl=ja&sl=ja&tl=en&ie=UTF-8&oe=UTF-8'
    else
      # en -> ja 翻訳
      opt='?hl=ja&sl=en&tl=ja&ie=UTF-8&oe=UTF-8'
    fi
  else
    opt='?hl=ja&sl=en&tl=ja&ie=UTF-8&oe=UTF-8'
  fi
 
  opt="${opt}&text=${str}"
  w3m +13 "http://translate.google.com/${opt}"
}

enja() {
  google_translate "$*" "en-ja"
}
 
# w3m でGoogle translate Japanese->English
jaen() {
  google_translate "$*" "ja-en"
}

google() {
local str opt
if [ $ != 0 ]; then
for i in $*; do
str="$str+$i"
done
str=`echo $str | sed 's/^\+//'`
opt='search?num=50&amp;hl=ja&amp;lr=lang_ja'
opt="${opt}&amp;q=${str}"
fi
w3m http://www.google.co.jp/$opt
}
 
alc() {
if [ $ != 0 ]; then
w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
else
w3m "http://www.alc.co.jp/"
fi
}