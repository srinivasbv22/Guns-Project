FROM tomcat
MAINTAINER Srinivas
RUN apt-get update && apt-get -y upgrade
EXPOSE 8080
