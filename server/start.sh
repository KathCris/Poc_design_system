#!/bin/sh

nginx -g 'daemon off;' &
pm2-runtime start npm -- start
