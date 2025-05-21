FROM node:19-alpine3.16

WORKDIR /work

COPY public public
COPY src src
COPY .eslintignore .eslintignore
COPY .eslintrc.cjs .eslintrc.cjs
COPY .prettierrc.json .prettierrc.json
COPY env.d.ts env.d.ts
COPY index.html index.html
COPY package-lock.json package-lock.json
COPY package.json package.json
COPY tsconfig.config.json tsconfig.config.json
COPY tsconfig.json tsconfig.json
COPY vite.config.ts vite.config.ts

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