# Fast Reverse Proxy

https://github.com/fatedier/frp/

frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet. As of now, it supports TCP and UDP, as well as HTTP and HTTPS protocols, where requests can be forwarded to internal services by domain name.

frp also has a P2P connect mode.


---
### Schema

[![img](docs/img/schema.png)](docs/img/schema.png)


### Server 
Run in docker 
```bash
  cd ./server
  cp .env.example .env
  # change variables in .env
  docker-compose build
  docker-compose up -d
```
---
### Client
Run in docker
```bash
  cd ./client
  cp .env.example .env
  # change variables in .env
  docker-compose build
  docker-compose up -d
```