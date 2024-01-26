# EC2 setup

1. create an instace.

- provide a name for the instance
- select AMI (amazon machine image), instance type e.g. t2.micro.
- create a key pair to access the machine, through ssh.
- network configurations, select subnets (availability zones).
- configure storage.
- configure your security groups (firewall) e.g. allow http request from all Ips (IPv4 || 0.0.0.0/0)

2. Create an Elastic IP and associate it with your instance.

- so as to not loss our ip to the GREAT IP COLLECTOR (basically aws ip pool for unused ips 😉) when we stop or reboot our instance.

3. Update and upgrade instance packages.

- ssh into the instance
- run `sudo apt update`
- run `sudo apt upgrade`

4. Install a web server on the instance e.g. nginx, apache.

- then checkout your ip on port 80 (HTTP)
