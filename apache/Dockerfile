FROM debian:stable
MAINTAINER dockerage <dockerage@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get -y install \
		apache2 \
	&& apt-get clean

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN /bin/ln -sf ../sites-available/default-ssl /etc/apache2/sites-enabled/001-default-ssl
RUN /bin/ln -sf ../mods-available/ssl.conf /etc/apache2/mods-enabled/
RUN /bin/ln -sf ../mods-available/ssl.load /etc/apache2/mods-enabled/

EXPOSE 80
EXPOSE 443

# Expose apache conf, cgi-bin, log and docroot
VOLUME /etc/apache2
VOLUME /etc/ssl
VOLUME /usr/lib/cgi-bin 
VOLUME /var/log/apache2
VOLUME /var/www

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

