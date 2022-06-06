FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	# apt-get -y upgrade && \
	apt-get -y install cron python3-pip

COPY ./scrape.sh /
COPY ./run.sh /

RUN pip3 install streamrip --upgrade

RUN mkdir /config
RUN touch /config/links.txt

VOLUME /config
VOLUME /downloads

CMD ["/run.sh"]