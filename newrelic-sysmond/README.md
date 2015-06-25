# newrelic-sysmond

Run NewRelic server monitoring in a CoreOS fleet.

## Installation
* Check version
```
docker run --rm xuwang/newrelic-sysmond nrsysmond -v
```
* Replace NEW_RELIC_LICENSE_KEY and IMAGE in `envvars` with your NewRelic licence key and image name. 
* Optional Include Labels to `LABELS` variable in `newrelic-sysmond.service`.
* Startthe monitoring agent into your fleet

```bash
fleetctl start newrelic-sysmond.service
```
* Destroy the agent
```bash
fleetctl destroy newrelic-sysmond.service
```

## NewRelic Agent
[Getting started](https://docs.newrelic.com/docs/server/new-relic-servers)  
[Release Notes](https://docs.newrelic.com/docs/releases/linux_server)  
[Monitoring docker](http://newrelic.com/docker/)
