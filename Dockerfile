FROM keymetrics/pm2:10-alpine
RUN apk update && apk upgrade && \
    apk add --no-cache bash git curl openssh
MAINTAINER Fahryan
RUN mkdir -p /usr/src/apps
WORKDIR /usr/src/apps
COPY package.json ./
RUN npm cache clean --force
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "pm2-runtime", "start", "pm2.json", "--env", "production"]