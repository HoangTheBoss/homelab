FROM ubuntu:16.04

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install cron

COPY scrape.sh /
COPY run.sh /

FROM python:3.9

RUN pip3 install streamrip --upgrade

RUN touch /config/links.txt

VOLUME /config
VOLUME /downloads

CMD ["/run.sh"]