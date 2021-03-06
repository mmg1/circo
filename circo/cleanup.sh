#!/bin/bash
# Small script to clean up after testing & running circo.py (single mode)

kill -9 `ps ax | grep telnetd-fake | grep -v grep | awk '{print $1}'` 2>/dev/null
kill -9 `ps ax | grep sshd-fake | grep -v grep | awk '{print $1}'` 2>/dev/null
kill -9 `ps ax | grep snmposter | grep -v grep | awk '{print $1}'` 2>/dev/null
kill -9 `ps ax | grep nmap | grep -v grep | awk '{print $1}'` 2>/dev/null
rm Cisco_2960-fake.snmpwalk *CRED.txt cli.conf agent.csv ssh_rsa.key.pub ssh_rsa.key 2>/dev/null
ip link set wlan1 down
iw wlan1 set type managed
ip link set wlan1 up
ifconfig eth0 down >/dev/null
iptables -F
