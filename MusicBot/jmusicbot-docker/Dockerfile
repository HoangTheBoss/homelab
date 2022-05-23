FROM ubuntu:latest

RUN apt update
RUN apt install -y openjdk-11-jre wget

WORKDIR /bot

ARG BOTVERSION=0.3.8
ARG TOKEN="0"
ARG OWNER="0
ARG PREFIX="!"

RUN wget https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt

RUN sed -i 's/##token/'$token'/g' config.txt
RUN sed -i 's/##owner/'$owner'/g' config.txt
RUN sed -i 's/##prefix/'$prefix'/g' config.txt

RUN wget -O JMusicBot.jar https://github.com/jagrosh/MusicBot/releases/download/$BOTVERSION/JMusicBot-$BOTVERSION.jar

CMD ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]
