wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1JGk8b-tZgzAOnDqTx5B3F9qN6AyNs7Zy' -O dir-listing.zip

unzip -o dir-listing.zip -d /var/www/jarkom/

echo '
server {
    listen 80;
    server_name sekianterimakasih.it24.com www.sekianterimakasih.it24.com;

    root /var/www/jarkom;
    index index.php index.html index.htm;

    location /dirlisting {
        alias /var/www/jarkom/dir-listing/worker2;
        autoindex on;
        autoindex_exact_size off;
        autoindex_format html;
        autoindex_localtime on;
    }

    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
}
' > /etc/nginx/sites-enabled/jarkom

service nginx restart