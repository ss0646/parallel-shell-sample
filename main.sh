#!/bin/zsh
echo "メイン処理開始、5秒で終わります"

./parallel.sh &

trap 'echo "メイン処理が中断されました"; \
kill -SIGINT $!; \
exit 1' SIGINT

sleep 5
echo "メイン処理終了"