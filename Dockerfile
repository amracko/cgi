FROM java:7


MAINTAINER mrales

ADD java-exp /usr/local/

WORKDIR /usr/local/

CMD ["/usr/local/start.sh"]
