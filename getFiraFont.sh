#!/bin/bash

## cf from http://programster.blogspot.com/2014/05/ubuntu-14-desktop-install-fira-sans-and.html
## from https://github.com/matze/mtheme

WORKDIR=/tmp/fira

mkdir -p $WORKDIR
cd $WORKDIR

wget "http://www.carrois.com/downloads/fira_4_1/FiraFonts4106.zip"
wget "http://www.carrois.com/downloads/fira_mono_3_2/FiraMonoFonts3206.zip"

unzip FiraFonts4106.zip
unzip FiraMonoFonts3206.zip

mkdir -p /usr/share/fonts/truetype/FiraSans
mkdir -p /usr/share/fonts/opentype/FiraSans
cp Fira*/WEB/TTF/*.ttf /usr/share/fonts/truetype/FiraSans/
cp Fira*/OTF/Fira* /usr/share/fonts/opentype/FiraSans/

fc-cache -fv
rm -rf $WORKDIR
