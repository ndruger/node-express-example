!#/bin/bash

# execute as user of app service

app=/var/www/node-express-example/current/app.js

source ~/node-express-example-config.sh
cd /var/www/node-express-example/current
NODE_ENV=production forever stop ${app}
NODE_ENV=production forever start ${app}

