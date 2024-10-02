# Jarkom-Modul-2-IT24-2024

| Nama | NRP |
|---|---|
|Amoes Noland|5027231028|
|Radella Chesa Syaharani|5027231064|

- [Soal 1](#soal-1)
- [Soal 2](#soal-2)
- [Soal 3](#soal-3)
- [Soal 4](#soal-4)
- [Soal 5](#soal-5)
- [Soal 6](#soal-6)

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