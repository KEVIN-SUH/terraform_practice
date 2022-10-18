#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt-get install python
echo "thisi is webserver 1 welcom" | sudo tee /var/www/html/index.html
