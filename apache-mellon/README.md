# SSO ReverseProxy Service

This service acting as a SSO proxy to backend services. It is basically a Apache server with [`mod_auth_mellon`][mod_auth_mellon] and mod_proxy.

Apache module [`mod_auth_mellon`][mod_auth_mellon] enables you to authenticate users of a web site against a SAML 2.0 enabled IdP. It can grant access to paths and provide attributes to other modules and applications.

## Service Configuration

### The backend service configurations should be put in:

		vols/apache2/sites-enabled/
		vold/apache2/conf-enabled/

### The SSL certs and keys should be in:

		vols/apache2/ssl/

### The auth_mellon conf should be in:

		vols/apache2/mellon

see [auth_mellon configuration spec][mod_auth_mellon] for more details

## Start Service
Before start the SSO-Proxy service, make sure the backend service is runing.
Then start SSO-proxy:

	docker run -d --name apache-mellon \
		-p 443:443 \
		-v $(pwd)/vols/apache2/sites-enabled:/etc/apache2/sites-enabled \
		-v $(pwd)/vols/apache2/conf-enabled:/etc/apache2/conf-enabled \
		-v $(pwd)/vols/apache2/mellon:/etc/apache2/mellon \
		-v $(pwd)/vols/apache2/ssl:/etc/apache2/ssl \
		-v $(pwd)/vols/usr/lib/cgi-bin:/usr/lib/cgi-bin \
		dockerage/apache-mellon


## Know Issus
* Bad SSO request with wrong timestamp
  If Mac OS X laptop goes to sleep while the VM is running, when the laptop wakes up, all the clocks are wrong in the VM and in the containers. When this happened, SSO requests may have expired timestamps and the auth will fail.

Check VM time status:

	timedatectl status

Usually reload the VM will solve the problem:

	vagrant reload


[mod_auth_mellon]: https://github.com/UNINETT/mod_auth_mellon/blob/master/README
