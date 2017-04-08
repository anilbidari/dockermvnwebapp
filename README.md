# dockermvnwebapp
dockermvnwebapp
Install docker : docs.docker.io
Install Jenkins : https://blog.nimbleci.com/2016/08/31/how-to-build-docker-images-automatically-with-jenkins-pipeline/

docker run -d --name jenkins -p 8080:8080 jenkins:2.7.2
In newer versions of Jenkins the admin password is left in the logs, to find it run this:
$ docker logs -f jenkins


Jenkins theme : http://jenkins-contrib-themes.github.io/jenkins-neo-theme/
User:admin
Pass: Jenkins
Java-maven-dockerfile
========================
https://blog.giantswarm.io/getting-started-with-java-development-on-docker/



tomcat error:
sudo docker run --cap-add SYS_PTRACE -it ubuntu bash

http://stackoverflow.com/questions/29683231/tomcat7-fail-to-start-inside-ubuntu-docker-container




Dockerfile:
FROM java:8

# Install maven
RUN apt-get update
RUN apt-get install -y maven
RUN apt-get install -y libtomcat7-java
RUN apt-get install -y tomcat7
WORKDIR /code
# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]
#RUN ["mvn", "verify"]
# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "package"]
RUN ["cp", "target/CloudenabledWebApp.war", "/var/lib/tomcat7/webapps/"]
EXPOSE 8080
CMD ["service", "tomcat7", "restart"]


docker run  -d --privileged=true -it -p 9090:8080 ubuntumvn



http://stackoverflow.com/questions/27719353/dockerfile-for-tomcat



WORKING:
-=============

Docker run   :   docker run -d --privileged=true -p 9090:8080 sushil2226:dockermvnwebapp
Docker buid: docker build dockermvnwebapp .
Docker tag: docker tag 31f9199817a4 sushil2226/dockermvnwebapp:latest
--------------------


Additionals:

Jenkins themes:
https://s3-eu-west-1.amazonaws.com/sushil-cloudenabled/jenkins-material-theme.css?response-content-disposition=inline&X-Amz-Security-Token=FQoDYXdzED8aDMzoi91eowZWEFrGsSKBBG0xnn7BN8zQdDX4v0Ll%2FjbTYKus1CYa%2B7AD3UWILWThpQp%2FKCR3xTVpLtbovA1sk7MzQxNZMLtpMSrE%2FFF77xK6Pdht4gtOAcgzhlshdmMPpBV3UP%2B4hSbNbA4hvaaAbqNCYKaY%2BmPAEmyTy9LTjWxqOUgtUXqtBd0P%2B7ZrddLnJYUqKy9oBRSpCLM8PHWfgExu9bI7WFMko%2FWzuhJwQ%2FoIeRzhj9oN9cAJTX75Jw80i4qwAG9YDAPSh7emra1oJw8hftRuwMmxFdL4He7eNC3D6wl8RCDE9oSzVoh68uqiC3To3EQie23FUfSiBPTt%2BChFRND9ca%2BrLkr5bXJBnTZXKO2gWquEcdQNaoupgCOZW8GhC37%2Bu1JJ813qOgRoNwLVXUoUPW3hOWC%2FSzyWJhnbcg2P5IxZJvBV6FI5RB6wKFpjPp6xia10Q%2F%2BT85c98yZ2UdDJ0TWRBfQJrRxehREphPMLTm%2BFZN4rfGnd6lg2%2FM0VKkvGaNPPoKY6Y21h47kdDoDAwmJsuEjtcw4INB5uaffhLvmbb5b1cUCFc31T6QtzY0L41GXFyz8LkdwQHi9AEjQeNpDHb0r2qbjRQEenG2H3Xagq7GJGlG0YGxNGUZR3CMbni3YY8FwK%2FMZMJxtJRwNlsiT8XGStRjhGv2gcQWeAZQbpLvOODLGrjVKW2ijNsJ%2FHBQ%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20170408T060305Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAJSM2OCRXT27A6NDA%2F20170408%2Feu-west-1%2Fs3%2Faws4_request&X-Amz-Signature=5bfe07e3c14cf585b904da0886cac0ce6fc87c62b8d77efcac90d5026de95587



http://afonsof.com/jenkins-material-theme/dist/material-light.css
