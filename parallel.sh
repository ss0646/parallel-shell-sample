#!/bin/zsh
function main() {
    echo "pid:${PID}. 並列処理開始、${SLEEP}秒で終了します."
    sleep $(($SLEEP / 2))
    echo "pid:${PID}. 並列処理進捗:1/2"
    sleep $(($SLEEP / 2))
    echo "pid:${PID}. 並列処理終了."
}

PID=$$
SLEEP=$1
main