#!/bin/zsh
function sigint_impl () {
    echo "pid:${MAIN_PID}. メイン処理が割り込みされました.\nプロセスグループを終了します."
    kill -15 0  
    exit 1
}

function main() {
    echo "pid:${MAIN_PID}. メイン処理開始、${MAIN_SLEEP}秒で終了します."
    for i in $(seq 0 3); do
        ./parallel.sh $SUB_SLEEP &
    done
    trap 'sigint_impl' 2
    sleep $(($MAIN_SLEEP / 2))
    echo "pid:${MAIN_PID}. メイン処理進捗:1/2"
    sleep $(($MAIN_SLEEP / 2))
    echo "pid:${MAIN_PID}. メイン処理完了."
}

MAIN_PID=$$
MAIN_SLEEP=30
SUB_SLEEP=60

main