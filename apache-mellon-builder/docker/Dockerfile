FROM ubuntu:14.04
MAINTAINER dockerage <dockerage@gmail.com>

# Set the env variables to non-interactive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update && apt-get -yq install \
	build-essential \
	pkg-config \
	autoconf \
	devscripts \
	quilt \
	dh-make \
	automake \
	debhelper \
	equivs \
	fakeroot \
	lintian \
	patchutils \
    curl \
    wget \
	git \
	vim
	
RUN apt-get -yq install \
	apache2 \
	apache2-dev \
	liblasso3 \
	liblasso3-dev \
	libcurl3-dev

ADD debuild.sh /debuild.sh
RUN chmod 0755 /debuild.sh
RUN adduser --disabled-login --system debian
RUN mkdir /build && chown debian /build

VOLUME /build
WORKDIR /build
USER debian	

CMD ["bash", "/debuild.sh"]

