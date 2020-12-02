#!/bin/bash


if [ -d "/media/adminpc/BUZZMEDIA/buzz_video_songs/" ] ; then

	pkill -f chromium-browser

	cd /home/adminpc/lampstack-7.1.20-1/apache2/htdocs/client/uploads/ && rm -rf video_songs 

	cp -R /media/adminpc/BUZZMEDIA/buzz_video_songs /home/adminpc/lampstack-7.1.20-1/apache2/htdocs/client/uploads/video_songs/

	/home/adminpc/lampstack-7.1.20-1/php/bin/php /home/adminpc/lampstack-7.1.20-1/apache2/htdocs/client/artisan upload:songs

	/home/adminpc/lampstack-7.1.20-1/php/bin/php /home/adminpc/lampstack-7.1.20-1/apache2/htdocs/client/artisan config:cache

	/home/adminpc/lampstack-7.1.20-1/php/bin/php /home/adminpc/lampstack-7.1.20-1/apache2/htdocs/client/artisan view:clear

	/home/adminpc/lampstack-7.1.20-1/php/bin/php /home/adminpc/lampstack-7.1.20-1/apache2/htdocs/client/artisan songs:log
	init 6

else
	echo "not found"

fi

