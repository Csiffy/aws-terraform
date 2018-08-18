#!/bin/bash

#Module
sudo yum -y update

#For example if the instance is a web server
sudo yum -y install nginx
sudo systemctl enable nginx
sudo systemctl start nginx


