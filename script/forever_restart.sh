!#/bin/bash

# execute as user of app service

app=/var/www/node-express-example/current/app.js

source ~/.bash_profile
cd /var/www/node-express-example/current
source /var/www/node-express-example/current/config/config.sh
NODE_ENV=production forever stop ${app}
NODE_ENV=production forever start ${app}

