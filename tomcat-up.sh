#!/bin/bash

TOMCAT_VER=apache-tomcat-9.0.36
CATALINA_HOME=/opt/$TOMCAT_VER
JAVA_HOME=/usr/lib/jvm/java-1.8.0

sudo yum -y install java-1.8.0-openjdk-devel

sudo wget https://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.36/bin/\
$TOMCAT_VER.zip -P /opt

sudo unzip /opt/$TOMCAT_VER.zip -d /opt

sudo chown -R vagrant:vagrant /opt/$TOMCAT_VER
chmod -R +x /opt/$TOMCAT_VER/bin

echo CATALINA_HOME=$CATALINA_HOME  >> /etc/profile.d/1654.sh
echo JAVA_HOME=$JAVA_HOME >> /etc/profile.d/1654.sh

export CATALINA_HOME=$CATALINA_HOME
export JAVA_HOME=$JAVA_HOME

$CATALINA_HOME/bin/catalina.sh start

ip a list eth1 | sed -n '3 {s/^.*inet \([0-9.]*\).*/\1/;p}' > /vagrant/ip-tomcat

cp /vagrant/*.war /$CATALINA_HOME/webapps/
