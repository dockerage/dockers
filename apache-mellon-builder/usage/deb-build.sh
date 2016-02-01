#!/bin/sh

export VERSON=${1:-0.11.0}
export DEBEMAIL=${DEBEMAIL:-"dockerage@gmail.com"}
export DEBFULLNAME=${DEBFULLNAME:-"Docker Age"}

IMG='dockerage/apache-mellon-builder'

echo building libapache2-mod-auth-mellon_${VERSON}-1_amd64.deb debian package...
containerID=$(sudo docker run -d \
	-e VERSON="${VERSON}" \
	-e DEBEMAIL="${DEBEMAIL}" \
	-e DEBFULLNAME="${DEBFULLNAME}" \
	${IMG})
sudo docker wait $containerID

echo getting libapache2-mod-auth-mellon_${VERSON}-1_amd64.deb
docker cp $containerID:/build/libapache2-mod-auth-mellon_${VERSON}-1_amd64.deb .
echo getting libapache2-mod-auth-mellon_${VERSON}-1.dsc
docker cp $containerID:/build/libapache2-mod-auth-mellon_${VERSON}-1.dsc .
echo getting libapache2-mod-auth-mellon_${VERSON}-1.debian.tar.gz
docker cp $containerID:/build/libapache2-mod-auth-mellon_${VERSON}-1.debian.tar.gz .
echo getting libapache2-mod-auth-mellon_${VERSON}.orig.tar.gz
docker cp $containerID:/build/libapache2-mod-auth-mellon_${VERSON}.orig.tar.gz .
sleep 1
docker rm -f $containerID > /dev/null 2>&1
