# STEP-1: Ensure Java 21 and wget are installed
sudo dnf install -y java-21-amazon-corretto wget

# STEP-2: Download Tomcat 11.0.14 from the Apache Archive
wget https://archive.apache.org/dist/tomcat/tomcat-11/v11.0.14/bin/apache-tomcat-11.0.14.tar.gz

# STEP-3: Extract the downloaded archive
tar -zxvf apache-tomcat-11.0.14.tar.gz

# STEP-4: Configure Tomcat Users
sed -i '/<\/tomcat-users>/i \
  <role rolename="manager-gui"/>\n\
  <role rolename="manager-script"/>\n\
  <user username="tomcat" password="root123456" roles="manager-gui, manager-script"/>' apache-tomcat-11.0.14/conf/tomcat-users.xml

# STEP-5: Remove Remote Access Restrictions for Manager App
sed -i '/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/,+3d' apache-tomcat-11.0.14/webapps/manager/META-INF/context.xml
sed -i '/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/,+3d' apache-tomcat-11.0.14/webapps/host-manager/META-INF/context.xml

# STEP-6: Start Tomcat Server
sh apache-tomcat-11.0.14/bin/startup.sh
