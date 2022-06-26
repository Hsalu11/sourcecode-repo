#!/bin/bash
pm2 delete all  # Delete all existing pm2 process 
pm2 start "ng serve --host 0.0.0.0 --port 4200" --name "Angular App" --watch #This will start angular app
cd API
pm2 start --name "Nodejs API" npm -- start #This will start Nodejs app

# Startup command
sudo env PATH=$PATH:/home/ubuntu/actions-runner/angular-app/_tool/node/14.19.1/x64/bin /home/ubuntu/actions-runner/angular-app/_tool/node/14.19.1/x64/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
pm2 save

# Working workflow
