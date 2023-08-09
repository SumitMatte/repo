sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

sudo mkdir /opt/tomcat
cd /opt/tomcat
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz
cd /opt/tomcat
sudo tar -xf apache-tomcat-*.tar.gz -C /opt/tomcat --strip-components=1
sudo chown -R tomcat: /opt/tomcat
echo 'export CATALINA_HOME="/opt/tomcat"' >> ~/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/default-java"' >> ~/.bashrc
source ~/.bashrc
$CATALINA_HOME/bin/startup.sh

