echo "Starting Container Initialization Script."
if [ -z "$(ls -A /config)" ]; then
   echo "Initializing . . ."
   mkdir -p -v /config/cache
   mkdir -p -v /config/cache/pagespeed_cache
   mkdir -p -v /config/keys
   mkdir -p -v /config/log/nginx
   mkdir -p -v /config/log/pagespeed
   mkdir -p -v /config/log/php
   mkdir -p -v /config/nginx/site-confs
   mkdir -p -v /config/php
   mkdir -p -v /config/www
   mkdir -p -v /config/keys
   mkdir -p /var/cache/nginx | :
   cp /initializer/nginx.conf /config/nginx/nginx.conf
   cp /initializer/nginx.conf /config/nginx/fastcgi_params
   cp /initializer/nginx.conf /config/nginx/mime.types
   cp /initializer/nginx.conf /config/nginx/site-confs/default
   cp /initializer/nginx.conf /config/www/index.php
   echo "; Add any php.ini entry here to overwrite any php.ini configuration" > /config/php/php-overwrite.ini
   echo "Please replace yourdomain.com with your domain in /config/nginx/site-confs/default to enable pagespeed."
   exit 0
else
   echo "Already Initiated, Starting NGINX PageSpeed and PHP7.3"
   mkdir -p /var/cache/nginx | :
   echo "If you haven't yet, please replace yourdomain.com with your domain in /config/nginx/site-confs/default to enable pagespeed."
   cat /config/php/php-overwrite.ini >> /etc/php/7.3/fpm/php.ini
   exit 0
fi
