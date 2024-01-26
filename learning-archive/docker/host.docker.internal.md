### THIS IS TO SOLVE THE HOST.DOCKER.INTERNAL NOT WORKING ON LINUX

The equivalent of host.docker.internal on Linux is 172.17.0.1. You can use this IP address to connect to the host machine from within a Docker container. If you’re running with --net=host or Just for the record: within Docker Componse, network_mode: "host", localhost should work fine. If you’re using default networking, use the static IP address 172.17.0.1. I hope that helps!

## DOCKER RUN FLAG

`--add-host=host.docker.internal:host-gateway`

## DOCKER COMPOSE

```
version: '3.7'
services:
    fpm:
        build:
            context: .
        extra_hosts:
            - "host.docker.internal:host-gateway"
```

### Whats is host.docker.internal

- "host.docker.internal" => Is a default name docker uses to point to it default host e.g. 172.17.0.1 in `/etc/hosts`.
- "host.docker.internal:host-gateway" => This is a way of manually pointing docker to a custom host in `/etc/hosts`. e.g. host.docker.internal:172.17.0.1 will add 172.17.0.1 to hosts in `/etc/hosts` and point host.docker.internal to it. Making things like http://host.docker.internal:5000 possible.
