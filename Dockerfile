FROM ubuntu:18.04
MAINTAINER alex.chan9923@gmail.com
EXPOSE 8080
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Singapore

RUN apt-get update
RUN apt-get install -y nodejs npm
ENV USER root
RUN npm i express mongoose
RUN npm install --save
RUN useradd -ms /bin/bash user
COPY server.js /home/user/server.js
COPY start.sh /home/user/start.sh
RUN chmod a+x /home/user/start.sh
USER user
WORKDIR /home/user

CMD ["sh","/home/user/start.sh"]
