FROM ubuntu:14.04
MAINTAINER dockerage <dockerage@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install apache2
	
RUN a2enmod ssl && a2ensite default-ssl

VOLUME /var/www
VOLUME /var/log/apache2

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

