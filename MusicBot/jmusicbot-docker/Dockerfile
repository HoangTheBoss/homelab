FROM ubuntu:latest

RUN apt update
RUN apt install -y openjdk-11-jre wget

# RUN mkdir -p /bot
WORKDIR /bot
# VOLUME /bot

ARG BOTVERSION=0.3.8
ARG TOKEN="0"
ARG OWNER="0"
ARG PREFIX="!"

RUN wget -O ./config.txt https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt

RUN sed -i 's+^token.*+token = "'$TOKEN'"+g' ./config.txt
RUN sed -i 's+^owner.*+owner = "'$OWNER'"+g' ./config.txt
RUN sed -i 's+^prefix.*+preix = "'$PREFIX'"+g' ./config.txt
RUN cat ./config.txt

RUN wget -q -O ./JMusicBot.jar https://github.com/jagrosh/MusicBot/releases/download/$BOTVERSION/JMusicBot-$BOTVERSION.jar

CMD ["java", "-Dnogui=true", "-jar", "./JMusicBot.jar"]
