FROM ubuntu
FROM openjdk:11-jre-slim

WORKDIR /bot
VOLUME /bot

ENV BOTVERSION=0.3.8

RUN wget -O JMusicBot.jar https://github.com/jagrosh/MusicBot/releases/download/$BOTVERSION/JMusicBot-$BOTVERSION.jar
RUN wget https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt
# CMD ls /home/

ENV TOKEN=0
ENV OWNER=0
ENV PREFIX=!

RUN sed -i 's/##token/'$token'/g' config.txt
RUN sed -i 's/##owner/'$owner'/g' config.txt
RUN sed -i 's/##prefix/'$prefix'/g' config.txt

ENTRYPOINT java -jar JMusicBot.jar
