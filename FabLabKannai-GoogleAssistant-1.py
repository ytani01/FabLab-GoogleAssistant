#!/usr/bin/env python

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


import subprocess           # コマンドを実行するためのライブラリ

# 音源データ
SOUND_DIR='/home/pi/sound'
SOUND_ACK = [
        SOUND_DIR+'/computerbeep_43.mp3',
        SOUND_DIR+'/computerbeep_58.mp3',
        SOUND_DIR+'/computerbeep_12.mp3']

proc = None

# 確認音の再生
def play_ack(num):
    global proc

    print('> play_ack(', num, '): ', end='')
    if proc != None:
        proc.terminate()
        print('proc.terminate(): ', end='')
    cmd = ['cvlc', '-q', '--play-and-exit', SOUND_ACK[num]]
    proc = subprocess.Popen(cmd)
    print(cmd)

def process_event(event):
    """Pretty prints events.

    Prints all events that occur with two spaces between each new
    conversation and a single space between turns of a conversation.

    Args:
        event(event.Event): The current event to process.
    """
    if event.type == EventType.ON_CONVERSATION_TURN_STARTED:
        print()

    print(event)

    if event.type == EventType.ON_START_FINISHED:
        play_ack(0)

    if event.type == EventType.ON_CONVERSATION_TURN_STARTED:
        play_ack(1)

    if event.type == EventType.ON_END_OF_UTTERANCE:
        play_ack(2)

    if (event.type == EventType.ON_CONVERSATION_TURN_FINISHED and
            event.args and not event.args['with_follow_on_turn']):
        print()
        play_ack(0)


def main():
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
    main()