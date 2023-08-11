#!/bin/bash

sudo apt install maven -y
cd /mnt/
git clone https://github.com/SumitMatte/onlinebookstore.git
cd /mnt/onlinebookstore/
mvn install
sudo chmod -R o+rwx /var/lib/tomcat9/webapps/

sudo cp -r target/onlinebookstore.war /var/lib/tomcat9/webapps/





