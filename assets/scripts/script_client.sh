echo nameserver 192.245.1.1 > /etc/resolv.conf # Master
echo nameserver 192.245.2.1 >> /etc/resolv.conf # Slave
apt update
apt install dnsutils -y
apt install lynx -y
echo End of script