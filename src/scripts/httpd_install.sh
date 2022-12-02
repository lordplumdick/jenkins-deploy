#!/bin/bash
yum install -y httpd
echo "blue/green!" > /var/www/html/ec2.html
echo "<br>" >> /var/www/html/ec2.html
curl http://169.254.169.254/latest/meta-data/public-ipv4 >> /var/www/html/ec2.html
echo "<br>" >> /var/www/html/ec2.html
curl http://169.254.169.254/latest/meta-data/instance-id >> /var/www/html/ec2.html
echo "<br>" >> /var/www/html/ec2.html
date | awk '{print " " $4}' >> /var/www/html/ec2.html