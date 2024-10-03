# Jarkom-Modul-2-IT24-2024

| Nama | NRP |
|---|---|
|Amoes Noland|5027231028|
|Radella Chesa Syaharani|5027231064|

## Daftar Soal

- [Soal 1](#soal-1)
- [Soal 2](#soal-2)
- [Soal 3](#soal-3)
- [Soal 4](#soal-4)
- [Soal 5](#soal-5)
- [Soal 6](#soal-6)
- [Soal 7](#soal-7)
- [Soal 8](#soal-8)
- [Soal 9](#soal-9)
- [Soal 10](#soal-10)
- [Soal 11](#soal-11)
- [Soal 12](#soal-12)
- [Soal 13](#soal-13)

## Script Umum

### Nusantara (Router)

```sh
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.245.0.0/16
echo nameserver 192.168.122.1 > /etc/resolv.conf
echo End of script
```

### Sriwijaya, Mahapahit (DNS Master/Slave)

```sh
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt update
apt install bind9 -y
echo End of script
```

### Sanjaya, Jayanegara, Anusapati (Clients)

```sh
echo nameserver 192.245.1.1 > /etc/resolv.conf
echo End of script
```


## Soal 1

### Nusantara (Router)

```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.245.1.2
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.245.2.2
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.245.3.2
	netmask 255.255.255.0
```

### Sriwijaya (DNS Master)

```
auto eth0
iface eth0 inet static
	address 192.245.1.1
	netmask 255.255.255.0
	gateway 192.245.1.2
```

### Majapahit (DNS Slave)

```
auto eth0
iface eth0 inet static
	address 192.245.2.1
	netmask 255.255.255.0
	gateway 192.245.2.2
```

### Tanjungkulai (Web Server)

```
auto eth0
iface eth0 inet static
	address 192.245.1.3
	netmask 255.255.255.0
	gateway 192.245.1.2
```

### Bedahulu (Web Server)

```
auto eth0
iface eth0 inet static
	address 192.245.1.4
	netmask 255.255.255.0
	gateway 192.245.1.2
```

### Kotalingga (Web Server)

```
auto eth0
iface eth0 inet static
	address 192.245.2.3
	netmask 255.255.255.0
	gateway 192.245.2.2
```

### Sanjaya (Client)

```
auto eth0
iface eth0 inet static
	address 192.245.1.11
	netmask 255.255.255.0
	gateway 192.245.1.2
```

### Jayanegara (Client)

```
auto eth0
iface eth0 inet static
	address 192.245.2.11
	netmask 255.255.255.0
	gateway 192.245.2.2
```

### Anusapati (Client)

```
auto eth0
iface eth0 inet static
	address 192.245.2.12
	netmask 255.255.255.0
	gateway 192.245.2.2
```

### Solok (Load Balancer)

```
auto eth0
iface eth0 inet static
	address 192.245.3.1
	netmask 255.255.255.0
	gateway 192.245.3.2
```

## Soal 2

### Script Solok (sudarsana.it24.com)

```sh
echo 'zone "sudarsana.it24.com" {
    type master;
    notify yes;
    file "/etc/bind/jarkom/sudarsana.it24.com";
};' > /etc/bind/named.conf.local

mkdir -p /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/sudarsana.it24.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     sudarsana.it24.com. root.sudarsana.it24.com. (
                        2024100201      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      sudarsana.it24.com.
@       IN      A       192.245.3.1     ; IP Solok
www     IN      CNAME   sudarsana.it24.com.' > /etc/bind/jarkom/sudarsana.it24.com

service bind9 restart
```

## Soal 3

### Script Kotalingga (pasopati.it24.com)

```sh
echo 'zone "pasopati.it24.com" {
    type master;
    notify yes;
    file "/etc/bind/jarkom/pasopati.it24.com";
};' >> /etc/bind/named.conf.local

mkdir -p /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/pasopati.it24.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     pasopati.it24.com. root.pasopati.it24.com. (
                        2024100201      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      pasopati.it24.com.
@       IN      A       192.245.2.3     ; IP Kotalingga
www     IN      CNAME   pasopati.it24.com.' > /etc/bind/jarkom/pasopati.it24.com

service bind9 restart
```

## Soal 4

### Script Tanjungkulai (rujapala.it24.com)

```sh
echo 'zone "rujapala.it24.com" {
    type master;
    notify yes;
    file "/etc/bind/jarkom/rujapala.it24.com";
};' >> /etc/bind/named.conf.local

mkdir -p /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/rujapala.it24.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     rujapala.it24.com. root.rujapala.it24.com. (
                        2024100201      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      rujapala.it24.com.
@       IN      A       192.245.1.3     ; IP Tanjungkulai
www     IN      CNAME   rujapala.it24.com.' > /etc/bind/jarkom/rujapala.it24.com

service bind9 restart
```

## Soal 5

### Sanjaya

![Sanjaya](assets/gallery/5_1.png)

### Jayanegara

![Jayanegara](assets/gallery/5_2.png)

### Anusapati

![Anusapati](assets/gallery/5_3.png)

## Soal 6

### Script Reverse DNS Kotalingga

```sh
echo 'zone "2.245.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.245.192.in-addr.arpa";
};' >> /etc/bind/named.conf.local

mkdir -p /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/2.245.192.in-addr.arpa

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     pasopati.it24.com. root.pasopati.it24.com. (
                        2024100201         ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
2.245.192.in-addr.arpa.      IN      NS      pasopati.it24.com.
3                            IN      PTR     pasopati.it24.com.' > /etc/bind/jarkom/2.245.192.in-addr.arpa

service bind9 restart
```

### Modifikasi pada Client script

```sh
echo nameserver 192.245.1.1 > /etc/resolv.conf
apt update
apt install dnsutils -y
echo End of script
```

## Soal 7

### Script untuk named.conf.local (DNS Master)

```sh
echo 'zone "sudarsana.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/sudarsana.it24.com";
};
zone "pasopati.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/pasopati.it24.com";
};
zone "rujapala.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/rujapala.it24.com";
};
zone "2.245.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.245.192.in-addr.arpa";
};' > /etc/bind/named.conf.local
```

### Script untuk named.conf.local (DNS Slave)

```sh
echo 'zone "sudarsana.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/sudarsana.it24.com";
};
zone "pasopati.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/pasopati.it24.com";
};
zone "rujapala.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/rujapala.it24.com";
};' > /etc/bind/named.conf.local
```

### Modifikasi pada Client script

```sh
echo nameserver 192.245.1.1 > /etc/resolv.conf # Master
echo nameserver 192.245.2.1 >> /etc/resolv.conf # Slave
apt update
apt install dnsutils -y
echo End of script
```

## Soal 8

### Modifikasi Script Sudarsana untuk Subdomain

```sh
echo 'zone "sudarsana.it24.com" {
    type master;
    notify yes;
    file "/etc/bind/jarkom/sudarsana.it24.com";
};' > /etc/bind/named.conf.local

mkdir -p /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/sudarsana.it24.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     sudarsana.it24.com. root.sudarsana.it24.com. (
                        2024100201      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      sudarsana.it24.com.
@       IN      A       192.245.3.1     ; IP Solok
www     IN      CNAME   sudarsana.it24.com.
cakra	IN      A       192.245.3.2     ; IP Bedahulu' > /etc/bind/jarkom/sudarsana.it24.com

service bind9 restart
```

## Soal 9

### Modifikasi Script Pasopati untuk Subdomain (Sriwijaya)

```sh
echo 'zone "pasopati.it24.com" {
    type master;
    notify yes;
    file "/etc/bind/jarkom/pasopati.it24.com";
};' >> /etc/bind/named.conf.local

mkdir -p /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/pasopati.it24.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     pasopati.it24.com. root.pasopati.it24.com. (
                        2024100201      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      pasopati.it24.com.
@       IN      A       192.245.2.3     ; IP Kotalingga
www     IN      CNAME   pasopati.it24.com.
ns1		IN		A		192.245.2.1		; delegasi IP Majapahit
panah	IN		NS		ns1				; subdomain IP delegasi'> /etc/bind/jarkom/pasopati.it24.com

service bind9 restart
```

### Script Subdomain Delegasi Panah (Majapahit)

```sh
echo 'zone "panah.pasopati.it24.com" {
    type master;
    notify yes;
    file "/etc/bind/panah/panah.pasopati.it24.com";
};' >> /etc/bind/named.conf.local

mkdir -p /etc/bind/panah

cp /etc/bind/db.local /etc/bind/panah/panah.pasopati.it24.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     panah.pasopati.it24.com. root.panah.pasopati.it24.com. (
                        2024100201      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      panah.pasopati.it24.com.
@       IN      A       192.245.2.3     ; IP Kotalingga
www     IN      CNAME   panah.pasopati.it24.com.'> /etc/bind/panah/panah.pasopati.it24.com

service bind9 restart
```

### Modifikasi script untuk named.conf.local (DNS Master)

```sh
echo '
options {
	directory "/var/cache/bind";
	allow-query { any; };
	auth-nxdomain no; #conform to RFC1035
	listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

echo 'zone "sudarsana.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/sudarsana.it24.com";
};
zone "pasopati.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/pasopati.it24.com";
};
zone "rujapala.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/rujapala.it24.com";
};
zone "2.245.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.245.192.in-addr.arpa";
};' > /etc/bind/named.conf.local
```

### Modifikasi script untuk named.conf.local (DNS Slave)

```sh
echo '
options {
	directory "/var/cache/bind";
	allow-query { any; };
	auth-nxdomain no; #conform to RFC1035
	listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

echo 'zone "sudarsana.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/sudarsana.it24.com";
};
zone "pasopati.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/pasopati.it24.com";
};
zone "rujapala.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/rujapala.it24.com";
};' > /etc/bind/named.conf.local
```

## Soal 10

### Modifikasi Script Subdomain Delegasi Panah

```sh
echo 'zone "panah.pasopati.it24.com" {
    type master;
    notify yes;
    file "/etc/bind/panah/panah.pasopati.it24.com";
};' >> /etc/bind/named.conf.local

mkdir -p /etc/bind/panah

cp /etc/bind/db.local /etc/bind/panah/panah.pasopati.it24.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     panah.pasopati.it24.com. root.panah.pasopati.it24.com. (
                        2024100201      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      panah.pasopati.it24.com.
@       IN      A       192.245.2.3     ; IP Kotalingga
www     IN      CNAME   panah.pasopati.it24.com.
log     IN      A       192.245.2.3     ; IP Kotalingga
www.log IN      CNAME   panah.pasopati.it24.com.'> /etc/bind/panah/panah.pasopati.it24.com

service bind9 restart
```

## Soal 11

### Modifikasi script untuk named.conf.local (Majapahit)

```sh
echo '
options {
	directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

	allow-query { any; };
	auth-nxdomain no; #conform to RFC1035
	listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

echo 'zone "sudarsana.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/sudarsana.it24.com";
};
zone "pasopati.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/pasopati.it24.com";
};
zone "rujapala.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/rujapala.it24.com";
};' > /etc/bind/named.conf.local
```

### Hasil ping luar tanpa nameserver NAT

![ping google.com](assets/gallery/11_1.png)

## Soal 12

### Modifikasi pada Client script

```sh
echo nameserver 192.245.1.1 > /etc/resolv.conf # Master
echo nameserver 192.245.2.1 >> /etc/resolv.conf # Slave
apt update
apt install dnsutils -y
apt install lynx -y
echo End of script
```

### Script di Kotalingga

```sh
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt update
apt install apache2 libapache2-mod-php7.0 php wget unzip -y

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/pasopati.it24.com.conf

echo '
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/pasopati.it24.com
    ServerName pasopati.it24.com
    ServerAlias www.pasopati.it24.com
</VirtualHost>
' > /etc/apache2/sites-available/pasopati.it24.com.conf

mkdir -p /var/www/pasopati.it24.com

a2ensite pasopati.it24.com.conf

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O lb.zip

unzip lb.zip -d lb

mv lb/* /var/www/pasopati.it24.com

cp /var/www/pasopati.it24.com/worker/index.php /var/www/pasopati.it24.com/index.php

cp /var/www/pasopati.it24.com/index.php /var/www/html/index.php
rm /var/www/html/index.html

service apache2 restart
```

## Soal 13

### Script Load Balancer Solok

```sh
apt update
apt install apache2 -y

a2enmod proxy
a2enmod proxy_balancer
a2enmod proxy_http
a2enmod lbmethod_byrequests

echo '
echo nameserver 192.168.122.1 > /etc/resolv.conf

<VirtualHost *:80>
    <Proxy balancer://mycluster>
        BalancerMember http://192.245.1.3
        BalancerMember http://192.245.2.4
        BalancerMember http://192.245.2.3
        ProxySet lbmethod=byrequests
    </Proxy>

    ProxyPass / balancer://mycluster/
    ProxyPassReverse / balancer://mycluster/

</VirtualHost>
' > /etc/apache2/sites-available/000-default.conf

service apache2 restart
```

### Script Web Server (web.sh)

```sh
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt update
apt install apache2 libapache2-mod-php7.0 php wget unzip -y

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O lb.zip

unzip lb.zip -d lb
rm /var/www/html/index.html
cp lb/worker/index.php /var/www/html/index.php

service apache2 restart
```