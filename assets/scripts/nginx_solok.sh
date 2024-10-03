apt update
apt install nginx -y

echo '
upstream webserver  {
    least_conn;
    server 192.245.1.3;
    server 192.245.1.4;
    server 192.245.2.3;
}

server {
  listen 31400;
  server_name solok.it24.com www.solok.it24.com;

  location / {
    proxy_pass http://webserver;
  }
}

server {
  listen 4697;
  server_name solok.it24.com www.solok.it24.com;

  location / {
    proxy_pass http://webserver;
  }
}

server {
    listen 80 default_server;
    server_name 192.245.3.1;

    return 301 http://www.solok.it24.com;
}

server {
  listen 8082;
  listen 8083;
  listen 8084;
  server_name 192.245.3.1;

  return 404;
}
' > /etc/nginx/sites-available/solok

ln -s /etc/nginx/sites-available/solok /etc/nginx/sites-enabled/solok
rm /etc/nginx/sites-enabled/default

service apache2 stop
service nginx restart