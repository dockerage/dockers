# README #

This is Apache/2.4.7 (Ubuntu:14.04) image with SSL support. It has following data volumes:

- /var/www for your site content
- /var/log/apache2, optionally, if you want to store logfiles visibly outside the container
- /etc/ssl, optionally, if you wish to use SSL with real keys
- /etc/apache2, optionaly, all the apache2 configurations can be set from here

## A note on SSL ##

By defaults, Apache will use the bundled "snakeoil" cert/key when serving SSL. Obviously this is _NOT_ for production, so you should to mount production certs and keys onto /etc/ssl/ or /etc/apache2/ssl and change the related ssl configurations in the site conf.

## Simple Examples ##

Assuming www content at $(pwd)/vol/www/, the below will be sufficient to serve it. Note that many Docker users encourage mounting data from a storage container, rather than directly from the filesyetem.

Run apache container:

	# docker run -p 80:80 -p 443:443 -d dockerage/apache

Varify it is running:

	# curl http://localhost
or

	# curl -k https://localhost	

Run apache with www contents under $(pwd)/vol/www/:

	# docker run -p 80:80 -p 443:443 -d  -v $(pwd)/vol/www/:/var/www dockerage/apache


Run apache with custermized configurations under $(pwd)/vol/apache2/:

	# docker run -p 80:80 -p 443:443 -d  \
		-v $(pwd)/vol/mysite.conf:/etc/apache2/sites-enabled/mysite.conf \
		-v $(pwd)/vol/apache2/ssl:/etc/apache2/ssl \
		-v $(pwd)/vol/www/:/var/www \
		dockerage/apache

## More About Apache Configurations: [HTTPD - Apache2 Web Server](https://help.ubuntu.com/lts/serverguide)