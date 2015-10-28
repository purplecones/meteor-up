#!/bin/bash

# Remove the lock
set +e
sudo rm /var/lib/dpkg/lock > /dev/null
sudo rm /var/cache/apt/archives/lock > /dev/null
set -e

# Install wkhtmltopdf
apt-get update
sudo apt-get -y install libjpeg8-dev libxrender1 fontconfig > /dev/null

WKHTMLTOPDF_VERSION=0.12.2.1

cd /usr/local/share/
mkdir tmp
cd tmp
sudo wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb > /dev/null
ar -vx wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
tar xf data.tar.xz
cp usr/local/bin/wkhtmltopdf ../wkhtmltopdf
sudo ln -s -f /usr/local/share/wkhtmltopdf /usr/local/bin/wkhtmltopdf
sudo ln -s -f /usr/local/share/wkhtmltopdf /usr/bin/wkhtmltopdf

# Clean up
rm -rf /usr/local/share/tmp
