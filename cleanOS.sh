#!/bin/bash

echo 'Let`s get started'
apt update && apt upgrade -y
echo 'Apt updated'
apt install mc make git openssl libpcre++-dev libssl-dev libxslt1-dev libgeoip-dev libgd-dev gcc -y
echo 'We install some bullshit'
mkdir /var/lib/nginx
touch /var/lib/nginx/body
mkdir /git
git init
cd /git/.git/
git remote add origin https://github.com/oshepkovsi/testing.git
git pull https://github.com/oshepkosi/testing.git

echo 'Now we download all needed files'

tar xzf echo-nginx-module-0.62.tar.gz
tar xzf nginx-1.23.1.tar.gz
tar xzf nginx-module-vts-0.2.1.tar.gz
tar xzf nginx-rtmp-module-master.tar.gz
echo 'Unzipping needed files'
#----------------------
cd /git/.git/	nginx-1.23.1/

./configure --with-cc-opt='-g -O2 -fPIE -fstack-protector-strong -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_addition_module --with-http_dav_module --with-http_geoip_module --with-http_image_filter_module --with-http_v2_module --with-http_sub_module --with-http_xslt_module --with-stream --with-stream_ssl_module --with-mail --with-mail_ssl_module --without-http_gzip_module --with-threads --add-module=/git/echo-nginx-module-0.62

make && make install

cp /usr/share/nginx/sbin/nginx /usr/sbin/nginx
cp /git/nginx.service /lib/systemd/system/nginx.service
systemctl stop nginx
systemctl enable nginx
systemctl stop nginx
#----------------------
./configure --with-cc-opt='-g -O2 -fPIE -fstack-protector-strong -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_addition_module --with-http_dav_module --with-http_geoip_module --with-http_image_filter_module --with-http_v2_module --with-http_sub_module --with-http_xslt_module --with-stream --with-stream_ssl_module --with-mail --with-mail_ssl_module --without-http_gzip_module --with-threads --add-module=/git/echo-nginx-module-0.62 --add-module=/git/nginx-rtmp-module-master

make && make install
cp /usr/share/nginx/sbin/nginx /usr/sbin/nginx_rtmp
cp /git/nginx_rtmp /lib/systemd/system/nginx_rtmp.service
#----------------------
./configure --with-cc-opt='-g -O2 -fPIE -fstack-protector-strong -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_addition_module --with-http_dav_module --with-http_geoip_module --with-http_image_filter_module --with-http_v2_module --with-http_sub_module --with-http_xslt_module --with-stream --with-stream_ssl_module --with-mail --with-mail_ssl_module --without-http_gzip_module --with-threads --add-module=/git/echo-nginx-module-0.62 --add-module=/git/nginx-module-vts-0.2.1

make && make install
cp /usr/share/nginx/sbin/nginx /usr/sbin/nginx_vts
cp /git/nginx_vts /lib/systemd/system/nginx_vts.service
#----------------------
./configure --with-cc-opt='-g -O2 -fPIE -fstack-protector-strong -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_addition_module --with-http_dav_module --with-http_geoip_module --with-http_image_filter_module --with-http_v2_module --with-http_sub_module --with-http_xslt_module --with-stream --with-stream_ssl_module --with-mail --with-mail_ssl_module --without-http_gzip_module --with-threads --add-module=/git/echo-nginx-module-0.62 --add-module=/git/nginx-module-vts-0.2.1 --add-module=/git/nginx-rtmp-module-master

make && make install
cp /usr/share/nginx/sbin /usr/sbin/nginx_all
cp /git/nginx_all.service /lib/systemd/system/nginx_all.service

echo 'Create the servises- OK'
echo 'DONE! NOW REBOOT!'




