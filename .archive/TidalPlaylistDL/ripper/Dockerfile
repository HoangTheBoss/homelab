FROM ubuntu:latest

COPY ./scrape.sh /
COPY ./run.sh /

VOLUME /config
VOLUME /downloads

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	# apt-get -y upgrade && \
	apt-get -y install cron python3-pip

RUN pip3 install streamrip --upgrade

RUN chmod +x /run.sh && chmod +x /scrape.sh

ENTRYPOINT ["/run.sh"]