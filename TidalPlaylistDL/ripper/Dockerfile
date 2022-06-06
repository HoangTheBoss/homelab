FROM ubuntu:latest

VOLUME /config
VOLUME /downloads

COPY ./scrape.sh /
COPY ./run.sh /

RUN touch /config/links.txt

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	# apt-get -y upgrade && \
	apt-get -y install cron python3-pip

RUN pip3 install streamrip --upgrade

ENTRYPOINT ["/run.sh"]
RUN ["rip","repair","-n"]