FROM node:10-alpine as builder

COPY package.json ./

RUN npm i && mkdir /app && mv ./node_modules ./app

WORKDIR /app

COPY . .



RUN npm run build

FROM nginx:alpine

#!/bin/sh

COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/build /usr/share/nginx/html
