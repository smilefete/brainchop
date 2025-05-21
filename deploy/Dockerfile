FROM nginx:1.19.8-alpine

ENV TZ=Asia/Shanghai

RUN sed -i "s@http://dl-cdn.alpinelinux.org/@https://repo.huaweicloud.com/@g" /etc/apk/repositories \
    && apk update \
    && apk add curl busybox-extras --no-cache \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" >  /etc/timezone \
    && rm -rf /var/cache/apk/*

WORKDIR /work

COPY deploy/nginx.conf /etc/nginx/nginx.conf
COPY deploy/default.conf /etc/nginx/conf.d/default.conf
COPY dist static/trial



CMD ["nginx","-g","daemon off;"]