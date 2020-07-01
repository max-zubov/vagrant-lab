#!/bin/bash

sudo yum -y update
sudo yum -y install nginx

read IP < /vagrant/ip-tomcat
sudo sed -e " s/ip:8080/${IP}:8080/" /vagrant/1654-nginx.conf  >  /etc/nginx/nginx.conf

ip a list eth1 | sed -n '3 {s/^.*inet \([0-9.]*\).*/\1/;p}' > /vagrant/ip-nginx

sudo systemctl enable nginx
sudo systemctl start nginx
