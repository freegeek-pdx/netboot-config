#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward
/sbin/iptables -t nat -F
/sbin/iptables -F
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
/sbin/iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -d 192.168.253.93 -i eth1 -o eth0 -j ACCEPT
/sbin/iptables -A FORWARD -j REJECT
