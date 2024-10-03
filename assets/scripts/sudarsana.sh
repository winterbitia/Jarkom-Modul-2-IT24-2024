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
cakra   IN      A       192.245.3.2     ; IP Bedahulu' > /etc/bind/jarkom/sudarsana.it24.com

service bind9 restart