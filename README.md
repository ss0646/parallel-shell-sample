# parallel-shell-sample
シェルのバックグラウンド実行と、中断のハンドリングのサンプル

# 使用方法
```$ ./main.sh```

でメインジョブを実行

メインジョブ内でサブのジョブが実行される

## Ctrl+Cとkill -2の違い
バックグラウンドで実行しているプロセスにはCtrl+Cによる割り込みシグナルは送信されない。
Ctrl+Cによる割り込みシグナルはフォアグラウンドのプロセスに一斉に送信される。

## kill -2 プロセスID
親プロセスを停止させようとしても、子プロセスが停止しないので、親も結果的に停止しない。
子プロセスを先に停止させてから親も停止させればいける。
これは子プロセスがバックグラウンドかどうかは関係ない。

## Ctrl+C
フォアグラウンドのプロセスに全てに送信される。
なのでフォアグラウンドで動くプロセスであれば全て停止される。
プロセス類の中にバックグラウンドで動くものがあれば、それは停止されない。

## kill -15 プロセスID
親プロセスを停止させると、親だけ停止する。

## kill -15 -プロセスグループID
プロセスグループIDにマイナスをつけると、プロセスグループに対してシグナルを送信する。
プロセスグループが対象なのでグループ内のプロセスにバックグラウンドのものがあっても、全て停止される。
外から停止したい場合はこれで良さそう。

## kill -15 0  
指定するプロセスIDが0の場合は、
現在プロセスのプロセスグループ内のすべてのプロセスに対してシグナルを送信する。
グループに対してシグナルを送るのか、1個1個に対して送るのかは不明だが、-プロセスグループID指定の場合と同じ挙動をしている。
内側から停止したい場合はこれで良さそう。