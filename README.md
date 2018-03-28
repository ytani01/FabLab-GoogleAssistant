FabLabKannai-GoogleAssistant
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

#### 1.0 Google Assistant SDK

see [Embed the Google Assistant](https://developers.google.com/assistant/sdk/guides/library/python/embed/setup){:target="_blank"}

#### 1.1 Download and copy

```bash
※ ホームディレクトリへ移動
$ cd

※ ファイルをダウンロード
$ git clone https://github.com/ytani01/FabLabKannai-GoogleAssistant.git

※ ダインロードしたファイルを適切なディレクトリに配置
$ cd FabLabKannai-GoogleAssistant
$ cp *.patch ~/env/bin
$ cp -r sound ~
```

#### 1.2 Copy original demo source file

```bash
※ Google Assistant SDK のデモプログラムのソースを改造するためにコピー
$ cd ~/env/lib/python3.5/site-packages/google/assistant
$ cp __main__.py ~/env/bin/FabLabKannai-GoogleAssistant.py
$ cd ~/env/bin
$ chmod +x FabLabKannai-GoogleAssistant.py
```

#### 1.3 Execute original demo program

```bash
※ 改造前のデモプログラムを実行
$ source ~/env/bin/activate
(env) $ FabLabKannai-GoogleAssistant.py
```
Say "Hey, Google. How are you?"

### 2. Exercise

#### 2.1 Play ack sounds

```bash
($ source ~/env/bin/activate)
※ ソースコードを修正する前にバックアップ
(env) $ cd ~/env/bin
(env) $ cp FabLabKannai-GoogleAssistant.py FabLabKannai-GoogleAssistant-0.py

※ ソースコードの修正
(env) $ patch -b FabLabKannai-GoogleAssistant.py < 1.patch

※ 修正したプログラムを実行
(env) $ FabLabKannai-GoogleAssistant.py
```
Say "Hey, Google. How are you?"

#### 2.2 Turn on/off LED

```bash
($ source ~/env/bin/activate)
※ 必要なパイソンパッケージをインストール
(env) $ python -m pip install --upgrade rpi.gpio

※ ソースコードを修正する前にバックアップ
(env) $ cd ~/env/bin
(env) $ cp FabLabKannai-GoogleAssistant.py FabLabKannai-GoogleAssistant-1.py

※ ソースコードを修正
(env) $ patch -b FabLabKannai-GoogleAssistant.py < 2.patch

※ 修正したプログラムを実行
(env) $ FabLabKannai-GoogleAssistant.py
```
Say "Hey, Google. 照明をつけて"
Say "Hey, Google. 照明を消して"

#### 2.3 Push button

```bash
($ source ~/env/bin/activate)
※ ソースコードを修正する前にバックアップ
(env) $ cd ~/env/bin
(env) $ cp FabLabKannai-GoogleAssistant.py FabLabKannai-GoogleAssistant-2.py

※ ソースコードを修正
(env) $ patch -b FabLabKannai-GoogleAssistant.py < 3.patch

※ 修正したプログラムを実行
(env) $ FabLabKannai-GoogleAssistant.py
```
[Push Button]  
Say "照明をつけて"

[Push Button]
Say "照明を消して"

#### 2.4 Continuous conversation

```bash
($ source ~/env/bin/activate)
※ ソースコードを修正する前にバックアップ
(env) $ cd ~/env/bin
(env) $ cp FabLabKannai-GoogleAssistant.py FabLabKannai-GoogleAssistant-3.py

※ ソースコードを修正
(env) $ patch -b FabLabKannai-GoogleAssistant.py < 4.patch

※ 修正したプログラムを実行
(env) $ FabLabKannai-GoogleAssistant.py
```
