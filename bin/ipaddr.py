#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import netifaces
import sys

#####
def get_ipaddr(ifn):
    ret_ip = {}
    
    for if_name in netifaces.interfaces():
        if if_name == 'lo':
            continue

        if len(ifn) > 0:
            if not if_name in ifn:
                continue
        
        addrs = netifaces.ifaddresses(if_name)

        try:
            ip = addrs[netifaces.AF_INET]
        except(KeyError):
            ip = []
            
        for a in ip:
            ret_ip[if_name]=a['addr']

    return(ret_ip)
    
##### Main
def main():
    sys.argv.pop(0)

    ip=get_ipaddr(sys.argv)

    for ifname in list(ip.keys()):
        print(ip[ifname] + ' ', end='')

    print()
    
if __name__ == '__main__':
    main()
