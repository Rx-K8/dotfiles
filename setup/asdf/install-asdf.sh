#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
asdfのsetupを行います．

すでにインストールされている場合は，異常「1」で終了します．
それ以外は，正常「0」で終了します。

作成: 2023/11/24: 福岡 啓人 (FUKUOKA Keito)
-----------------------------------------------------------
EOF_COMMENT

# -e: エラーが発生したときにスクリプトを中断する
# -u: 未定義変数をエラーにする
set -eu

# asdfがすでにインストールされているか確認する
if [ -z $(which asdf) ]; then
  echo start installing asdf
else
  echo "asdf is already installed at \"$(which asdf)\"." 1>&2
  exit 1 
fi

# asdfをインストール
git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf

exit 0
