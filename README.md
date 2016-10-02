# Docker phpipam
#### Features
* Support of of Kea-1.1.0-beta (DHCP)
* Support of PowerDNS
* phpipam auto-installation

#### Roadmap
* Add phpipam-agent support
* Add "[Crons for phpIPAM ping check, DNS resolution and host discovery](https://github.com/phpipam/phpipam/issues/762)"
* See if patch from [fanfoni/phpipam]( https://bitbucket.org/thiagofanfoni/phpipam/src/4a96bc18b6b337e1cbffff9794a515e6b72eb780/Dockerfile?at=master&fileviewer=file-view-default) is needed


#### Sources
* [Docker RafPe/docker-phpipam](https://github.com/RafPe/docker-phpipam)
* [Docker fanfoni/phpipam](https://bitbucket.org/thiagofanfoni/phpipam)
* [Docker pierrecdn/phpipam](https://github.com/pierrecdn/phpipam)
* [Docker mrlesmithjr/docker-phpipam](mrlesmithjr/docker-phpipam)
* [phpipam.net](http://phpipam.net)

#### Misc

*Default login:* admin / ipamadmin

**Variable list**

| Variable         | Values        | Default |
| :----------------|:-------------:|--------:|
| DEBUG            | true or false | false   |
| PROXY_ENABLED    | true or false | false   |
| PROXY_ADDRESS    | any           | emtpy   |
| PROXY_PORT       | any           | empty   |
| PROXY_AUTH       | true or false | false   |
| PROXY_USER       | any           | empty   |
| PROXY_PASSWORD   | any           | empty   |
| SSL_OFFLOAD      | true or false | false   |
| DATABASE_HOST    | any           | empty   |
| DATABASE_PORT    | any           | 3306    |
| DATABAE_NAME     | any           | empty   |
| DATABASE_USER    | any           | root    |
| DATABAE_PASSWORD | any           | empty   |
