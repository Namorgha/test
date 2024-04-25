FROM debian:stable

RUN apt update && apt upgrade -y

RUN apt install adminer wget vim -y

EXPOSE 8080

COPY ./tools /

CMD bash /script.sh
