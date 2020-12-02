#!/bin/bash


if [ -d "/media/pi/BUZZMEDIA/buzz_video_songs/" ] ; then

	pkill -f chromium-browser

	cd /var/www/html/client/uploads/ && rm -rf video_songs 

	cp -R /media/pi/BUZZMEDIA/buzz_video_songs /var/www/html/client/uploads/video_songs

	php /var/www/html/client/artisan upload:songs

	php /var/www/html/client/artisan config:cache

	php /var/www/html/client/artisan view:clear

	php /var/www/html/client/artisan songs:log

	init 6

else
	echo "not found"

fi

