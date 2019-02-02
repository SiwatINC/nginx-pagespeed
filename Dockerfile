FROM siwatinc/ubuntubaseimage_unraid
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install openssl libssl-dev build-essential zlib1g-dev libpcre3-dev uuid-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y install libxml2 libxslt1-dev libgd-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y install libgeoip-dev google-perftools && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y install libgoogle-perftools-dev libgoogle-perftools4 && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN cd $home && wget https://ngxpagespeed.com/install && chmod +x ./install && ./install -n latest -y -a '--prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib/nginx/modules --conf-path=/config/nginx/nginx.conf --error-log-path=/config/log/error.log --http-log-path=/config/log/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --with-http_ssl_module --with-http_v2_module --with-select_module --with-poll_module --with-threads --with-file-aio --with-http_realip_module --with-http_addition_module --with-http_xslt_module --with-http_image_filter_module --with-http_geoip_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_slice_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-stream --with-google_perftools_module '
RUN add-apt-repository ppa:ondrej/php && apt-get -y update
RUN apt-get -y --quiet install php7.2 php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml php7.2-fpm php7.2-cgi php7.2-dom php7.2-gmagick && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN cat /config/php/php-local.ini >> /etc/php/7.2/fpm/php.ini
CMD cat service php7.2-fpm start && nginx
