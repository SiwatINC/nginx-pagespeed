FROM ghcr.io/siwatinc/siwat-ubuntubaseimage:focal
ENV DEBIAN_FRONTEND noninteractive
ARG cachebust=1
RUN apt-get update
RUN apt-get -y install openssl libssl-dev build-essential zlib1g-dev libpcre3-dev uuid-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y install libxml2 libxslt1-dev libgd-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y install libgeoip-dev google-perftools && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y install libgoogle-perftools-dev libgoogle-perftools4 && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN cd / && git clone https://github.com/arut/nginx-rtmp-module.git && wget http://labs.frickle.com/files/ngx_cache_purge-2.3.tar.gz && tar -xvzf ./ngx_cache_purge-2.3.tar.gz && wget https://ngxpagespeed.com/install
RUN cd / && chmod +x ./install && ./install -n latest -y -a '--prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --with-cc-opt="-Wimplicit-fallthrough=0" --add-module=/nginx-rtmp-module --add-module=/ngx_cache_purge-2.3 --modules-path=/usr/lib/nginx/modules --conf-path=/config/nginx/nginx.conf --error-log-path=/config/log/error.log --http-log-path=/config/log/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --with-http_ssl_module --with-http_v2_module --with-select_module --with-poll_module --with-threads --with-file-aio --with-http_realip_module --with-http_addition_module --with-http_xslt_module --with-http_image_filter_module --with-http_geoip_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_slice_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-stream --with-google_perftools_module '
RUN add-apt-repository ppa:ondrej/php && apt-get -y update
RUN apt-get update && apt-get -y --quiet install php7.3 php7.3-ldap php7.3-apcu php7.3-intl php-pear php7.3-curl php7.3-sqlite3 php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-fpm php7.3-cgi php7.3-dom php7.3-gmagick && apt-get clean && rm -rf /var/lib/apt/lists/*
ADD . /initializer
CMD chmod +x /initializer/initialize-builtin.sh && /initializer/initialize-builtin.sh && service php7.3-fpm start && nginx
