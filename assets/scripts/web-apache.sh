echo nameserver 192.245.1.1 > /etc/resolv.conf # Master
echo nameserver 192.245.2.1 >> /etc/resolv.conf # Slave

apt update
apt install apache2 libapache2-mod-php7.0 php wget unzip -y

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O lb.zip

unzip -o lb.zip -d lb
rm /var/www/html/index.html
cp lb/worker/index.php /var/www/html/index.php

service nginx stop
service apache2 restart