echo '
options {
        directory "/var/cache/bind";
        allow-query { any; };
        auth-nxdomain no; #conform to RFC1035
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

echo 'zone "sudarsana.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/sudarsana.it24.com";
};
zone "pasopati.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/pasopati.it24.com";
};
zone "rujapala.it24.com" {
    type master;
    notify yes;
    also-notify { 192.245.2.1; };
    allow-transfer { 192.245.2.1; };
    file "/etc/bind/jarkom/rujapala.it24.com";
};
zone "2.245.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.245.192.in-addr.arpa";
};' > /etc/bind/named.conf.local