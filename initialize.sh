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
else
   echo "Already Initiated, Starting NGINX PageSpeed and PHP7.2"
   exit 0
fi
