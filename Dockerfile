FROM java:7

MAINTAINER radek

ADD java-exp /usr/local/

WORKDIR /usr/local/

CMD ["/usr/local/start.sh"]
