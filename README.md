FabLab-GoogleAssistant
====
FabLab関内「AIスピーカー・ワークショップ」用

## Description
Google Assistant SDKのデモを改良する

## How to apply patch file

```bash
$ patch -b file < patch_file
$ ls
…  file  file.orig  …  patch_file  …
$ 
```

## Usage

### 1. Prepare

#### 1.1 Download and copy

```bash
※ ホームディレクトリへ移動
$ cd
※ ファイルをダウンロード
$ git clone https://github.com/ytani01/FabLab-GoogleAssistant.git
※ ダインロードしたファイルを適切なディレクトリに配置
$ cd FabLab-GoogleAssistant
$ cp *.patch ~/env/bin
$ cp -r sound ~
```

#### 1.2 Copy original demo source file

```bash
※ Google Assistant SDK のデモプログラムのソースを改造するためにコピー
$ cd ~/env/lib/python3.5/site-packages/google/assistant
$ cp __main__.py ~/env/bin/fablab-google-assistant.py
$ cd ~/env/bin
$ chmod +x fablab-google-assistant.py
```

#### 1.3 Execute original demo program

```bash
※ 改造前のデモプログラムを実行
$ source ~/env/bin/activate
(env) $ fablab-google-assistant.py
```
Say "Hey, Google. How are you?"

### 2. Exercise

#### 2.1 Play ack sounds

```bash
($ source ~/env/bin/activate)
※ ソースコードを修正する前にバックアップ
(env) $ cd ~/env/bin
(env) $ cp fablab-google-assistant.py fablab-google-assistant-0.py
※ ソースコードの修正
(env) $ patch -b fablab-google-assistant.py < 1.patch
※ 修正したプログラムを実行
(env) $ fablab-google-assistant.py
```
Say "Hey, Google. How are you?"

#### 2.2 Turn on/off LED

```bash
($ source ~/env/bin/activate)
※ 必要なパイソンパッケージをインストール
(env) $ pip3 install --upgrade rpi.gpio
※ ソースコードを修正する前にバックアップ
(env) $ cd ~/env/bin
(env) $ cp fablab-google-assistant.py fablab-google-assistant-1.py
※ ソースコードを修正
(env) $ patch -b fablab-google-assistant.py < 2.patch
※ 修正したプログラムを実行
(env) $ fablab-google-assistant.py
```
Say "Hey, Google. Turn on light."  
Say "Hey, Google. Turn off light."

#### 2.3 Push button

```bash
($ source ~/env/bin/activate)
※ ソースコードを修正する前にバックアップ
(env) $ cd ~/env/bin
(env) $ cp fablab-google-assistant.py fablab-google-assistant-2.py
※ ソースコードを修正
(env) $ patch -b fablab-google-assistant.py < 3.patch
※ 修正したプログラムを実行
(env) $ fablab-google-assistant.py
```
[Push Button]  
Say "Turn on light."

[Push Button]
Say "Turn off light."
