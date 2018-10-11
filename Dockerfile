FROM node:8-alpine

LABEL maintainer Dhruv Tripathi, dhruv.tri7@gmail.com

#VOLUME /var/lib/eg
WORKDIR /usr/src/app

COPY . .

RUN ls /usr/src/app


RUN  apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm i\
    && apk del build-dependencies
#COPY ./config /var/lib/eg
#COPY ./config/models /var/lib/eg/models
#COPY user_model.js /var/lib/eg
#RUN ls /var/lib/eg

ENV NODE_ENV production
#ENV NODE_PATH /usr/local/share/.config/yarn/global/node_modules/
#ENV EG_CONFIG_DIR /var/lib/eg

ENV CHOKIDAR_USEPOLLING true

EXPOSE 8080 9876

#CMD ["node", "-e", "require('express-gateway')().run();"]
CMD [ "npm", "start" ]