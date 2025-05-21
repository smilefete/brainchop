FROM node:19-alpine3.16

WORKDIR /work


COPY css css
COPY docs docs
COPY public public
COPY py2tfjs py2tfjs
COPY v3 v3
COPY brainchop-diagnostics.js brainchop-diagnostics.js
COPY brainchop-mainthread.js brainchop-mainthread.js
COPY brainchop-parameters.js brainchop-parameters.js
COPY brainchop-webworker.js brainchop-webworker.js
COPY bwlabels.js bwlabels.js
COPY main.js main.js
COPY playwright.config.cjs playwright.config.cjs
COPY tensor-utils.js tensor-utils.js
COPY index.html index.html
COPY package-lock.json package-lock.json
COPY package.json package.json
COPY vite.config.js vite.config.js

RUN npm install
RUN npm run build

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
COPY --from=0 /work/dist static/trial

CMD ["nginx","-g","daemon off;"]