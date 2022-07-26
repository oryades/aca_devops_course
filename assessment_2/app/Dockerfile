FROM node:lts-alpine3.15 AS builder

RUN mkdir app/
WORKDIR app/
COPY . .
RUN npm install --silent
RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
