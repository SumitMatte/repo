sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

sudo mkdir /opt/tomcat
cd /opt/tomcat
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz
cd /opt/tomcat
sudo tar -xf apache-tomcat-*.tar.gz -C /opt/tomcat --strip-components=1
sudo chown -R tomcat: /opt/tomcat
sudo chown -R tomcat webapps/ work/ temp/ logs/

echo 'export CATALINA_HOME="/opt/tomcat"' >> ~/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"' >> ~/.bashrc

echo 'export CATALINA_HOME="/opt/tomcat"' >> ~/.profile
echo 'export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"' >> ~/.profile


source ~/.bashrc
sudo /opt/tomcat/bin/catalina.sh start
#$CATALINA_HOME/bin/startup.sh
sudo ufw allow 8080

