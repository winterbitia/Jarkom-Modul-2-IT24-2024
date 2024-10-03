apt update
apt install nginx php php-fpm -y

mkdir -p /var/www/jarkom
cp /var/www/html/index.php /var/www/jarkom/index.php

echo '
server {
    listen 80;

    root /var/www/jarkom;

    index index.php index.html index.htm;
    server_name _;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    error_log /var/log/nginx/jarkom_error.log;
    access_log /var/log/nginx/jarkom_access.log;
}
' > /etc/nginx/sites-available/jarkom

ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom
rm -rf /etc/nginx/sites-enabled/default

service apache2 stop
service nginx restart
service php7.0-fpm stop
service php7.0-fpm start