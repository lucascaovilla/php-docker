#!/bin/bash

# Run npm install
if [ ! -d "node_modules" ]; then
        npm install
fi

# Run composer install
if [ ! -d "vendor" ]; then
        composer install
fi

# Start Laravel server
nohup php artisan serve --host=0.0.0.0 --port=8000 > /dev/null 2>&1 &

# Start npm watch in detached mode
#nohup npm run watch > /dev/null 2>&1 &
npm update --save/--save-dev -f
npm run watch
