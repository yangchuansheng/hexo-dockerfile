FROM nginx:alpine
MAINTAINER Stephen Liang "docker-maint@stephenliang.pw"

ADD default.conf /etc/nginx/conf.d/default.conf

# Grab dependencies
RUN apk update && apk add curl && apk add nodejs && apk add git
RUN npm install -g hexo-cli

# Create hexo base files
RUN rm -rf /usr/share/nginx/html/*
RUN hexo init /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
RUN npm install

CMD nginx -g "daemon off;"
