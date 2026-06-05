#!/bin/bash

clear

echo "=================================="
echo " Easy Let's Encrypt SSL Installer "
echo "=================================="

read -p "Domain Name: " DOMAIN
read -p "Email Address: " EMAIL

echo ""
echo "[1/4] Updating packages..."
apt update -y

echo "[2/4] Installing Certbot..."
apt install -y certbot

echo "[3/4] Requesting SSL certificate..."
certbot certonly --standalone \
  -d $DOMAIN \
  --email $EMAIL \
  --agree-tos \
  --non-interactive

echo "[4/4] Testing renewal..."
certbot renew --dry-run

echo ""
echo "=================================="
echo " SSL setup completed!"
echo "=================================="
echo "Domain: $DOMAIN"
echo ""
