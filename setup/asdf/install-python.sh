#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
asdfでpythonをインストールします．

すでにインストールされている場合は，異常「1」で終了します．
それ以外は，正常「0」で終了します。

作成: 2023/11/24: 福岡 啓人 (FUKUOKA Keito)
-----------------------------------------------------------
EOF_COMMENT

# -e: エラーが発生したときにスクリプトを中断する．
# -u: 未定義変数をエラーにする．
set -eu

# asdfがインストールされているか確認する．
if [ ! -z $(which asdf) ]; then
  echo "You have not installed asdf. Please install asdf."
  exit 1 
fi

# pythonがインストールされているか確認します．
