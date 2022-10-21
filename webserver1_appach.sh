#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt-get install -y python
cd /etc/apache2
sudo sed -i'' -r -e "/Listen 80/i\Listen 3000" ports.conf
cd /etc/httpd/conf
sudo sed -i'' -r -e "/Listen 80/i\Listen 3000" httpd.conf
cd ~

echo "thisi is webserver 1 welcom" | sudo tee /var/www/html/index.html
