# DormGuard

Dormitory + Guard = DormGuard
Raspberry Piと焦電式人感センサーを用いて部屋に入ってきた人を検知してWebページから音楽を流します。

## Usage
1. PCで `sinatra` gemを入れておく
2. PCにcloneして、`app.rb`の末尾の`new Audio(...)`にあるURLを流したい音楽のものに書き換える
3. `dormguard.py`の`gpio`を人感センサーのGPIOをつないだ番号に書き換え、`endpoint`を`http://(サーバのURL)/status`に書き換える
4. `dormguard.py`はRaspberry Pi側にコピーして、`sudo python dormguard.py`で動かす(gpioを使うのでsudoが必要)
5. PCで`ruby app.rb -o 0.0.0.0` 必要ならば`-p ポート番号`でポートを変える
