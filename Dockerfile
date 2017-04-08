FROM ubuntu:14.04 

RUN apt-get update

RUN apt-get install -y default-jre
RUN apt-get install -y default-jdk
# Install maven
RUN apt-get install -y maven
RUN apt-get install -y tomcat7

WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "package"]
RUN ["cp", "target/CloudenabledWebApp.war", "/var/lib/tomcat7/webapps/"]

EXPOSE 8080
CMD service tomcat7 start && tail -f /var/lib/tomcat7/logs/catalina.out
