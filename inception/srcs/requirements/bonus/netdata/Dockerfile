FROM debian:stable

RUN apt update && apt upgrade -y

RUN apt install netdata -y

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/netdata/netdata.conf

RUN service netdata restart

EXPOSE 2000

CMD netdata -u root -D
