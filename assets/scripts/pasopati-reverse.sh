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
ns1     IN      A       192.245.2.1     ; delegasi IP Majapahit
panah   IN      NS      ns1             ; subdomain IP delegasi'> /etc/bind/jarkom/pasopati.it24.com

service bind9 restart