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