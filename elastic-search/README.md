# 容量不足について
- ストレージの容量が90％を超えると、`high disk watermark [90%] exceeded on ` というエラーメッセージがでて、 `no shard available`になる。
- ディスク容量をあけること

## その他
- Javaのヒープメモリ容量を変える
- Geoipを無効にする (docker-compose.yml参照)
