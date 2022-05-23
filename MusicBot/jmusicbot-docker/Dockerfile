FROM openjdk:11-jre-slim

WORKDIR /bot

ENV BOTVERSION=0.3.8

ADD https://github.com/jagrosh/MusicBot/releases/download/$BOTVERSION/JMusicBot-$BOTVERSION.jar /bot/JMusicBot.jar
# CMD ls /home/

ENV TOKEN=0
ENV OWNER=0
ENV PREFIX=!
ENTRYPOINT java -Dtoken=$TOKEN -Downer=$OWNER -Dprefix=$PREFIX -jar /bot/JMusicBot.jar
