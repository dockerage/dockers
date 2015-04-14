FROM dockerage/apache
MAINTAINER Xu Wang <xuwang@gmail.com>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get -yq install \
		liblasso3 \
	&& apt-get clean

# Install mod-auth-mellon 0.10.0, the deb is create by apache-mellon-builder
ADD ./libapache2-mod-auth-mellon_0.10.0-1_amd64.deb  /tmp/libapache2-mod-auth-mellon_0.10.0-1_amd64.deb
RUN dpkg -i /tmp/libapache2-mod-auth-mellon_0.10.0-1_amd64.deb \
	&& rm /tmp/libapache2-mod-auth-mellon_0.10.0-1_amd64.deb

# Activate a2enmod
RUN a2enmod \
		rewrite \
		auth_mellon \
		headers \
		proxy \
		proxy_http \
		proxy_wstunnel