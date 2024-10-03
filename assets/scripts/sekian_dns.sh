echo 'zone "sekianterimakasih.it24.com" {
    type master;
    notify yes;
    file "/etc/bind/jarkom/sekianterimakasih.it24.com";
};' >> /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/sekianterimakasih.it24.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     sekianterimakasih.it24.com. root.sekianterimakasih.it24.com. (
                        2024100201      ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      sekianterimakasih.it24.com.
@       IN      A       192.245.1.4     ; IP Bedahulu
www     IN      CNAME   sekianterimakasih.it24.com.' > /etc/bind/jarkom/sekianterimakasih.it24.com

service bind9 restart