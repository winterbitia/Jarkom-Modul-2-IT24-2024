echo nameserver 192.245.1.1 > /etc/resolv.conf # Master
echo nameserver 192.245.2.1 >> /etc/resolv.conf # Slave

apt update
apt install apache2 libapache2-mod-php7.0 php wget unzip -y

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/pasopati.it24.com.conf

echo '
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html
    ServerName pasopati.it24.com
    ServerAlias www.pasopati.it24.com
</VirtualHost>
' > /etc/apache2/sites-available/pasopati.it24.com.conf

service apache2 start
a2ensite pasopati.it24.com.conf

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O lb.zip

unzip -o lb.zip -d lb
rm /var/www/html/index.html
cp lb/worker/index.php /var/www/html/index.php

service nginx stop
service apache2 restart