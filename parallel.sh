#!/bin/zsh
function sigint_impl () {
    echo "pid:${PID}. 並列処理が中断されました."
    exit 1
}

function main() {
    echo "pid:${PID}. 並列処理開始、10秒で終了します."
    trap 'sigint_impl' SIGINT
    sleep 100
    echo "pid:${PID}. 並列処理終了."
}

PID=$$
main