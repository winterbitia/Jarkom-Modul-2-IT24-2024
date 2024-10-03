iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.245.0.0/16
echo nameserver 192.168.122.1 > /etc/resolv.conf
echo End of script