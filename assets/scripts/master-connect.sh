echo '
options {
        directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

        allow-query { any; };
        auth-nxdomain no; #conform to RFC1035
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

echo 'zone "sudarsana.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/sudarsana.it24.com";
};
zone "pasopati.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/pasopati.it24.com";
};
zone "rujapala.it24.com" {
    type slave;
    masters { 192.245.1.1; };
    file "/etc/bind/jarkom/rujapala.it24.com";
};' > /etc/bind/named.conf.local