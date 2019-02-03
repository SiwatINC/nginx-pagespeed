echo "Starting Container Initialization Script."
if [ -z "$(ls -A /config)" ]; then
   echo "Initializing . . ."
   mkdir -p /config/cache/pagespeed_cache
   mkdir -p /config/keys
   mkdir -p /config/log/nginx
   mkdir -p /config/log/pagespeed
   mkdir -p /config/log/php
   mkdir -p /config/nginx/site-confs
   mkdir -p /config/php
   mkdir -p /config/www
   mkdir -p /config/keys
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/nginx.conf" > /config/nginx/nginx.conf
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/fastcgi_params" > /config/nginx/fastcgi_params
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/mime.types" > /config/nginx/mime.types
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/default" > /config/nginx/site-confs/default
   echo "; Add any php.ini entry here to overwrite any php.ini configuration" > /config/php/php-overwrite.ini
   echo "Please edit your site configuration in the /config/nginx/site-confs/default directory to enable pagespeed"
else
   echo "Already Initiated, Starting NGINX PageSpeed and PHP7.2"
   cat /config/php/php-overwrite.ini >> /etc/php/7.2/fpm/php.ini
   exit 0
fi
