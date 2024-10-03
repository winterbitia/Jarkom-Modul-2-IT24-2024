echo nameserver 192.168.122.1 > /etc/resolv.conf

apt update
apt install apache2 -y

a2enmod proxy
a2enmod proxy_balancer
a2enmod proxy_http
a2enmod lbmethod_byrequests

echo '
<VirtualHost *:80>
    <Proxy balancer://mycluster>
        BalancerMember http://192.245.1.3
        BalancerMember http://192.245.1.4
        BalancerMember http://192.245.2.3
        ProxySet lbmethod=byrequests
    </Proxy>

    ProxyPass / balancer://mycluster/
    ProxyPassReverse / balancer://mycluster/

</VirtualHost>
' > /etc/apache2/sites-available/000-default.conf

service nginx stop
service apache2 restart