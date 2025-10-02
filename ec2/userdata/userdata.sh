#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<center><h1>Instance successfully running the Apache Webserver!</h1></center>" | sudo tee /var/www/html/index.html > /dev/null
