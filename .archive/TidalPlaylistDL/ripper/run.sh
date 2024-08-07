#!/bin/bash

touch /config/links.txt

./scrape.sh

echo "*/15 * * * * /scrape.sh" > /cron
crontab /cron
service cron start
tail -f /dev/null
