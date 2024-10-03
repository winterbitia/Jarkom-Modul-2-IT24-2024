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