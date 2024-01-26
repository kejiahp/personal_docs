# Add an SSL Certificate with LetsEncrypt

Install snapd

- run `sudo apt install snapd`

Remove any pre-existing certbot packages because we will be using certbot snap and the could be package conflicts

- run `sudo apt-get remove certbot`

Install certbot

- run `sudo snap install --classic certbot`

Test the certbot command to ensure it can be run

- run `sudo ln -s /snap/bin/certbot /usr/bin/certbot`

Install the Certificate and have certbot edit you nginx config and add ssl support

- run `sudo certbot --nginx`

Certbot automatically renews ssl certificates every 90 days but it can be done maually with

- run `sudo certbot renew --dry-run`

For more information: [certbot.eff.org](https://certbot.eff.org/instructions "certbot.eff.org")

By the way if your service is on a machine with a firewall remember to open up port 443👌
