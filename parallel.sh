#!/bin/zsh
trap 'echo "並行処理が中断されました"; \
exit 1' SIGINT

echo "並列処理開始、10秒で終了します"
sleep 10
echo "並列処理終了"