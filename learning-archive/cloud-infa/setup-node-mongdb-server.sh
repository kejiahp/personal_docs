#!/bin/bash

# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Ensure the domain and port are passed as arguments
if [ $# -lt 4 ]; then
    echo "Usage: $0 NODEJS_DOMAIN NODEJS_PORT NEXTJS_DOMAIN NEXTJS_PATH"
    exit 1
fi

NODEJS_DOMAIN=$1
NODEJS_PORT=$2
NEXTJS_DOMAIN=$3
NEXTJS_PATH=$4  # Assuming this is the port Next.js runs on

# Update and Install Nginx
apt update && apt install -y nginx

# Install Certbot for Let's Encrypt SSL
apt install -y certbot python3-certbot-nginx

# Install Node.js and NPM (Node.js 16)
curl -sL https://deb.nodesource.com/setup_16.x | bash -
apt install -y nodejs

# Install Yarn and PM2 globally
npm install -g yarn pm2

# Install MongoDB
apt install -y mongodb
systemctl start mongodb
systemctl enable mongodb

# Configure Nginx for Node.js API
cat > /etc/nginx/sites-available/$NODEJS_DOMAIN <<EOF
server {
    listen 80;
    server_name $NODEJS_DOMAIN;

    location / {
        proxy_pass http://localhost:$NODEJS_PORT;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

ln -s /etc/nginx/sites-available/$NODEJS_DOMAIN /etc/nginx/sites-enabled/

# Configure Nginx for Next.js Application
cat > /etc/nginx/sites-available/$NEXTJS_DOMAIN <<EOF
server {
    listen 80;
    server_name $NEXTJS_DOMAIN;

    location / {
        proxy_pass http://localhost:$NEXTJS_PATH;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 30d;
        access_log off;
        add_header Cache-Control "public, no-transform";
    }
}
EOF

ln -s /etc/nginx/sites-available/$NEXTJS_DOMAIN /etc/nginx/sites-enabled/

# Reload Nginx to apply changes
nginx -t && systemctl reload nginx

# Obtain SSL Certificates
certbot --nginx -d $NODEJS_DOMAIN -d $NEXTJS_DOMAIN --non-interactive --agree-tos -m user@email.com

echo "Setup completed."