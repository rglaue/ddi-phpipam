![phpipam](https://raw.githubusercontent.com/PierrickV/phpipam/master/images/logo.png "Phpipam.net logo")

# Docker image for phpIPAM

## Forked Documentation

This project is	forked from [Newlode/phpipam](https://github.com/Newlode/phpipam).

### Changes from what was forked

* docker-compose 3.5 configuration supported (was 2.0)

### What is DDI, How is it supported

DDI is an acronym for DNS/DHCP/IPAM; See [IP Address Management](https://en.wikipedia.org/wiki/IP_Address_Management)
* DNS: [PowerDNS](https://www.powerdns.com/)
* DHCP: [ISC Kea DHCP Server](https://www.isc.org/kea/)
* IPAM: [phpIPAM](https://phpipam.net/)

phpIPAM has support for PowerDNS, and has an
[issue #777](https://github.com/phpipam/phpipam/issues/777)
open about Kea DHCP integration.
There is an alternative that uses a scripted approach to writing out a DHCPd
configuration file: [https://github.com/debops/phpipam-scripts](https://github.com/debops/phpipam-scripts))


DDI is a suite of services to manage dynamic and static IP assignment within
Computing Infrastructure. The desire is to have a central administrative
system for tracking this information, and making it available to domain name
and IP services.

phpIPAM has a REST api that can be leveraged to assist assignment of IPs in
provisioning systems that want to use static assignment. This could be IaC
(Infrastructure as Code), or Virtual Machine provisioning. phpIPAM integrates
with PowerDNS which provides Authoritative DNS services. And progress is
moving with ISC Kea integration to manage dynamic (DHCP) assignment. DHCP is
also widely used in Virtual Machine provisioning systems.

### How to use this fork 
Give docker interfaces trusted privilege to pass traffic through the firewall
* docker0 is the docker interface
* br-ddi_net is the container bridge interface defined in docker-compose.yml
```
firewall-cmd --zone=trusted --add-interface=docker0   
firewall-cmd --permanent --zone=trusted --add-interface=docker0
firewall-cmd --zone=trusted --add-interface=br-ddi_net
firewall-cmd --permanent --zone=trusted --add-interface=br-ddi_net
```
Clone this forked repository, and bring up the containers
```
git clone https://github.com/rglaue/ddi-phpipam.git
sudo docker-compose up -d
```

### How to configure the DDI setup

#### Enable the PowerDNS and (optionally) API modules in phpIPAM

- under SERVER MANAGEMENT (in the left side bar)
  - click on "phpIPAM settings"
    - under Feature settings > (enable modules by changing the switch from OFF to ON)
      - API: ON
      - Enable PowerDNS: ON
    - Click [Save] button  (scroll to bottom)

After enabling these modules, you will see them appear in the the left side bar: "API", "PowerDNS".

#### Connect phpIPAM to the the PowerDNS database

- SERVER MANAGEMENT > PowerDNS > Settings
  - Host
    - change value to: powerdns_db    (this is the hostname defined in docker-compose.yml)

#### Using phpIPAM API

- DDI phpIPAM API URL: http://localhost/api/
- [Example API calls using cURL](https://phpipam.net/news/api_example_curl/)



**[End of Forked Documentation]**

## How to use

```
git clone https://github.com/Newlode/phpipam.git
sudo docker-compose up
```

## Features
* Based on [debian/stretch](https://hub.docker.com/_/debian/)
* phpipam auto-installation
* ~~Support of of [Kea-1.1.0-beta](http://kea.isc.org/wiki) (DHCP)~~ - [Not working yet](https://github.com/phpipam/phpipam/issues/777)
* Support of [PowerDNS](https://www.powerdns.com/)
* Support of SNMP

## Roadmap
* Make the PROXY_ variables work
* Add phpipam-agent support
* Add "[Crons for phpIPAM ping check, DNS resolution and host discovery](https://github.com/phpipam/phpipam/issues/762)"
* See if patch from [fanfoni/phpipam](https://bitbucket.org/thiagofanfoni/phpipam/commits/4a96bc18b6b337e1cbffff9794a515e6b72eb780?at=master) is needed

## Misc

### Default login:
admin / ipamadmin

### PowerDns configuration exemple:
![PowerDns configuration Example](https://raw.githubusercontent.com/PierrickV/phpipam/master/images/powerdns_conf.png)

## Variable list

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
| DATABASE_NAME     | any           | empty   |
| DATABASE_USER    | any           | root    |
| DATABASE_PASSWORD | any           | empty   |

## Sources

* [RafPe/docker-phpipam](https://github.com/RafPe/docker-phpipam)
* [fanfoni/phpipam](https://bitbucket.org/thiagofanfoni/phpipam)
* [pierrecdn/phpipam](https://github.com/pierrecdn/phpipam)
* [mrlesmithjr/docker-phpipam](mrlesmithjr/docker-phpipam)
* [phpipam.net](http://phpipam.net)
