FROM openjdk:11-jre-slim

WORKDIR /bot

ENV BOTVERSION=0.3.6

ADD https://github.com/jagrosh/MusicBot/releases/download/$BOTVERSION/JMusicBot-$BOTVERSION.jar JMusicBot.jar
# CMD ls /home/
VOLUME /bot

ENV TOKEN=0
ENV OWNER=0
ENV PREFIX=!
ENTRYPOINT java -Dtoken=$TOKEN -Downer=$OWNER -Dprefix=$PREFIX -jar JMusicBot.jar
