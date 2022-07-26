FROM node:16.3.0-alpine as builder


RUN mkdir /app 

WORKDIR /app

COPY . .

RUN npm i && npm run build

FROM nginx:alpine

#!/bin/sh

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/build /usr/share/nginx/html
