# Jarkom-Modul-2-IT24-2024

| Nama | NRP |
|---|---|
|Amoes Noland|5027231028|
|Radella Chesa Syaharani|5027231064|

- [Soal 1](Soal_1)

## Script Umum

### Nusantara (Router)

```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.245.0.0/16
echo nameserver 192.168.122.1 > /etc/resolv.conf
echo End of script
```

### Sriwijaya, Mahapahit (DNS Master/Slave)

```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt update
apt install bind9 -y
echo End of script
```

### Sanjaya, Jayanegara, Anusapati (Clients)

```
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

### Script Solok
