#FROM dockerhub.stanford.edu/core/ubuntu:20150127-1
FROM ubuntu:vivid
MAINTAINER Xu Wang <xuwang@gmail.com>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get -yq install \
        apache2 \ 
		libapache2-mod-auth-mellon \
        curl \
		git
	
# Activate a2enmod
RUN a2enmod rewrite \
	  auth_mellon \
      cgi \
      headers \
      proxy \
      proxy_http \
      proxy_wstunnel \
	  ssl

	  
ADD apache2/mellon /etc/apache2/mellon
ADD apache2/ssl /etc/apache2/ssl
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

EXPOSE 80 443

# Expose apache conf, cgi-bin and docroot
VOLUME /etc/apache2/sites-enabled 
VOLUME /etc/apache2/conf-enabled 
VOLUME /etc/apache2/ssl 
VOLUME /etc/apache2/mellon 
VOLUME /usr/lib/cgi-bin 
VOLUME /var/www

CMD ["bash", "start.sh"]

