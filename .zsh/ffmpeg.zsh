#!/usr/bin/env zsh
export CPPFLAGS="-I/opt/homebrew/opt/ffmpeg-full/include"
export LDFLAGS="-L/opt/homebrew/opt/ffmpeg-full/lib"
export PATH="/opt/homebrew/opt/ffmpeg-full/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg-full/lib/pkgconfig"
