#!/usr/bin/env python3
#

import json

CREDENTIAL_FNAME='credentials'
CREDENTIAL_PATH='/boot/'+CREDENTIAL_FNAME+'.json'

def main():
    try:
        with open(CREDENTIAL_PATH, 'r') as f:
            data = json.load(f)
    except json.JSONDecodeError as e:
        print(e)
    f.close()

    print(data['installed']['project_id'])

if __name__ == '__main__':
    main()
