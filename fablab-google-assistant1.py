#!/usr/bin/env python
#
# $Id: fablab-google-assistant1.py,v 2.6 2017/11/23 10:45:02 ytani Exp $
#

# Copyright (C) 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


from __future__ import print_function

import argparse
import os.path
import json

import google.oauth2.credentials

from google.assistant.library import Assistant
from google.assistant.library.event import EventType
from google.assistant.library.file_helpers import existing_file

import subprocess
import RPi.GPIO as GPIO     # GPIOライブラリ

SOUND_DIR='/home/ytani/sound'
SOUND_ACK = [
        SOUND_DIR+'/computerbeep_43.mp3',
        SOUND_DIR+'/computerbeep_58.mp3',
        SOUND_DIR+'/computerbeep_12.mp3']

PIN_LED = 17                # LEDのピン番号(BCM)
PIN_BUTTON = 27             # ボタンのピン番号(BCM)
BOUNCE_MSEC = 500           # チャタリング防止用インターバル

def procButton(pin):
    print('*> procButton',(pin),': start')
    if pin == PIN_BUTTON:
        if GPIO.input(pin) == GPIO.HIGH:
            print('*** Push:', pin)
            assistant.start_conversation()
        else: # GPIO.LOW
            print('*** Release:', pin)
            assistant.stop_conversation()
    print('*< procButton',(pin),': end')

def play_ack(num):
    cmd = ['cvlc', '-q', '--play-and-exit', SOUND_ACK[num]]
    proc = subprocess.call(cmd)
    print('* play_ack(', num, '):', SOUND_ACK[num])

def process_event(event):
    """Pretty prints events.

    Prints all events that occur with two spaces between each new
    conversation and a single space between turns of a conversation.

    Args:
        event(event.Event): The current event to process.
    """

    if event.type == EventType.ON_START_FINISHED:
        play_ack(0)

    if event.type == EventType.ON_CONVERSATION_TURN_STARTED:
        play_ack(1)
        print()

    if event.type == EventType.ON_END_OF_UTTERANCE:
        play_ack(2)

    if event.type == EventType.ON_RECOGNIZING_SPEECH_FINISHED:
        speech_str = event.args['text']         # 認識した文章を取り出す
        if 'light' in speech_str:               # 文章を解析してLEDのON/OFF
            if 'on' in speech_str:
                GPIO.output(PIN_LED, GPIO.HIGH)
            elif 'off' in speech_str:
                GPIO.output(PIN_LED, GPIO.LOW)

    print(event)

    if (event.type == EventType.ON_CONVERSATION_TURN_FINISHED and
            event.args and not event.args['with_follow_on_turn']):
        if GPIO.input(PIN_BUTTON) == GPIO.HIGH:
            assistant.start_conversation()
        else:
            play_ack(0)
        print()


def main():
    global assistant                                # グローバル変数宣言

    # GPIOの初期化
    GPIO.setmode(GPIO.BCM)                          # ピンのナンバリング方法の設定
    GPIO.setup(PIN_LED, GPIO.OUT)                   # PIN_LEDを出力に設定
    GPIO.setup(PIN_BUTTON, GPIO.IN, GPIO.PUD_DOWN)  # PIN_BUTTONを入力に設定
    GPIO.add_event_detect(PIN_BUTTON, GPIO.BOTH,    # 割り込みコールバックの登録 
            callback=procButton, bouncetime=BOUNCE_MSEC)

    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--credentials', type=existing_file,
                        metavar='OAUTH2_CREDENTIALS_FILE',
                        default=os.path.join(
                            os.path.expanduser('~/.config'),
                            'google-oauthlib-tool',
                            'credentials.json'
                        ),
                        help='Path to store and read OAuth2 credentials')
    args = parser.parse_args()
    with open(args.credentials, 'r') as f:
        credentials = google.oauth2.credentials.Credentials(token=None,
                                                            **json.load(f))

    with Assistant(credentials) as assistant:
        for event in assistant.start():
            process_event(event)


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Ctrl-C')
    finally:
        print('GPIO.cleanup()')
        GPIO.cleanup()  # 重要：GPIOの終了処理
