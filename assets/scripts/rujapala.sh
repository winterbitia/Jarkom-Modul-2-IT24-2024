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