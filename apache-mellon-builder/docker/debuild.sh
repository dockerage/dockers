#!/bin/bash

# Set up the Debian maintenance environment variables
export DEBEMAIL=${DEBEMAIL:-xuwang@gmail.com}
export DEBFULLNAME=${DEBFULLNAME:-Xu Wang}

# Set up the release verson
VERSON=${VERSON:-0.10.0}

# Download the origin source tarball
curl -L "https://github.com/UNINETT/mod_auth_mellon/releases/download/v${VERSON}/mod_auth_mellon-${VERSON}.tar.gz" -o "libapache2-mod-auth-mellon_${VERSON}.orig.tar.gz" >/dev/null 2>&1

tar zxf "libapache2-mod-auth-mellon_${VERSON}.orig.tar.gz" >/dev/null 2>&1

# Download the debian package source
git clone https://anonscm.debian.org/git/collab-maint/modmellon.git

mv modmellon/debian mod_auth_mellon-${VERSON}
rm -rf modmellon

cd mod_auth_mellon-${VERSON}

dch -v ${VERSON}-1 "New upstream release. See https://github.com/UNINETT/mod_auth_mellon/releases/tag/v${VERSON}"

debuild -us -uc

rm -rf mod_auth_mellon-${VERSON}