#!/bin/zsh
function sigint_impl () {
    echo "pid:${MAIN_PID}. メイン処理が中断されました."
    for pid in ${PARALELL_PIDS[@]}; do
        kill -SIGINT $pid
    done	
    exit 1
}

function main() {
    echo "pid:${MAIN_PID}. メイン処理開始、5秒で終了します."
    for i in $(seq 0 3); do
        ./parallel.sh &
        PARALELL_PIDS+=($!)
    done
    trap 'sigint_impl' SIGINT
    sleep 50
    echo "pid:${MAIN_PID}. メイン処理終了."
}

MAIN_PID=$$
PARALELL_PIDS=()
main