!#/bin/bash

# execute as user of app service

app=/var/www/node-express-example/current/app.js

source ~/.bash_profile
cd /var/www/node-express-example/current
forever stop ${app}
forever start ${app}

